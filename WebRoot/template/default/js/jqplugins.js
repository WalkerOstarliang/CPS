/**
 * jquery自定义插件
 */
(function($){
	
	$.extend({
		
		alert : function(msg)
		{
			$.openLayerWin({
				title : "提示",
				type : "alert",
				source : msg,
				width : 450,
				height : 150
			});
		},
		/**
		 * @param params : {
		 * 		title,
		 * 		type,	iframe, div ,alert
		 *      source, 
		 *      width,
		 *      height,
		 * 	    close : 
		 * }
		 */
		openLayerWin : function(params)
		{
			var v_box = "2";
			var winwidth = params.width ? params.width + "px" : "68%";
			var winheight = params.height ? params.height + "px": "86%";
			if (params.type == "iframe")
			{
				v_box = "2";
			}
			else if (params.type == "div")
			{
				v_box = "1";
			}
			else if (params.type == "alert")
			{
				v_box = "0"
			}
			else if (params.type == "loading")
			{
				v_box = "3"
			}
			var documentheight = $(window).height();
			var intheight = params.height ? params.height : (documentheight * 0.86)
			var offsetheight = (documentheight/2 - intheight/2);
			
			$.layer( {
				v_title : params.title,
				v_box : v_box,
				v_dom : params.source,
				v_msg : params.source,
				v_src : params.source,
				border : [5, 0.5, '#666', true],
				v_area : [winwidth, winheight],
				v_btns : 0,
				v_offset : [offsetheight , "" ],
				closeBtn : false,
				close : function()
				{
					layer_close();
				}
			});
		},
		
		timeTask : function(time,exefun)
		{
			if(exefun && $.isFunction(exefun))
			{
				return setInterval(exefun,time);
			}
		},
		clearTimeTask : function(taskObj)
		{
			if (taskObj)
			{
				taskObj.clearInterval();
			}
		},
		//滚动条位置
		scollPostion : function()
		{
			 var t, l, w, h;
		     if (document.documentElement && document.documentElement.scrollTop) {
		          t = document.documentElement.scrollTop;
		          l = document.documentElement.scrollLeft;
		          w = document.documentElement.scrollWidth;
		          h = document.documentElement.scrollHeight;
		      } else if (document.body) {
		          t = document.body.scrollTop;
		          l = document.body.scrollLeft;
		          w = document.body.scrollWidth;
		          h = document.body.scrollHeight;
		      }
		      return { top: t, left: l, width: w, height: h };
		},
		// 打开dialog window
		openDialogWindow : function(params)
		{
			var op = $.extend({
				url : "",
				width : 500,
				height:300,
				arguments : "",
				data : null,
				scroll : false,
				callback : null
			},params)
			var url = op.url;
			if (op.data != null)
			{
				var paramsstr = "a=b";
				$.each(op.data,function(key,value){
					paramsstr += "&" + key + "=" + value;
				});
				if (url.indexOf("?") > 0)
				{
					url += "&" + paramsstr;
				}
				else
				{
					url += "?" + paramsstr;
				}
			}
			
			var sFeatures = "dialogWidth="+op.width+"px;dialogHeight="+op.height+"px;help=yes;resizable=no;status=no;center=yes;scroll="+(op.scroll ? "yes" : "no")+";edge=sunken;";
			var resultValue = window.showModalDialog(url,op.arguments,sFeatures);
			if ($.isFunction(op.callback))
			{
				op.callback(resultValue);
			}
		},
		//打开window 窗口
		openWindow : function(params)
		{
			var op = $.extend({
				name : "",
				url : "",
				width : 500,
				height : 500,
				scroll : false,
				resizable : "yes",
				data : null
			},params);
			
			var url = op.url;
			if (op.data != null)
			{
				var paramsstr = "a=b";
				$.each(op.data,function(key,value){
					paramsstr += "&" + key + "=" + value;
				});
				if (url.indexOf("?") > 0)
				{
					url += "&" + paramsstr;
				}
				else
				{
					url += "?" + paramsstr;
				}
			}
			
			var paramss = "width="+op.width+"px,height="+op.height+"px,scrollbars="+(scroll?"yes":"no")+",toolbar=no,menubar=no,resizable=" + op.resizable + ",status=no,location=no,alwaysRaised=yes,titlebar=no,z-look=yes";
			var win = window.open(url,op.name,paramss);
			win.focus();
			return win;
			
		},
		// 关闭window 窗口
		closeWindow : function()
		{
			window.close();
		},
		// 设置窗口返回值
		setResultValue : function(value)
		{
			window.returnValue = value;
		},
		//打开用户选择窗口
		openUserInfoWin : function(param,callback)
		{
			var url = "../pbzl/toPbrySelectPage.action?t="+new Date().getTime();
			if (param)
			{
				url += "&" + $.param(param);	
			}
			$.openDialogWindow({
				url :  url,
				height : 500,
				width:1000,
				scroll : false,
				callback : callback
			})
		},
		/**
		 * opts = 
		 * {
		 *  namespace : "/linkfb",
		 *  action : "updatepbzlInfo",
		 *  data : {id : '1',sfzh:'1313'},
		 *  callback : null
		 * }
		 * @param {Object} opts
		 */
		fire : function(opts)
		{
			$.ajax({
				type : "post",
				url : ".."+opts.namespace+"/"+opts.action+".action?t="+new Date().getTime(),
				data : $.converJSONArrayToUrlParam(opts.data),
				dataType : opts.dtaType,
				success : function(result)
				{
					if ($.isFunction(opts.callback))
					{
						opts.callback(result)
					}
					
				}
			});
		},
		trimLastChar : function(str,searchchar)
		{
			var newStr = "";
			if (str.lastIndexOf(searchchar) > 0)
			{
				newStr = str.substring(0,str.length-1);
			}
			else
			{
				newStr = str;
			}
			return newStr;
		},
		converJSONArrayToUrlParam : function(jsonObjOrArray)
		{
			var newStr = "";
			if (jsonObjOrArray)
			{
				if ($.isArray(jsonObjOrArray))
				{
					
					$.each(jsonObjOrArray,function(i,obj)
					{
						if ($.isPlainObject(obj))
						{
							newStr += $.param(obj)+"&";
						}
					});
					var newStr = $.trimLastChar(newStr,"&");
				}
				else if ($.isPlainObject(jsonObjOrArray))
				{
					newStr = $.param(jsonObjOrArray);
				}
				else
				{
					newStr = jsonObjOrArray;
				}
			}
			return newStr;
		},
		/**
		 * array or object conver stuff object 
		 * @param {Object} array
		 * @param {Object} stuff
		 * @return {TypeName} 
		 */
		conver : function(array,stuff)
		{
			var newArray = new Array();
			if ($.isArray(array))
			{
				var allStr = "[";
				for (var i=0;i<array.length;i++)
				{
					if (!$.isPlainObject(array[i]))
					{
						continue;
					}
					var objStr = "{"
					$.each(array[i],function(key,value){
						objStr += "'"+stuff+"["+i+"]."+key+"' : '"+value+"',"
					});
					objStr = $.trimLastChar(objStr,",");
					objStr += "},";
					allStr += objStr;
				}
				allStr = $.trimLastChar(allStr,",");
				allStr += "]"
				return eval("("+allStr+")");
			}
			else
			{
				var objStr = "{"
				$.each(array[i],function(key,value){
					objStr += "'"+stuff+"["+i+"]."+key+"' : '"+value+"',"
				});
				objStr = $.trimLastChar(objStr,",");
				objStr += "}";
				return eval("("+allStr+")");
			}
		},
		
		/**
		 * 为对象前增加前缀
		 * @param {Object} object
		 * @param {Object} stuff
		 * @return {TypeName} 
		 */
		converToStuffObject : function(object,stuff)
		{
			if ($.isPlainObject(object))
			{
				var newobject = new Object();
				$.each(object,function(key,value){
					if(value == null)
					{
						value = '';
					}
					newobject[stuff+"."+key] = value;
					 
				});
				return newobject;
			}
			else
			{
				return object;
			}
		},
		
		maxWindow : function()
		{
			//窗口最大化
			window.moveTo(0,0) ;
			window.resizeTo(screen.availWidth,screen.availHeight); 
		},
		isBlank : function(value)
		{
			if (value == undefined)
			{
				return true;
			}
			else if (value == null)
			{
				return true
			}
			else if (value == "")
			{
				return true
			}
			else
			{
				return false;
			}
			
		} ,
		startWith : function(str, regStr)
		{
			var index = str.indexOf(regStr);
			if (index == 0)
			{
				return true;
			}
			return false;
		},
		validateform : function(formId)
		{
			return $("#" + formId).validationEngine('validate');
		},
		getParentWindowObject : function(type)
		{
			if ("iframe" == type)
			{
				return window.parent;
			}
			else
			{
				return window.opener;
			}
		},
		showLoading : function(width,height,left,top)
		{
			
			$("body").append("<div id=\"loading\" class=\"cps-loading\" style=\"display: none;z-index: 100\"></div>");
			
			$("#loading").css("width",width).css("height",height).css("left",left).css("top",top);
			$("#loading").append("<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" height=\"100%\">"+
					"<tr height=\"100%\" valign=\"middle\">" +
					"<td align=\"right\" width=\"50%\">" + 
					"</td>" + 
					"<td width=\"50%\"><div style=\"font-size:12px\"><font color=\"red\">" + 
					"<img src=\"" + contextPath + themePath + "/images/loading.gif\">" + 
					"正在处理中,请耐心等待....</font></div></td>" +
			"</table>");
			$("#loading").show();
		},
		hideLoading : function()
		{
			$("#loading").remove();
		},
		toUpperCase : function(str)
		{
			return "" + str.toUpperCase();
		},
		toLowerCase : function(str)
		{
			return "" + str.toLowerCase();
		},
		
		setFormValue : function(formId, obj)
		{
			$.each(obj,function(key,value){
				$("#" + key).val(value);
			});
		},
		
		getFormParams : function(formId)
		{
			return $("#" + formId).serialize();
		},
		
		substring : function(str,startIndex,endIndex)
		{
			var result = "";
			if (str.length <= startIndex)
			{
				result = "";
			}
			else if (str.length >= startIndex - 1 && str.length >= endIndex - 1)
			{
				result = str.substring(startIndex, endIndex);
			}
			else if (str.length > startIndex-1 && str.length < endIndex - 1)
			{
				result = str.substring(startIndex, str.length);
			}
			return result;
		},
		substr : function(str,startIndex,length)
		{
			 return str.substr(startIndex,length);
		},
		replaceStr : function(str,begin,end,newchar)
		{
			 var fstStr = str.substring(0,begin);
			 var scdStr =str.substring(begin,end);
			 var lstStr = str.substring(end,str.length);
			 return fstStr + newchar + lstStr;
		},
		ajaxFire : function(namespace,action,data,callback)
		{
			$.ajax({
				type : "post",
				url : contextPath + namespace + "/" + action + ".action",
				data : $.param(data),
				dataType : "json",
				success : function(result)
				{
					callback(result)
				},
				failure : function(result)
				{
					alert("请求失败.");
				},
				error : function(result)
				{
					alert("请求错误.");
				}
			});
		}
	});
})(jQuery);
