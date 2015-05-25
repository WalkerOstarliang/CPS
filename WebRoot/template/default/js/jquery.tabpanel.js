(function($){
	$.fn.extend({
		tabPanel : function()
		{
			return this.each(function(){
				var $this = $(this);
				var winheight = $(window).height();
				var tabpanelId = $(this).attr("id");
				var width = $(this).attr("width");
				var height = $(this).attr("height");
				$("#" + tabpanelId).css("width", width).css("height",height);
				var panelheight = null;
				if (height != null && height!="" && height.indexOf("%") > 0)
				{
					var pv = $.substring(height, 0, height.indexOf("%"));
					panelheight = pv * 0.01 * winheight;
					$("#" + tabpanelId).find(".cps-tab-content").first().css("height", panelheight - 24);
				}
				else if (height == "auto")
				{
					var winheight = $(window).height();
					var offset = $("#" + tabpanelId).offset();
					panelheight = winheight - offset.top;
					$("#" + tabpanelId).find(".cps-tab-content").first().height(panelheight -30);
				}
				else
				{
					panelheight = height ;
					$("#" + tabpanelId).find(".cps-tab-content").first().css("height", panelheight - 24);
				}
				$("#" + tabpanelId).find(".tab-content").hide();
				$(this).find("button[class^='cps-tab-head']").each(function(i){
					var display = $(this).attr("display");
					var href = $(this).attr("href");
					if (display == "true")
					{
						$("#" + tabpanelId).find(".tab-content").eq(i).show();
						$(this).attr("clickfinish", true);
						// 异步加载
						if (href != null && href!="")
						{
							$.ajax({
								type:"post",
								url : contextPath + href,
								dataType : "html",
								success : function(resulthtml)
								{
									$("#" + tabpanelId).find(".tab-content").eq(i).html(resulthtml);
								}
							})
						}
					}
					$(this).bind("click", function(){
						var temp = true;
						// 如果点击签返回temp则，切换tab
						if (temp)
						{
							$("#" + tabpanelId).find(".cps-tab-head button").removeClass("cps-tab-head-inline").addClass("cps-tab-head-none");
							$(this).removeClass("cps-tab-head-none").addClass("cps-tab-head-inline");
							$(this).attr("display","true");
							$("#" + tabpanelId).find(".tab-content").hide();
							$("#" + tabpanelId).find(".tab-content").eq(i).show();
							var href = $(this).attr("href");
							if (href && href != "")
							{
							
								var clickfinish = $(this).attr("clickfinish");
								if (!clickfinish)
								{
									$(this).attr("clickfinish", true);
									$.ajax({
										type:"post",
										dataType : "html",
										url : contextPath + href,
										success : function(resulthtml)
										{
											$("#" + tabpanelId).find(".tab-content").eq(i).html(resulthtml);
										}
									});
								}
							}
						}
					});
					var length = $("#" + $this.attr("id")).find("button[display='true']").length;
					if (length > 0)
					{
						$("#" + $this.attr("id")).find("button[display='true']").first().trigger("click");
					}
				});
			});
		}
	});
})(jQuery)