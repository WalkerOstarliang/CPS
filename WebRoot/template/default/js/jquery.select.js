(function($){
	$.fn.extend({
		select : function()
		{
			return this.each(function(){
				 var $this = $(this);
				 var inputid = ($this.attr("id") != undefined && $this.attr("id") != null && $this.attr("id") != "")  ?  
				                          $this.attr("id") + "_input_" + new Date().getTime()
				 						  : "_input_" + new Date().getTime();
				                          
				 var selectdivid = ($this.attr("id") != undefined && $this.attr("id") != null && $this.attr("id") != "")  ?  
				                          $this.attr("id") + "_div_" + new Date().getTime() 
				 						  : "_div_" + new Date().getTime();
				 $this.before("<input id=\"" + inputid + "\" type=\"text\" class=\"cps-input cps-select-input\"/>");
				 $this.after("<div id=\"" +selectdivid + "\" class=\"cps-select-edit-div\"></div>");
				 
				 				 
				 $this.attr("inputid",inputid);
				 $this.attr("selectdivid",selectdivid);
				 
				 var thisdisabled = $this.attr("disabled");
				 if (thisdisabled == "disabled")
				 {
					 $("#" + inputid).attr("disabled","disabled");
				 }
				 $this.removeAttr("disabled");
				 
				 var defaultvalue = $this.val();
				 var defaulttext = $this.find("option:selected").text();
				 $("#" + inputid).val(defaulttext).attr("title",defaulttext);
				 
				 var inputoffset = $("#" + inputid).offset();
				 var selectdivoffset = {
					 top : inputoffset.top + $("#" + inputid).height() + 6,
					 left : inputoffset.left
				 }
				 $("#" + selectdivid).offset(selectdivoffset);
				 
				 $("#" + inputid).focus(function(){
					 $("#" + selectdivid).show();
					 bindSelectDivUlLi($this,selectdivid,inputid,1);
					 bindSelectDivEvent($this,selectdivid,inputid);
					 
				 }).keyup(function(event){
				     bindSelectDivUlLi($this,selectdivid,inputid);
					 bindSelectDivEvent($this,selectdivid,inputid)
				 }).keydown(function(event){
					 //删除
					 if (event.keyCode == 8)
					 {
						 $(this).val("");
					 }
				 });
				 
				 
				 $(document).click(function(event){
					 var obj = event.srcElement ? event.srcElement : event.target
					 var srcid = $(obj).attr("id")
					 if (srcid != inputid)
					 {
						 $("#" + selectdivid).hide();
					 }
				 });
				 $this.hide();
			});
		}
	});
	
	function bindSelectDivUlLi(globobj,selectdivid,inputid,source)
	{
		 $("#" + selectdivid).width("");
		 var inputvalue = $("#" + inputid).val();
		 $("#" + selectdivid).empty();
		 $("#" + selectdivid).append("<ul></ul>");
		 //焦点事件执行
		 if (source != undefined && source == 1)
		 {
			  globobj.find("option").each(function(){
				 var value = $(this).attr("value") + "";
				 var text = $(this).text() + "";
				 if (value != undefined && value != null && $.trim(value) != "" )
				 {
					  $("#" + selectdivid).find("ul").first().append("<li title=\"" + text + "\" val=\"" + value +"\">[" + value +"]" + text + "&nbsp;&nbsp;</li>");
				 }
				 else
				 {
					  $("#" + selectdivid).find("ul").first().append("<li title=\"" + text + "\" val=\"" + value +"\">" + text + "&nbsp;&nbsp;</li>");
				 }
				
			 });
		 }
		 else 
		 {
			 globobj.find("option").each(function(){
				 var value = $(this).attr("value") +"";
				 var text = $(this).text() + "";
				 if (inputvalue == undefined || inputvalue == null || inputvalue == "")
				 {
					 if (value != undefined && value != null && $.trim(value) != "" )
					 {
						 $("#" + selectdivid).find("ul").first().append("<li title=\"" + text + "\" val=\"" + value +"\">[" + value +"]" + text + "&nbsp;&nbsp;</li>");
						 
					 }
					 else
					 {
						  $("#" + selectdivid).find("ul").first().append("<li title=\"" + text + "\" val=\"" + value +"\">" + text + "&nbsp;&nbsp;</li>");
					 }
				 }
				 else if (text.indexOf(inputvalue) >= 0 || value.indexOf(inputvalue) >=0)
				 {
					 if (value != undefined && value != null && $.trim(value) != "")
					 {
						 $("#" + selectdivid).find("ul").first().append("<li title=\"" + text + "\" val=\"" + value +"\">[" + value +"]" + text + "&nbsp;&nbsp;</li>");
				 	 }
					 else
					 {
						$("#" + selectdivid).find("ul").first().append("<li title=\"" + text + "\" val=\"" + value +"\">" + text + "&nbsp;&nbsp;</li>");
					 }
				 }
			 });
		 }
		 
		  //设置宽度
		 var inputwidth = $("#" + inputid).width();
		 var selectdivwidth = $("#" + selectdivid).width();
		 
		 if (selectdivwidth < inputwidth)
		 {
			  $("#" + selectdivid).width(inputwidth);
		 }
		 
		
		 var size = $("#" + selectdivid).find("ul").first().find("li").length;
		 if (size <=0)
		 {
			  var inputwidth = $("#" + inputid).width();
			  $("#" + selectdivid).width(inputwidth);
		 }
		 
	}
	
	function bindSelectDivEvent(globobj,selectdivid,inputid)
	{
		 $("#" + selectdivid).find("ul li").mouseover(function(){
			$(this).css("background-color","#7E9EE5"); 
			$(this).css("color","white"); 
		 }).mouseout(function(){
			 $(this).css("background-color","");
			 $(this).css("color",""); 
		 }).click(function(){
			 var selectedvalue = $(this).attr("val");
			 var text = $(this).attr("title");
			 globobj.val(selectedvalue);
			 //$("#fwcs").val(selectedvalue)
			 $("#" + inputid).val(text);
			 $("#" + selectdivid).hide();
		 });
	}
	 
})(jQuery)