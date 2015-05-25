function downloadFile(fileName,filePath,pid){ 
	
	var url = "../common/download.action?fileName="+encodeURIComponent(fileName);
	if (filePath != null && filePath != "")
	{
		url += "&filePath="+filePath;
	}
	else if (pid != null && pid != "")
	{
		url += "&pid="+pid;
	}
	window.location.href = url;
}
/*
 *字符串变JSON对象  解决IE报JSON未定义错
 */
function parse(msg){
	if(typeof(JSON) == 'undefined'){
		return eval("("+msg+")");
	}else{
		return JSON.parse(msg);
	}
}	
/*
 * 参数设置: url:访问地址, width:宽度, height:高度, vArguments:返回参数, isbars:是否需要滚动条(yes/on);
 */
function openModalDialog(url,width,height,vArguments,isbars)
{
	if(!isbars) 
	{
		isbars = "no";
	}
	var sFeatures = "dialogWidth="+width+"px;dialogHeight="+height+"px;help=yes;resizable=no;status=no;center=yes;scroll="+isbars+";edge=sunken;";
	return window.showModalDialog(url,vArguments,sFeatures);
}
/**拖动窗口**/
function down1(m){//当按下鼠标按键的时候获取div和鼠标在div中的位置，从而计算div在页面上的位置
		n=m;
		down=true;
		var marginX = parseInt($(m).css('width')) - event.clientX + parseInt($(m).css('left'));
		var marginY = parseInt($(m).css('height')) - event.clientY + parseInt($(m).css('top'));
		if(marginX <= 5 && marginY <=5) resizeable=true;
		else{
			marginX = event.clientX - parseInt($(m).css('left'));
			marginY = event.clientY - parseInt($(m).css('top'));
			if(marginX >0 && (marginX < parseInt($(m).css('width'))-20) && marginY > 0 && marginY < 20){
				moveable=true;
			}
		}
		divleft=event.clientX-parseInt($(m).css('left'));
		divtop=event.clientY-parseInt($(m).css('top'));
    }
function move(){
	if(down && moveable==true){//只有当鼠标点下去的时候才移动
			//n.style.left=event.clientX-divleft;
			$(n).css('left',(event.clientX-divleft) + "px");
			//n.style.top=event.clientY-divtop;
			$(n).css('top',(event.clientY-divtop) + "px");
	}
}
/**拖动窗口 结束**/
/**js获得当前时间**/
function getCurrentTime(){
	var rq = new Date();
	var date=rq.getYear().toString() + "-" + buLing( rq.getMonth() + 1 ) + "-" + buLing(rq.getDate())+ " " + buLing(rq.getHours())+ ":" + buLing(rq.getMinutes())+ ":" + buLing(rq.getSeconds());
	return date;
}
/** js 的月份和日期只有一位时在其前面补 0 **/
function buLing( str ){
	str = str.toString();
	return (str.length > 1 ? str : ("0" + str));
}
/**附件上传**/
function uploadFile(){
			
           var url="common/wjcs.action";
			UPLOAD_COMPONENTS = new AjaxUpload($("#UPLOAD_FILE"), {  
			    action: url,   
			    name: 'fj',                   //后台取此名来进行文传上传  
			    data: {},
			    onSubmit : function(file, ext){
			        this.disable();  
			        $("#UPLOAD_FILE").val("正在上传……");
			        return true;  
			    },  
			    onComplete: function(file, response){ 
			        this.enable();
			        $("#UPLOAD_FILE").val("点击上传照片");                
			        if(response != "");{ 
			           $("#userPhoto").attr("src","/SWGZPT/datareuse/load/photo/"+file);
			           $("#xp").val(file);
			        } 	                                  
			    }  
	});  //end	new AjaxUpload
}

function uploadUserXp(){
	
    var url="common/bczp.action";
		UPLOAD_COMPONENTS = new AjaxUpload($("#UPLOAD_FILE"), {  
		    action: url,   
		    name: 'fj',                   //后台取此名来进行文传上传  
		    data: {},
		    onSubmit : function(file, ext){
		        this.disable();  
		        $("#UPLOAD_FILE").val("正在上传……");
		        return true;  
		    },  
		    onComplete: function(file, response){ 
		        this.enable();
		        $("#UPLOAD_FILE").val("点击上传照片");                
		        if(response != "");{ 
		           $("#userPhoto").attr("src","/SWGZPT/common/loadUserXp.action?t"+new Date());
		        } 	                                  
		    }  
		});  //end	new AjaxUpload
}

