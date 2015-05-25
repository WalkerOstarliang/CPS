/**
 * 技防单位
 */

/* 重新加载页面 */
function resetLoadPage(jgbh) {
	var url = contextPath + "/zagl/dw/toJfdwPage.action?t="
			+ new Date().getTime();
	url += "&operType=update" + "&jgbh=" + jgbh;
	window.location.href = url;
	// window.location.reload(true);
}

/* 保存单位信息 */
function saveDw() {
	var zzjgdm = $("#dwdm").val();
	var yyzzhm = $("#yyzzbh").val();

	if (zzjgdm == "" && yyzzhm == "") {
		alert("组织机构代码和营业执照号中必须填写一个。");
		return;
	}

	// 获取事件源
	var eventSrcObj = event.srcElement ? $(event.srcElement) : $(event.target);

	if ($.validateform("jfdw_form")) {
		eventSrcObj.attr("disabled", "disabled");
		$("#jfdw_form").ajaxSubmit({
					type : "post",
					url : contextPath + "/zagl/dw/saveDwJbxx.action",
					dataType : "json",
					success : function(dwBean) {
						if (dwBean != null) {
							alert("单位信息保存成功.");
							resetLoadPage(dwBean.dwjbxx.jgbh);
						} else {
							alert("单位信息保存失败.");
							eventSrcObj.removeAttr("disabled");
						}
					}
				});
	}
}

// 是否校验身份证
function changeFrsfrz(obj) {
	if ($(obj).attr("checked") == "checked") {
		$("#frsfzhm")
				.attr("class",
						" validate[[required, maxSize[18],funcCall[checkIDC]]]  cps-input");
	} else {
		$("#frsfzhm").attr("class",
				" validate[[required, maxSize[18]]] cps-input");
	}
}

/* 根据身份查询人员信息 */
function queryRyBysfz(sfzh, xmId, lxfsId, xzdzId) {
	if ($("#sfzjy").attr("checked") == undefined) {
		return;
	}
	if (sfzh) {
		queryRkBean(sfzh, function(czrkxxBean) {
					if (czrkxxBean != null) {
						$("#" + xmId).val(czrkxxBean.xm);
						$("#" + lxfsId).val(czrkxxBean.lxdh);
					}
				});
	}
}

/* 打开年审界面 */
function openNsxx(jgbh, opertype) {
	if (jgbh) {
		var url = contextPath + "/zagl/dw/toJfdwNsxxPage.action?t="
				+ new Date().getTime() + "&jgbh=" + jgbh;
		if (opertype) {
			url += "&operType=" + opertype;
		}

		$.openWindow({
					url : url,
					width : 1020,
					height : 900
				});
	} else {
		alert("请先保存单位信息.");
		return;
	}
}

/**
 * 机构人员选择
 * 
 * @param {}
 *            orgcode
 * @param {}
 *            hidden
 * @param {}
 *            show
 */
function orgUserSelect(orgcode, hidden, show, callback) {
	if (orgcode) {
		openDwRySelect({
					rootOrgCode : orgcode,
					mutilSelect : false
				}, function(userbean) {
					if (userbean != null) {
						$("#" + hidden).val(userbean.username);
						$("#" + show).val(userbean.realname);
						if ($.isFunction(callback)) {
							callback(userbean);
						}
					}
				});

	} else {
		alert("无效的机构代码");
	}
}

/** 机构选择* */
function selectOrg(orgcode, hiddenfield, showfield) {
	if (orgcode) {
		openDwSelect({
					rootOrgCode : orgcode,
					mutilSelect : false,
					nodeSelectedType : "ps",
					nodeNotSelectedType : "ps"
				}, function(orgbeans) {
					if (orgbeans != null) {
						$("#" + hiddenfield).val(orgbeans.id);
						$("#" + showfield).val(orgbeans.name);
					}
				});
	} else {
		alert("无效的机构代码")
	}
}

$(function() {
			if ($("#opertype").val() == 'detail') {
				$("#jfdw_form").find("input").attr("disabled", "disabled");
				$("#jfdw_form").find("select").attr("disabled", "disabled");
				$("#jfdw_form").find("textarea").attr("disabled", "disabled")
			}
		});