/**
 * 查询路面盘查信息
 */
function queryLmpcxx()
{
	$("#lmpcxxList").query("F", "searchform");
}

/**
*新增路面盘查页面
**/
function openAddLmpcxx(operType,jlbh)
{
	if (operType == "detail")
	{
		$.openWindow({
			url : contextPath + "/afgl/lmpcxx/toAddLmpcxx.action",
			data :{"operType":operType,"jlbh":jlbh,"t":new Date().getTime()},
			width : 900,
			height : 700,
			callback:function(){
				queryLmpcxx();
			}
		});
	}
	else
	{
		$.openDialogWindow({
			url : contextPath + "/afgl/lmpcxx/toAddLmpcxx.action",
			data :{"operType":operType,"jlbh":jlbh,"t":new Date().getTime()},
			width : 900,
			height : 700,
			callback:function(){
				queryLmpcxx();
			}
		});
	}
}

/**
 * 保存路面盘查信息
 */
function addLmpcxx(){
	if($.validateform("add_lmpcxx_form")){
		$("#add_lmpcxx_form").ajaxSubmit({
			type : "post",
			success : function(result) {
				if(result){
				 alert("操作成功");
				 $.closeWindow();
				}else{
				 alert("操作失败");
				}
			}
		});
	}
}

/**
*新增同行人
**/
var index=0;
function pageAddLmpcxx(){
	var trhtml="";
	trhtml +="<tr>";
	trhtml +="<th align='right' width='12%'>同行人姓名：</th>";
	trhtml +="<td width='30%'><input type='text' name='txrBeanList["+index+"].txrxm' maxlength='15' class='cps-input' style='width:70%'/></td>";
	trhtml +="<th align='right' width='12%'>同行人身份证：</th>";
	trhtml +="<td width='23%'><input id='txrsfzh' type='text' name='txrBeanList["+index+"].txrsfzh' class='validate[funcCall[checkIDC],maxSize[18]] cps-input' style='width:85%'/></td>";
	trhtml +="<td width='7%' align='center'><span class='cps_span_href' onclick='delTxrxx(this);' style='color:green'>删除</span></td>";
	
	trhtml +="</tr>";
	index++;
	$("#txrtable").append(trhtml);
}
function delTxrxx(obj){
	$(obj).parent().parent().remove();
}
/**
 * 打开卡口信息窗口
 */
function viewKkPcxxByPcbh(pcbh){
	$.openDialogWindow({
		url : contextPath + "/kkpcxx/viewKkpcxxByPcbh.action?kkpcxxQuery.pcbh="
							+ pcbh + "&t=" + new Date().getTime(),
		width : 900,
		height : 700
	});
}
//列表页面里的操作行
function kkpcxxlistCzRowCallback(trObj, rowdataObj)
{
	var result = "";
	result += "<span class=\"cps_span_href\" style=\"color:green\" onclick=\"openUpdateKkpcxxByPcbh('"+ rowdataObj["pcbh"] +"')\">修改</span>&nbsp;";
	result += "<span class=\"cps_span_href\" style=\"color:green\" onclick=\"viewKkPcxxByPcbh('"+ rowdataObj["pcbh"] +"')\">详情</span>&nbsp;";
	return result;
}
//新增页面里的操作行
function updateKkpcxxCzRowCallback(trObj, rowdataObj){
	var result = "";
	result += "<span class=\"cps_span_href\" style=\"color:green\" onclick=\"setUpdateKkpcxxByPcbh('"+ rowdataObj["pcbh"] +"')\">修改</span>&nbsp;";
	result += "<span class=\"cps_span_href\" style=\"color:green\" onclick=\"viewKkPcxxByPcbh('"+ rowdataObj["pcbh"] +"')\">详情</span>&nbsp;";
	result += "<span class=\"cps_span_href\" style=\"color:green\" onclick=\"addKywpxxByPcbh('"+ rowdataObj["pcbh"] +"')\">添加可疑物品</span>&nbsp;";
	return result;
}