/**打开单位机构树**/
function openDwWin(orgname,orgid){
	var url = "jsp/dwTree/dwTree.jsp?date="+new Date().getTime();
	var userInfo = openModalDialog(url,310,430,"ss","no");
	
	if (userInfo)
	{	
		$("#"+orgname).val(userInfo.orgName);
		$("#"+orgid).val(userInfo.orgId);
	}
}
/**访问量**/
function stringToArry(fwl,id){
   var html="";
   var arr=[];
   for(var i=0;i<fwl.length;i++){
   		arr.push(fwl.substring(i,i+1));
   }
   $.each(arr,function(i){
   		 html+="<li>"+arr[i]+"</li>";
   });
  $("#"+id).find("ul").append(html);
}
/**国保动态 详情**/
function gbdt_xq(){
    var _url = "gbdt/gbdt_gbdtXq.action";
	 $.ajax({
	        type: "POST",
	        url: _url ,
	        data : "",
            dataType:"",
            async:"true",//异步请求 ，默认值	
            cache:"true",
	        success : function(msg) {
	}
	}); 
}
/**显示系统时间**/
function tick() {
		var hours, minutes, seconds, xfile;
		var intHours, intMinutes, intSeconds;
		var today, theday;
		today = new Date();
		function initArray(){
			this.length=initArray.arguments.length;
			for(var i=0;i<this.length;i++)
			this[i+1]=initArray.arguments[i]; 
		}
		var d=new initArray(
			" 星期日",
			" 星期一",
			" 星期二",
			" 星期三",
			" 星期四",
			" 星期五",
			" 星期六");
		var year = today.getYear()<1900?(1900+today.getYear()):today.getYear();//兼容火狐 ie9
		theday = year+"年" + [today.getMonth()+1]+"月" +today.getDate() +"日" + d[today.getDay()+1 ];
		intHours = today.getHours();
		intMinutes = today.getMinutes();
		intSeconds = today.getSeconds();
		if (intHours == 0) {
			hours = "12:";
			xfile = " 午夜";
		} else if (intHours < 12) {
			hours = intHours+":";
			xfile = " 上午";
		} else if (intHours == 12) {
			hours = "12:";
			xfile = " 正午";
		} else {
			intHours = intHours - 12;
			hours = intHours + ":";
			xfile = " 下午";
		}
		if (intMinutes < 10) {
			minutes = "0"+intMinutes+":";
		} else {
			minutes = intMinutes+":";
		}
		if (intSeconds < 10) {
			seconds = "0"+intSeconds+" ";
		} else {
			seconds = intSeconds+" ";
		}
		timeString = theday+xfile+hours+minutes+seconds;
		$("#Clock").html(timeString);
		window.setTimeout("tick();", 100);
}
/**检验IE版本**/
function checkBrower(){
	var browser=navigator.appName;
	var b_version=navigator.appVersion ;
	var version=b_version.split(";"); 
	try{ //代码只针对ie浏览器有效，为了避免在其他浏览器报错，可以用使用try{代码体}catch(err){代码体}来消除报错 
	var trim_Version=version[1].replace(/[ ]/g,""); 
	if(browser=="Microsoft Internet Explorer" && trim_Version=="MSIE7.0") 
	{ 
	//将"your-stylesheet-url"替换成想在ie7中加载的样式表的路径 
	alert("7")
	} 
	else if(browser=="Microsoft Internet Explorer" && trim_Version=="MSIE6.0") 
	{ 
	//将"your-another-stylesheet-url"替换成想在ie6中加载的样式表的路径 
	//document.styleSheets[0].href=http://www.webmy.cn; 
	//alert("6")
	} 
	} 
	catch(err) { //捕捉错误后不作任何处理也可 
	} 
}
function intDate(){
	var today = new Date();
	var year=today.getYear();
	year = (year < 1900) ? (1900 + year) : year;
	var month = today.getMonth()+1+"";
	var monthfrom=today.getMonth()+"";
	var date=today.getDate()+"";
	$("#bzsj").val(year+"-" +f_formate(month));
	$("#rksjFrom").val(year+"-" +f_formate(monthfrom)+"-"+f_formate(date));
	$("#rksjTo").val(year+"-" +f_formate(month)+"-"+f_formate(date));
	
	$("#qb_rksjFrom").val(year+"-" +f_formate(monthfrom)+"-"+f_formate(date));
	$("#qb_rksjTo").val(year+"-" +f_formate(month)+"-"+f_formate(date));
}
function f_formate(str){
	if(str.length<2){
		str="0"+str;
	}
	return  str;
}
/**加载最新活动轨迹**/
var myar=0;
var gj_yd_frag =true;
function reLoadHdgj(){
	 var _url = "hdgj/hdgj_index_scroll.action";
	 $.ajax({
	        type: "POST",
	        url: _url,
	        data : "",
            dataType:"",
            async:"true",//异步请求 ，默认值	
            cache:"true",
	        success : function(msg) {
	        value= parse(msg);
	        if(value!=""){
	        	var html="<ul>";
	        	$.each(value,function(i,v){
	        		 html+="<li style=\"border-bottom:#CCC dashed 1px;\"><table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\"><tr>"+
			        "<td width=\"100\" height=\"132\" align=\"right\"><img src=\"hdgj/hdgj_queryPoto.action?sfzh="+v.sfzh+"\" width=\"94\" height=\"120\" id=\"hdgjImg\" /></td><td>"+
			        "<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"2\">"+
			        "<tr><td height=\"27\" align=\"right\">姓名：</td><td class=\"color004aa5\">"+v.zdryxm+
			        "</td></tr><tr> <td height=\"27\" width=\"30%\" align=\"right\">证件号码：</td><td class=\"color004aa5\">"+v.sfzh+
			        "</td></tr><tr> <td height=\"27\" width=\"30%\" align=\"right\">信息类别：</td><td class=\"color004aa5\">"+v.dtxxlb+
			        "</td></tr><tr> <td height=\"27\" width=\"30%\" align=\"right\">发生时间：</td><td class=\"color004aa5\">"+v.hdfssj+
			        "</td></tr><tr> <td height=\"27\" width=\"30%\" align=\"right\">发生场所：</td><td class=\"color004aa5\">"+v.hdfsddxz+
			        "</tr></table></td></tr></table></li>";
	        	});
	        	 html+="</ul>";
	        }else{
	        	var html ="<font color=\"blue\">暂无数据</font>";
	        }
            $("#hdgjDiv").html(html);
            myar = setInterval('AutoScroll("#hdgjDiv")',3000);
            $("#hdgjDiv").hover(function() { gj_yd_frag=false;clearInterval(myar); }, function() {gj_yd_frag=true; myar = setInterval('AutoScroll("#hdgjDiv")', 1000) }); //当鼠标放上去的时候，滚动停止，鼠标离开的时候滚动开始
	}
	}); 
}
/*滚动效果*/
function AutoScroll(obj) {
	if(gj_yd_frag){
	     $(obj).find("ul:first").animate({
	      marginTop: "-158px"
	      }, 2000, function(){
	        $(this).css({ marginTop: "0px" }).find("li:first").appendTo(this);
	      });
	}
}
/**最新轨迹上一个**/
function f_up(){
	var rows=parseInt($("#rows").val());
	var rownum=parseInt($("#rownum").val());
	if(rownum != 1){
		rownum=rownum-1;
		reLoadHdgj(rownum+"");
	}else{
		alert("当前为第一个");
	}
	
}
/**最新轨迹下一个**/
function f_next(){
	var rows=parseInt($("#rows").val());
	var rownum=parseInt($("#rownum").val());
	if(rownum<rows){
		rownum=rownum+1;
		reLoadHdgj(rownum+"");
	}else{
		alert("当前为最后一个");
	}
}
//加载相关情报线索
function reLoadXgqbxs(){
	 var _url = "qbxs/qbxs_index.action";
	 $.ajax({
	        type: "POST",
	        url: _url,
	        data : "",
            dataType:"",
            async:"true",//异步请求 ，默认值	
            cache:"true",
	        success : function(msg) {
	        value=parse(msg);
		        var arr=new Array();
	     		arr.push('<tr>');
	     		arr.push('<th style="text-align:center">');
	     		arr.push('姓名');
	     		arr.push('</th>');
	     		arr.push('<th style="text-align:center">');
	     		arr.push('身份证号');
	     		arr.push('</th>');
	     		arr.push('<th style="text-align:center">');
	     		arr.push('信息来源');
	     		arr.push('</th>');
	     		arr.push('<th style="text-align:center">');
	     		arr.push('采集时间');
	     		arr.push('</th>');
	     		arr.push('<th style="text-align:center">');
	     		arr.push('采集人');
	     		arr.push('</th>');
	     		arr.push('</tr>');
	     		if(value==""){
	     		arr.push('<tr><td colspan="12" align="center">暂无数据');
	     		arr.push('</tr></td>')
	     		}else{     		
	     		$.each(value,function(i,v){
	     			arr.push('<tr>');
		     		arr.push('<td align="center">&nbsp;');
		     		arr.push(v.xm);
		     		arr.push('</td>');
		     		arr.push('<td align="center">&nbsp;');
		     		arr.push(v.sfzh);
		     		arr.push('</td>');
		     		arr.push('<td align="center">&nbsp;');
		     		arr.push(v.xxly);
		     		arr.push('</td>');
		     		arr.push('<td align="center">&nbsp;');
		     		arr.push(v.cjsj);
		     		arr.push('</td>');
		     		arr.push('<td align="center">&nbsp;');
		     		arr.push(v.cjr);
		     		arr.push('</td>');
		     		arr.push('</tr>');
	     		});
	     		}
	     		$("#qbxsTab").html(arr.join('')); 
	}
	}); 
}

