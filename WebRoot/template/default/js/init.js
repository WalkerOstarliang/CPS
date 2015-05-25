function initCom()
{
	$(".cps-select").each(function(){
		//var parentObj = $(this).parent();
		//var parentWidth = parentObj.width();
		//$(this).css("width",parentWidth * 0.71)
	});
	
	$(".chosen-select").each(function(){
		$(this).chosen({
			disable_search_threshold: 10,
		    no_results_text: "没找到选项",
		    search_contains:true,
		    width: "87%"
    	});
	});
	
	$(".cps-tablegrid td").each(function(){
		var align = $(this).attr("align");
		$(this).css("text-align",align);
	});
	
	//  初始化全局验证规则
	$("form").each(function(i){
		$(this).validationEngine({
			promptPosition : "topLeft",
			inlineValidation : false,
			success : false
		});
	});
	
	// 时间控件绑定
	$(".Wdate").each(function(i){
		if ($(this).attr("cssClass"))
		{
			$(this).addClass($(this).attr("cssClass"));
		}

		//绑定事件
		$(this).bind("click",function(){
			var minData = $(this).attr("minDate");
			if ($(this).attr("minDateDepend"))
			{
				minData = "#F{$dp.$D('" + $(this).attr("minDateDepend") + "')}";
			}
			
			var maxData = $(this).attr("maxDate");
			if ($(this).attr("maxDateDepend"))
			{
				maxData = "#F{$dp.$D('" + $(this).attr("maxDateDepend") + "')}";
			}
			var params = {
				dateFmt:$(this).attr("dateFmt")?$(this).attr("dateFmt") : "yyyy-MM-dd",
				minDate:minData ? minData : "1900-01-01 00:00:00",
				maxDate:maxData ? maxData : "2099-12-31 23:59:59",
				readOnly:$(this).attr("readOnly")?$(this).attr("readOnly") : false
			}
			WdatePicker(params);
		});
	});
	
		
	$(".imageswitch").each(function(){
		var imageswitch = $(this);
		var zpxximageid = $(this).attr("id");
		var height = $("#" + zpxximageid).attr("height");
		var width = $("#" + zpxximageid).attr("width");
		
		var size = imageswitch.find(".spec-list div").first().find("img").length;
		if (size <= 0)
		{
			imageswitch.find(".spec-list div").first().append("<img src=\"" + contextPath + themePath + "/images/default_zp.png\">");
		}
		
		if (height != null && height != "")
		{
			$("#" + zpxximageid).css("height",height);
			imageswitch.find(".spec-list div").first().css("height", parseInt(height) - 20);
			imageswitch.find(".spec-list div").first().find("img").css("height", parseInt(height) - 20);
		}
		if (width != null && width != "")
		{
			$("#" + zpxximageid).css("width",width);
			imageswitch.find(".spec-list div").first().css("width", width);
			imageswitch.find(".spec-list div").first().find("img").css("width", width);
		
		}
		
		
		imageswitch.find(".spec-list div").first().find("img").hide();
		imageswitch.find(".spec-list div").first().find("img:first").show();
		$("#" + zpxximageid).data("index",0);
		imageswitch.find(".spec-left").bind("click",function(){
			var size = imageswitch.find(".spec-list div").first().find("img").length;
			var index = $("#" + zpxximageid).data("index");
			if (index > 0)
			{
				$("#" + zpxximageid).data("index",index -1);
				imageswitch.find(".spec-list div").first().find("img").eq(index).hide();
				imageswitch.find(".spec-list div").first().find("img").eq(index-1).show()
			}
			else if (index <=0)
			{
				$("#" + zpxximageid).data("index",size-1);
				imageswitch.find(".spec-list div").first().find("img").eq(0).hide();
				imageswitch.find(".spec-list div").first().find("img").eq(size-1).show()
			}
		});
		$(this).find(".spec-right").bind("click",function(){
			
			var size = imageswitch.find(".spec-list div").first().find("img").length;
			var index = $("#" + zpxximageid).data("index");
			if (index < size-1)
			{
				$("#" + zpxximageid).data("index",index + 1);
				imageswitch.find(".spec-list div").first().find("img").eq(index).hide();
				imageswitch.find(".spec-list div").first().find("img").eq(index+1).show()
			}
			else if (index >= size - 1)
			{
				$("#" + zpxximageid).data("index",0);
				imageswitch.find(".spec-list div").first().find("img").eq(index).hide();
				imageswitch.find(".spec-list div").first().find("img").eq(0).show()
			}
		});
		imageswitch.find(".spec-list div img").bind("mouseover",function(){
			var offset = $("#" + zpxximageid).offset();
			
			var src = $(this).attr("src");
			$("#" + zpxximageid).find(".imagebig:first").find("img:first").attr("src",src);
			$("#" + zpxximageid).find(".imagebig:first").css("top",offset.top).css("right",$(document).width() - offset.left);
			$("#" + zpxximageid).find(".imagebig:first").show();
		});
		imageswitch.find(".spec-list div img").bind("mouseout",function(){
		 	$("#" + zpxximageid).find(".imagebig:first").hide();
		})
	});
	
	// tabpanel
	$(".creatorpanel").each(function(){
		var panelId = $(this).attr("id");
		var height = $(this).attr("height");
		var width = $(this).attr("width");
		var tbarId = $(this).attr("tbarId");
		$("#head_" + panelId).css("width",width);
		$("#body_" + panelId).css("width",width);
		if (height == "window")
		{
			var winheight = $(document).height();
			$("#body_" + panelId).css("height",winheight - 40);
		}
		else if (height == "auto")
		{
			$("#body_" + panelId).css("height","auto");
		}
		else
		{
			$("#body_" + panelId).css("height",height);
		}
	
		if (tbarId != null && tbarId != "")
		{
			$("#tbar_" + panelId).html($("#" + tbarId).html());
		}
	});
	
	
	$("input[readonly='readonly']").css("background-color","#F5F4EA");
	
	$(":input").each(function(){
		var disabled = $(this).attr("disabled");
		var hideValue = $(this).attr("hideValue");
		if (disabled == "disabled" && hideValue == true)
		{
			var id = $(this).attr("id");
			var name = $(this).attr("name");
			var value = $(this).val();
			if ($("#" + id + "_hidden").length <=0)
			{
				$(this).before("<input type='hidden' id='" + id + "_hidden' name='" + name + "' value='" + value + "'/>")
			}
			$(this).removeAttr("name");
		}
	});
	
	$("div[view='true']").find(":input").each(function(){
		$(this).attr("disabled","disabled");
		var name = $(this).attr("name");
		var value = $(this).val();
		var id = $(this).attr("id");
		$(this).before("<input type='hidden' id='" + id + "_hidden' name='" + name + "' value='" + value + "'/>");
		$(this).removeAttr("name");
		$(this).css("background-color","#F5F4EA");
	});
	
	$(".cps-icon-panel ul").bind("mouseover",function(){
		$(this).addClass("cps-icon-moveover-bg");
	}).bind("mouseout",function(){
		$(this).removeClass("cps-icon-moveover-bg");
	});
	
	$(".cps-icon-panel").find("ul").each(function(){
		 var href = $(this).attr("href");
		 var id = $(this).attr("id")
		 if (!$.isBlank(href))
		 {
			 $(this).bind("click",function(){
				 $.openWindow({
					name : "win_" + id,
					url : href,
					width : 1000,
					height : 600,
					scroll : true,
					resizable : "yes"
				 });
			 });
		 }
	});
}


	
$(function(){
	// 设置全局ajax方式
	jQuery.ajaxSetup({
		type : "post",
		global: true,
		timeout : 120000,
		error : function(result,msg,obj)
		{
			alert("请求发生错误")
			$("#loading").hide();
		},
		failure : function(result)
		{
			alert("请求失败")
			$("#loading").hide();
		}
	});
	var index;
	jQuery(".cps-loading").ajaxStart(function(){
		index = layer.load(0);
	}).ajaxStop(function(){
		if (index != undefined)
		 {
			 layer.close(index);  
		 }
		initCom();
	 }).ajaxError(function(){
		 if (index != undefined)
		 {
			 layer.close(index);  
		 }
		 initCom();
	 }).ajaxComplete(function(){
		if (index != undefined)
		{
			layer.close(index);  
		}
		$("form").each(function(i){
	    	 $(this).validationEngine();
		});
	});
	initCom();
});