/**
*删除同行人信息
**/
function deltxrxx(id){
	$.ajax({
		dataType : "json",
		type : "post", 
		url : contextPath + "/afgl/lmpcxx/deltxrxx.action?id=" + id + "&t=" + new Date().getTime(),
		success : function(result){
			if(result){
				alert("删除成功");
				$("#txrxxList").query("F","add_lmpcxx_form");
			}else{
				alert("删除失败");
			}
		}
	});
	
}

function setlmpcxx(ryxxBean){
	if (ryxxBean)
	{	
		$("#pcdxxm").val(ryxxBean["xm"]);
		$("#zpxx img").attr("src",contextPath + "/cps/common/showPoto.action?sfzh="+ryxxBean["sfzh"]);
	}
}

function resetForm(){
	$("#searchform").get(0).reset();
}
//注销本人自己录入的当月的路面盘查信息
function zxLmpcxx(){
	var size = $("#lmpcxxList").getTotalSize();
	var ddcjjbeans = $("#lmpcxxList").getSelected();
	var _username = $("#username").val();
	var id ;
	var _djrjh ;
	var _pcsj;
	var _yxx;
	var time = new Date();
	var _year = time.getYear();
	var _yearMonth;
	var _month = time.getMonth() +1;
	if (_month<10){
		_month = '0'+_month;
	}
	_yearMonth = String(_year)+String(_month);
	if (ddcjjbeans.length == 0 || size == 0){
		alert("请选择要注销的记录");
		return false;
	}
	if(size > 0 && ddcjjbeans.length > 1){
		alert("一次最多只能注销1条记录");
		return false;
	}
	
	if(size > 0 && ddcjjbeans.length == 1){
		if (confirm("你确定注销该条数据吗？"))
			{
				$("#table_lmpcxxList tr").each(function(){
				//这地方涉及到页面页表中相应字段的索引位置。
					var chk =$(this).find('td').eq(1).find('input');
					if(chk.attr('checked')=='checked'){
						//这地方涉及到页面页表中相应字段的索引位置。
						_yxx = $(this).find('td').eq(11).text();
						_yxx = _yxx.replace(/(^\s*)|(\s*$)/g,"");
						_djrjh = $(this).find('td').eq(10).text();
						//这地方涉及到页面页表中相应字段的索引位置。
						_djrjh = _djrjh.replace(/(^\s*)|(\s*$)/g,"");
						id = $(this).find('td').eq(3).text();
						//这地方涉及到页面页表中相应字段的索引位置。
						id = id.replace(/(^\s*)|(\s*$)/g,"");
						_pcsj  = $(this).find('td').eq(9).text();
						//这地方涉及到页面页表中相应字段的索引位置。
						_pcsj = _pcsj.substr(1,4)+_pcsj.substr(6,2);
					}
				})
				_pcsj = _pcsj.toString();
				_yxx = _yxx.toString();
				_yearMonth = _yearMonth.toString();
				_djrjh =$.trim(_djrjh);
				id = $.trim(id);
				_yxx = $.trim(_yxx);
				
				if(_yxx == "注销"){
					alert("该信息已被注销")
					return false;
				}
				//alert(_djrjh)
				if(_yearMonth != _pcsj){
					alert('只能注销当月数据')
					return false;
				};
				
				if(_username.valueOf() == _djrjh.valueOf()){
					$.ajax({
						type:'post',
						url : contextPath + "/afgl/lmpcxx/zxLmpcxx.action?v_jlbh=" + id + "&t=" + new Date().getTime(),
						success : function(result){
							if(result){
								alert("注销成功");
								$("#lmpcxxList").query("F", "searchform");
							}else{
								alert("注销失败");
							}
						}
					})
				}else if (_username.valueOf() != _djrjh.valueOf()){
					alert('该数据非本人采集，不能注销')
				}
				
			}
	}
	
}
