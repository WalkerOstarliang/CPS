/**
 * jquery 插件集合
 * @param {Object} $
 * @memberOf {TypeName} 
 * @return {TypeName} 
 */
(function($){
	$.fn.extend({
		ajaxFormFire : function(namespace,action,callback)
		{
			var formid = $(this).attr("id");
			if ($.validateform(formid))
			{
				var url = contextPath + namespace + "/" + action + ".action";
				$("#" + formid).ajaxSubmit({
					type:"post",
					dataType:"json",
					url:url,
					success : function(result)
					{
						callback(result);
					}
				});
			}
		},
		ajaxUploadFire : function(namespace,action,getData,onbefore,callback)
		{
			var index = null;
			var button = $(this);
			var ajaxupload = new AjaxUpload(button, {
				action: contextPath + namespace + "/" + action + ".action", 
				name: button.attr("name"),
				responseType: "json",
				autoSubmit : true,
				onChange : function(file, ext)
				{
					if (button.attr("name") != null && button.attr("name") != "")
					{
						if ($.isFunction(onbefore))
						{
							return onbefore(file,ext);
						}
					}
					else
					{						
						alert("文件名不能为空.");
						return false;
					}
				},
				onSubmit : function(file, extension)
				{
					index = layer.load(0);
					if ($.isFunction(getData))
					{
						var params = getData();
						ajaxupload.setData(params);
					}
					else
					{
						ajaxupload.setData(getData);
					}
				},
				onComplete: function(file, result)
				{
					if ($.isFunction(callback))
					{
						callback(file,result);
			    	}
			    	layer.close(index);  
				}
			});
			return ajaxupload;
		},
		eachObjectSetValue : function(jsonObejct)
		{
			 return $(this).find(":input").each(function(){
				 if (jsonObejct == null) return false;
				 var tagName = this.tagName;
				 var vtype = $(this).attr("type");
				 var inputfield = $(this);
				 if (vtype == undefined || (vtype.toLowerCase() != "checkbox" && vtype.toLowerCase() != "radio"))
				 {
				 	inputfield.val("");
				 }
				 var key = $(this).attr("id");
				 var keyhidden = key + "_hidden";
				 if (jsonObejct[key] != undefined)
				 {
				 	  $(this).val(jsonObejct[key]);
				 	  $("#" + keyhidden).val(jsonObejct[key]);
					  if (tagName == "SELECT")
					  {
						 var value = inputfield.val();
						 var inputid = inputfield.attr("inputid");
						 if (inputid != undefined && inputid != null && inputid != "")
						 {
							 $("#" + inputid).val(inputfield.find("option:selected").text());
						 }
						 if (!$.isBlank(value))
						 {
							 var text = inputfield.find("option:selected").text();
						 	 inputfield.next("span").text(text != null ? text : "");
						 }
						 else
						 {
							 inputfield.next("span").text("");
						 }
						 
						 var id = inputfield.attr("id");
						 $("#" + id + "_chosen").find("a span").first().html(inputfield.find("option:selected").text())
					 }
					 else if (tagName == "TEXTAREA")
					 {
						var text = inputfield.text();
						inputfield.next("span").text(text != null ? text : "");
					 }
					 else
					 {
						 inputfield.next("span").text(jsonObejct[key] != null ? jsonObejct[key] : "");
					 }
				 }
			 });
		},
		displayText : function()
		{
			changeTextDisplay(this);
		},
		displayInputForText : function()
		{
			return $(this).find(":input").each(function(){
				 changeTextDisplay(this);
			});
		},
		changeInputDisabled : function()
		{
			return $(this).find(":input").each(function(){
				changeDisabled(this);
			});
		},
		getWindowHeight : function()
		{
			return $(window).height();
		},
		setDomWindowHeight : function()
		{
			$(this).height($(window).height() - 5)
		}
		
	});
	
	function changeDisabled(domobj)
	{
		$(domobj).attr("disabled","disabled")
	}
	
	function changeTextDisplay(domobj)
	{
		var tagName = domobj.tagName;
		var inputfield = $(domobj);
		var type = inputfield.attr("type");
		inputfield.next("span").first().remove();
		if (type == "text" || type =="date")
		{
			//var text = inputfield.val();
			//inputfield.after("<span>&nbsp;" + text + "</span>");
			//inputfield.hide();
			inputfield.attr("readonly","readonly");
		}
		else if (type == "radio")
		{
			inputfield.attr("disabled","disabled");
		}
		else if (type == "checkbox")
		{
			inputfield.attr("disabled","disabled");
		}
		else if (type == "button" || type == "reset" || type == "submit")
		{
			inputfield.hide();
		}
		else if (type == "select")
		{
			inputfield.attr("disabled","disabled");
		 	/**
			var value = inputfield.val();
			
			if (!$.isBlank(value))
			{
				var text = inputfield.find("option:selected").text();
				
				inputfield.after("<span>&nbsp;" + text + "</span>");
				inputfield.hide();
			}
			else
			{
				inputfield.hide();
				inputfield.after("<span>&nbsp;</span>");
			}
			 */
		}
		else
		{
			if (tagName == "SELECT")
			{
				inputfield.attr("disabled","disabled");
				
				/**
				var value = inputfield.val();
				if (value != null && value != "")
				{
					var text = inputfield.find("option:selected").text();
					inputfield.after("<span>&nbsp;" + text + "</span>");
					inputfield.hide();
				}
				else
				{
					inputfield.hide();
					inputfield.after("<span>&nbsp;</span>");
				}
				*/
			}
			else if (tagName == "TEXTAREA")
			{
				inputfield.attr("readonly","readonly");
				//var width = inputfield.width();
				//var value = inputfield.text();
				//inputfield.after("<div style='width : " + width + "'>&nbsp;" + value + "</div>");
				//inputfield.hide();
				//inputfield.attr("disabled","disabled");
			}
		}
	}
})(jQuery)