/**消息栏固定定位 兼容IE6**/
function scrollDht(){
	var t = $(document).scrollTop();
	 //$("#sunmenu").css("top",(t+sunmenu_top)+"px");
	 $("#swDiv").css("top",(t+sunmenu_top-184)+"px");//我的事物固定定位
	 $("#zjDiv").css("top",(t+sunmenu_top-222)+"px");//我的足迹固定定位
	 $("#xxDiv").css("top",(t+sunmenu_top-222)+"px");//我的消息固定定位
	 $("#txlDiv").css("top",(t+sunmenu_top-222)+"px");//通讯录固定定位
	 //$("#xxWin").css("top",(t+sunmenu_top-500)+"px");//�Ի���̶���λ
	 $("#personDiv").css("top",(t+sunmenu_top-222)+"px");//个人中心固定定位
	 $("#txllxzDiv").css("top",(t+sunmenu_top-222)+"px");//通讯录新建组名对话框固定定位
	// $("#rightClickCreateDiv").css("top",(t+sunmenu_top-200)+"px");
	 // $("#rightClickZmCreateDiv").css("top",(t+sunmenu_top-210)+"px");
	 //$("#photoMessageDiv").css("top",(t+sunmenu_top-500)+"px");
	// $("#xxtjDiv").css("top",(t+sunmenu_top-500)+"px");
}
//*********************************消息提醒 开始***********************************************************//
/**显示消息提醒框**/
function f_showMessage(){
	$("#form_music")[0].submit();
	f_show();
	$("#xxtjDiv").show("normal");
	
	
	//$('html,body').animate({scrollTop: '0px'}, 800);//滚动条置顶
	
}
/**显示透明层**/
function f_show(){
	var bg = document.getElementById("mapBgLayer");
	var w = document.body.clientWidth;
	var h = document.body.offsetHeight;
	bg.style.display = "";
	bg.style.width =  w + "px";
	bg.style.height = 1.6*h+"PX";
}
/**隐藏透明层**/
function f_display(){
	var bg = document.getElementById("mapBgLayer");
	bg.style.display = "none";
}
/**关闭消息提醒**/
function f_messageWinClose(){
	$("#xxtjDiv").hide("normal");
	f_display();

}
/**稍后再提醒**/
function f_showAgin(){
	f_messageWinClose();
	window.setTimeout("f_showMessage()","300000");
}
//展示我的事物
function f_showSwMeaages(){
	f_messageWinClose();
	f_swWinOpen();//打开我的事务提醒
}
//*********************************消息提醒 结束***********************************************************//
//********************************我的事物 开始***********************************************************//
function f_swWinClose(){
	$("#swDiv").hide("normal");
}
/****/
function f_swWinOpen(){
   $.ajax({
	        type: "POST",
	        url: "xxts/xxts_swXx.action" ,
	        data : "",
            dataType:"",
            async:"true",//异步请求 ，默认值	
            cache:"true",
	        success : function(msg) {
	        var value=parse(msg);
	        var html ="<table width=\"100%\" border=\"0\" cellspacing=\"5\" cellpadding=\"0\">";
	        var index=0;
	        $.each(value,function(i,v){
	        	if(i%2==0){
	        		if(v.swsl=='0'){
	        		html+="<tr><td>"+v.swmc+"("+v.swsl+")</td>"
	        		}else{
	        		html+="<tr><td><a href=\""+v.ssourl+"?user_name="+v.userjh+"&urlNo="+v.xtid+"&FuncitonId="+v.functionid+"\" class=\"l_blue\" target=\"_blank\">"+v.swmc+"("+v.swsl+")</a></td>"
	        		}
	        	}else{
	        		if(v.swsl=='0'){
	        		html+="<td>"+v.swmc+"("+v.swsl+")</td></tr>"
	        		}else{
	        		html+="<td><a href=\""+v.ssourl+"?user_name="+v.userjh+"&urlNo="+v.xtid+"&FuncitonId="+v.functionid+"\" class=\"l_blue\" target=\"_blank\">"+v.swmc+"("+v.swsl+")</a></td></tr>"
	        		}
	        	}
	        	index++;
	        });
	        if(index%2!=0){
	        	html+="</tr></table>";
	        }else{
	        	html+="</table>";
	        }
	$("div .win_box02").html(html);
	}
	}); 
	$('#swDiv').show('normal');
	$('#zjDiv').hide('normal');
	$('#xxDiv').hide('normal');
	$('#txlDiv').hide('normal');
	$('#personDiv').hide('notmal');
}
//********************************我的足迹 开始***********************************************************//
function f_zjWinOpen(){
	f_loaddx("qb",1);//加载浏览过的对象,参数初始化为30天内(全部)
	$("#zjlx").val("dx");//初始化足迹类型为浏览对象
	$("#sjfw").val("qb");//初始化时间范围为 30天内(全部)
	f_intSjfw();
	f_intWdzj();
	$('#zjDiv').show('normal');
	$('#swDiv').hide('normal');
	$('#txlDiv').hide('normal');
	$('#xxDiv').hide('normal');
	$('#personDiv').hide('notmal');
	
}
function f_loaddx(sjfw,currentpage){
	var html="";
	$.ajax({
	        type: "POST",
	        url: "xxts/xxts_wdZj.action",
	        data : "sjfw="+sjfw+"&currentpage="+currentpage,
            dataType:"",
            async:"true",//异步请求 ，默认值	
            cache:"true",
	        success : function(msg) {
	        var value=parse(msg);
	        if(value.datas!= null){
        	f_upOrDown(value.currentPage,value.totalPage);//判断能否上一页或下一页
	        $.each(value.datas,function(i,v){
		       html+="<ul><li>"+v.xgsj+"</li><li><img src=\"hdgj/hdgj_queryPoto.action?sfzh="+v.sfzh+"\" width=\"60\" height=\"60\"/></li>"+
		       "<li style=\"text-align:center\">"+f_substr(v.xm)+"</li></ul>";
	        });
	        }else{
	        	$("#turnleftImg").attr("src","common/images/turn_left02.jpg");
	        	$("#turnrightImg").attr("src","common/images/turn_right02.jpg");
	        	html+="<ul><li style=\"padding-top:30px;padding-left:30px\">您在该时间段没有浏览过任何对象</li></ul>";
	        }
	          html+="<div class=\"clear\"><input type=\"hidden\" id=\"currentpage\" name=\"currentpage\" value=\""+value.currentPage+"\"><input type=\"hidden\" id=\"totalPage\" name=\"totalPage\" value=\""+value.totalPage+"\"></div>";
	         $("#zjDiv").find("div .wdzj_div").html(html);
	}
	});
}
function f_sjfw(obj,sjfw){
	$(obj).parent().find("a").each(function(i){
		$(this).removeClass("fontnav_a");
	});
	$(obj).closest("a").addClass("fontnav_a");
	var zjlx=$("#zjlx").val();
	$("#sjfw").val(sjfw);
	if(zjlx == "dx"){$("#zjlx").val("dx");f_loaddx(sjfw,1);}//加载浏览过的对象,参数初始化为30天内(全部);
	else if(zjlx == "xt"){$("#zjlx").val("xt");f_loadxt(sjfw,1);}
	else if(zjlx == "cz"){$("#zjlx").val("cz");f_loadcz(sjfw,1);}
}
//判断能否上一页或下一页
function f_upOrDown(currentPage,totalPage){
	if(currentPage == totalPage && totalPage==1){
		$("#turnleftImg").attr("src","common/images/turn_left02.jpg");
	    $("#turnrightImg").attr("src","common/images/turn_right02.jpg");
	}else if(currentPage < totalPage && currentPage!=1){
		$("#turnleftImg").attr("src","common/images/turn_left01.jpg");
	    $("#turnrightImg").attr("src","common/images/turn_right01.jpg");
	}else if(currentPage < totalPage && currentPage==1){
		$("#turnleftImg").attr("src","common/images/turn_left02.jpg");
	    $("#turnrightImg").attr("src","common/images/turn_right01.jpg");
	}else if(currentPage == totalPage && totalPage > 1){
		$("#turnleftImg").attr("src","common/images/turn_left01.jpg");
	    $("#turnrightImg").attr("src","common/images/turn_right02.jpg");
	}
}
//上一页
function f_turnleft(){
	var obj=$("#turnleftImg").attr("src");
	if(obj == "common/images/turn_left02.jpg"){
		return;
	}else{
		var currentpage = parseInt($("#currentpage").val());
		var sjfw=$("#sjfw").val();
		var zjlx=$("#zjlx").val();
		if(zjlx == "dx"){$("#zjlx").val("dx");f_loaddx("qb",currentpage-1);}//加载浏览过的对象,参数初始化为30天内(全部);
		else if(zjlx == "xt"){$("#zjlx").val("xt");f_loadxt("qb",currentpage-1);}
		else if(zjlx == "cz"){$("#zjlx").val("cz");f_loadcz("qb",currentpage-1);}
	}
}
//下一页
function f_turnright(){
	var obj=$("#turnrightImg").attr("src");
	if(obj == "common/images/turn_right02.jpg"){
		return;
	}else{
		var currentpage = parseInt($("#currentpage").val());
		var sjfw=$("#sjfw").val();
		var zjlx=$("#zjlx").val();
		if(zjlx == "dx"){$("#zjlx").val("dx");f_loaddx("qb",currentpage+1);}//加载浏览过的对象,参数初始化为30天内(全部);
		else if(zjlx == "xt"){$("#zjlx").val("xt");f_loadxt("qb",currentpage+1);}
		else if(zjlx == "cz"){$("#zjlx").val("cz");f_loadcz("qb",currentpage+1);}
	}
}

