//单位选择
function dwselect(rootcode,leve){
	var orgcode = '';
	if(leve == 1){
		orgcode = rootcode.substring(0,2) + "0000000000";
	}else if(leve == 2){
		orgcode = rootcode.substring(0,4) + "00000000";
	}else if(leve == 3){
		orgcode = rootcode.substring(0,6) + "000000";
	}else if(leve == 4){
		orgcode = rootcode.substring(0,8) + "0000";
	}else if(leve == 5){
		orgcode = rootcode;
	}
	
	openDwSelect2({
		rootOrgCode : orgcode,
		mutilSelect : false,
		nodeSelectedType : "ps",
		nodeNotSelectedType : "ps"
		}, 
		function(orgbeans) {
			if (orgbeans != null) {
				$("#dwdm").val(orgbeans.id);
				$("#dwmc").val(orgbeans.name);
			}
		});
}

/**
 * 单位派发
 */
function dwpf(orgcode){
	if($.validateform("dwpfForm")){
		var mbdwdm = $("#dwdm").val();
		if(orgcode == mbdwdm){
			alert("必须选择下级单位.");
			return;
		}
		
		$("#dwpfForm").attr("action",contextPath + "/sydw/dwop/dwpf.action");
		$("#dwpfForm").ajaxSubmit({
			type : "post",
			success:function(result){
				var flag = eval(result);
				if(flag){
					alert("派发成功.");
					$("#pfbutton").hide();
				}else{
					alert("派发失败.");
				}
			}
		});
	}
}

//单位退回
function dwth(){
	if($.validateform("dwpfForm")){
		
		$("#dwpfForm").attr("action",contextPath + "/sydw/dwop/dwth.action");
		$("#dwpfForm").ajaxSubmit({
			type : "post",
			success:function(result){
				var flag = eval(result);
				if(flag){
					alert("退回成功.");
					$("#thbutton").hide();
				}else{
					alert("退回失败.");
				}
			}
		});
	}
}

//房屋选择
function openDwSelectFwInfoPage(){
	$.openDialogWindow({
		url : contextPath + "/lsgl/fw/toSelectFwWin.action",
		width:900,
		height:650,
		data : {
			"queryBean.rylb":"2",
			"queryBean.selectType" : "select", 
			t: new Date().getTime()
		},
		callback : function(resultObj)
		{
			if (resultObj)
			{
				var fwxxBean = resultObj["fwxxBean"];
				$("#fwid").val(fwxxBean["fwid"]);
				$("#dzid").val(fwxxBean["dzid"]);
				$("#dzmc").val(fwxxBean["dzmc"]);
				$("#sssqdm").val(fwxxBean["sssq"]);
				
				clearDw();
			}
		}
	});
}

/**
 * 打开单位选择页面
 */
function openDwSelectPage(){
	$.openDialogWindow({
		url : contextPath+ "/sydw/dwop/toDwSelectPage.action?t="+ new Date().getTime() ,
		width : 1000,
		height : 700,
		callback : function(result) {
			if(result != null){
				$("#dwmc").val(result.dwmc);
				$("#jgbh").val(result.jgbh);
				clearDz();
			}
		}
	});
}

/**
 * 清除地址
 */
function clearDz(){
	$("#fwid").val("");
	$("#dzid").val("");
	$("#dzmc").val("");
	$("#sssqdm").val("");
}

/**
 * 清除单位
 */
function clearDw(){
	$("#dwmc").val("");
	$("#dwmc").val("");
}

//单位签收
function dwqs(){
	var dzid = $("#dzid").val();
	var jgbh = $("#jgbh").val();
	
	if(dzid == "" && jgbh == ""){
		alert("签收时必须选择单位地址或者现有单位");
	}else{
		$("#dwqsForm").attr("action",contextPath + "/sydw/dwop/dwqs.action");
		$("#dwqsForm").ajaxSubmit({
			type : "post",
			success:function(result){
				var flag = eval(result);
				if(flag){
					alert("签收成功.");
					$("#qsbutton").hide();
				}else{
					alert("签收失败.");
				}
			}
		});
	}
}
/** 机构选择* */
function selectOrg(orgcode, hiddenfield, showfield) {
	if (orgcode) {
		openDwSelect2({
			rootOrgCode : orgcode,
			mutilSelect : false,
			nodeSelectedType : "ps",
			nodeNotSelectedType : "ps"
			}, 
			function(orgbeans) {
				if (orgbeans != null) {
					$("#" + hiddenfield).val(orgbeans.id);
					$("#" + showfield).val(orgbeans.name);
					delAlltems("oneSeleid");
					getOne();
				}
			});
	} else {
		alert("无效的机构代码")
	}
}
// 选择所属社区
function getOne(){
	var urls = contextPath+"/sydw/dwop/querySssqlist.action";
	$.ajax({
		url:urls,
		type:"POST",
		data:{"wbdw.sszrdwdm":$("#sszrdwdm").val()},
		async: false,
		success:function(obj){
			setOneFun(obj);
		}
	});
};
// 3
function setOneFun(obj){
	 var v_obj = eval('('+obj+')');
	  $("#oneSeleid").append("<option value='{\"dm\":\"\",\"mc\":\"--请选择--\"}'> --请选择--</option>");
	   for(var i=0;i<v_obj.length;i++){
	  	 var Strvalue = "{dm:"+"\""+v_obj[i].dm+"\""+",mc:"+"\""+v_obj[i].mc+"\""+"}";
		 $("#oneSeleid").append("<option title=" + v_obj[i].mc + " value="+Strvalue+">"+v_obj[i].mc+"</option>");
	  };
};
// 清空select 里面的option函数
function delAlltems(selectid){
	var objSelelct = document.getElementById(selectid); 
	for(var i=objSelelct.options.length-1;i>=0;i--){
		objSelelct.options[i]=null;
	}
};
// 保存危爆单位信息
function submitSaveWbdwxx(){
	var _dwdm = $("#sszrdwdm").val();
	if (!_dwdm){
		alert("责任单位必填！");
		return false;
	}
	if ($.validateform("wbdwform"))
	{
		getSssqdm();
		var formData =$("#wbdwform").serialize()+'&t='+new Date().getTime();
		$.ajax({
			type: "post",
			data: formData,
			url: contextPath + $("#wbdwform").attr('action'),
			success: function(msg){
				msg = eval('('+msg+')');
				if (msg.ywzjid){
					if($("#operType").val()=="add"){
						$("#ywzjid").val(msg.ywzjid);
						$("#operType").val('update');
						alert("新增成功！");
					}else if($("#operType").val()=="update"){
						alert("修改成功！");
					}
				}else {
					alert('保存失败!')
				}
			}
		});
	}
}
// 获取所属社区值
function getSssqdm(){
	var v_value = document.getElementById("oneSeleid").value;
	if(document.getElementById("oneSeleid").options.length > 1 && v_value != null && typeof(v_value)!="undefined"){
		var strobj = $("#oneSeleid").val();
		eval('var obj = ' + strobj);
		var dm=obj.dm;
		var mc = obj.mc;
		$("#sssqdm").val(dm);
	}	
}

