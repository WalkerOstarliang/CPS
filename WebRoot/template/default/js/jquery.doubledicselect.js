(function($){
	$.fn.extend({
		doubleDicSelect : function(callback)
		{
			return this.each(function(){
				
				var $this = $(this);
				
				var zdlb = $this.attr("zdlb");
				var depend =  $this.attr("depend");
				var value = $this.attr("defaultValue");
				if ($this.attr("headKey") != undefined)
				{
					$this.append("<option value=\"" + ($this.attr("headKey")?$this.attr("headKey") : "") + "\">" + ($this.attr("headValue")?$this.attr("headValue") : "") + "</option>");
				}
				if (!$.isBlank(zdlb))
				{
					var isload = true;
					var parentdm = "";
					if (depend)
					{
						parentdm = $("#" + depend).attr("defaultValue");
						if (parentdm == null || parentdm == "")
						{
							isload = false;
						}
					}
					else
					{
						parentdm = $this.attr("parentdm");
					}
					if (isload)
					{
						//初始化加载下拉框
						callbackfindDicBeanByParentDm(zdlb,parentdm,function(dicBeanList){
							$this.empty();
							var width = $this.width();
							if ($this.attr("headValue") != undefined)
							{
								$this.append("<option value=\"" + ($this.attr("headKey")?$this.attr("headKey") : "") + "\">" + ($this.attr("headValue")?$this.attr("headValue") : "") + "</option>");
							}
							
							$.each(dicBeanList,function(i,dicBean){
								var displayname = $this.attr("displayfield") ? $this.attr("displayfield") : "mc";
								if (value == dicBean["dm"])
								{
									$this.append("<option value=\"" + dicBean["dm"] + "\" selected=\"selected\">" + dicBean[displayname] + "</option>");
								}
								else
								{
									$this.append("<option value=\"" + dicBean["dm"] + "\">" + dicBean[displayname] + "</option>");
								}
							});
						});
					}
				}
				//绑定change事件
				$this.bind("change",function(){
					var parentdm = $(this).val();
					$(this).attr("defaultValue",parentdm);
					//初始化加载下拉框
					callbackfindDicBeanByParentDm(zdlb,parentdm,function(dicBeanList){
						var displayname = $this.attr("displayfield") ? $this.attr("displayfield") : "mc";
						var doubleSelect = $this.attr("doubleSelect");
						if (doubleSelect)
						{
							//var width = $("#" + doubleSelect).width();
							var value = $("#" + doubleSelect).val();
							$("#" + doubleSelect).empty();
							if ($("#" + doubleSelect).attr("headKey") != undefined)
							{
								$("#" + doubleSelect).append("<option value=\"" + ($("#" + doubleSelect).attr("headKey")?$("#" + doubleSelect).attr("headKey") : "") + "\">" + ($("#" + doubleSelect).attr("headValue")?$("#" + doubleSelect).attr("headValue") : "") + "</option>");
							}
							$.each(dicBeanList,function(i,dicBean){
								
								if (value == dicBean["dm"])
								{
									$("#" + doubleSelect).append("<option value=\"" + dicBean["dm"] + "\" selected=\"selected\">" + dicBean[displayname] + "</option>");
								}
								else
								{
									$("#" + doubleSelect).append("<option value=\"" + dicBean["dm"] + "\">" + dicBean[displayname] + "</option>");
								}
							});
							
						}
						if ($.isFunction(callback))
						{
							callback(dicBeanList);
						}
						
					});
				});
			})
		}
	});
})(jQuery)