function f_wdzj(obj,zjlx){
	$(obj).parent().find("a").each(function(i){
		$(this).attr("class","tabnav_b");
	});
	$(obj).closest("a").attr("class","tabnav_a");
	f_intSjfw();//初始化时间范围
	$("#sjfw").val("qb");
	if(zjlx == "dx"){$("#zjlx").val("dx");f_loaddx("qb",1);}//加载浏览过的对象,参数初始化为30天内(全部);
	else if(zjlx == "xt"){$("#zjlx").val("xt");f_loadxt("qb",1);}
	else if(zjlx == "cz"){$("#zjlx").val("cz");f_loadcz("qb",1);}
}
//初始化是时间范围
function f_intSjfw(){
  var obj_div=$("#zjDiv").find("div.tabbox02").find("a");
    $.each(obj_div,function(i){
		if(i==0){
			$(this).addClass("fontnav_a");
		}else{
			$(this).removeClass("fontnav_a");
		}
	});
}
//初始化是我的足迹 为浏览过的对象
function f_intWdzj(){
  var obj_div=$("#zjDiv").find("div.tabbox").find("a");
    $.each(obj_div,function(i){
		if(i==0){
			$(this).addClass("tabnav_a");
		}else{
			$(this).removeClass("tabnav_a");
		}
	});
}
function f_loadxt(sjfw,currentpage){
	var html="";
	$.ajax({
	        type: "POST",
	        url: "xxts/xxts_wdZjXt.action",
	        data : "sjfw="+sjfw+"&currentpage="+currentpage,
            dataType:"",
            async:"true",//异步请求 ，默认值	
            cache:"true",
	        success : function(msg) {
	        var value=parse(msg);
	        if(value.datas!= null){
        	f_upOrDown(value.currentPage,value.totalPage);//判断能否上一页或下一页
	        $.each(value.datas,function(i,v){
		       html+="<ul><li>"+v.czsj+"</li><li><img src=\"common/images/"+v.xtdm+"_zj.PNG\" width=\"60\" height=\"60\"/></li>"+
		       "<li style=\"text-align:center\" title=\""+v.xtmc+"\">"+f_substr(v.xtmc)+"</li></ul>";
	        });
	        }else{
	        	$("#turnleftImg").attr("src","common/images/turn_left02.jpg");
	        	$("#turnrightImg").attr("src","common/images/turn_right02.jpg");
	        	html+="<ul><li style=\"padding-top:30px;padding-left:30px\">您在该时间段没有访问过任何系统</li></ul>";
	        }
	          html+="<div class=\"clear\"><input type=\"hidden\" id=\"currentpage\" name=\"currentpage\" value=\""+value.currentPage+"\"><input type=\"hidden\" id=\"totalPage\" name=\"totalPage\" value=\""+value.totalPage+"\"></div>";
	         $("#zjDiv").find("div .wdzj_div").html(html);
	}
	});
}
function f_loadcz(sjfw,currentpage){
	var html="<ul><li style=\"padding-top:30px;padding-left:30px\">您在该时间段没有任何操作记录</li></ul>";
	$("#zjDiv").find("div .wdzj_div").html(html);
}
//********************************我的消息 开始***********************************************************//
function f_xxWinOpen(){
	var html="";
	$.ajax({
	        type: "POST",
	        url: "xxts/xxts_xxXx.action",
	        data : "",
            dataType:"",
            async:"true",//异步请求 ，默认值	
            cache:"true",
	        success : function(msg) {
	        var value=parse(msg);
	        $.each(value,function(i,v){
		        if(v.fsrsfzx=='Y'){
			        html+="<tr><td width=\"40\" height=\"50\"><img src=\"xxts/xxts_queryPotoByUserid.action?id="+v.fsr+"\" width=\"40\" height=\"40\" alt=\""+v.fsrxm+"\"/></td>"+
		            "<td><span class=\"f_red\">有"+v.count+"条消息提醒</span></td><td width=\"50\" align=\"right\"><a href=\"javascript:void(0);\" onclick=\"f_xxqs(this,'"+v.fsr+"')\" title=\"签收\"><img src=\"common/images/pencil.gif\" width=\"16\" height=\"16\" /></a>&nbsp;&nbsp;<a href=\"javascript:void(0);\" onclick=\"f_openMessageWin('"+v.fsr+"','"+v.fsrxm+"','"+v.fsrdw+"','"+v.fsrdh+"','在线');\" title=\"对话\">"+
		            "<img src=\"common/images/comment_add.gif\" width=\"16\" height=\"16\" /></a></td></tr>";
		        }else{
		        	html+="<tr><td width=\"40\" height=\"50\"><img src=\"xxts/xxts_queryPotoByUserid.action?id="+v.fsr+"\" width=\"40\" height=\"40\" alt=\""+v.fsrxm+"\"/></td>"+
		            "<td><span class=\"f_hui\">有"+v.count+"条消息提醒</span></td><td width=\"50\" align=\"right\"><a href=\"javascript:void(0);\" onclick=\"f_xxqs(this,'"+v.fsr+"')\" title=\"签收\"><img src=\"common/images/pencil.gif\" width=\"16\" height=\"16\" /></a>&nbsp;&nbsp;<a href=\"javascript:void(0);\" onclick=\"f_openMessageWin('"+v.fsr+"','"+v.fsrxm+"','"+v.fsrdw+"','"+v.fsrdh+"','离线');\" title=\"对话\">"+
		            "<img src=\"common/images/comment_add02.gif\" width=\"16\" height=\"16\" /></a></td></tr>";
		        }
	        });
	         $("#xxDiv").find("table").html(html);
	}
	});
	$('#xxDiv').show('normal');
	$('#swDiv').hide('normal');
	$('#txlDiv').hide('normal');
	$('#zjDiv').hide('normal');
	$('#personDiv').hide('notmal');
}
/**消息签收**/
function f_xxqs(obj,fsr){
	if(confirm("点击签收所有消息，您确定要签收？")){
		$.ajax({
			type:"POST",
			url:"xxts/xxts_xxQs.action",
			data:"fsr="+fsr,
			dataType:"",
			async:"true",//异步请求 ，默认值	
            cache:"true",
	        success : function(msg) {
	        var value=parse(msg);
	        if(value =='true'){
	        	$(obj).parent().parent().remove();
	        }else{
	        	alert("签收失败，请重试");
	        }
	        }
		});
}
}
/**打开发送消息窗口**/
function f_openMessageWin(id,xm,dw,lxdh,sfzx){
	$("#topSpan").html("与"+xm+"["+sfzx+"]对话中");
	var html="<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" style=\"margin:5px;\">"+
	"<tr><td><img src=\"xxts/xxts_queryPotoByUserid.action?id="+id+"\" width=\"100\" height=\"100\"/></td></tr><tr><td height=\"25\"><strong>"+xm+"</strong></td></tr>"+
	" <tr><td height=\"25\">"+dw+"</td></tr><tr><td height=\"25\">联系电话："+lxdh+"</td></tr></table>";
	$("td.win_box05_r").html(html);
	f_getMessages(id);
	$("#jsr").val(id);
	$("#xxWin").show('normal');
}
/**关闭发生消息窗口**/
function f_closeMessageWin(){
	$('#xxWin').hide();
	window.clearTimeout(myar);//终止定时器
}
function f_hlMessage(obj){
	if(confirm("点击忽略所有消息，您确定要忽略？")){
	$.ajax({
			type:"POST",
			url:"xxts/xxts_xxHl.action",
			data:"",
			dataType:"",
			async:"true",//异步请求 ，默认值	
            cache:"true",
	        success : function(msg) {
	        var value=parse(msg);
	        if(value =='true'){
	        	$(obj).parent().parent().find("table").remove();
	        }else{
	        	alert("签收失败，请重试");
	        }
	        }
		});
		}
}
/**获取消息详情**/
function f_getMessages(fsrid){
	$.ajax({
	        type: "POST",
	        url: "xxts/xxts_getMessagesByUserId.action",
	        data : "fsrid="+fsrid,
            dataType:"",
            async:"true",//异步请求 ，默认值	
            cache:"true",
	        success : function(msg) {
	        var value=parse(msg);
	        if(value!=null){
	        $.each(value,function(i,v){
	        	html="<ul><li class=\"f_green\">"+v.fsrxm+"&nbsp;<span class=\"f_hui\">"+v.fssj+"</span></li>"+
            	"<li class=\"f_hei\">"+v.xxnr+"</li></ul>";
            	$("#xxWin div.win_box05_nr").append(html);
	        });
	        }
	        }
	 });
	myar= window.setTimeout("f_getMessages("+fsrid+");", 5000);//每隔5秒取一次
}
/**发送信息**/
function f_send(){
	var xm="我";
	var nr=$("#messageNr").val();
	var jsr=$("#jsr").val();
	var date=getCurrentTime();//当前时间
	$.ajax({
	        type: "POST",
	        url: "xxts/xxts_sendMessage.action",
	        data : "xxnr="+nr+"&jsr="+jsr,
            dataType:"",
            async:"true",//异步请求，默认值	
            cache:"true",
	        success : function(msg) {
	        var value=parse(msg);
	        if(value =='true'){
	      		var html="<ul><li>"+xm+"&nbsp;<span class=\"f_hui\">"+date+"</span></li>"+
      			"<li class=\"f_hei\">"+nr+"</li></ul>";
				$("#xxWin div.win_box05_nr").append(html);
				$("#messageNr").val("");
	        }else{
	        	alert("请检查网络连接");
	        }
	        
	        }
	 });
}
//********************************通讯录 开始***********************************************************//
function f_txlWinOpen(){
	var html="";
	$.ajax({
	        type: "POST",
	        url: "xxts/xxts_txlList.action",
	        data : "",
            dataType:"",
            async:"true",//异步请求 ，默认值	
            cache:"true",
	        success : function(msg) {
	        var value=parse(msg);
	        $.each(value,function(i,v){
	        if(v.fsrsfzx=='Y'){
			    html+="<tr><td width=\"70\" height=\"70\"><img src=\"xxts/xxts_queryPotoByUserid.action?id="+v.jsr+"\" width=\"60\" height=\"60\" /></td>"+
			    "<td width=\"170\"><div class=\"f_red\"><strong>"+v.jsrxm+"</strong></div><div class=\"f_hui\">"+v.jsrdw+"</div><div class=\"f_hui\">联系电话："+v.jsrdh+"</div></td>"+
			    "<td width=\"30\" align=\"right\"><div><a href=\"javascript:void(0);\" onclick=\"f_openMessageWin('"+v.jsr+"','"+v.jsrxm+"','"+v.jsrdw+"','"+v.jsrdh+"','在线');\" title=\"对话\"><img src=\"common/images/comment.gif\" width=\"16\" height=\"16\" /></a></div>&nbsp;&nbsp;"+
			    "<div><a href=\"javascript:void(0);\" onclick=\"f_openSendPhotoMessageWin('"+v.jsr+"','"+v.jsrxm+"','"+v.jsrdh+"');\" title=\"手机短信\"><img src=\"common/images/email_open.gif\" /></a></div>&nbsp;&nbsp;<div><a href=\"javascript:void(0);\" onclick=\"f_fz("+v.jsr+")\" title=\"增加\"><img src=\"common/images/add.gif\" /></a></div></td></tr>";
	        }else{
	        	 html+="<tr><td width=\"70\" height=\"70\"><img src=\"xxts/xxts_queryPotoByUserid.action?id="+v.jsr+"\" width=\"60\" height=\"60\" /></td>"+
			    "<td width=\"170\"><div class=\"f_red\"><strong>"+v.jsrxm+"</strong></div><div class=\"f_hui\">"+v.jsrdw+"</div><div class=\"f_hui\">联系电话："+v.jsrdh+"</div></td>"+
			    "<td width=\"80\" align=\"right\"><div><a href=\"javascript:void(0);\" onclick=\"f_openMessageWin('"+v.jsr+"','"+v.jsrxm+"','"+v.jsrdw+"','"+v.jsrdh+"','离线');\" title=\"对话\"><img src=\"common/images/comment02.gif\" width=\"16\" height=\"16\" /></a></div>&nbsp;&nbsp;"+
			    "<div><a href=\"javascript:void(0);\" onclick=\"f_openSendPhotoMessageWin('"+v.jsr+"','"+v.jsrxm+"','"+v.jsrdh+"');\" title=\"手机短信\"><img src=\"common/images/email_open.gif\" /></a></div>&nbsp;&nbsp;<div><a href=\"javascript:void(0);\" onclick=\"f_fz("+v.jsr+")\" title=\"增加\"><img src=\"common/images/add.gif\" /></a></div></td></tr>";
	        }
	        });
	        $("#txlDiv").find("table .win_box04_list").html(html);
	        f_loadLxz();//加载联系组信息
	        $("div .box_search").keyup(function(e){  //绑定搜索事件
	        	var xm=$("div .box_search").find("input[type=text]").val();
	        	f_queryZy(xm);//通过输入的信息模糊查找组员
	        });
	}
	});
	$('#txlDiv').show('normal');
	$('#swDiv').hide('normal');
	$('#zjDiv').hide('normal');
	$('#xxDiv').hide('normal');
	$('#personDiv').hide('notmal');
}
/**新建通讯录联系组**/
function f_creatTxllxz(){
	var html="<div class=\"win_box06\" id=\"txllxzDiv\"><div class=\"win_title04\"><a href=\"javascript:void(0);\" onclick=\"f_closeTxllxzWin()\"><img src=\"common/images/close.gif\" style=\"float:right;\" /></a>新建组名</div>"+
	"<table><tr><td>组名:</td><td><input type=\"text\" id=\"lxzname\" name=\"txlBean.zm\" /></td></tr><tr><td colspan=\"2\" align=\"center\">"+
	"<input type=\"button\" value=\"确定\" onclick=\"f_submit()\"><input type=\"button\" value=\"取消\" onclick=\"f_closeTxllxzWin()\"></td></tr></table>"+
	"</div>";
	$("body").append(html);
}
/**关闭新建通讯录联系组窗口**/
function f_closeTxllxzWin(){
	$("#txllxzDiv").remove();
}
/**提交新增联系组**/
function f_submit(){
	var obj=$("div #DoorP").find("table");
	var bool=true;
	var lxzname = $("#lxzname").val();
	if(lxzname==""){
		alert("请输入组名");
	}else{
		$("div #DoorP").find("table").each(function(i){
			if($(this).find("td:last").html()==lxzname){
				alert("您要新增的组名已存在，请重试");
				$("#lxzname").val("");
				bool=false;
				return false;
			}
		});
		if(bool){
			$.ajax({
	        type: "POST",
	        url: "xxts/xxts_createNewLxz.action",
	        data : "zm="+lxzname,
            dataType:"",
            async:"true",//异步请求，默认值	
            cache:"true",
	        success : function(msg) {
	        var value=parse(msg);
	        if(value =='true'){
	      		f_loadLxz();//刷新联系组
	      		f_closeTxllxzWin();//关闭新建组窗口
	        }else{
	        	alert("请检查网络连接");
	        }
	        }
	 	});
		}
	}
}
//加载联系组信息
function f_loadLxz(){
	var html="";
	$.ajax({
	   type: "POST",
	   url: "xxts/xxts_showTxlLxz.action",
	   data : "",
       dataType:"",
       async:"true",//异步请求，默认值	
       cache:"true",
	   success : function(msg) {
	   var value=parse(msg);
	   if(value!=null){
	   $.each(value,function(i,v){
	   		html+="<table style=\"font-weight:bold;\"><tr style=\"cursor:pointer;\"  onmouseover=\"f_mmove(this)\" onmouseout=\"f_mout(this)\"><td width=\"16px\">"+
	      	"<img src=\"common/images/left.gif\" /></td><td width=\"100px\" id=\""+v.id+"\">"+v.zm+"("+v.zygs+")</td><td width=\"16px\">"+
	      	"<div style=\"display:none; float:right;\"><a onclick=\"f_delectLxz("+v.id+")\" href=\"javascript:void(0);\"><img src=\"common/images/close.gif\" alt=\"删除\"/></a></div></td></tr></table><div class=\"content\">"
	      	$.each(v.zyList,function(j,m){
	      		if(m.sfzx=='Y'){
	      			html+="<li><a  name=\""+m.zyid+"@"+m.zyxm+"@"+m.zydw+"@"+m.zydh+"@在线\" href=\"javascript:void(0);\" >"+m.zyxm+"</a></li>";
	      		}else{
	      			html+="<li><a name=\""+m.zyid+"@"+m.zyxm+"@"+m.zydw+"@"+m.zydh+"@离线\" href=\"javascript:void(0);\"><font color=\"gray\">"+m.zyxm+"</font></a></li>";
	      		}
	      	});
	      	html+="</div>";
	   });
	   html+="<script type=\"text/javascript\" src=\"common/js/toggle.js\"></script>";
	   $("div #DoorP").html(html);
	   $("div #DoorP").find("li").each(function(i){    //绑定事件 点击组员 左键打开对话框 右键点击打开分组信息等
	   	 var cs = $(this).find("a").attr("name");
	   	 $(this).mousedown(function(e){
	   	 	if(3==e.which){
	   	 		$(document).bind('contextmenu',function(e){return false;}); 
	   	 		f_rightClickRmCreateDiv(e,cs.split("@")[0]);
	   	 	}
	   	 });
	   	 $(this).dblclick(function(e){ 
	   	  	f_openMessageWin(cs.split("@")[0],cs.split("@")[1],cs.split("@")[2],cs.split("@")[3],cs.split("@")[4]);
	   	  });
	   });
	   $("div #DoorP").find("table").each(function(i){//绑定事件 点击组名 右键新增组员
	   		 $(this).find("td").eq(1).mousedown(function(e){
	   		 	var zid=$(this).attr("id");
	   			if(3==e.which){
	   	 		$(document).bind('contextmenu',function(e){return false;}); 
	   	 		f_rightClickZmCreateDiv(e,zid);
	   	 	}
	   		});
	   });
	   }
	   }
	});
	
}
//鼠标移入显示删除按钮
function f_mmove(obj){
	$(obj).find("div").show();
}
//鼠标移出显示删除按钮
function f_mout(obj){
	$(obj).find("div").hide();
}

