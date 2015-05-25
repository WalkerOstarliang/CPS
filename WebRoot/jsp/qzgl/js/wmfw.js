function jxquery(){
	if (typeof $("#tgzmquerylist").val() != 'undefined'){
		$("#tgzmquerylist").query("F","tgzmqueryform");
	}
}

function clearQuery(){
	if (typeof $("#tgzmquerylist").val() != 'undefined'){
		$("#sqrxm").val("");
		$("#startDate").val("");
		$("#endDate").val("");
		$("#cbrxm").val("");
		$("#cbdwmc").val("");
		$("#startTime").val("");
		$("#endTime").val("");
		$("#tgzmlx").val("");
	}
	jxquery()
}

function sqrxmrowcallback(trObj, rowdataobj){
	var v_id = rowdataobj["id"];
	var v_sqrxm = rowdataobj["sqrxm"];
	var _html = '';
	var v_w = 980;
	var v_h = 500;
	var _url = contextPath + '/qzgl/wmfwgl/toTgzmPage.action';
	_html = '<a href="###" onclick="openWin(\''+v_id+'\',\''+_url+'\',\'detail\',\''+v_w+'\',\''+v_h+'\')"><font title="点击查看详情" style="color:green;">' + v_sqrxm + '</font></a>' + '&nbsp;';
	return _html;
}
// 选择单位
function selectDw(orgcode, hiddenfield, showfield){
	openDwSelect({
		rootOrgCode : orgcode,
  		mutilSelect : false,
   		nodeSelectedType : "ps",
   		nodeNotSelectedType : "ps"
	},function(orgbeans){
		if(orgbeans){
			$("#"+hiddenfield).val(orgbeans.id);
			$("#"+showfield).val(orgbeans.name);
		}
	});
}

