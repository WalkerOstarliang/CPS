/**
 * <table id="xx"></table>
		  * colModel : [
 * {title: '编号', field : 'id',isCheckbox:true, width : 20, sortable : true, align: 'center',display:true}, 
 * {title: '姓名, field : 'name', width : 180, sortable : true, align: 'left',expand : true}, 
 * {title: '生日', field : 'bathday', width : 60, sortable : true, align: 'left'},
 * {title: '年龄, field : 'age', width : 60, sortable : true, align: 'left'}
 * {title: '操作',html:'<a href >操作</a>'},
 * {title: '操作',html: function(obj){sss}}
 * ]
 * {
 * currentPage : 1,
 * pageSize : 10,
 * totalCount : 200,
 * totalPage : 1,
 * datas:[
 * 	{id : '1',name:'xmc',age : '26'},
 * 	{id : '1',name:'xmc',age : '26'},
 * ]
 * }
 */
(function($){
	
	/**
	 * 全局变量 opts  ： {
	 *    tbarHTML ： "",
	 *    globTablePanel : null,
	 *    selectedArray : new Array()
	 * }
	 * all_page_data : 全部的page数据
	 * @param {Object} opt
	 * @memberOf {TypeName} 
	 * @return {TypeName} 
	 */
	
	$.fn.extend({
		tableGrid : function(opt)
		{
			// 只能化panel的宽度
			var documentWidth = $(document).width() - 25;
			if (opt.width && opt.width.indexOf("%") > 0)
			{
				opt.panelWidth = opt.width;
			}
			else
			{
				if (parseInt(opt.width) > documentWidth)
				{
					opt.panelWidth = documentWidth;
				}
				else if (parseInt(opt.width) < documentWidth)
				{
					opt.panelWidth = parseInt(opt.width) + 2;
				}
			}
			if (opt.searchform && opt.searchform != null && opt.searchform != "")
			{
				opt.params = $("#" + opt.searchform).serialize();
			}
			var op = $.extend({
				id : "",
				title : null,					// 列表标题
				width: "100%",					// 宽
				height:null,
				panelWidth:"100%",				// panel 的宽
				url : "",						// 数据加载url
				contenturl : "",				// 内容url
				contentTemplateId : "", 		// 内容模板 于 contenturl 只选其中一个
				dataType : "json",      		// 数据类型，目前只支持json
				usepager : true,        		// 是否分页显示
				autothead : false,				// 自动表头
				defaultBgColor : "#F0F0F0",
				currentPage : 1,        		// 当前页
				totalCount : 0,         		// 返回总记录数据
				totalPage : 1,          		// 总页数
				showTotalSpan:true,			//是否选手分页总数
				mutilSelect : true,     		// 是否多选默认多选，false 则单选
				pageSize : 10,          		// 每页显示多少记录
				pageSizeModel : [5,10,15,20,25,30,40,50,60,70,80,90,100],  //没有显示的页数选择的下拉框 
				queryAfter : null,				// 每次查询完做什么事
				autoload : true,			 	// 是否自动加载
				searchform : null,       		// 查询条件的formid
				params : null,					// 
				colModel : null,			 	// 列模式
				click:null,					 	// 行单击事件
				tbarId : null,					// 工具菜单
				initAfter : null,			 	// 表格初始化后要做的事
				dblclick : null,				// 行双击事件
				modal : false,					// 是否模态对话框中
				isAsynch : true,				// 是否异步请求
				datas : null					// 数据集
			},opt);
			opts = op;
			
			return this.each(function(){
				var $this = $(this);
				var tablePanel = null;
				
				$("#" + opts.id).data("opts",opts);
				// 如果设置了表头则需要生成panel
				if (opts.title != null || opts.tbarId != null)
				{
					tablePanel = new TablePanel(opts);
					tablePanel.show();
				}
				var table = new Table(opts);
				table.showThead();
				// 把对象保存起来
				$("#" + opts.id).data("table",table);
				if (opts.usepager)
				{
					var pagination = new Pagination(opts);
					pagination.show();
					$("#" + opts.id).data("pagination",pagination);
				}
				// 如果不是自动加载，提供默认数据
				if (!opts.isAsynch)
				{
					table.setOpts(opts);
					table.showTbody();
				}
				// 异步加载
				else
				{
					if (opts.url != null && opts.url != "")
					{
						// 如果自动加载
						if (opts.autoload)
						{
							queryGrid(opts);
						}
					}
					else
					{
						alert("异步请求url不能为空");
					}
				}
				
				
				
			});
		},
		/**
		 * 
		 * @param {Object} type 传递的数据类型 F ： 表单ID, O：javascript Object, P : url 参数 格式 username=xmc&password=123456 
		 * @param {Object} t 参数对象。 如果type 是"F" 该值为表单ID，如果为 O 表示 java对象。 P：url 参数
		 * @param {Object} callback 当查询完毕后的回调函数
		 * @memberOf {TypeName} 
		 */
		query : function(type,t,callback)
		{
			var params = null;
			if ($.toUpperCase(type) == "F")
			{
				params = $("#" + t).serialize();
			}
			else if ($.toUpperCase(type) == "O")
			{
				params = $.param(t);
			}
			else if ($.toUpperCase(type) == "P")
			{
				params = t;
			}
			var newopts = $.extend($("#" + $(this).attr("id")).data("opts"),{
				params : params,
				currentPage : 1,
				callback : callback
			});
			queryGrid(newopts);
		},
		getDataSize : function()
		{
			var size = $(this).data("currentCount");
			return size;
		},
		getTotalSize : function()
		{
			var opts = $("#" + $(this).attr("id")).data("opts");
			return opts.totalCount;
		},
		getTableGridRowCount : function()
		{
			var id = $(this).attr("id");
			return $("#table_" + id).find("tr[class=tablegrid_tbody]").length;
		},
		getSelected : function()
		{
			var selectedRows = new Array();
			var tablegridid = $(this).attr("id");
			$(this).find(".tbody_checkbox").each(function(){
				var rowdata = $("#" + tablegridid + "_tr_" + $(this).val()).data(tablegridid +"_tr_" + $(this).val() + "_rowdata");
				if ($(this).attr("checked"))
				{
					selectedRows.push(rowdata);
				}
			});
			return selectedRows;
		},
		setTableGridHeight : function(height)
		{
			$(this).height(height);
		},
		setFirstPageInex : function()
		{
			var opts = $("#" + $(this).attr("id")).data("opts");
			var newopts = $.extend($("#" + $(this).attr("id")).data("opts"),{
				currentPage : 1
			});
			$("#" + $(this).attr("id")).data("opts",newopts);
		}
	});
	

	var TablePanel = function(opts)
	{
		this.opts = opts;
	}

	$.extend(TablePanel.prototype,{
		
		show : function()
		{
			var opts = this.opts;
			
			// 生成panel
			$("#" + opts.id).wrap("<div id=\"panel_" + opts.id + "\" class=\"cps-panel\"></div>");
			
			$("#" + opts.id).before("<div class=\"cps-panel-title\"></div>");
				
			if (opts.title != null)
			{
				$("#panel_" + opts.id).find("div[class=cps-panel-title]").eq(0).append("<div style=\"float: left;\">&nbsp;" + opts.title + "</div>");
			}
			if (opts.tbarId != null)
			{
				$("#panel_" + opts.id).find("div[class=cps-panel-title]").eq(0).append("<div style=\"float: right;padding-right: 3px;\">" + $("#" + opts.tbarId).html() + "</div>");
				$("#" + opts.tbarId).remove();
			}
			if ($.type(opts.panelWidth) == "string")
			{
				$("#panel_" + opts.id).css("width", opts.panelWidth);
			}
			else if ($.type(opts.panelWidth) == "number")
			{
				// 设置panel的宽度
				$("#panel_" + opts.id).css("width", parseInt(opts.panelWidth) + 2);
			}
		}
	});
	
	var Table = function(opts)
	{
		this.opts = opts;
	}
	
	$.extend(Table.prototype,{
		setOpts : function(opts)
		{
			$.extend(this.opts,opts);
		},
		show : function()
		{
			 this.showThead();
			 this.showTbody();
		},
		showThead : function()
		{
			var opts = this.opts;
			//设置属性
			$("#" + opts.id).addClass("cps-panel-content")
								 .css("width",opts.panelWidth);
								
			// 追加表格
			$("#" + this.opts.id).append("<table id=\"table_" + opts.id + "\" width=\"" + opts.width +"\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" class=\"cps-tablegrid\"></table>");
			
			$("#table_" + opts.id).append("<tr id=\"thead_"+opts.id + "\"></tr>");
			
			if (opts.colModel != null && opts.colModel.length > 0)
			{
				// 生成表头
				$.each(opts.colModel,function(i,col){
					
					// 是复选框
					if (col["isCheckbox"] && col["isCheckbox"] == true)
					{
						// 多选
						if (opts.mutilSelect == true)
						{
							$("#thead_" + opts.id).append("<th width=\"30\" align=\"center\" class=\"isCheckbox\"><input id=\"thead_chk_" + opts.id +"\" type=\"checkbox\"/></th>");
							// 绑定全选/反选事件
							$("#thead_chk_" + opts.id).bind("click",function(){
								var checked = $(this).get(0).checked;
								if (checked)
								{
									$("#table_" + opts.id).find("input[type='checkbox']").attr("checked","true");
								}
								else
								{
									$("#table_" + opts.id).find("input[type='checkbox']").removeAttr("checked");
								}
							});
						}
						// 单选
						else
						{
							$("#thead_" + opts.id).append("<th width=\"30\" align=\"center\" class=\"isNumber\">选择</th>");
						}
					}
					// 序号
					else if (col["isNumber"] && col["isNumber"] == true)
					{
						$("#thead_" + opts.id).append("<th width=\"30\" align=\"center\">" + col["title"] + "</th>")
					}
					// 生成其他表头
					else
					{
						
						$("#thead_" + opts.id).append("<th>" + (col["title"] ? col["title"] : "") + "</th>");
						if (col["display"] != undefined && col["display"] == false)
						{
							$("#thead_" + opts.id).find("th").last().hide();
						}
						if (col["width"])
						{
							$("#thead_" + opts.id).find("th").last().attr("width", col["width"]);
							
						}
						$("#thead_" + opts.id).find("th").last().attr("id", col["field"] + "_" + opts.id + "_head");
						
					}
				});
				
				// 动态字段事件处理
				if (this.opts.autothead == true)
				{
					$("#" + opts.id).after("<div id=\"autothead_" + opts.id + "\" style=\"position: absolute;\" class=\"cps-tablegrid-autohead\"></div>");
					$("#autothead_" + this.opts.id).append("<table id=\"autothead_table" + opts.id + "\" width=\"300\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\"></table>");
					$("#autothead_table" + opts.id).append("<tr></tr>");
					$("#autothead_table" + opts.id).find("tr").last().append("<th width=\"25\" align=\"center\">序号</th>")
					$("#autothead_table" + opts.id).find("tr").last().append("<th width=\"25\" align=\"center\">选择</th>");
					$("#autothead_table" + opts.id).find("tr").last().append("<th>列名</th>");
					
					// 生成动态表头选项
					$.each(opts.colModel,function(i,col){
						if (!col["isCheckbox"] && !col["isNumber"])
						{
							$("#autothead_table" + opts.id).append("<tr></tr>");
							$("#autothead_table" + opts.id).find("tr").last().append("<td>" + (i + 1) + "</td>");
							$("#autothead_table" + opts.id).find("tr").last().append("<td><input type=\"checkbox\" value=\"" + col["field"] + "\">");
							$("#autothead_table" + opts.id).find("tr").last().append("<td>" + col["title"] + "</td>");
							if (col["display"] == undefined || col["display"] == true)
							{
								
								$("#autothead_table" + opts.id).find("tr").last().find("input[type='checkbox']").attr("checked","true");
							}
							else 
							{
								$("#autothead_table" + opts.id).find("tr").last().find("input[type='checkbox']").removeAttr("checked");
							}
							// 动态字段复选框事件
							//alert($("#autothead_table" + opts.id).find("tr").last().find("input[type='checkbox']").val())
							$("#autothead_table" + opts.id).find("tr").last().find("input[type='checkbox']").bind("click",function(){
								
									var field = $(this).val();
									if (!$(this).get(0).checked)
									{
										$("#" + opts.id).find("th[id^='" + field + "_']").hide();
										$("#" + opts.id).find("td[id^='" + field + "_']").hide();
									}
									else
									{
										$("#" + opts.id).find("th[id^='" + field + "_']").show();
										$("#" + opts.id).find("td[id^='" + field + "_']").show();
									}
									
							});
							
						}
					});
					$("#autothead_table" + opts.id).append("<tr></tr>");
					$("#autothead_table" + opts.id).find("tr").last().append("<td colspan=\"3\"></td>");
					$("#autothead_table" + opts.id).find("tr").last().find("td").last().append("<button id=\"btn_" + opts.id+"\">关闭</button>")
				
					$("#btn_" + opts.id).bind("click",function(){
						$("#autothead_" + opts.id).hide();
					});
					
					// 绑定选择动态列事件
					$("#autothead_" + opts.id).find("input[type='checkbox']").bind("click",function(){
						var value = $(this).val();
						var checked = $(this).attr("checked");
						if (value = null || value == "")
						{
							if (checked == "checked")
							{
								$.each(opts.colModel,function(i, col){
									$("#table_" + opts.id).find("td[id^=" + col["field"] + "_" + this.opts.id + "]").show();
								});
							}
							else
							{
								$.each(opts.colModel,function(i, col){
									$("#table_" + opts.id).find("td[id^=" + col["field"] + "_" + this.opts.id + "]").hide();
								});
							}
							
						}
						else
						{
							if (checked == "checked")
							{
								$("#table_" + opts.id).find("td[id^=" + value + "_" + opts.id + "]").show();
							}
							else
							{
								$("#table_" + opts.id).find("td[id^=" + value + "_" + opts.id + "]").hide();
							}
							
						}
					});
					
					// 绑定点击选择选择动态字段事件
					$("#table_" + opts.id).find("th").bind("click",function(event){
						if ($(this).attr("class") != "isCheckbox")
						{
							var docoffset = {
								left : event.pageX,
								top : event.pageY
							}
							var documentwidth = $(document).width();
							var hidewidth = $("#autothead_" + opts.id).width();
							var offset = {left : docoffset.left, top : docoffset.top};
							if (docoffset.left + hidewidth > documentwidth)
							{
								offset.left = docoffset.left - hidewidth;
							}
							$("#autothead_" + opts.id).css("left",offset.left).css("top",offset.top).show();
						}
						else
						{
							$("#autothead_" + opts.id).hide();
						}
					});
					
				}
			}
		},
	 
		showTbody : function()
		{
			var opts = this.opts;
			$("#table_" + opts.id).find(".tablegrid_tbody").remove();
			$("#table_" + opts.id).find("tr[id$=_content]").remove();
			var datas = opts.datas;
			// 循环数据
			if (datas != null)
			{
				$.each(datas,function(i,data){
					$("#table_" + opts.id).append("<tr id=\"" + opts.id +"_tr_" + i + "\" class=\"tablegrid_tbody\"></tr>");
					
					//绑定行单击事件
					$("#" + opts.id +"_tr_" + i).bind("click", function(event,type){
						$(".tablegrid_tbody:odd").css("backgroundColor",opts.defaultBgColor);
						$(".tablegrid_tbody:even").css("backgroundColor","#FFFFFF");
						$(this).css("backgroundColor","#FFF0B2");
						$("#" + opts.id).data("selectedindex",i);
						$(this).find("input[type=checkbox]").first().attr("checkbox","checkbox");
						if (opts.mutilSelect == false)
						{
							var checkboxobj = $(this).find("td input[type='checkbox']");
							if (checkboxobj != undefined && checkboxobj != null && checkboxobj.length > 0)
							{
								var checked = checkboxobj.get(0).checked;
								if (checked == true || checked == "true")
								{
									$(this).find("td input[type='checkbox']").first().removeAttr("checked");
								}
								else
								{
									$(".tbody_checkbox").removeAttr("checked");
									$(this).find("input[type=checkbox]").attr("checked","checked");
								}
							}
						}
						else
						{
							var checkboxobj = $(this).find("td input[type='checkbox']");
							if (checkboxobj != undefined && checkboxobj != null && checkboxobj.length > 0)
							{
								var checked = checkboxobj.get(0).checked;
								if (checked == false || checked == "false")
								{
									$(this).find("input[type=checkbox]").attr("checked","checked");
								}
								else
								{
									$(this).find("td input[type='checkbox']").first().removeAttr("checked");
								}
							}
						}
						if (opts.click != undefined && $.isFunction(opts.click))
						{
							opts.click($(this),data,event);
						}
					});		
				
					//绑定行双击事件
					if (opts.dblclick != undefined && $.isFunction(opts.dblclick))
					{
						$("#" + opts.id +"_tr_" + i).bind("dblclick", function(event){
							opts.dblclick($(this),data,event);
						});	
					}
					
					$("#" + opts.id + "_tr_" + i).data(opts.id + "_tr_" + i + "_rowdata",data);
					// 绑定行移动事件
					$("#" + opts.id +"_tr_" + i).bind("mouseover",function(){
						var color = $(this).css("backgroundColor");
						$("#" + opts.id).data("trbackgroundColor",color);
						$(this).css("backgroundColor","#FFF0B2");
					});
					
					$("#" + opts.id +"_tr_" + i).bind("mouseout",function(){
						var color =$("#" + opts.id).data("trbackgroundColor")
						var index = $("#" + opts.id).data("selectedindex");
						if (i == index)
						{
							$(this).css("backgroundColor","#FFF0B2");
						}
						else
						{
							$(this).css("backgroundColor",color);
						}
						
					});
					$("#" + opts.id +"_tr_" + i).after("<tr id=\"" + opts.id +"_tr_" + i + "_content\" style=\"display:none\"><td colspan=\"" +opts.colModel.length +"\" align=\"left\" style=\"margin: 0px;padding: 0px\"><div style=\"width:100%\"></div></td></tr>");
					// 循环表头字段
					$.each(opts.colModel,function(k,col){
						if (col["isCheckbox"] && col["isCheckbox"] == true)
						{
							$("#" + opts.id +"_tr_" + i).append("<td>" + "<input type=\"checkbox\" value=\"" + i +"\" class=\"tbody_checkbox\"></td>");
							
							$("#" + opts.id +"_tr_" + i).find("td input[type='checkbox']").last().bind("click",function(){
								$("#" + opts.id +"_tr_" + i).trigger("click",["checkboxclick"]);
							});
						}
						else if (col["isNumber"] && col["isNumber"] == true)
						{
							$("#" + opts.id +"_tr_" + i).append("<td>" + (i + 1) +"</td>");
						}
						else
						{
							if (col["rowcallback"] && $.isFunction(col["rowcallback"]))
							{
								$("#" + opts.id +"_tr_" + i).append("<td></td>");
								// 执行行回调参数
								var tdobj = $("#" + opts.id +"_tr_" + i).find("td").last();
								var callhtml = col["rowcallback"](tdobj,data); 
								tdobj.html("&nbsp;" + callhtml);
							}
							else
							{
								var text = (data[col["field"]] != null)&&(data[col["field"]] != "") ? data[col["field"]] : "&nbsp;";
								// 如果设置了最大长度限制
								if (col["maxlength"])
								{
									
									if (data[col["field"]] && (data[col["field"]].length > parseInt(col["maxlength"])))
									{
										$("#" + opts.id +"_tr_" + i).append("<td>&nbsp;" + data[col["field"]].substr(0,parseInt(col["maxlength"])) + ".." + "</td>");
									}
									else
									{
										$("#" + opts.id +"_tr_" + i).append("<td>&nbsp;" +  text + "</td>");
									}
								}
								else
								{
									$("#" + opts.id +"_tr_" + i).append("<td>&nbsp;" + text + "</td>");
								}
							}
							if (col["align"])
							{
								$("#" + opts.id +"_tr_" + i).find("td").last().attr("align",col["align"]);
							}
							if (col["display"] != undefined && col["display"] == false)
							{
								$("#" + opts.id +"_tr_" + i).find("td").last().hide();
							}
							if (!(data[col["field"]] != null 
									&& data[col["field"]] != undefined 
									&& data[col["field"]].indexOf("<") >= 0 
									&& data[col["field"]].indexOf("</") >0 
									&& data[col["field"]].indexOf(">") > 0))
							{
								$("#" + opts.id +"_tr_" + i).find("td").last().attr("title", data[col["field"]]);
							}
							$("#" + opts.id +"_tr_" + i).find("td").last().attr("id", col["field"] + "_" + opts.id + "_" + i + "" + k);
							if (opts.autothead)
							{
								var checked = $("#autothead_" + opts.id).find("input[value=" + col["field"] + "]:first").get(0).checked;
								if (!checked)
								{
									$("#" + opts.id +"_tr_" + i).find("td").last().hide();
								}
							}
							
							//默认展开
							if (col["expand"]==undefined || col["expand"] == true)
							{
								// 内容加载
								if (opts.contenturl)
								{
									$("#" + opts.id +"_tr_" + i).find("td").last().bind("click",function(){
										$("#table_" + opts.id).find("tr[id$=_content]").hide();
										var display = $("#" + opts.id).data(opts.id +"_tr_" + i + "_display");
										if (!display || display == false)
										{
											$("#" + opts.id).data(opts.id +"_tr_" + i + "_display", true)
											var trobj = $(this).parent();
											//替换参数
											var url = opts.contenturl;
											$.each(opts.colModel,function(i,col){
												url = url.replace("{" + col["field"] + "}",data[col["field"]]);
											});
											$.ajax({
												type : "post",
												url: url,
												//data : $.param(trobj.data("rowdata")),
												success : function(result)
												{
													$("#" + opts.id +"_tr_" + i +  "_content").find("td").first().find("div").first().html(result);
													$("#" + opts.id +"_tr_" + i +  "_content").show();
													$("#" + opts.id).css("height", $("#table_" + opts.id).height() + 20);
													$("#" + opts.id).data(opts.id +"_tr_" + i + "_display",true);
												}
											});
										}
										else
										{
											$("#" + opts.id +"_tr_" + i +  "_content").hide();
											$("#" + opts.id).css("height", $("#table_" + opts.id).height() + 20)
											$("#" + opts.id).data(opts.id +"_tr_" + i + "_display",false);
										}
									});
								}
								// 模板加载
								else if (opts.contentTemplateId)
								{
									$("#" + opts.id +"_tr_" + i).find("td").last().bind("click",function(){
										$("#table_" + opts.id).find("tr[id$=_content]").hide();
										var display = $("#" + opts.id).data(opts.id +"_tr_" + i + "_display");
										if (!display || display == false)
										{
											
											 var temphtml = $("#" + opts.contentTemplateId).html();
											 $.each(opts.colModel,function(h,column){
												 var reg = new RegExp("\{" + column["field"] + "\}","g");
												 temphtml = temphtml.replace(reg, data[column["field"]]);
											 });
											 $("#" + opts.id +"_tr_" + i +  "_content").find("td").first().find("div").first().html(temphtml);
											 $("#" + opts.id +"_tr_" + i +  "_content").show();
											 $("#" + opts.id).css("height", $("#table_" + opts.id).height() + 20)
											 $("#" + opts.id).data(opts.id +"_tr_" + i + "_display",true);
										}
										else
										{
											$("#" + opts.id +"_tr_" + i +  "_content").hide();
											$("#" + opts.id).css("height", $("#table_" + opts.id).height() + 20)
											$("#" + opts.id).data(opts.id +"_tr_" + i + "_display",false);
										}
									});
								}
							}
							
						}
					});
				});
			}
			 
			$(".tablegrid_tbody:odd").css("backgroundColor",opts.defaultBgColor);
			//固定高度
			if (opts.height && $.type(opts.height) == "string" )
			{
				if (opts.height.indexOf("%") > 0)
				{
					var doccumentheight = $(document).height();
					var newheight = doccumentheight * (parseFloat(opts.height) * 0.01);
					$("#" + opts.id).css("height",newheight);
				}
				else
				{
					$("#" + opts.id).css("height",opts.height);
				}
				
			}
			else
			{
				$("#" + opts.id).css("height", $("#table_" + opts.id).height() + 20)
			}
			$("#table_" + opts.id).width("99%");
		}
	});
	
	
	var Pagination = function(opts) {
		this.opts = opts;
	}
	
	$.extend(Pagination.prototype, {
		getInterval:function(){
			var ne_half = Math.ceil(this.opts.pageNumShown/2);
			var np = this.numPages();
			var upper_limit = np - this.opts.pageNumShown;
			var start = this.getCurrentPage() > ne_half ? Math.max( Math.min(this.getCurrentPage() - ne_half, upper_limit), 0 ) : 0;
			var end = this.getCurrentPage() > ne_half ? Math.min(this.getCurrentPage()+ne_half, np) : Math.min(this.opts.pageNumShown, np);
			return {start:start+1, end:end+1};
		},
		getCurrentPage:function(){
			var currentPage = parseInt(this.opts.currentPage);
			if (isNaN(currentPage)) return 1;
			return currentPage;
		},
		hasPrev:function(){
			if (this.opts.currentPage == 1)
			{
				return false;
			}
			else
			{
				return true;
			}
		},
		hasNext:function(){
			if (!this.opts.showTotalSpan)
			{
				return true;
			}
			else
			{
				if (this.opts.totalPage == this.opts.currentPage)
				{
					return false;
				}
				else if (this.opts.totalPage > this.opts.currentPage)
				{
					return true;
				}
			}
		},
		isFirst : function(){
			if (!this.opts.showTotalSpan)
			{
				return true;
			}
			else
			{
				if (this.opts.currentPage == 1)
				{
					return true;
				}
				else
				{
					return false;
				}
			}
		},
		isLast : function()
		{
			if (!this.opts.showTotalSpan)
			{
				return true;
			}
			else
			{
				if (this.opts.totalPage == this.opts.currentPage)
				{
					return true;
				}
				else
				{
					return false;
				}
			}
		},
		
		bindEvent : function()
		{
			var opts = this.opts;
			$("#pagination_"+opts.id).find(".active_first").click(function(){
				queryGrid($.extend(opts,{
					currentPage : 1
				}));
			}).hover(function(){
				$(this).css("backgroundColor","#DEF0FF")
			},function(){
				$(this).css("backgroundColor","");
			});
			
			$("#pagination_"+opts.id).find(".active_prev").click(function(){
				
				queryGrid($.extend(opts,{
					currentPage : opts.currentPage - 1
				}))
			}).hover(function(){
				$(this).css("backgroundColor","#DEF0FF")
			},function(){
				$(this).css("backgroundColor","");
			});
			
			$("#pagination_"+opts.id).find(".active_next").click(function(){
				
				queryGrid($.extend(opts,{
					currentPage : opts.currentPage +1
				}));
			}).hover(function(){
				$(this).css("backgroundColor","#DEF0FF")
			},function(){
				$(this).css("backgroundColor","");
			});
			
			$("#pagination_"+opts.id).find(".active_last").click(function(){
				queryGrid($.extend(opts,{
					currentPage : opts.totalPage
				}));
			}).hover(function(){
				$(this).css("backgroundColor","#DEF0FF")
			},function(){
				$(this).css("backgroundColor","");
			});
			
			$("#"+opts.id+"_select_pagesize").change(function(){
				$("#" + opts.id).clearSelected();
				queryGrid($.extend(opts,{
					pageSize : $(this).val(),
					currentPage : 1
				}));
			});
			$("#clearselectd_" + opts.id).click(function(){
				$("#" + opts.id).clearSelected();
			});
			
			$("#"+opts.id+"_go_page").blur(function(){
				var currentPage = $(this).val()>opts.totalPage ? opts.totalPage :$(this).val();
				var reg =  /^[\-\+]?\d+$/;
				if (!reg.test($(this).val()))
				{
					alert("非法数字.");
					return false;
				}
				else if ($(this).val()=="0")
				{
					currentPage = 1;
				}
				queryGrid($.extend(opts,{
					currentPage : currentPage
				}));
			});
		},
		
		show : function()
		{
			
			var opts = this.opts;
			$("#pagination_" + opts.id).remove();
			// 生成pagination
			$("#" + opts.id).after("<div id=\"pagination_"+opts.id+"\" class=\"cps-pagination\">");
			
			// 设置pagination 的宽的
			$("#pagination_" + opts.id).css("width",opts.panelWidth);
			
			// 生成pagination 的table
			$("#pagination_" + opts.id).append("<table id=\"pagination_table_" + opts.id + "\" width=\"100%\" height=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\"></table>");
			
			// 追加行
			$("#pagination_table_" + opts.id).append("<tr><td style=\"border-right:0px\"></td><td align=\"right\" style=\"border-left:0px\"></td></tr>");
			
			//追加分页模式 
			$("#pagination_table_" + opts.id).find("td").first().append("<select id=\"pagemodel_select_" + opts.id + "\"></select>");
			$.each(opts.pageSizeModel,function(i){
				if (opts.pageSize == opts.pageSizeModel[i])
				{
					$("#pagemodel_select_" + opts.id).append("<option value=\"" + opts.pageSizeModel[i] + "\" selected=\"selected\">" + opts.pageSizeModel[i] + "</option>");
				}
				else
				{
					$("#pagemodel_select_" + opts.id).append("<option value=\"" + opts.pageSizeModel[i] + "\">" + opts.pageSizeModel[i] + "</option>");
				}
				
			});
			// 选择分页数查询
			$("#pagemodel_select_" + opts.id).bind("change", function(){
				var pageSize = $(this).find("option:selected").val();
				queryGrid($.extend($("#" + opts.id).data("opts"),{
					pageSize : pageSize
				}));
			});
			
			// 追加分页操作上一页 下一页等
			
			$("#pagination_table_" + opts.id).find("td").last().append("<div id=\"pageinfo_" + opts.id+"\"></div>");
			if (opts.showTotalSpan)
			{
				$("#pageinfo_" + opts.id).append("共<font color=\"red\">" + opts.totalCount + "</font>条记录&nbsp;");
				$("#pageinfo_" + opts.id).append("第<font color=\"red\">" + opts.currentPage +"</font>页&nbsp;");
				$("#pageinfo_" + opts.id).append("共<font color=\"red\">" + opts.totalPage + "</font>页&nbsp;");
			}
			
			if (this.isFirst())
			{
				$("#pageinfo_" + opts.id).append("<span class=\"disabled\">首页</span>&nbsp;&nbsp;");
			}
			else
			{
				$("#pageinfo_" + opts.id).append("<span class=\"active_first\">首页</span>&nbsp;&nbsp;");
			}
			
			// 绑定首页点击事件
			$("#pageinfo_" + opts.id).find(".active_first").first().bind("click",function(){
				queryGrid($.extend($("#" + opts.id).data("opts"),{
					currentPage : 1
				}));
			});
			
			if (this.hasPrev())
			{
				$("#pageinfo_" + opts.id).append("<span class=\"active_prev\">上一页</span>&nbsp;&nbsp;")
			}
			else
			{
				$("#pageinfo_" + opts.id).append("<span class=\"disabled\">上一页</span>&nbsp;&nbsp;");
			}
			
			// 绑定上一页事件
			$("#pageinfo_" + opts.id).find(".active_prev").first().bind("click",function(){
				queryGrid($.extend($("#" + opts.id).data("opts"),{
					currentPage : opts.currentPage - 1
				}));
			});
			
			
			if (this.hasNext())
			{
				$("#pageinfo_" + opts.id).append("<span class=\"active_next\">下一页</span>&nbsp;&nbsp;");
			}
			else
			{
				$("#pageinfo_" + opts.id).append("<span class=\"disabled\">下一页</span>&nbsp;&nbsp;")
			}
			//绑定下一页事件
			$("#pageinfo_" + opts.id).find(".active_next").first().bind("click",function(){
				queryGrid($.extend($("#" + opts.id).data("opts"),{
					currentPage : opts.currentPage + 1
				}));
			});
			
			if (this.isLast())
			{
				$("#pageinfo_" + opts.id).append("<span class=\"disabled\">末页</span>&nbsp;&nbsp;");
			}
			else
			{
				$("#pageinfo_" + opts.id).append("<span class=\"active_last\">末页</span>&nbsp;&nbsp;");
			}
			//绑定 末页 点击事件
			$("#pageinfo_" + opts.id).find(".active_last").first().bind("click",function(){
				queryGrid($.extend($("#" + opts.id).data("opts"),{
					currentPage : opts.totalPage
				}));
			});
			
			$("#pageinfo_" + opts.id).append("跳转到<input id=\"gopage_" + opts.id + "\" type=\"text\" size=\"3\" style=\"height: 13px\"/>页&nbsp;&nbsp;");
			$("#gopage_" + opts.id).val(opts.currentPage);
			
			$("#gopage_" + opts.id).bind("keyup",function(){
				$(this).val($(this).val().replace(/[^0-9]/g,''));
			});
			
			// 绑定页面调整点击事件
			$("#gopage_" + opts.id).bind("blur",function(){
				 
				var currentPage = $(this).val()> opts.totalPage ? opts.totalPage :$(this).val();
				queryGrid($.extend($("#" + opts.id).data("opts"),{
					currentPage : currentPage
				}));
			});
		}
	});
	
	function queryGrid(opts)
	{
		var width = $("#" + opts.id).width();
		var height = $("#" + opts.id).height();
		var scollPostion = $.scollPostion();
		var left = $("#table_" + opts.id).offset() ? $("#table_" + opts.id).offset().left : "0";
		var top = $("#" + opts.id).offset() ? $("#" + opts.id).offset().top : "0";
		//$.showLoading(width,height,left,top);
		var url = opts.url;
		if (opts.url.indexOf("?") > 0)
		{
			url += "&currentPage="+opts.currentPage+"&pageSize=" + opts.pageSize;
		}
		else
		{
			url += "?currentPage="+opts.currentPage+"&pageSize=" + opts.pageSize;
		}
		$.ajax({
			type : "post",
			dataType : "json",
			url : url,
			data : $.isPlainObject(opts.params) ? $.param(opts.params) : opts.params,
			timeout : 120 * 1000,
			success : function(pageResultInfo)
			{
				if (!$.isBlank(pageResultInfo) && pageResultInfo != "null")
				{
					var table = $("#" + opts.id).data("table");
					if (table && table != null)
					{
						
						var newOpts = $.extend(opts,{
							currentPage : pageResultInfo.currentPage,
							totalPage : pageResultInfo.totalPage,
							totalCount : pageResultInfo.totalCount,
							datas : pageResultInfo.datas != null ? pageResultInfo.datas : []
						})
						table.setOpts(newOpts);
						table.showTbody();
						$("#" + opts.id).data("opts",newOpts);
					}
					else
					{
						var newOpts = $.extend(opts,{
							currentPage : pageResultInfo.currentPage,
							totalPage : pageResultInfo.totalPage,
							totalCount : pageResultInfo.totalCount,
							datas : pageResultInfo.datas
						});
						table = new Table(newOpts);
						$("#" + opts.id).data("table",table);
						$("#" + opts.id).data("opts",newOpts);
					}
					
					var pagination = $("#" + opts.id).data("pagination");
					if (pagination && pagination != null)
					{
						pagination.show();
						$("#" + opts.id).data("pagination",pagination);
					}
					if (pageResultInfo.datas != null)
					{
						$("#" + opts.id).data("currentCount", pageResultInfo.datas.length);
					}
					else
					{
						$("#" + opts.id).data("currentCount", 0);
					}
					if (opts.callback && $.isFunction(opts.callback))
					{
						opts.callback(pageResultInfo);
					}
					//$.hideLoading();
				}
			}
		});
	}
})(jQuery);
