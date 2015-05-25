function submitSaveStZapctb(){
	//document.getElementById("b").innerHTML='sdfdfdfd';
	//$("#b").html('dfdfdfd');
	//document.getElementById("ss").innerHTML ='111';
	 //var s = document.getElementById("qyb").value; 
	 //alert(s)
	// document.getElementById("qyb").value ='224435';
	
  	var   hja = $("#hja").val()       ;     //  varchar2(10)  y      排查发现可能引发个人极端暴力犯罪的线索数：合计(必须填写数字)
	var   lljf = $("#lljf").val()       ;     //  varchar2(10)  y      原因分析：邻里纠纷(必须填写数字)
	var   zdcq  = $("#zdcq").val()      ;     //  varchar2(10)  y      原因分析：征地拆迁(必须填写数字)
	var   tqgz  = $("#tqgz").val()      ;     //  varchar2(10)  y      原因分析：拖欠工资(必须填写数字)
	var   fzcsw = $("#fzcsw").val()      ;     //  varchar2(10)  y      原因分析：非正常死亡(必须填写数字)
	var   sfss   = $("#sfss").val()     ;     //  varchar2(10)  y      原因分析：涉法涉诉(必须填写数字)
	var   qtyy   = $("#qtyy").val()     ;     //  varchar2(10)  y      原因分析：其他(必须填写数字)
	var   mjpcfx  = $("#mjpcfx").val()    ;     //  varchar2(10)  y      线索来源渠道分析：民警排查发现(必须填写数字)
	var   hlwjh   = $("#hlwjh").val()    ;     //  varchar2(10)  y      "线索来源渠道分析：互联网截获(必须填写数字)"
	var   dhjb   = $("#dhjb").val()     ;     //  varchar2(10)  y      线索来源渠道分析：110接报(必须填写数字)
	var   qzjb  = $("#qzjb").val()      ;     //  varchar2(10)  y      线索来源渠道分析：群众举报(必须填写数字)
		               
		               
	var   hjb    = $("#hjb").val()     ;     //  varchar2(10)  y      治安系统化解处置个人极端暴力犯罪案事件数：合计(必须填写数字)
	var   qsydw  = $("#qsydw").val()     ;     //  varchar2(10)  y      预谋实施的场所部位分析：企事业单位(必须填写数字)
	var   dzjg   = $("#dzjg").val()     ;     //  varchar2(10)  y      预谋实施的场所部位分析：党政机关(必须填写数字)
	var   xx    = $("#xx").val()      ;     //  varchar2(10)  y      预谋实施的场所部位分析：学校(必须填写数字)
	var   jccz  = $("#jccz").val()      ;     //  varchar2(10)  y      预谋实施的场所部位分析：机场、车站、码头、地铁(必须填写数字)
	var   gc    = $("#gc").val()      ;     //  varchar2(10)  y      预谋实施的场所部位分析：广场、商业网点等人员密集公共场所(必须填写数字)
	var   jj    = $("#jj").val()      ;     //  varchar2(10)  y      预谋实施的场所部位分析：进京(必须填写数字)
	var   qtbw  = $("#qtbw").val()      ;     //  varchar2(10)  y      预谋实施的场所部位分析：其他(必须填写数字)
	var   bzwp   = $("#bzwp").val()     ;     //  varchar2(10)  y      使用工具情况分析：爆炸物品(必须填写数字)
	var   qz     = $("#qz").val()     ;     //  varchar2(10)  y      使用工具情况分析：枪支(必须填写数字)
	var   qy     = $("#qy").val()     ;     //  varchar2(10)  y      使用工具情况分析：汽油等易燃物品(必须填写数字)
	var   jd     = $("#jd").val()     ;     //  varchar2(10)  y      使用工具情况分析：剧毒化学品(必须填写数字)
	var   dj     = $("#dj").val()     ;     //  varchar2(10)  y      使用工具情况分析：刀具(必须填写数字)
	var   qtgj    = $("#qtgj").val()    ;     //  varchar2(10)  y      使用工具情况分析：其他(必须填写数字)
	var   yjqtjz  = $("#yjqtjz").val()    ;     //  varchar2(10)  y      移交其他警种和政府有关部门(必须填写数字)
		               
		               
	var   hjc    = $("#hjc").val()     ;     //  varchar2(10)  y      稳控打击有个人极端暴力犯罪倾向的重点人数：合计(必须填写数字)
	var   esyx    = $("#esyx").val()    ;     //  varchar2(10)  y      年龄阶段分析：20岁以下(必须填写数字)
	var   eszss   = $("#eszss").val()    ;     //  varchar2(10)  y      年龄阶段分析：20-40岁(必须填写数字)
	var   syzws   = $("#syzws").val()    ;     //  varchar2(10)  y      年龄阶段分析：41-50岁(必须填写数字)
	var   ssyys   = $("#ssyys").val()    ;     //  varchar2(10)  y      年龄阶段分析：51岁以上(必须填写数字)
	var   wyry    = $("#wyry").val()    ;     //  varchar2(10)  y      重点人群分析：无业人员(必须填写数字)
	var   wlwgry   = $("#wlwgry").val()   ;     //  varchar2(10)  y      重点人群分析：外来务工人员(必须填写数字)
	var   sfry     = $("#sfry").val()   ;     //  varchar2(10)  y      重点人群分析：上访人员(必须填写数字)
	var   jsbr     = $("#jsbr").val()   ;     //  varchar2(10)  y      重点人群分析：精神病人(必须填写数字)
	var   qtrq    = $("#qtrq").val()    ;     //  varchar2(10)  y      重点人群分析：其他(必须填写数字)
	var   zacf    = $("#zacf").val()    ;     //  varchar2(10)  y      采取处置措施情况：治安处罚(必须填写数字)
	var   xscf     = $("#xscf").val()   ;     //  varchar2(10)  y      采取处置措施情况：刑事处罚(必须填写数字)
	var   rcwk     = $("#rcwk").val()   ;     //  varchar2(10)  y      采取处置措施情况：日常稳控(必须填写数字)
		               
		               
	var   sjzy   = $("#sjzy").val()     ;     //  varchar2(10)  y      收缴炸药（公斤）(必须填写数字)
	var   lg      = $("#lg").val()    ;     //  varchar2(10)  y      雷管（枚）(必须填写数字)
	var   jdhxp   = $("#jdhxp").val()    ;     //  varchar2(10)  y      剧毒化学品（克）(必须填写数字)
	var   qzb    = $("#qzb").val()     ;     //  varchar2(10)  y      枪支（把）(必须填写数字)
	var   zdb    = $("#zdb").val()     ;     //  varchar2(10)  y      子弹（发）(必须填写数字)
	var   qyb    = $("#qyb").val()     ;     //  varchar2(10)  y      汽油等易燃物品（升）(必须填写数字)
  	
  	
    //必填校验
    if(!hja){alert('请填写所有项目再保存');return  ;};
	if(!lljf){alert('请填写所有项目再保存');return  ;};
	if(!zdcq){alert('请填写所有项目再保存');return  ;};
	if(!tqgz){alert('请填写所有项目再保存');return  ;};
	if(!fzcsw){alert('请填写所有项目再保存');return  ;};
	if(!sfss){alert('请填写所有项目再保存');return  ;};
	if(!qtyy){alert('请填写所有项目再保存');return  ;};
	if(!mjpcfx){alert('请填写所有项目再保存');return  ;};
	if(!hlwjh){alert('请填写所有项目再保存');return  ;};
	if(!dhjb){alert('请填写所有项目再保存');return  ;};
	if(!qzjb){alert('请填写所有项目再保存');return  ;};
	if(!hjb){alert('请填写所有项目再保存');return  ;};
	if(!qsydw){alert('请填写所有项目再保存');return  ;};
	if(!dzjg){alert('请填写所有项目再保存');return  ;};
	if(!xx){alert('请填写所有项目再保存');return  ;};
	if(!jccz){alert('请填写所有项目再保存');return  ;};
	if(!gc){alert('请填写所有项目再保存');return  ;};
	if(!jj){alert('请填写所有项目再保存');return  ;};
	if(!qtbw){alert('请填写所有项目再保存');return  ;};
	if(!bzwp){alert('请填写所有项目再保存');return  ;};
	if(!qz){alert('请填写所有项目再保存');return  ;};
	if(!qy){alert('请填写所有项目再保存');return  ;};
	if(!jd){alert('请填写所有项目再保存');return  ;};
	if(!dj){alert('请填写所有项目再保存');return  ;};
	if(!qtgj){alert('请填写所有项目再保存');return  ;};
	if(!yjqtjz){alert('请填写所有项目再保存');return  ;};
	if(!hjc){alert('请填写所有项目再保存');return  ;};
	if(!esyx){alert('请填写所有项目再保存');return  ;};
	if(!eszss){alert('请填写所有项目再保存');return  ;};
	if(!syzws){alert('请填写所有项目再保存');return  ;};
	if(!ssyys){alert('请填写所有项目再保存');return  ;};
	if(!wyry){alert('请填写所有项目再保存');return  ;};
	if(!wlwgry){alert('请填写所有项目再保存');return  ;};
	if(!sfry){alert('请填写所有项目再保存');return  ;};
	if(!jsbr){alert('请填写所有项目再保存');return  ;};
	if(!qtrq){alert('请填写所有项目再保存');return  ;};
	if(!zacf){alert('请填写所有项目再保存');return  ;};
	if(!xscf){alert('请填写所有项目再保存');return  ;};
	if(!rcwk){alert('请填写所有项目再保存');return  ;};
  
  	//逻辑校验
	var num1 = Number(lljf)  +  Number(zdcq) + Number(tqgz) + Number(fzcsw) + Number(sfss) + Number(qtyy);
	if(num1 != Number(hja)){
		alert('不符合逻辑1=2+3+4+5+6+7');
		$("#isOk").val('false');
		return ;
	}
	var num2 = Number(hjb) + Number(yjqtjz); 
	if(num2 != Number(hja)){
		alert('不符合逻辑1=12+26');
		$("#isOk").val('false');
		return ;
	} 
	var num3 = Number(qsydw) +  Number(dzjg) +  Number(xx) +  Number(jccz)  +  Number(gc) +  Number(jj) +  Number(qtbw);
	if(num3 != Number(hjb)){
		alert('不符合逻辑12=13+14+15+16+17+18+19');
		$("#isOk").val('false');
		return ;
	}
	
	var zagjNum = Number(bzwp) + Number(qz) + Number(qy) + Number(jd) + Number(dj) + Number(qtgj) ;
	if(zagjNum > 0){
		var lgzaNum = Number(sjzy) + Number(lg) + Number(jdhxp) + Number(qzb) + Number(zdb) + Number(qyb) ;
		if(lgzaNum == 0){
			alert('治安系统化解处置个人极端暴力犯罪案事件中涉及了爆炸物品、枪支、汽油等易燃物品、剧毒化学品案件，必须填写相应物品数量');
			return  ;
		}
	}
	
	if($("#id").val()){
		$("#isOk").val('true');
		$("#operType").val('update');
	}
	
	var isOk = $("#isOk").val();
	if(isOk == 'true'){
		var formData =$("#zapctbform").serialize()+'&t='+new Date().getTime();
		$.ajax({
			type: "post",
			data: formData,
			url: contextPath + '/qzgl/wmfwgl/saveStZapctb.action',
			success: function(msg){
				msg = eval('('+msg+')');
				if (msg.id){
					if($("#operType").val()=="add"){
						$("#id").val(msg.id);
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
function isNumber(id){
	var value =$("#"+id).val();
	if( typeof value == 'undefine' || value == ''){
		$("#isOk").val('false');
		return  ;
	}
	if(isNaN(value)){
		alert('只能填写数值');
		$('#'+id).val('');
		$("#isOk").val('false');
		return ;
	}
	var isD = value.indexOf('.');
	if(isD>=0){
		alert('只能填写整数值！');
		$('#'+id).val('');
		$("#isOk").val('false');
		return ;
	}
	var O = value.indexOf('0');
	if(O==0 && value.length>1){
		alert('不能以0开头');
		$('#'+id).val('');
		$("#isOk").val('false');
		return ;
	}
	var j = value.indexOf('-');
	if(j == 0 && value.length>1){
		alert('只能填写正数');
		$('#'+id).val('');
		$("#isOk").val('false');
		return ;
	}
	$("#isOk").val('true');
}
//显示说明
function showShuoMing(){
	var html = '<Strong>&nbsp;&nbsp;<font style=\"color:red;\">逻辑关系</font></Strong>';
	html = html + '<br/>&nbsp;&nbsp;只能填写数字，<br/>&nbsp;&nbsp;所有项目必填';
	html = html + '<br/>&nbsp;&nbsp;1&nbsp;=&nbsp;2+3+4+5+6+7';
	html = html + '&nbsp;=&nbsp;12+26';
	html = html + '<br/>&nbsp;&nbsp;12&nbsp;=&nbsp;13+14+15+16+17+18+19';
	html = html + '&nbsp;=&nbsp;20+21+22+23+24+25';
	html = html + '<br/>&nbsp;&nbsp;27&nbsp;=&nbsp;28+29+30+31';
	html = html + '&nbsp;=&nbsp;32+33+34+35+36';
	html = html + '&nbsp;=&nbsp;37+38+39';
	html = html +'<br/>&nbsp;&nbsp;<a onclick=\"clearShuoMing()\" href=\"javascript:clearShuoMing()\" style=\"text-decoration:underline;\"><font color=\"#00FF00\">点击隐藏。</font></a>';
	document.getElementById("shuoming").innerHTML= html ;
}
// 隐藏说明
function clearShuoMing(){
	document.getElementById("shuoming").innerHTML ='';
}
function dateChange(){
	var _tjyf = $("#tjyf").val();
	var _djdwdm = $("#djdwdm").val();
	var stdate =_tjyf.substr(0,4)+'-'+ _tjyf.substr(4,6)+'-01'+' 23:59:59';
	stdate =stdate.replace(/-/g,"/");
	var today = new Date(stdate); 
	today.setFullYear(_tjyf.substr(0,4));
	today.setMonth(today.getMonth()+2);
	var Mon =  ''+today.getMonth();
	if(Mon.length<2){
		Mon = Number(Mon);
		Mon = '0'+Mon;
	};
	var Year = today.getYear();
	var strEnd = Year+'年'+Mon+'月'+'03'+'日';
	var strStart = _tjyf.substr(0,4)+'年'+ _tjyf.substr(4,6)+'月'+'04'+'日';
	var titless = strStart + '&nbsp;-&nbsp;' + strEnd ; 
	
	$("#tjqsrq").val(_tjyf+'04');
	$("#tjjzrq").val(Year+''+Mon+'03');
	
	$("#title").html("统计日期：" + titless);
	$.ajax({
		type:'get',
		url: contextPath + '/qzgl/wmfwgl/queryStZapctbByDjdwdmAndTjny.action?zapcquery.tjyf='+_tjyf+'&zapcquery.djdwdm='+_djdwdm ,
		success:function(obj){
			obj = eval('('+obj+')');
			if(obj.id){
				 $("#hja").val(obj.hja)       ;     //  varchar2(10)  y      排查发现可能引发个人极端暴力犯罪的线索数：合计(必须填写数字)
				 $("#lljf").val(obj.lljf)       ;     //  varchar2(10)  y      原因分析：邻里纠纷(必须填写数字)
				 $("#zdcq").val(obj.zdcq)      ;     //  varchar2(10)  y      原因分析：征地拆迁(必须填写数字)
				 $("#tqgz").val(obj.tqgz)      ;     //  varchar2(10)  y      原因分析：拖欠工资(必须填写数字)
				 $("#fzcsw").val(obj.fzcsw)      ;     //  varchar2(10)  y      原因分析：非正常死亡(必须填写数字)
				 $("#sfss").val(obj.sfss)     ;     //  varchar2(10)  y      原因分析：涉法涉诉(必须填写数字)
				 $("#qtyy").val(obj.qtyy)     ;     //  varchar2(10)  y      原因分析：其他(必须填写数字)
				 $("#mjpcfx").val(obj.mjpcfx)    ;     //  varchar2(10)  y      线索来源渠道分析：民警排查发现(必须填写数字)
				 $("#hlwjh").val(obj.hlwjh)    ;     //  varchar2(10)  y      "线索来源渠道分析：互联网截获(必须填写数字)"
				 $("#dhjb").val(obj.dhjb)     ;     //  varchar2(10)  y      线索来源渠道分析：110接报(必须填写数字)
				 $("#qzjb").val(obj.qzjb)      ;     //  varchar2(10)  y      线索来源渠道分析：群众举报(必须填写数字)
				  
				 $("#hjb").val(obj.hjb)     ;     //  varchar2(10)  y      治安系统化解处置个人极端暴力犯罪案事件数：合计(必须填写数字)
				 $("#qsydw").val(obj.qsydw)     ;     //  varchar2(10)  y      预谋实施的场所部位分析：企事业单位(必须填写数字)
				 $("#dzjg").val(obj.dzjg)     ;     //  varchar2(10)  y      预谋实施的场所部位分析：党政机关(必须填写数字)
				 $("#xx").val(obj.xx)      ;     //  varchar2(10)  y      预谋实施的场所部位分析：学校(必须填写数字)
				 $("#jccz").val(obj.jccz)      ;     //  varchar2(10)  y      预谋实施的场所部位分析：机场、车站、码头、地铁(必须填写数字)
				 $("#gc").val(obj.gc)      ;     //  varchar2(10)  y      预谋实施的场所部位分析：广场、商业网点等人员密集公共场所(必须填写数字)
				 $("#jj").val(obj.jj)      ;     //  varchar2(10)  y      预谋实施的场所部位分析：进京(必须填写数字)
				 $("#qtbw").val(obj.qtbw)      ;     //  varchar2(10)  y      预谋实施的场所部位分析：其他(必须填写数字)
				 $("#bzwp").val(obj.bzwp)     ;     //  varchar2(10)  y      使用工具情况分析：爆炸物品(必须填写数字)
				 $("#qz").val(obj.qz)     ;     //  varchar2(10)  y      使用工具情况分析：枪支(必须填写数字)
				 $("#qy").val(obj.qy)     ;     //  varchar2(10)  y      使用工具情况分析：汽油等易燃物品(必须填写数字)
				 $("#jd").val(obj.jd)     ;     //  varchar2(10)  y      使用工具情况分析：剧毒化学品(必须填写数字)
				 $("#dj").val(obj.dj)     ;     //  varchar2(10)  y      使用工具情况分析：刀具(必须填写数字)
				 $("#qtgj").val(obj.qtgj)    ;     //  varchar2(10)  y      使用工具情况分析：其他(必须填写数字)
				 $("#yjqtjz").val(obj.yjqtjz)    ;     //  varchar2(10)  y      移交其他警种和政府有关部门(必须填写数字)
				  
				 $("#hjc").val(obj.hjc)     ;     //  varchar2(10)  y      稳控打击有个人极端暴力犯罪倾向的重点人数：合计(必须填写数字)
				 $("#esyx").val(obj.esyx)    ;     //  varchar2(10)  y      年龄阶段分析：20岁以下(必须填写数字)
				 $("#eszss").val(obj.eszss)    ;     //  varchar2(10)  y      年龄阶段分析：20-40岁(必须填写数字)
				 $("#syzws").val(obj.syzws)    ;     //  varchar2(10)  y      年龄阶段分析：41-50岁(必须填写数字)
				 $("#ssyys").val(obj.ssyys)    ;     //  varchar2(10)  y      年龄阶段分析：51岁以上(必须填写数字)
				 $("#wyry").val(obj.wyry)    ;     //  varchar2(10)  y      重点人群分析：无业人员(必须填写数字)
				 $("#wlwgry").val(obj.wlwgry)   ;     //  varchar2(10)  y      重点人群分析：外来务工人员(必须填写数字)
				 $("#sfry").val(obj.sfry)   ;     //  varchar2(10)  y      重点人群分析：上访人员(必须填写数字)
				 $("#jsbr").val(obj.jsbr)   ;     //  varchar2(10)  y      重点人群分析：精神病人(必须填写数字)
				 $("#qtrq").val(obj.qtrq)    ;     //  varchar2(10)  y      重点人群分析：其他(必须填写数字)
				 $("#zacf").val(obj.zacf)    ;     //  varchar2(10)  y      采取处置措施情况：治安处罚(必须填写数字)
				 $("#xscf").val(obj.xscf)   ;     //  varchar2(10)  y      采取处置措施情况：刑事处罚(必须填写数字)
				 $("#rcwk").val(obj.rcwk)   ;     //  varchar2(10)  y      采取处置措施情况：日常稳控(必须填写数字)
				 
				 $("#sjzy").val(obj.sjzy)     ;     //  varchar2(10)  y      收缴炸药（公斤）(必须填写数字)
				 $("#lg").val(obj.lg)    ;     //  varchar2(10)  y      雷管（枚）(必须填写数字)
				 $("#jdhxp").val(obj.jdhxp)    ;     //  varchar2(10)  y      剧毒化学品（克）(必须填写数字)
				 $("#qzb").val(obj.qzb)     ;     //  varchar2(10)  y      枪支（把）(必须填写数字)
				 $("#zdb").val(obj.zdb)     ;     //  varchar2(10)  y      子弹（发）(必须填写数字)
				 $("#qyb").val(obj.qyb)     ;     //  varchar2(10)  y      汽油等易燃物品（升）(必须填写数字)
				
				 $("#operType").val('update'); 
				 $("#id").val(obj.id);
				 $("#isOk").val('true');
			}else{
				 $("#hja").val('')       ;     //  varchar2(10)  y      排查发现可能引发个人极端暴力犯罪的线索数：合计(必须填写数字)
				 $("#lljf").val('')       ;     //  varchar2(10)  y      原因分析：邻里纠纷(必须填写数字)
				 $("#zdcq").val('')      ;     //  varchar2(10)  y      原因分析：征地拆迁(必须填写数字)
				 $("#tqgz").val('')      ;     //  varchar2(10)  y      原因分析：拖欠工资(必须填写数字)
				 $("#fzcsw").val('')      ;     //  varchar2(10)  y      原因分析：非正常死亡(必须填写数字)
				 $("#sfss").val('')     ;     //  varchar2(10)  y      原因分析：涉法涉诉(必须填写数字)
				 $("#qtyy").val('')     ;     //  varchar2(10)  y      原因分析：其他(必须填写数字)
				 $("#mjpcfx").val('')    ;     //  varchar2(10)  y      线索来源渠道分析：民警排查发现(必须填写数字)
				 $("#hlwjh").val('')    ;     //  varchar2(10)  y      "线索来源渠道分析：互联网截获(必须填写数字)"
				 $("#dhjb").val('')     ;     //  varchar2(10)  y      线索来源渠道分析：110接报(必须填写数字)
				 $("#qzjb").val('')      ;     //  varchar2(10)  y      线索来源渠道分析：群众举报(必须填写数字)
				  
				 $("#hjb").val('')     ;     //  varchar2(10)  y      治安系统化解处置个人极端暴力犯罪案事件数：合计(必须填写数字)
				 $("#qsydw").val('')     ;     //  varchar2(10)  y      预谋实施的场所部位分析：企事业单位(必须填写数字)
				 $("#dzjg").val('')     ;     //  varchar2(10)  y      预谋实施的场所部位分析：党政机关(必须填写数字)
				 $("#xx").val('')      ;     //  varchar2(10)  y      预谋实施的场所部位分析：学校(必须填写数字)
				 $("#jccz").val('')      ;     //  varchar2(10)  y      预谋实施的场所部位分析：机场、车站、码头、地铁(必须填写数字)
				 $("#gc").val('')      ;     //  varchar2(10)  y      预谋实施的场所部位分析：广场、商业网点等人员密集公共场所(必须填写数字)
				 $("#jj").val('')      ;     //  varchar2(10)  y      预谋实施的场所部位分析：进京(必须填写数字)
				 $("#qtbw").val('')      ;     //  varchar2(10)  y      预谋实施的场所部位分析：其他(必须填写数字)
				 $("#bzwp").val('')     ;     //  varchar2(10)  y      使用工具情况分析：爆炸物品(必须填写数字)
				 $("#qz").val('')     ;     //  varchar2(10)  y      使用工具情况分析：枪支(必须填写数字)
				 $("#qy").val('')     ;     //  varchar2(10)  y      使用工具情况分析：汽油等易燃物品(必须填写数字)
				 $("#jd").val('')     ;     //  varchar2(10)  y      使用工具情况分析：剧毒化学品(必须填写数字)
				 $("#dj").val('')     ;     //  varchar2(10)  y      使用工具情况分析：刀具(必须填写数字)
				 $("#qtgj").val('')    ;     //  varchar2(10)  y      使用工具情况分析：其他(必须填写数字)
				 $("#yjqtjz").val('')    ;     //  varchar2(10)  y      移交其他警种和政府有关部门(必须填写数字)
				  
				 $("#hjc").val('')     ;     //  varchar2(10)  y      稳控打击有个人极端暴力犯罪倾向的重点人数：合计(必须填写数字)
				 $("#esyx").val('')    ;     //  varchar2(10)  y      年龄阶段分析：20岁以下(必须填写数字)
				 $("#eszss").val('')    ;     //  varchar2(10)  y      年龄阶段分析：20-40岁(必须填写数字)
				 $("#syzws").val('')    ;     //  varchar2(10)  y      年龄阶段分析：41-50岁(必须填写数字)
				 $("#ssyys").val('')    ;     //  varchar2(10)  y      年龄阶段分析：51岁以上(必须填写数字)
				 $("#wyry").val('')    ;     //  varchar2(10)  y      重点人群分析：无业人员(必须填写数字)
				 $("#wlwgry").val('')   ;     //  varchar2(10)  y      重点人群分析：外来务工人员(必须填写数字)
				 $("#sfry").val('')   ;     //  varchar2(10)  y      重点人群分析：上访人员(必须填写数字)
				 $("#jsbr").val('')   ;     //  varchar2(10)  y      重点人群分析：精神病人(必须填写数字)
				 $("#qtrq").val('')    ;     //  varchar2(10)  y      重点人群分析：其他(必须填写数字)
				 $("#zacf").val('')    ;     //  varchar2(10)  y      采取处置措施情况：治安处罚(必须填写数字)
				 $("#xscf").val('')   ;     //  varchar2(10)  y      采取处置措施情况：刑事处罚(必须填写数字)
				 $("#rcwk").val('')   ;     //  varchar2(10)  y      采取处置措施情况：日常稳控(必须填写数字)
				 
				 $("#sjzy").val('')     ;     //  varchar2(10)  y      收缴炸药（公斤）(必须填写数字)
				 $("#lg").val('')    ;     //  varchar2(10)  y      雷管（枚）(必须填写数字)
				 $("#jdhxp").val('')    ;     //  varchar2(10)  y      剧毒化学品（克）(必须填写数字)
				 $("#qzb").val('')     ;     //  varchar2(10)  y      枪支（把）(必须填写数字)
				 $("#zdb").val('')     ;     //  varchar2(10)  y      子弹（发）(必须填写数字)
				 $("#qyb").val('')     ;     //  varchar2(10)  y      汽油等易燃物品（升）(必须填写数字)
				 
				 $("#operType").val('add'); 
				 $("#id").val('');
			}
		}
	});
}

function dateChangeTwo(){
	var _tjyf = $("#tjyf").val();
	if ($.isBlank(_tjyf))
	{
		return false;
	}
	var _djdwdm = $("#djdwdm").val();
	var stdate =_tjyf.substr(0,4)+'-'+ _tjyf.substr(4,6)+'-01'+' 23:59:59';
	stdate =stdate.replace(/-/g,"/");
	var today = new Date(stdate); 
	today.setFullYear(_tjyf.substr(0,4));
	today.setMonth(today.getMonth()+2);
	var Mon =  ''+today.getMonth();
	if(Mon.length<2){
		Mon = Number(Mon);
		Mon = '0'+Mon;
	};
	var Year = today.getYear();
	var strEnd = Year+'年'+Mon+'月'+'03'+'日';
	var strStart = _tjyf.substr(0,4)+'年'+ _tjyf.substr(4,6)+'月'+'04'+'日';
	var titless = strStart + '&nbsp;-&nbsp;' + strEnd ; 
	
	$("#tjqsrq").val(_tjyf+'04');
	$("#tjjzrq").val(Year+''+Mon+'03');
	
	$("#title").html(titless);
	
	//tjbbStZapctb();
	
}

// 统计报表  全国治安系统开展排查发现及时化解提前处置个人极端暴力犯罪工作情况月报表
function tjbbStZapctb(){
	var dwdm = $("#jzdpcsdm").val();
	var ny = $("#tjyf").val();
	if(!dwdm){
		alert('请选择统计单位');
		return  ;
	}
	if(!ny){
		alert('请选择统计月份');
		return  ;
	}
	$.ajax({
		type:'GET',
		url: contextPath + '/qzgl/wmfwgl/queryStZapctbTjBBByDjdwdmAndTjny.action?zapcquery.djdwdm='+dwdm+'&zapcquery.tjyf='+ny,
		success:function(obj){
			obj = eval('('+obj+')');
			if(obj[0].hja){
				document.getElementById("hja1").innerHTML = obj[0].hja ;       
				document.getElementById("lljf1").innerHTML = obj[0].lljf ;      
				document.getElementById("zdcq1").innerHTML = obj[0].zdcq ;       
				document.getElementById("tqgz1").innerHTML = obj[0].tqgz ;       
				document.getElementById("fzcsw1").innerHTML = obj[0].fzcsw ;       
				document.getElementById("sfss1").innerHTML = obj[0].sfss ;       
				document.getElementById("qtyy1").innerHTML = obj[0].qtyy ;       
				document.getElementById("mjpcfx1").innerHTML = obj[0].mjpcfx ;       
				document.getElementById("hlwjh1").innerHTML = obj[0].hlwjh ;       
				document.getElementById("dhjb1").innerHTML = obj[0].dhjb ;       
				document.getElementById("qzjb1").innerHTML = obj[0].qzjb ;       
				
				document.getElementById("hjb1").innerHTML =  obj[0].hjb ;      
				document.getElementById("qsydw1").innerHTML = obj[0].qsydw ;       
				document.getElementById("dzjg1").innerHTML =  obj[0].dzjg ;      
				document.getElementById("xx1").innerHTML =  obj[0].xx ;      
				document.getElementById("jccz1").innerHTML = obj[0].jccz ;       
				document.getElementById("gc1").innerHTML = obj[0].gc ;       
				document.getElementById("jj1").innerHTML = obj[0].jj ;       
				document.getElementById("qtbw1").innerHTML =  obj[0].qtbw ;      
				document.getElementById("bzwp1").innerHTML =  obj[0].bzwp ;      
				document.getElementById("qz1").innerHTML = obj[0].qz ;       
				document.getElementById("qy1").innerHTML = obj[0].qy ;       
				document.getElementById("jd1").innerHTML = obj[0].jd ;       
				document.getElementById("dj1").innerHTML = obj[0].dj ;       
				document.getElementById("qtgj1").innerHTML = obj[0].qtgj ;       
				document.getElementById("yjqtjz1").innerHTML = obj[0].yjqtjz ;       
				
				document.getElementById("hjc1").innerHTML = obj[0].hjc ;       
				document.getElementById("esyx1").innerHTML = obj[0].esyx ;      
				document.getElementById("eszss1").innerHTML = obj[0].eszss ;       
				document.getElementById("syzws1").innerHTML = obj[0].syzws ;       
				document.getElementById("ssyys1").innerHTML = obj[0].ssyys ;       
				document.getElementById("wyry1").innerHTML =  obj[0].wyry ;     
				document.getElementById("wlwgry1").innerHTML = obj[0].wlwgry ;       
				document.getElementById("sfry1").innerHTML = obj[0].sfry ;       
				document.getElementById("jsbr1").innerHTML =  obj[0].jsbr ;      
				document.getElementById("qtrq1").innerHTML = obj[0].qtrq ;       
				document.getElementById("zacf1").innerHTML = obj[0].zacf ;       
				document.getElementById("xscf1").innerHTML = obj[0].xscf ;       
				document.getElementById("rcwk1").innerHTML = obj[0].rcwk ;       
				
				document.getElementById("sjzy1").value = obj[0].sjzy ;       
				document.getElementById("lg1").value =   obj[0].lg ;     
				document.getElementById("jdhxp1").value = obj[0].jdhxp ;       
				document.getElementById("qzb1").value =  obj[0].qzb ;      
				document.getElementById("zdb1").value = obj[0].zdb ;       
				document.getElementById("qyb1").value =  obj[0].qyb ;      
			}else{
				document.getElementById("hja1").innerHTML = '' ;       
				document.getElementById("lljf1").innerHTML = ''  ;      
				document.getElementById("zdcq1").innerHTML =  '' ;       
				document.getElementById("tqgz1").innerHTML =  ''  ;       
				document.getElementById("fzcsw1").innerHTML =  '' ;       
				document.getElementById("sfss1").innerHTML =  ''  ;       
				document.getElementById("qtyy1").innerHTML =  ''  ;       
				document.getElementById("mjpcfx1").innerHTML =  ''  ;       
				document.getElementById("hlwjh1").innerHTML =  ''  ;       
				document.getElementById("dhjb1").innerHTML =  ''  ;       
				document.getElementById("qzjb1").innerHTML =  ''  ;       
				
				document.getElementById("hjb1").innerHTML =   ''  ;      
				document.getElementById("qsydw1").innerHTML =  ''  ;       
				document.getElementById("dzjg1").innerHTML =   ''  ;      
				document.getElementById("xx1").innerHTML =   ''  ;      
				document.getElementById("jccz1").innerHTML =  ''  ;       
				document.getElementById("gc1").innerHTML =  ''  ;       
				document.getElementById("jj1").innerHTML =  ''  ;       
				document.getElementById("qtbw1").innerHTML =   '' ;      
				document.getElementById("bzwp1").innerHTML =   ''  ;      
				document.getElementById("qz1").innerHTML =  '' ;       
				document.getElementById("qy1").innerHTML =  ''  ;       
				document.getElementById("jd1").innerHTML =  ''  ;       
				document.getElementById("dj1").innerHTML =  ''  ;       
				document.getElementById("qtgj1").innerHTML =  ''  ;       
				document.getElementById("yjqtjz1").innerHTML = ''  ;       
				
				document.getElementById("hjc1").innerHTML =  ''  ;       
				document.getElementById("esyx1").innerHTML =  ''  ;      
				document.getElementById("eszss1").innerHTML =  ''  ;       
				document.getElementById("syzws1").innerHTML =  '' ;       
				document.getElementById("ssyys1").innerHTML =  ''  ;       
				document.getElementById("wyry1").innerHTML =   ''  ;     
				document.getElementById("wlwgry1").innerHTML =  ''  ;       
				document.getElementById("sfry1").innerHTML =  ''  ;       
				document.getElementById("jsbr1").innerHTML =   ''  ;      
				document.getElementById("qtrq1").innerHTML =  ''  ;       
				document.getElementById("zacf1").innerHTML =  ''  ;       
				document.getElementById("xscf1").innerHTML =  ''  ;       
				document.getElementById("rcwk1").innerHTML =  ''  ;       
				
				document.getElementById("sjzy1").value = '' ;       
				document.getElementById("lg1").value =   '' ;     
				document.getElementById("jdhxp1").value = '' ;       
				document.getElementById("qzb1").value =  '' ;      
				document.getElementById("zdb1").value = '' ;       
				document.getElementById("qyb1").value =  '' ;      
			}
			if(obj[1].hja){
				document.getElementById("hja2").innerHTML = obj[1].hja ;       
				document.getElementById("lljf2").innerHTML = obj[1].lljf ;      
				document.getElementById("zdcq2").innerHTML = obj[1].zdcq ;       
				document.getElementById("tqgz2").innerHTML = obj[1].tqgz ;       
				document.getElementById("fzcsw2").innerHTML = obj[1].fzcsw ;       
				document.getElementById("sfss2").innerHTML = obj[1].sfss ;       
				document.getElementById("qtyy2").innerHTML = obj[1].qtyy ;       
				document.getElementById("mjpcfx2").innerHTML = obj[1].mjpcfx ;       
				document.getElementById("hlwjh2").innerHTML = obj[1].hlwjh ;       
				document.getElementById("dhjb2").innerHTML = obj[1].dhjb ;       
				document.getElementById("qzjb2").innerHTML = obj[1].qzjb ;       
				
				document.getElementById("hjb2").innerHTML =  obj[1].hjb ;      
				document.getElementById("qsydw2").innerHTML = obj[1].qsydw ;       
				document.getElementById("dzjg2").innerHTML =  obj[1].dzjg ;      
				document.getElementById("xx2").innerHTML =  obj[1].xx ;      
				document.getElementById("jccz2").innerHTML = obj[1].jccz ;       
				document.getElementById("gc2").innerHTML = obj[1].gc ;       
				document.getElementById("jj2").innerHTML = obj[1].jj ;       
				document.getElementById("qtbw2").innerHTML =  obj[1].qtbw ;      
				document.getElementById("bzwp2").innerHTML =  obj[1].bzwp ;      
				document.getElementById("qz2").innerHTML = obj[1].qz ;       
				document.getElementById("qy2").innerHTML = obj[1].qy ;       
				document.getElementById("jd2").innerHTML = obj[1].jd ;       
				document.getElementById("dj2").innerHTML = obj[1].dj ;       
				document.getElementById("qtgj2").innerHTML = obj[1].qtgj ;       
				document.getElementById("yjqtjz2").innerHTML = obj[1].yjqtjz ;       
				
				document.getElementById("hjc2").innerHTML = obj[1].hjc ;       
				document.getElementById("esyx2").innerHTML = obj[1].esyx ;      
				document.getElementById("eszss2").innerHTML = obj[1].eszss ;       
				document.getElementById("syzws2").innerHTML = obj[1].syzws ;       
				document.getElementById("ssyys2").innerHTML = obj[1].ssyys ;       
				document.getElementById("wyry2").innerHTML =  obj[1].wyry ;     
				document.getElementById("wlwgry2").innerHTML = obj[1].wlwgry ;       
				document.getElementById("sfry2").innerHTML = obj[1].sfry ;       
				document.getElementById("jsbr2").innerHTML =  obj[1].jsbr ;      
				document.getElementById("qtrq2").innerHTML = obj[1].qtrq ;       
				document.getElementById("zacf2").innerHTML = obj[1].zacf ;       
				document.getElementById("xscf2").innerHTML = obj[1].xscf ;       
				document.getElementById("rcwk2").innerHTML = obj[1].rcwk ;       
				
				document.getElementById("sjzy1").value = obj[0].sjzy ;       
				document.getElementById("lg1").value =   obj[0].lg ;     
				document.getElementById("jdhxp1").value = obj[0].jdhxp ;       
				document.getElementById("qzb1").value =  obj[0].qzb ;      
				document.getElementById("zdb1").value = obj[0].zdb ;       
				document.getElementById("qyb1").value =  obj[0].qyb ;      
			}else{
				document.getElementById("hja2").innerHTML = '' ;       
				document.getElementById("lljf2").innerHTML = ''  ;      
				document.getElementById("zdcq2").innerHTML =  '' ;       
				document.getElementById("tqgz2").innerHTML =  ''  ;       
				document.getElementById("fzcsw2").innerHTML =  '' ;       
				document.getElementById("sfss2").innerHTML =  ''  ;       
				document.getElementById("qtyy2").innerHTML =  ''  ;       
				document.getElementById("mjpcfx2").innerHTML =  ''  ;       
				document.getElementById("hlwjh2").innerHTML =  ''  ;       
				document.getElementById("dhjb2").innerHTML =  ''  ;       
				document.getElementById("qzjb2").innerHTML =  ''  ;       
				
				document.getElementById("hjb2").innerHTML =   ''  ;      
				document.getElementById("qsydw2").innerHTML =  ''  ;       
				document.getElementById("dzjg2").innerHTML =   ''  ;      
				document.getElementById("xx2").innerHTML =   ''  ;      
				document.getElementById("jccz2").innerHTML =  ''  ;       
				document.getElementById("gc2").innerHTML =  ''  ;       
				document.getElementById("jj2").innerHTML =  ''  ;       
				document.getElementById("qtbw2").innerHTML =   '' ;      
				document.getElementById("bzwp2").innerHTML =   ''  ;      
				document.getElementById("qz2").innerHTML =  '' ;       
				document.getElementById("qy2").innerHTML =  ''  ;       
				document.getElementById("jd2").innerHTML =  ''  ;       
				document.getElementById("dj2").innerHTML =  ''  ;       
				document.getElementById("qtgj2").innerHTML =  ''  ;       
				document.getElementById("yjqtjz2").innerHTML = ''  ;       
				
				document.getElementById("hjc2").innerHTML =  ''  ;       
				document.getElementById("esyx2").innerHTML =  ''  ;      
				document.getElementById("eszss2").innerHTML =  ''  ;       
				document.getElementById("syzws2").innerHTML =  '' ;       
				document.getElementById("ssyys2").innerHTML =  ''  ;       
				document.getElementById("wyry2").innerHTML =   ''  ;     
				document.getElementById("wlwgry2").innerHTML =  ''  ;       
				document.getElementById("sfry2").innerHTML =  ''  ;       
				document.getElementById("jsbr2").innerHTML =   ''  ;      
				document.getElementById("qtrq2").innerHTML =  ''  ;       
				document.getElementById("zacf2").innerHTML =  ''  ;       
				document.getElementById("xscf2").innerHTML =  ''  ;       
				document.getElementById("rcwk2").innerHTML =  ''  ;       
				
			}
		}
	});
	
}
// 点击查看明细1(治安)
function queryStZapcMingXiA(){
	var dwdm = $("#jzdpcsdm").val();
	var ny = $("#tjyf").val();
	if(!dwdm){
		alert('请选择统计单位');
		return  ;
	}
	if(!ny){
		alert('请选择统计月份');
		return  ;
	}
	
	var _tjyf = $("#tjyf").val();
	var _djdwdm = $("#djdwdm").val();
	var stdate =_tjyf.substr(0,4)+'-'+ _tjyf.substr(4,6)+'-01'+' 23:59:59';
	stdate =stdate.replace(/-/g,"/");
	var today = new Date(stdate); 
	today.setFullYear(_tjyf.substr(0,4));
	today.setMonth(today.getMonth()+2);
	var Mon =  ''+today.getMonth();
	if(Mon.length<2){
		Mon = Number(Mon);
		Mon = '0'+Mon;
	};
	var Year = today.getYear();
	var strEnd = Year+'年'+Mon+'月'+'03'+'日';
	var strStart = _tjyf.substr(0,4)+'年'+ _tjyf.substr(4,6)+'月'+'04'+'日';
	var titless = strStart + '&nbsp;-&nbsp;' + strEnd ; 
	
	$.openWindow({
		url : contextPath + '/qzgl/wmfwgl/openStZapcTbbMingXi.action',
		data : {"zapcquery.djdwdm":dwdm,
				"zapcquery.tjyf":ny,
				"zapcquery.jb":'0',
				"zapcquery.titless":titless}
		})
}
// 点击查看明细2（派出所）
function queryStZapcMingXiB(){
	var dwdm = $("#jzdpcsdm").val();
	var ny = $("#tjyf").val();
	if(!dwdm){
		alert('请选择统计单位');
		return  ;
	}
	if(!ny){
		alert('请选择统计月份');
		return  ;
	}
	
	var _tjyf = $("#tjyf").val();
	var _djdwdm = $("#djdwdm").val();
	var stdate =_tjyf.substr(0,4)+'-'+ _tjyf.substr(4,6)+'-01'+' 23:59:59';
	stdate =stdate.replace(/-/g,"/");
	var today = new Date(stdate); 
	today.setFullYear(_tjyf.substr(0,4));
	today.setMonth(today.getMonth()+2);
	var Mon =  ''+today.getMonth();
	if(Mon.length<2){
		Mon = Number(Mon);
		Mon = '0'+Mon;
	};
	var Year = today.getYear();
	var strEnd = Year+'年'+Mon+'月'+'03'+'日';
	var strStart = _tjyf.substr(0,4)+'年'+ _tjyf.substr(4,6)+'月'+'04'+'日';
	var titless = strStart + '&nbsp;-&nbsp;' + strEnd ; 
	
	$.openWindow({
		url : contextPath + '/qzgl/wmfwgl/openStZapcTbbMingXi.action',
		data : {"zapcquery.djdwdm":dwdm,
				"zapcquery.tjyf":ny,
				"zapcquery.jb":'1',
				"zapcquery.titless":titless}
		})
}
// 点击单位名称，更新文字内容
function queryMxi(djdwdm,tjyf){
	$.ajax({
		type: 'POST',
		data : {"zapcquery.djdwdm":djdwdm,
				"zapcquery.tjyf":tjyf},
		url: contextPath + '/qzgl/wmfwgl/queryStZapcTbbMingXiLgzy.action',
		success:function(obj){
			obj = eval('('+obj+')');
			if(!obj.id){
				$("#sjzy").val(obj.sjzy);
				$("#lg").val(obj.lg);
				$("#jdhxp").val(obj.jdhxp);
				$("#qzb").val(obj.qzb);
				$("#zdb").val(obj.zdb);
				$("#qyb").val(obj.qyb);
			}
		}
	});
}

function orgSelect(code,hiddenfield,showfield)
{
	if (code) 
	{
		openDwSelect({
			rootOrgCode : code.substr(0,4) + "00000000",
			mutilSelect : false,
			nodeSelectedType : "ps",
			nodeNotSelectedType : "ps"
			}, 
			function(orgbeans) {
				if (orgbeans != null) {
					$("#" + hiddenfield).val(orgbeans.id);
					$("#" + showfield).val(orgbeans.name);
				}
			});
	} 
	else 
	{
		alert("无效的机构代码")
	}
}
// 导出结果
function downloadTJExcel(){
	var dwdm = $("#jzdpcsdm").val();
	var ny = $("#tjyf").val();
	if(!dwdm){
		alert('请选择统计单位');
		return  ;
	}
	if(!ny){
		alert('请选择统计月份');
		return  ;
	}
	
	var _tjyf = $("#tjyf").val();
	var _djdwdm = $("#djdwdm").val();
	var stdate =_tjyf.substr(0,4)+'-'+ _tjyf.substr(4,6)+'-01'+' 23:59:59';
	stdate =stdate.replace(/-/g,"/");
	var today = new Date(stdate); 
	today.setFullYear(_tjyf.substr(0,4));
	today.setMonth(today.getMonth()+2);
	var Mon =  ''+today.getMonth();
	if(Mon.length<2){
		Mon = Number(Mon);
		Mon = '0'+Mon;
	};
	var Year = today.getYear();
	var strEnd = Year+'年'+Mon+'月'+'03'+'日';
	var strStart = _tjyf.substr(0,4)+'年'+ _tjyf.substr(4,6)+'月'+'04'+'日';
	var titless = strStart + '&nbsp;-&nbsp;' + strEnd ; 
	var _tbdwmc = $("#jzdpcsmc").val();
	var _tbrxm = $("#tbrxm").val();
	$.openWindow({
		data :{"zapcquery.djdwdm":dwdm,
				"zapcquery.tjyf":ny,
				"zapcquery.titless":titless,
				"zapcquery.tbdwmc":_tbdwmc,
				"zapcquery.tbrxm":_tbrxm,
				"t":new Date().getTime()
			  },
		url : contextPath + '/qzgl/wmfwgl/downloadStZapcTbbExcel.action'
	});
}

function countTwoToSive()
{
	var lljf = parseInt($.isBlank($("#lljf").val())? "0" : $("#lljf").val());
	var zdcq = parseInt($.isBlank($("#zdcq").val())? "0" : $("#zdcq").val());
	var tqgz = parseInt($.isBlank($("#tqgz").val())? "0" : $("#tqgz").val());
	var fzcsw = parseInt($.isBlank($("#fzcsw").val())? "0" : $("#fzcsw").val());
	var sfss = parseInt($.isBlank($("#sfss").val()) ? "0" : $("#sfss").val());
	var qtyy = parseInt($.isBlank($("#qtyy").val())? "0":$("#qtyy").val());
	
	$("#hja").val(lljf + zdcq + tqgz + fzcsw + sfss + qtyy);
}

function count13To19()
{
	var qsydw = parseInt($.isBlank($("#qsydw").val())? "0" : $("#qsydw").val());
	var dzjg = parseInt($.isBlank($("#dzjg").val())? "0" : $("#dzjg").val());
	var xx = parseInt($.isBlank($("#xx").val())? "0" : $("#xx").val());
	var jccz = parseInt($.isBlank($("#jccz").val())? "0" : $("#jccz").val());
	var gc = parseInt($.isBlank($("#gc").val()) ? "0" : $("#gc").val());
	var jj = parseInt($.isBlank($("#jj").val())? "0":$("#jj").val());
	var qtbw = parseInt($.isBlank($("#qtbw").val())? "0":$("#qtbw").val());
	
	$("#hjb").val(qsydw + dzjg + xx + jccz + gc + jj + qtbw);
}