// 所有弹出页面函数
function openWin(v_id,v_url,type,v_w,v_h){
//openDialogWindow  openWindow
	$.openDialogWindow({
		url : v_url,
		data : {operType : type,id : v_id,t:Math.random()},
		width : v_w,
		height :v_h,
		callback : function()
		{
			if($(type != "detail"))
			{
				clearQuery();
				jxquery();
				
				mtryclearQuery();
				mtryquery();
				
				qyryclearQuery();
				qyryquery();
				
				qtryclearQuery();
				qtryquery(); 
				if (typeof reloadQtry == 'function'){
					reloadQtry();
				};
				
				qtfwclearQuery();
				qtfwquery();
			}
		}
	})
}
//新增“提供证明” 信息
function addTgzm(){
	var v_id  ='';
	var v_url = contextPath + '/qzgl/wmfwgl/toTgzmPage.action';
	var type  = 'add';
	var v_w = 980;
	var v_h = 500;
	openWin(v_id,v_url,type,v_w,v_h);
}
// 修改“提供证明” 信息
function xgTgzm(){
	var selectes = $("#tgzmquerylist").getSelected();
	if (selectes.length > 1){
		alert('只能选择一条记录')
		return false;
	}
	if (selectes.length > 0)
	{	 	 
		var v_id = selectes[0]["id"];
		var v_url = contextPath + '/qzgl/wmfwgl/toTgzmPage.action';
		var type  = 'update';
		var v_w = 980;
		var v_h = 500;
		openWin(v_id,v_url,type,v_w,v_h);
	}
	else
	{
		alert("请选择一条证明信息.");
	}
}	
// 删除选择的一条提供证明信息
function deleteTgzmxx(){
	var selectes = $("#tgzmquerylist").getSelected();
	if (selectes.length > 1){
		alert('只能选择一条记录')
		return false;
	}
	if (selectes.length > 0)
	{	 	 
		var _id = selectes[0]["id"];
		var bin = window.confirm("你确认要删除\"申请人\"为："+"\""+selectes[0]["sqrxm"]+"\""+"的提供证明记录吗？");
		if (bin){
			$.ajax({
				type: "post",
				data: {"id":_id,"operType":'delete'},
				url: contextPath + '/qzgl/wmfwgl/deleteTgzmBean.action',
				success: function(msg){
					if (msg){
						alert('删除成功')
						jxquery();
					}else {
						alert('删除失败')
					}
				}
			});
		}
	}
	else
	{
		alert("请选择一条证明信息.");
	}
}
// 保存“提供证明信息”
function submitSaveTgzm(clo){
	if ($.validateform("tgzmform"))
	{
		var formData =$("#tgzmform").serialize()+'&t='+new Date().getTime();
		$.ajax({
			type: "post",
			data: formData,
			url: $("#tgzmform").attr('action'),
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
// 打印“提供证明”信息
function printTgzm(oper){
	if(oper<10){
		bdhtml = window.document.body.innerHTML; // 获取当前页面的html代码
		sprnstr="<!--startprint"+oper+"-->"; // 设置打印开始区域
		eprnstr="<!--endprint"+oper+"-->"; //设置打印结束区域
		prnhtml=bdhtml.substr(bdhtml.indexOf(sprnstr)+18);// 从开始代码向后取html
		prnhtml=prnhtml.substr(0,prnhtml.indexOf(eprnstr));// 从结束代码向前取html
		window.document.body.innerHTML=prnhtml;
		window.print();
		window.document.body.innerHTML=bdhtml;
	}else{
		window.print();
	}
}
//迷途人员(回调函数)
function mtryxmrowcallback(trObj, rowdataobj){
	var v_id = rowdataobj["id"];
	var v_mtryxm = rowdataobj["mtryxm"];
	var _html = '';
	var v_w = 1000;
	var v_h = 750;
	var _url = contextPath + '/qzgl/wmfwgl/toMtryPage.action';
	_html = '<a href="###" onclick="openWin(\''+v_id+'\',\''+_url+'\',\'detail\',\''+v_w+'\',\''+v_h+'\')"><font title="点击查看详情" style="color:green;">' + v_mtryxm + '</font></a>' + '&nbsp;';
	return _html;
}
// 查询迷途人员列表
function mtryquery(){
	if (typeof $("#mtryquerylist").val() != 'undefined'){
		$("#mtryquerylist").query("F","mtryqueryform");
	}
}
//新增或修改迷途人员移送信息
function queryMtryYsxx(){
	var selectes = $("#mtryquerylist").getSelected();
	if (selectes.length > 1){
		alert('只能选择一条记录')
		return false;
	}
	if (selectes.length > 0)
	{	 	 
		var v_id = selectes[0]["id"];
		var v_url = contextPath + '/qzgl/wmfwgl/toMtryYsxxPage.action';
		var type  = 'update';
		var v_w = 750;
		var v_h = 350;
		openWin(v_id,v_url,type,v_w,v_h);
	}
	else
	{
		alert("请选择一条迷途人员信息.");
	}
}
//查询迷途人员条件重置
function mtryclearQuery(){
	if (typeof $("#mtryquerylist").val() != 'undefined'){
		$("#mtryxm").val("");
		$("#fxstartDate").val("");
		$("#fxendDate").val("");
		$("#mtryly").val("");
		$("#mtrysjrxm").val("");
		$("#dsstartDate").val("");
		$("#dsendDate").val("");
	}
	mtryquery();
}
//新增迷途人员信息
function addMtry(){
	var v_id  ='';
	var v_url = contextPath + '/qzgl/wmfwgl/toMtryPage.action';
	var type  = 'add';
	var v_w = 1000;
	var v_h = 750;
	openWin(v_id,v_url,type,v_w,v_h);
}
// 新增迷途人员照片(保存图片)
function insertMtryzp(){
	var formid = $("#mtryform").attr("id");
	var _img = $("#zpid");
	var v_id = $("#id").val();
	if (!v_id){
		alert('请先保存迷途人员信息')
		return false;
	};
	if ($.validateform(formid))
	{
		var str = _img.val();
		if (!str){
			alert('请先选择要上传的图片')
			return false;
		}
		var strtype = str.substring(str.length-3,str.length);
		if(strtype!=='jpg'&& strtype!=='peg' && strtype!=='gif' && strtype!=='png'){
			alert('只能上传jpg、jpeg、gif、png格式的照片')
			return false;
		}
		$("#" + formid).ajaxSubmit({
			type:"post",
			dataType:"json",
			url:contextPath + "/qzgl/wmfwgl/insertMtryPh.action",
			success: function(){
				$("#mtryzmzp").attr('src','');
				$("#mtryzmzp").attr('src',contextPath + '/qzgl/wmfwgl/showMtryPh.action?id='+$("#id").val()+'&t='+ Math.random());
			}
		});
	}
}
// 删除迷途人员照片
function deleteMtryZp(){
	var v_id = $("#id").val();
	if (!v_id){
		alert('请先保存迷途人员信息')
		return false;
	};
	$.ajax({
		type:'post',
		url:contextPath + "/qzgl/wmfwgl/deleteMtryPh.action?id="+v_id,
		success: function(){
			$("#mtryzmzp").attr('src','');
			$("#mtryzmzp").attr('src',contextPath + '/qzgl/wmfwgl/showMtryPh.action?id='+$("#id").val()+'&t='+ Math.random());
		}
	})
}
//修改迷途人员信息
function xgMtry(){
	var selectes = $("#mtryquerylist").getSelected();
	if (selectes.length > 1){
		alert('只能选择一条记录')
		return false;
	}
	if (selectes.length > 0)
	{	 	 
		var v_id = selectes[0]["id"];
		var v_url = contextPath + '/qzgl/wmfwgl/toMtryPage.action';
		var type  = 'update';
		var v_w = 980;
		var v_h = 750;
		openWin(v_id,v_url,type,v_w,v_h);
	}
	else
	{
		alert("请选择一条迷途人员信息.");
	}
}
//保存迷途人员信息
function submitSaveMtry(clo){
	if ($.validateform("mtryform"))
	{
		var formData =$("#mtryform").serialize()+'&t='+new Date().getTime();
		$.ajax({
			type: "post",
			data: formData,
			url: contextPath + $("#mtryform").attr('action'),
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
//保存迷途人员移送信息
function submitSaveMtryYsxx(clo){
	if ($.validateform("mtryysxxform"))
	{
		var formData =$("#mtryysxxform").serialize()+'&t='+new Date().getTime();
		$.ajax({
			type: "post",
			data: formData,
			url: contextPath + $("#mtryysxxform").attr('action'),
			success: function(msg){
				if (msg){
					alert('保存成功!')
				}else {
					alert('保存失败!')
				}
			}
		});
	}
}
//打印迷途人员移送信息
function printMtryYsxx(oper){
	printMtry(oper);
}


//删除迷途人员信息
function deleteMtry(){
	var selectes = $("#mtryquerylist").getSelected();
	if (selectes.length > 1){
		alert('只能选择一条记录')
		return false;
	}
	if (selectes.length > 0)
	{	 	 
		var _id = selectes[0]["id"];
		var bin = window.confirm("你确认要删除\"姓名\"为："+"\""+selectes[0]["mtryxm"]+"\""+"的迷途人员记录吗？");
		if (bin){
			$.ajax({
				type: "post",
				data: {"id":_id,"operType":'delete'},
				url: contextPath + '/qzgl/wmfwgl/deleteMtryBean.action',
				success: function(msg){
					if (msg){
						alert('删除成功')
						mtryquery();
					}else {
						alert('删除失败')
					}
				}
			});
		}
	}
	else
	{
		alert("请选择一条迷途人员信息.");
	}
}
// 打印“迷途人员信息”
function printMtry(oper){
	if(oper<10){
		bdhtml = window.document.body.innerHTML; // 获取当前页面的html代码
		sprnstr="<!--startprint"+oper+"-->"; // 设置打印开始区域
		eprnstr="<!--endprint"+oper+"-->"; //设置打印结束区域
		prnhtml=bdhtml.substr(bdhtml.indexOf(sprnstr)+18);// 从开始代码向后取html
		prnhtml=prnhtml.substr(0,prnhtml.indexOf(eprnstr));// 从结束代码向前取html
		window.document.body.innerHTML=prnhtml;
		window.print();
		window.document.body.innerHTML=bdhtml;
	}else{
		window.print();
	}
}

// 查询“弃婴信息”列表
function qyryquery(){
	if (typeof $("#qyryquerylist").val() != 'undefined'){
		$("#qyryquerylist").query("F","qyryqueryform");
	}
}

// 弃婴(回调函数)
function qyryxmrowcallback(trObj, rowdataobj){
	var v_id = rowdataobj["id"];
	var v_qyryxm = rowdataobj["qyryxm"];
	var _html = '';
	var v_w = 1000;
	var v_h = 750;
	var _url = contextPath + '/qzgl/wmfwgl/toQyryPage.action';
	_html = '<a href="###" onclick="openWin(\''+v_id+'\',\''+_url+'\',\'detail\',\''+v_w+'\',\''+v_h+'\')"><font title="点击查看详情" style="color:green;">' + v_qyryxm + '</font></a>' + '&nbsp;';
	return _html;
}
//重置“弃婴信息”列表查询条件 
function qyryclearQuery(){
	if (typeof $("#qyryquerylist").val() != 'undefined'){
		$("#qyryxm").val("");
		$("#fxstartDate").val("");
		$("#fxendDate").val("");
		$("#qyryly").val("");
		$("#qyryfxrxm").val("");
		$("#dsstartDate").val("");
		$("#dsendDate").val("");
	}
	qyryquery();
}

// 新增弃婴信息照片(保存图片)
function insertQyryzp(){
	var formid = $("#qyryform").attr("id"); //区别
	var _img = $("#zpid");
	var v_id = $("#id").val();
	if (!v_id){
		alert('请先保存弃婴信息')
		return false;
	};
	if ($.validateform(formid))
	{
		var str = _img.val();
		if (!str){
			alert('请先选择要上传的图片')
			return false;
		}
		var strtype = str.substring(str.length-3,str.length);
		if(strtype!=='jpg'&& strtype!=='peg' && strtype!=='gif' && strtype!=='png'){
			alert('只能上传jpg、jpeg、gif、png格式的照片')
			return false;
		}
		$("#" + formid).ajaxSubmit({
			type:"post",
			dataType:"json",
			url:contextPath + "/qzgl/wmfwgl/insertQyryPh.action",
			success: function(){
				$("#qyryzmzp").attr('src','');
				$("#qyryzmzp").attr('src',contextPath + '/qzgl/wmfwgl/showQyryPh.action?id='+$("#id").val()+'&t='+ Math.random());
			}
		});
	}
}
//删除弃婴照片信息
function deleteQyryZp(){
	var v_id = $("#id").val();
	if (!v_id){
		alert('请先保存弃婴信息')
		return false;
	};
	$.ajax({
		type:'post',
		url:contextPath + "/qzgl/wmfwgl/deleteQyryPh.action?id="+v_id,
		success: function(){
			$("#qyryzmzp").attr('src','');
			$("#qyryzmzp").attr('src',contextPath + '/qzgl/wmfwgl/showQyryPh.action?id='+$("#id").val()+'&t='+ Math.random());
		}
	})
}
// 新增弃婴信息
function addQyry(){
	var v_id  ='';
	var v_url = contextPath + '/qzgl/wmfwgl/toQyryPage.action';
	var type  = 'add';
	var v_w = 1000;
	var v_h = 750;
	openWin(v_id,v_url,type,v_w,v_h);
}
//修改弃婴信息
function xgQyry(){
	var selectes = $("#qyryquerylist").getSelected();
	if (selectes.length > 1){
		alert('只能选择一条记录')
		return false;
	}
	if (selectes.length > 0)
	{	 	 
		var v_id = selectes[0]["id"];
		var v_url = contextPath + '/qzgl/wmfwgl/toQyryPage.action';
		var type  = 'update';
		var v_w = 980;
		var v_h = 750;
		openWin(v_id,v_url,type,v_w,v_h);
	}
	else
	{
		alert("请选择一条弃婴信息.");
	}
}
//删除弃婴信息
function deleteQyry(){
	var selectes = $("#qyryquerylist").getSelected();
	if (selectes.length > 1){
		alert('只能选择一条记录')
		return false;
	}
	if (selectes.length > 0)
	{	 	 
		var _id = selectes[0]["id"];
		var bin = window.confirm("你确认要删除\"姓名\"为："+"\""+selectes[0]["qyryxm"]+"\""+"的弃婴记录吗？");
		if (bin){
			$.ajax({
				type: "post",
				data: {"id":_id,"operType":'delete'},
				url: contextPath + '/qzgl/wmfwgl/deleteQyryBean.action',
				success: function(msg){
					if (msg){
						alert('删除成功')
						qyryquery();
					}else {
						alert('删除失败')
					}
				}
			});
		}
	}
	else
	{
		alert("请选择一条弃婴信息.");
	}
}
//保存弃婴信息
function submitSaveQyry(clo){
	if ($.validateform("qyryform"))
	{
		var formData =$("#qyryform").serialize()+'&t='+new Date().getTime();
		$.ajax({
			type: "post",
			data: formData,
			url: contextPath + $("#qyryform").attr('action'),
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
// 打印弃婴信息
function printQyry(oper){
	if(oper<10){
		bdhtml = window.document.body.innerHTML; // 获取当前页面的html代码
		sprnstr="<!--startprint"+oper+"-->"; // 设置打印开始区域
		eprnstr="<!--endprint"+oper+"-->"; //设置打印结束区域
		prnhtml=bdhtml.substr(bdhtml.indexOf(sprnstr)+18);// 从开始代码向后取html
		prnhtml=prnhtml.substr(0,prnhtml.indexOf(eprnstr));// 从结束代码向前取html
		window.document.body.innerHTML=prnhtml;
		window.print();
		window.document.body.innerHTML=bdhtml;
	}else{
		window.print();
	}
}
// 弹出弃婴移送信息窗口
function queryQyryYsxx(){
	var selectes = $("#qyryquerylist").getSelected();
	if (selectes.length > 1){
		alert('只能选择一条记录')
		return false;
	}
	if (selectes.length > 0)
	{	 	 
		var v_id = selectes[0]["id"];
		var v_url = contextPath + '/qzgl/wmfwgl/toQyryYsxxPage.action';
		var type  = 'update';
		var v_w = 850;
		var v_h = 450;
		openWin(v_id,v_url,type,v_w,v_h);
	}
	else
	{
		alert("请选择一条弃婴信息.");
	}
}
// 保存弃婴移送信息
function submitSaveQyryYsxx(){
	if ($.validateform("qyryysxxform"))
	{
		var formData =$("#qyryysxxform").serialize()+'&t='+new Date().getTime();
		$.ajax({
			type: "post",
			data: formData,
			url: contextPath + $("#qyryysxxform").attr('action'),
			success: function(msg){
				if (msg){
					alert('保存成功!')
				}else {
					alert('保存失败!')
				}
			}
		});
	}
}
// 打印弃婴移送信息
function printQyryYsxx(oper){
	printQyry(oper);
}

//乞讨人员回调函数
function qtryxmrowcallback(trObj, rowdataobj){
	var v_id = rowdataobj["id"];
	var v_qtryxm = rowdataobj["qtryxm"];
	var _html = '';
	var v_w = 1000;
	var v_h = 750;
	var _url = contextPath + '/qzgl/wmfwgl/toQtryPage.action';
	_html = '<a href="###" onclick="openWin(\''+v_id+'\',\''+_url+'\',\'detail\',\''+v_w+'\',\''+v_h+'\')"><font title="点击查看详情" style="color:green;">' + v_qtryxm + '</font></a>' + '&nbsp;';
	return _html;
}
//查询乞讨人员列表
function qtryquery(){
	if (typeof $("#qtryqueryform").val() != 'undefined'){
		$("#qtryquerylist").query("F","qtryqueryform");
	}
}
// 重置查询乞讨人员条件
function qtryclearQuery(){
	if (typeof $("#qtryqueryform").val() != 'undefined'){
		$("#qtryxm").val("");
		$("#qtryxb").val("");
		$("#qtryjg").val("");
		$("#qtryjgmc").val("");
		$("#qtrylb").val("");
		$("#startbfxsj").val("");
		$("#endbfxsj").val("");
		$("#qtrybfxdd").val("");
	}
	qtryquery();
}
// 弹出新增乞讨人员信息
function addQtry(){
	var v_id  ='';
	var v_url = contextPath + '/qzgl/wmfwgl/toQtryPage.action';
	var type  = 'add';
	var v_w = 1000;
	var v_h = 750;
	openWin(v_id,v_url,type,v_w,v_h);
}
// 打开新增乞讨人员亲戚朋友页面
function openqtryqphy(){
	var v_id  = $("#qtryid").val();
	var v_url = contextPath + '/qzgl/wmfwgl/toQtryQyPage.action';
	var type  = 'add';
	var v_w = 550;
	var v_h = 400;
	if(v_id){
		openWin(v_id,v_url,type,v_w,v_h);
	}else {
		alert('请先保存乞讨人员基本信息！')
	}
}
//保存乞讨人员基本信息
function submitSaveQtry(clo){
	if ($.validateform("qtryform"))
	{
		var formData =$("#qtryform").serialize()+'&t='+new Date().getTime();
		$.ajax({
			type: "post",
			data: formData,
			url: contextPath + $("#qtryform").attr('action'),
			success: function(msg){
				msg = eval('('+msg+')');
				if (msg.id){
					if($("#operType").val()=="add"){
						$("#id").val(msg.id);
						$("#qtryid").val(msg.id);
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
//修改乞讨人员信息
function xgQtry(){
	var selectes = $("#qtryquerylist").getSelected();
	if (selectes.length > 1){
		alert('只能选择一条记录')
		return false;
	}
	if (selectes.length > 0)
	{	 	 
		var v_id = selectes[0]["id"];
		var v_url = contextPath + '/qzgl/wmfwgl/toQtryPage.action';
		var type  = 'update';
		var v_w = 980;
		var v_h = 750;
		openWin(v_id,v_url,type,v_w,v_h);
	}
	else
	{
		alert("请选择一条乞讨人员信息.");
	}
}
//删除（或注销）乞讨人员
function deleteQtry(){
	var selectes = $("#qtryquerylist").getSelected();
	if (selectes.length > 1){
		alert('只能选择一条记录')
		return false;
	}
	if (selectes.length > 0)
	{	 	 
		var _id = selectes[0]["id"];
		var bin = window.confirm("你确认要删除\"姓名\"为："+"\""+selectes[0]["qtryxm"]+"\""+"的乞讨人员记录吗？");
		if (bin){
			$.ajax({
				type: "post",
				data: {"id":_id,"operType":'delete'},
				url: contextPath + '/qzgl/wmfwgl/deleteQtryBean.action',
				success: function(msg){
					if (msg){
						alert('删除成功')
						qtryquery();
					}else {
						alert('删除失败')
					}
				}
			});
		}
	}
	else
	{
		alert("请选择一条乞讨人员信息.");
	}
}
//新增乞讨人员照片(保存图片)
function insertQtryzp(){
	var formid = $("#qtryform").attr("id"); //区别
	var _img = $("#zpid");
	var v_id = $("#id").val();
	if (!v_id){
		alert('请先保存乞讨人员基本信息')
		return false;
	};
	if ($.validateform(formid))
	{
		var str = _img.val();
		if (!str){
			alert('请先选择要上传的图片')
			return false;
		}
		var strtype = str.substring(str.length-3,str.length);
		if(strtype!=='jpg'&& strtype!=='peg' && strtype!=='gif' && strtype!=='png'){
			alert('只能上传jpg、jpeg、gif、png格式的照片')
			return false;
		}
		$("#" + formid).ajaxSubmit({
			type:"post",
			dataType:"json",
			url:contextPath + "/qzgl/wmfwgl/insertQtryPh.action",
			success: function(){
				$("#qtryzp").attr('src','');
				$("#qtryzp").attr('src',contextPath + '/qzgl/wmfwgl/showQtryPh.action?id='+$("#id").val()+'&t='+ Math.random());
			}
		});
	}
}
// 删除乞讨人员照片
function deleteQtryZp(){
	var v_id = $("#id").val();
	if (!v_id){
		alert('请先保存乞讨人员基本信息')
		return false;
	};
	$.ajax({
		type:'post',
		url:contextPath + "/qzgl/wmfwgl/deleteQtryPh.action?id="+v_id,
		success: function(){
			$("#qtryzp").attr('src','');
			$("#qtryzp").attr('src',contextPath + '/qzgl/wmfwgl/showQtryPh.action?id='+$("#id").val()+'&t='+ Math.random());
		}
	})
}
/**
 * 打开省市县
 */
function openSelectXzqh(rootOrgCode,callback)
{
	openXzqhTree({
		rootOrgCode : rootOrgCode,
        mutilSelect : false,
        isAsyn : true,
        nodeSelectedType : "ps",
        nodeNotSelectedType : "ps"
	},function(xzqhBean){
		callback(xzqhBean);
	})
}
//选择户籍区划回调函数
function callbackHjdqh(xzqhBean)
{
	if (xzqhBean != null)
	{
		$("#qtryjg").val(xzqhBean["id"]);
		$("#qtryjgmc").val(xzqhBean["name"]);
	}
}
// 保存乞讨人员家庭成员和亲友信息
function submitSaveQtryQyxx(clo){
	if ($.validateform("qtryqyxxform"))
	{
		var formData =$("#qtryqyxxform").serialize()+'&t='+new Date().getTime();
		$.ajax({
			type: "post",
			data: formData,
			url: contextPath + $("#qtryqyxxform").attr('action'),
			success: function(msg){
				msg = eval('('+msg+')');
				if(msg.id){
					alert("保存成功！");
					$.closeWindow();
				}else {
					alert('保存失败!')
				}
				
			}
		});
	}
}
// 刷新乞讨人员页面
function reloadQtry(){
	if (typeof $("#qtryqueryqylist").val() != 'undefined'){
		var _url = '/qzgl/wmfwgl/queryQtryqphyListAction.action?id='+$("#qtryid").val();
		$("#qtryqueryqylist").attr('url','');
		$("#qtryqueryqylist").attr('url',_url);
		$("#qtryqueryqylist").query("F","qtryform");
	}
}
//弹出乞讨人员移送信息登记窗口
function queryQtryYsxx(){
	var selectes = $("#qtryquerylist").getSelected();
	if (selectes.length > 1){
		alert('只能选择一条记录')
		return false;
	}
	if (selectes.length > 0)
	{	 	 
		var v_id = selectes[0]["id"];
		var v_url = contextPath + '/qzgl/wmfwgl/toQtryYsxxPage.action';
		var type  = 'update';
		var v_w = 1000;
		var v_h = 900;
		openWin(v_id,v_url,type,v_w,v_h);
	}
	else
	{
		alert("请选择一条乞讨人员信息.");
	}
}
// 保存乞讨人员移送信息
function submitSaveQtryYsxx(){
	if ($.validateform("qtryYsxxform"))
	{
		var formData =$("#qtryYsxxform").serialize()+'&t='+new Date().getTime();
		$.ajax({
			type: "post",
			data: formData,
			url: contextPath + $("#qtryYsxxform").attr('action'),
			success: function(msg){
				if (msg){
					alert('保存成功!')
				}else {
					alert('保存失败!')
				}
			}
		});
	}
}
//其他服务回调函数
function fwsjrowcallback(trObj, rowdataobj){
	var v_id = rowdataobj["id"];
	var v_fwsj = rowdataobj["fwsj"];
	var _html = '';
	var v_w = 900;
	var v_h = 450;
	var _url = contextPath + '/qzgl/wmfwgl/toQtfwPage.action';
	_html = '<a href="###" onclick="openWin(\''+v_id+'\',\''+_url+'\',\'detail\',\''+v_w+'\',\''+v_h+'\')"><font title="点击查看详情" style="color:green;">' + v_fwsj + '</font></a>' + '&nbsp;';
	return _html;
}
//查询其他服务列表
function qtfwquery(){
	if (typeof $("#qtfwqueryform").val() != 'undefined'){
		$("#qtfwquerylist").query("F","qtfwqueryform");
	}
}
//重置其他服务查询条件
function qtfwclearQuery(){
	if (typeof $("#qtfwqueryform").val() != 'undefined'){
		$("#jbrxm").val("");
		$("#startfwsj").val("");
		$("#endfwsj").val("");
		$("#fwnr").val("");
	}
	qtfwquery();
}
//弹出新增其他服务登记页面
function addQtfw(){
	var v_id  ='';
	var v_url = contextPath + '/qzgl/wmfwgl/toQtfwPage.action';
	var type  = 'add';
	var v_w = 900;
	var v_h = 450;
	openWin(v_id,v_url,type,v_w,v_h);
}
//保存其他服务信息
function submitSaveQtfw(clo){
	if ($.validateform("qtfwform"))
	{
		var formData =$("#qtfwform").serialize()+'&t='+new Date().getTime();
		$.ajax({
			type: "post",
			data: formData,
			url: contextPath + $("#qtfwform").attr('action'),
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
//修改其他服务信息
function xgQtfw(){
	var selectes = $("#qtfwquerylist").getSelected();
	if (selectes.length > 1){
		alert('只能选择一条记录')
		return false;
	}
	if (selectes.length > 0)
	{	 	 
		var v_id = selectes[0]["id"];
		var v_url = contextPath + '/qzgl/wmfwgl/toQtfwPage.action';
		var type  = 'update';
		var v_w = 900;
		var v_h = 450;
		openWin(v_id,v_url,type,v_w,v_h);
	}
	else
	{
		alert("请选择一条其他服务信息.");
	}
}
//删除其他服务信息
function deleteQtfw(){
	var selectes = $("#qtfwquerylist").getSelected();
	if (selectes.length > 1){
		alert('只能选择一条记录')
		return false;
	}
	if (selectes.length > 0)
	{	 	 
		var _id = selectes[0]["id"];
		var bin = window.confirm("你确认要删除该条记录吗？");
		if (bin){
			$.ajax({
				type: "post",
				data: {"id":_id,"operType":'delete'},
				url: contextPath + '/qzgl/wmfwgl/deleteQtfwBean.action',
				success: function(msg){
					if (msg){
						alert('删除成功')
						qtfwquery();
					}else {
						alert('删除失败')
					}
				}
			});
		}
	}
	else
	{
		alert("请选择一条乞讨人员信息.");
	}
}
//打印其他服务
function printQtfw(oper){
	if(oper<10){
		bdhtml = window.document.body.innerHTML; // 获取当前页面的html代码
		sprnstr="<!--startprint"+oper+"-->"; // 设置打印开始区域
		eprnstr="<!--endprint"+oper+"-->"; //设置打印结束区域
		prnhtml=bdhtml.substr(bdhtml.indexOf(sprnstr)+18);// 从开始代码向后取html
		prnhtml=prnhtml.substr(0,prnhtml.indexOf(eprnstr));// 从结束代码向前取html
		window.document.body.innerHTML=prnhtml;
		window.print();
		window.document.body.innerHTML=bdhtml;
	}else{
		window.print();
	}
}	