//删除联系人组
function f_delectLxz(zid){
	$.ajax({
	    type: "POST",
	    url: "xxts/xxts_removeLxz.action",
	    data : "zid="+zid,
        dataType:"",
        async:"true",//异步请求，默认值	
        cache:"true",
	    success : function(msg) {
	    var value=parse(msg);
	    if(value =='true'){
	      	f_loadLxz();//刷新联系组
	    }else{
	        alert("请检查网络连接");
	    }
	    }
	 	});
}
//将未分组的最近联系人分组
function f_fz(userid){
	var inputHtml="";
	var html="<table>";
	$.ajax({
	    type: "POST",
	    url: "xxts/xxts_lxrFz.action",
	    data : "userid="+userid,
        dataType:"",
        async:"true",//异步请求，默认值	
        cache:"true",
	    success : function(msg) {
	    var value=parse(msg);
	    if(value != null){
	    	$.each(value,function(i,v){
	    		if(v.ischecked== 'checked'){
	    			inputHtml="<input type=\"radio\" name=\"fzRadio\" checked=\"checked\" value=\""+v.id+"\"/>";
	    		}else{
	    			inputHtml="<input type=\"radio\" name=\"fzRadio\" value=\""+v.id+"\"/>";
	    		}
	    		html+="<tr><td>"+inputHtml+"</td><td>"+v.zm+"</td></tr>"
	    	});
	    	html+="<tr><td colspan=\"2\" align=\"center\"><input type=\"hidden\" value=\""+userid+"\" /><input type=\"button\" value=\"确定\" onclick=\"f_submitFz()\"/><input type=\"button\" value=\"取消\" onclick=\"f_closeTxllxzWin()\"/></td></tr></table>"
	    	f_createFzDiv(html);
	    	$("#rightClickCreateDiv").remove();
	    }else{
	        alert("请检查网络连接");
	    }
	    }
	 	});
}
//点击人名 新建右键菜单 
function f_rightClickRmCreateDiv(e,zyid){
	var html="<div style=\"width:100px;left:"+e.clientX+"px;position:absolute;bottom:200px;background-color:#F1F1F1; border:1px solid #999999;z-index:100;border:1px solid #ccc\" id=\"rightClickCreateDiv\">"+
	"<table><tr onmouseover=\"f_bgcolorblue(this)\" onmouseout=\"f_bgcolorgray(this)\" onclick=\"f_removeZy("+zyid+")\"><td><a href=\"javascript:void(0)\">删除</a></td></tr>"+
	"<tr onmouseover=\"f_bgcolorblue(this)\" onmouseout=\"f_bgcolorgray(this)\" onclick=\"f_fz("+zyid+")\"><td><a href=\"javascript:void(0)\" >把好友移动到组...</a></td></tr></table>"+
	"</div>";
	$("body").append(html);
	$("#rightClickCreateDiv").focus();  
	$("#rightClickCreateDiv").focusout(function(){
		var focusEm = $(":focus");
		var parentEm = focusEm.closest( "#rightClickCreateDiv" );
		if( $(parentEm).get(0) ){
			return ;
		}
	   $(this).remove();
	});
}
//点击组名 新建右键菜单
function f_rightClickZmCreateDiv(e,zid){
	var html="<div style=\"width:100px;left:"+e.clientX+"px;position:absolute;bottom:210px;background-color:#F1F1F1; border:1px solid #999999;z-index:100;border:1px solid #ccc\" id=\"rightClickZmCreateDiv\">"+
	"<table><tr onmouseover=\"f_bgcolorblue(this)\" onmouseout=\"f_bgcolorgray(this)\" onclick=\"f_addzy("+zid+")\"><td><a href=\"javascript:void(0)\">添加好友到该组...</a></td></tr>"+
	"</table>"+
	"</div>";
	$("body").append(html);
	$("#rightClickZmCreateDiv").focus();  
	$("#rightClickZmCreateDiv").focusout(function(){
		var focusEm = $(":focus");
		var parentEm = focusEm.closest( "#rightClickZmCreateDiv" );
		if( $(parentEm).get(0) ){
			return ;
		}
	   $(this).remove();
	});
}
function f_bgcolorblue(obj){
	$(obj).css("background-color","#b2b2b2");
	$(obj).find("a").css("color","#fff");
}
function f_bgcolorgray(obj){
	$(obj).css("background-color","#F1F1F1");
	$(obj).find("a").css("color","#000");
}
//新增组员
function f_addzy(zid){
	$("#addZyWin").show("normal");
	$("#zidInput").val(zid);
	$("#zddZyIframe").attr("src","jsp/dwTree/dwryMulti.jsp");
	$("#rightClickZmCreateDiv").remove();
}
//
function f_closeAddZyWin(){
	$('#addZyWin').hide();
}
//删除组员
function f_removeZy(zyid){
	$.ajax({
	    type: "POST",
	    url: "xxts/xxts_removeZy.action",
	    data : "zyid="+zyid,
        dataType:"",
        async:"true",//异步请求，默认值	
        cache:"true",
	    success : function(msg) {
	    var value=parse(msg);
	    if(value =='true'){
	      	f_loadLxz();//刷新联系组
	    }else{
	        alert("请检查网络连接");
	    }
	    }
	 	});
	$("#rightClickCreateDiv").remove();
}
/**新建移动组DIV**/
function f_createFzDiv(html){
	var html="<div class=\"win_box06\" id=\"txllxzDiv\"><div class=\"win_title04\">"+
	"<a href=\"javascript:void(0);\" onclick=\"f_closeTxllxzWin()\"><img src=\"common/images/close.gif\" style=\"float:right;\" /></a>把好友移动到组...</div>"+html+"</div>";
	$("body").append(html);
}
//提交组员分组
function f_submitFz(){
	var zid = $("#txllxzDiv").find("input[type=radio][checked=true]").val();
	var zyid = $("#txllxzDiv").find("input[type=hidden]").val();
	if(zid){
		$.ajax({
	    type: "POST",
	    url: "xxts/xxts_doLxrFz.action",
	    data : "zyid="+zyid+"&zid="+zid,
        dataType:"",
        async:"true",//异步请求，默认值	
        cache:"true",
	    success : function(msg) {
	    var value=parse(msg);
	    if(value =='true'){
	      	f_loadLxz();//刷新联系组
	      	f_closeTxllxzWin();
	    }else{
	        alert("请检查网络连接");
	    }
	    }
	 	});
	}else{
		alert("请勾选组名");
	}
}
//通过输入的信息查找组员 支持模糊查找
function f_queryZy(xm){
	var html="<table style=\"width:100%\" class=\"search_box\"><tr style=\"cursor:pointer;\"><th>用户名</th><th>组名</th></tr>"
	if(xm==""){
		f_loadLxz();//刷新联系组
	}else{
		$.ajax({
		    type: "POST",
		    url: "xxts/xxts_queryZy.action",
		    data : "zyxm="+xm,
	        dataType:"",
	        async:"true",//异步请求，默认值	
	        cache:"true",
		    success : function(msg) {
		    var value=parse(msg);
		    if(value != null){
		    	$.each(value,function(i,v){
		    	if(v.sfzx=='Y'){
		    		html+="<tr><td><a href=\"javascript:void\" ondblclick=\"f_openMessageWin('"+v.zyid+"','"+v.zyxm+"','"+v.zydw+"','"+v.zydh+"','离线')\">"+v.zyxm+"</a></td><td>"+v.zm+"</td></tr>";
		    	}else{
		    		html+="<tr><td><a href=\"javascript:void\" ondblclick=\"f_openMessageWin('"+v.zyid+"','"+v.zyxm+"','"+v.zydw+"','"+v.zydh+"','离线')\">"+v.zyxm+"</a></td><td>"+v.zm+"</td></tr>";
		    	}
		    	});
		    	html+="</table>";
		    	$("div #DoorP").html(html);
		    }else{
		        alert("请检查网络连接");
		    }
		    }
		 	});
	}
}
//发送
function f_openSendPhotoMessageWin(jsr,jsrxm,jsrdh){
	var html="<div class=\"win_box07\" id=\"photoMessageDiv\"><div class=\"win_title04\"><a href=\"javascript:$('#photoMessageDiv').remove();void(0);\"><img src=\"common/images/close.gif\" style=\"float:right;\" /></a>发送手机短信</div>"+
	"<table class=\"win_box08\"><tr><th width=\"15%\">接收者:</th><th width=\"80%\">"+jsrdh+"["+jsrxm+"]</th></tr><tr><td colspan=\"2\" style=\"border-bottom:3px solid #ccc;\"><div class=\"win_box07_nr\"></div></td></tr><tr><td height=\"81\" colspan=\"2\" style=\"padding:0px;margin:auto\"><table height=\"65\" border=\"0\">"+
	"<tr><td><textarea name=\"xxnr\" id=\"photoMessageNr\" cols=\"45\" rows=\"5\" class=\"textarea_box07\"></textarea></td><td valign=\"top\"><input type=\"button\" onclick=\"f_sendPhotoMessages("+jsr+")\" value=\"发送\" /></td></tr></table></td></tr></table></div>";
	$("body").append(html);
}
//发送手机短信
function f_sendPhotoMessages(jsr){
	var fsnr=$("#photoMessageNr").val();
	var date=getCurrentTime();//当前时间
	if(fsnr!=''){
	$.ajax({
	    type: "POST",
	    url: "xxts/xxts_sendPhotoMessages.action",
	    data : "jsr="+jsr+"&fsnr="+fsnr,
        dataType:"",
        async:"true",//异步请求，默认值	
        cache:"true",
	    success : function(msg) {
	    var value=parse(msg);
	    if(value =='true'){
	      	var html="<ul><li class=\"f_hei\"><span>我&nbsp;</span><span class=\"f_hui\">"+date+"</span></li>"+
      			"<li class=\"f_green\">"+fsnr+"</li></ul>";
			$("#photoMessageDiv div.win_box07_nr").append(html);
			$("#photoMessageNr").val("");
	    }else{
	        alert("请检查网络连接");
	    }
	    }
	 	});
	 	}else{
	 		alert("不能发送空短信");
	 	}
}
//********************************国保动态 开始***********************************************************//
function f_loadGbdt(){
	var html1="";
	var html2="<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" class=\"gbdt_list\">"
		$.ajax({
	    type: "POST",
	    url: "gbdt/gbdt_gbdtTitleShow.action",
	    data : "",
        dataType:"",
        async:"true",//异步请求，默认值	
        cache:"true",
	    success : function(msg) {
	    var value=parse(msg);
	    if(value != ""){
		    $.each(value,function(i,v){
		    	if(i==0){
		    		html1="<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\"><tr><td height=\"28\" class=\"gbdt_nes\"><a href=\""+cmspath+"/sitepublish/site3/gbdt/content_"+v.document_id+".html\" target=\"_blank\"><font color=\"red\">"+f_substring(v.title)+"</font></a></td>"+
		    		"</tr></table>";
		    	}else{
		    		html2+="<tr> <td height=\"24\"><span class=\"color_c0c0c0\">·</span><a href=\""+cmspath+"/sitepublish/site3/gbdt/content_"+v.document_id+".html\" target=\"_blank\">"+f_substring(v.title)+"</a></td>"+
                    "<td align=\"right\" class=\"color666\">"+v.publishtime+"</td></tr>";
		    	}
		    });
		    html2+="</table>"
		    var html=html1+html2;
			$("div.padd1").html(html);
	    }else{
	        html2+="<tr><td>暂无数据</td></tr></table>"
	        $("div.padd1").html(html2);
	    }
	    }
	 	});
  window.setTimeout("f_loadGbdt();", 5000);//每隔5秒取一次
}
//加载国保动态图片
function f_loadGbdtImg(){
	var html="";
	$.ajax({
	    type: "POST",
	    url: "gbdt/gbdt_gbdtTitleShow.action",
	    data : "",
        dataType:"",
        async:"true",//异步请求，默认值	
        cache:"true",
	    success : function(msg) {
	    var value=parse(msg);
	    if(value != null){
		    $.each(value,function(i,v){
		    if(v.pic_path!=null){
		    	html+="<img src=\""+cmspath+"/sitepublish/site3/"+v.pic_path+"\" />";
		    }
		    });
		    $("div.imgPlayer").html(html);
		    //首页图片切换
			$(".imgPlayer").imgPlayer({
				height:245,					 //自定义高度
				width:360,					 //自定义宽度
				showTitle:false,		     //不显示标题	
				bindEvent:'mouseover'		 //更改触发图片切换的鼠标事件为mouseover,默认为click
			});
	    }else{
	        alert("请检查网络连接");
	    }
	    }
	 	});
}
//截取标题
function f_substring(title){
	if(title!=""){
		if(title.length>26){
			title=title.substring(0,23)+"...";
		}
		return title;
	}
	return title;
}
//********************************快捷入口 开始***********************************************************//
function f_openKsrkWin(){
	f_loadKjrk_pzJsp();//显示已经添加的快捷入口
	var html="";
	$.ajax({
	    type: "POST",
	    url: "gbdt/gbdt_kpzKjrk.action",
	    data : "",
        dataType:"",
        async:"true",//异步请求，默认值	
        cache:"true",
	    success : function(msg) {
	    var value=parse(msg);
	    if(value ==""){
	      	html="<div style=\"padding-top:10px;padding-left:80px;\">权限不足，暂无可配置快捷入口！</div>";
	    }else{
	    	html="<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">";
	        $.each(value,function(i,v){
	        	if(v.kjrkList!=""){
	        	html+="<tr><td align=\"left\" valign=\"center\" class=\"kjrk_bt kjrk_xian\"><img src=\"common/images/"+v.xtid+".gif \"/></td><td class=\"kjrk_bt1 kjrk_xian\"><div>";
	        		$.each(v.kjrkList,function(j,k){
	        			html+="<a href=\"javascript:void(0);\" onclick=\"f_addKjrk(this,'"+k.function_id+"')\" class=\"kjrk_tj\" title=\""+f_trim(k.name)+"\">"+f_substr(k.name)+"</a>";
	        		});
	        	}
	        	//else{
	        	//	html+="<div style=\"padding-top:10px;padding-left:80px;\"><font color=\"red\">该系统下没有可配置的快捷入口！</font></div>";
	        	//}
	        	html+="<div class=\"clear\"></div></div></td></tr>";
	        });
	    }
	    html+="</table>";
	    $("div #kpzkjrkDiv").html(html);
	    }
	 });
	f_show();
	$("#kjrkDiv").fadeIn('normal');
}
function f_substr(str){
	var value=str;
	if(str!="" && str!="null" && str!=null){
		if(f_trim(str).length>8){
			value=str.substring(0,8)+".";
		}
	}
	return value;
}
function f_trim(str){
	if(str!="" && str!="null" && str!=null){
		str=str.replace(/(^\s*)|(\s*$)/,"");//去除左右空格
	}
	return str;
}
function f_closeKjrkWin(){
    f_loadKjrk();
	f_display();
	$("#kjrkDiv").fadeOut('normal');
}
//加载当前用户设置的快捷入口 首页展示
function f_loadKjrk(){
	var html="";
	$.ajax({
	    type: "POST",
	    url: "gbdt/gbdt_ypzKjrk.action",
	    data : "",
        dataType:"",
        async:"true",//异步请求，默认值	
        cache:"true",
	    success : function(msg) {
	    var value=parse(msg);
	     if(value ==""){
	      	html="<div style=\"padding-top:70px;\">暂无快捷入口，请<a href=\"javascript:void(0);\" onclick=\"f_openKsrkWin();\">添加</a></div>";
	    }else{ 
	    	html += "<ul>";
	        $.each(value,function(i,v){
	        	html+="<li><a  href=\""+v.ssoUrl+"?user_name="+v.user_id+"&urlNo="+v.xtid+"&FuncitonId="+v.function_id+"\" target=\"_blank\"  title=\""+f_trim(v.name)+"\"><img src='gbdt/gbdt_loadkjrkimg.action?functionid="+v.function_id+"' width='25' height='25' />&nbsp;&nbsp;"+f_substr(v.name)+"</a></li>";
	        });
	        html += "</ul>";
	    }
	    
	    $("div .ksrk_bj").html(html);
	    
	    
	    }
	 });
	 
}
//加载当前用户设置的快捷入口 快捷窗口配置页展示
function f_loadKjrk_pzJsp(){
	var html="";
	var index=0;
	$.ajax({
	    type: "POST",
	    url: "gbdt/gbdt_ypzKjrk.action",
	    data : "",
        dataType:"",
        async:"true",//异步请求，默认值	
        cache:"true",
	    success : function(msg) {
	    var value=parse(msg);
	     if(value ==""){
	      	html="<div style=\"padding-top:10px;padding-left:140px;\">暂无快捷入口，请点击下面添加！</div>";
	    }else{
	    	html="<ul>"
	        $.each(value,function(i,v){
	        	html+="<li title=\""+f_trim(v.name)+"\"><a href=\"javascript:void(0);\" onclick=\"f_removeKjrk(this,'"+v.function_id+"');\" class=\"kjrk_qx\"></a>"+f_substr(v.name)+"</li>";
	        	index++;
	        });
	        html+="</ul><div style=\"float:right\"><font size=\"3\"><span id=\"gs\"></span>"+index+"/8</font></div><div class=\"clear\"></div>"
	    }
	    $("div .kjrk_div").html(html);
	    }
	 });
}
//移出用户已设置好的快捷入口
function f_removeKjrk(obj,functionid){
	$.ajax({
	    type: "POST",
	    url: "gbdt/gbdt_removeKjrk.action",
	    data : "id="+functionid,
        dataType:"",
        async:"true",//异步请求，默认值	
        cache:"true",
	    success : function(msg) {
	    var value=parse(msg);
	    if(value =='true'){
	      	 f_loadKjrk_pzJsp();
	    }else{
	        alert("请检查网络连接");
	    }
	    }
	 	});
}
//给用户添加快捷入口
function f_addKjrk(obj,functionid){
	var bool=true;
	var object=$("div .kjrk_div").find("ul").find("li");
	if(object.length >7 ){bool=false;}
	else{object.each(function(i){
	    if($(this).attr("title") == $(obj).attr("title")){
	    	alert("不能重复添加");
	    	bool=false;
	    	return;
	    }
	 });}
	 if(bool){
	 	$.ajax({
	    type: "POST",
	    url: "gbdt/gbdt_addKjrk.action",
	    data : "id="+functionid,
        dataType:"",
        async:"true",//异步请求，默认值	
        cache:"true",
	    success : function(msg) {
	    var value=parse(msg);
	    if(value =='true'){
	      	 f_loadKjrk_pzJsp();//刷新
	    }else{
	        alert("请检查网络连接");
	    }
	    }
	 	});
	 }
}


function f_psersonWinOpen(){
	$('#personDiv').show('notmal');
	$('#txlDiv').hide('normal');
	$('#swDiv').hide('normal');
	$('#zjDiv').hide('normal');
	$('#xxDiv').hide('normal');
}

function f_psersonWinClose(){
	$("#personDiv").hide("normal");
}

function saveUser(){
	if(""  == $("#mobile").val() ){
		alert("请输入联系方式");
		
	}else{
		if("" == $("#orgid1").val() ){
			alert("请选择上级单位");
		}else{
			$.ajax({
			    type: "POST",
			    url: "SWGZPT/updateUserXx.action",
			    data : $("#userForm").serialize(),
			    success : function(msg) {
			    var value=parse(msg);
			    if(value =='1'){
			      	 alert("修改成功");
			    }else{
			        alert("修改失败");
			    }
			    }
			});
		}
	
	}
}