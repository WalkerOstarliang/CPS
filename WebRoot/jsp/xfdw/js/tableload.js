

function ajaxTableInfo(tableId, rowcallback){
	var tableObj = $('#' + tableId);
	var fromId = tableObj.attr('searchform');
	
	var data = $('#' + fromId).serialize();
	
	var url = tableObj.attr('url');
	var type = $('#' + fromId).attr('method')
	if(!type){
		type = "post";
	}
	loading($('#' + tableId).find('tbody'));
	report.ajaxLoadTable(url, data, tableId, rowcallback)
}

function loading(_ei){
	_ei.empty();
	_ei.append('<tr><td colspan="20" style="text-align: center;"><img src="' + contextPath + '/template/default/images/loading.gif"></td></tr>')	
	
}

function loadDiving(_ei) {
	_ei.empty();
	_ei.append('<img src="' + contextPath + '/template/default/images/loading.gif">');
}

function clearLoad(_ei){
	_ei.empty();
}

function fillTableCallback(tableId, data){
	
	var _table = $('#' + tableId);
	var html = "";
	
	//没有结果时.
	if(data == null || data.length <=0){
		clearLoad($('#' + tableId).find('tbody'));
		return;
	}
	
	var thead = _table.find('thead');
	
	_table.find('tbody').empty();
	$.each(data, function(i, v){
		var font = '';
		if(i == 0){
			font = "style='color:red;font-weight:bold;'"
		}
		var code = $('#code').val();
		if(code == '430100000000'){
			if((v['dwbm'] != '' || v['dwbm'] != null) && (v['code'] == '' || v['code'] == null) && v['dwbm'] != undefined){
		
			}else{
				var _td = "";
				$.each(thead.find('TH'), function(h, f){
					var field = $(f).attr('field');
					var alignCss = 'text-align:center;';
					if(field != null && field != ''){
						if($(f).css('text-align')){
							alignCss = 'text-align:' + $(f).css('text-align') + ';';
						}
						_td += "<td style='" + alignCss + "'>" + v[field] + "</td>";
					}
				});
				_table.find('tbody').append("<tr " + font + ">" + _td + "</tr>");
			}
		}else{
			var _td = "";
			$.each(thead.find('TH'), function(h, f){
				var field = $(f).attr('field');
				var alignCss = 'text-align:center;';
				if(field != null && field != ''){
					if($(f).css('text-align')){
						alignCss = 'text-align:' + $(f).css('text-align') + ';';
					}
					_td += "<td style='" + alignCss + "'>" + v[field] + "</td>";
				}
			});
			_table.find('tbody').append("<tr " + font + ">" + _td + "</tr>");
		}
	});
	report.toggleRowColor(tableId);
}


var report = {
	ajaxLoadTable: function(url, data, tableId, rowcallback){
		
		$.ajax({
			url 	: url,
			data	: data,
			type	: 'POST',
			dataType: "json",
			success	: function(datas){
				$('#' + tableId).find('tbody').first().empty();
				if(rowcallback == null || rowcallback == ''){
					rowcallback = 'report.fillTableInfo';
				}
				var functionName = rowcallback + "('" + tableId + "', datas)";
				eval(functionName);
			}
		});
	},
	fillTableInfo: function(tableId, datas){
		if(datas != null && datas.length > 0){
			$.each(datas, function(i, v){
				//alert('ok' + v['dwmc'])
				var tdObj = $('#' + tableId).find('tfoot').first().find('td');
				var trHTML = "<tr >";
				var font = '';
				if(v['dwmc'] == '合计'){
					font = "style='color:red;font-weight:bold;'"
				}
				$.each(tdObj, function(k, f){
					var field = $(f).attr('id');
					var align = $(f).attr('align');
					var report = $(f).attr('report');
					var _numberFormat = $(f).attr('numberFormat');
					var t = (new Date()).getTime();
					
					var icon = $(f).attr('icon');
					
					if(v[field] == '合计'){
						font = "style='color:red;font-weight:bold;'"
					}
					
					var _v = '';
					
					_v = v[field];
					/*
					//应市局要求，把分隔符去掉
					if(_numberFormat == 'false'){
						_v = v[field];
					}else{
						if(field && field.indexOf(',') != -1){
							var fields = field.split(',');
							_v += numberFormat(v[fields[0]],3,',') + '<br />';
							_v += "<font style='color:#0066FF'>(" + numberFormat(v[fields[1]],3,',') + ")</font>";
						}else if(field && field != ''){
							 _v = numberFormat(v[field],3,',');
						}
					}
					*/
					var _vv = _v;
					
					var maxLength = $(f).attr('maxLength');
					if(maxLength != undefined && Number(maxLength) >= 0){
						_v = _v.substring(0, Number(maxLength)) + '...';
					}
					
					if(icon == true || icon == 'true'){
						if(_v > 0){
							_v = "<span style='color:red;'>" + _v + "%</span><img src='" + contextPath + "/jsp/report/images/up.jpg' />";
						}else if(_v < 0){
							_v = "<span style='color:#3099d0;'>" + _v + "%</span><img src='" + contextPath + "/jsp/report/images/down.jpg' />";
						}else{
							_v = _v + "%";
						}
					}
					
					var bfb = $(f).attr('bfb');
					if(bfb == true || bfb == 'true'){
						_v = _v + "%"
					}
					
					if(align != null && align != ''){
						align = "style='text-align:" + align + "'";
					}
					
					var callback = $(f).attr('callback');
					
					if((callback != null && callback != '') || (field == 'dwmc' && v[field]!='合计' &&  $(f).attr('drill') != 'false')){
						var leve = getOrgLevel(v['dwbm'])
						if(Number(leve) <= 3 || callback != 'drillInfo'){
							if(field == 'dwmc'){
								callback = 'drillInfo';
							}
							var functionName =  callback + "(v)";
							eval("_v = " + functionName)
						}
					}
					
					var isNumber = $(f).attr('isNumber');
					if(isNumber == 'true'){
						_v = (i+1);
					}
					trHTML += "<td name='" + report+ "_" + field + "_" + t + "' " + align + " title='" + $('<div>' + _vv + '</div>').text() + "'><font "+font+">" + _v + "</font></td>";
				});
				
				trHTML += "</tr>";
				$('#' + tableId).append(trHTML);
			});
			//report.toggleRowColor(tableId);
			report.disColumn(tableId);
			report.fixedThead(tableId);
			report.displayTfoot(tableId);
			report.lockTable(tableId);
			//orderBy.initOrderBy(tableId);
		}
	},
	disColumn:	function(tableId){
		//控制表头显示模板
		var queryCount = 0;
		//没有条件筛选控制则不执行以下计算
		$.each($('#queryColumnDiv').find('input[type=checkbox]:checked'), function(){
			queryCount ++;
		});
		
		if(queryCount == 0){
			return;
		}
		
		//清空表头所有隐藏样式
		$('#' + tableId).find('tbody').first().find('td').css('display','');
		$('#' + tableId).find('thead').first().find('tr').last().find('TH').css('display','');
		
		//控制数据及最后一样表头
		$.each($('#queryColumnDiv').find('input[type=checkbox]'), function(i, v){
			if($(v).attr('checked') != true && $(v).attr('checked') != "checked"){
				var report = $(v).attr('name');
				$('#' + tableId).find('tbody').first().find('td[name^=' + report + ']').css('display','none');
				$('#' + tableId).find('thead').first().find('tr').last().find('TH[name^=' + report + ']').css('display','none');
			}
		});
		
		//获取表头总行数
		var theadCols = 0;
		$.each($('#' + tableId).find('thead').first().find('tr'), function(i, v){
			theadCols = i ;
		});
		
		for(var i = (theadCols-1); i >= 0; i--){
			$.each($($('#' + tableId).find('thead').first().find('tr')[i]).find('TH'), function(p, u){
				var colCount = 0;
				
				$.each($($('#' + tableId).find('thead').first().find('tr')[i+1]).find('TH'), function(j, k){
					if($(k).attr('pid') == $(u).attr('id') && $(k).attr('pid') != undefined){
						
						if($(k).attr('childrenCol') != undefined && $(k).attr('childrenCol') != null){
							
							colCount = Number(colCount) + Number($(k).attr('childrenCol')); 
							
						}else{
							$.each($('#queryColumnDiv').find('input[type=checkbox]:checked'), function(){
								if($(k).attr('name') == $(this).attr('name')){
									colCount++;
								}
							});
							
							if($(k).attr('name') == null || $(k).attr('name') == '' || $(k).attr('name') == undefined){
								colCount++;
							}
						}
					}
				})
				
				if($(u).attr('id') == null  || $(u).attr('id') == ''){
					colCount ++ ;
				}
				
				//跨行跨列表头控制
				if($(u).attr('isRowCol') == 'true'){
					$.each($($('#' + tableId).find('thead').first().find('tr')[i+Number($(u).attr('rowspan'))]).find('TH'), function(j, k){
						if($(k).attr('pid') == $(u).attr('id')){
							$.each($('#queryColumnDiv').find('input[type=checkbox]:checked'), function(){
								if($(k).attr('name') == $(this).attr('name')){
									colCount++;
								}
							});
							
							if($(k).attr('name') == null || $(k).attr('name') == '' || $(k).attr('name') == undefined){
								colCount++;
							}
						}
					});
				}
				
				if($(u).attr('childrenCol') != undefined && $(u).attr('childrenCol') != null){
					$(u).attr('childrenCol',colCount);
				}
				
				if(colCount != 0){
					$(u).attr('colspan',colCount);
					$(u).css('display','');
				}else{
					$(u).css('display','none');
				}
			})
		}
	},
	toggleRowColor:	function(tableId){
		$('tbody td').unbind('click').unbind('hover');
		$('#' + tableId).find('tbody').first().colorize();
	},
	exportData:	function(tableId){
	
		if(tableId == null || tableId == ''){
			alert('参数不正确...!');
			return;
		}
		
		var title = report.getTitleJSON(tableId);
		var shuoming = report.getShuomingJSON(tableId);
		
		var tbody = report.getTbodyJSON(tableId);
		var thead = report.getTheadJSON(tableId);
		var tfoot = report.getTfootJSON(tableId);
		var tbodyObj = $.parseJSON("{" + tbody + "}");
		
		if(tbodyObj.tbody == null || tbodyObj.tbody == ''){
			alert('没有相关数据导出!!');
			return ;
		}
		
		var reportDates = '{' + title + ','+shuoming+',"table":{' + thead + ',' + tfoot + ',' + tbody + '}}'
		$('#exportData').val(reportDates);
		// alert(reportDates);
		$('#exportform').submit();
	},
	/*
	getTbodyJSON:	function(tableId){
		var tbodyHtml = "";
		$.each($('#' + tableId).find('tbody').first().find('tr'),function(i, v){
			var trHtml = "";
			$.each($(v).find('td'), function(k, j){
				if($(j).css('display') != 'none'){
					$.each($('#' + tableId).find('tfoot').first().find('tr').first().find('td'), function(n, m){
						if(k === n){
							//.replace(/(^\s*)|(\s*$)/g, "")   空格过滤正则
							trHtml += "\"" + $(m).attr('id') + "\":\"" + $(j).text() + "\",";
						}
					});
				}
			});
			trHtml = trHtml.substring(0,trHtml.length-1);
			tbodyHtml +="{"+trHtml+"},";
		});
		tbodyHtml = tbodyHtml.substring(0,tbodyHtml.length-1);
		tbodyHtml = "\"tbody\":["+tbodyHtml+"]";
		return tbodyHtml;
	},
	*/
	getTbodyJSON:	function(tableId){
		var theadJson = "";
		$.each($('#' + tableId).find('tbody').first().find('tr'),function(i, v){
			var thJson = "";
			$.each($(v).find('td'), function(j, k){
				if($(k).css('display') != 'none'){
					var colspan = $(k).attr('colspan');
					var rowspan = $(k).attr('rowspan');
					
					if(colspan == undefined){
						colspan = 1;
					}
					
					if(rowspan == undefined){
						rowspan = 1;
					}
					
					thJson += '{"colspan":"' + colspan + '",';
					thJson += '"rowspan":"' + rowspan + '",' ;
					thJson += '"text":"' + $.trim($(k).text()) + '"},';
				}
			});
			thJson = thJson.substring(0,thJson.length-1);
			theadJson +='{"tr":[' + thJson + ']},';
		});
		theadJson = theadJson.substring(0,theadJson.length-1);
		theadJson = "\"tbody\":[" + theadJson + "]";
		return theadJson;
	},
	getTheadJSON:	function(tableId){
		var theadJson = "";
		$.each($('#' + tableId).find('thead').first().find('tr'),function(i, v){
			var thJson = "";
			$.each($(v).find('th'), function(j, k){
				if($(k).css('display') != 'none'){
					var colspan = $(k).attr('colspan');
					var rowspan = $(k).attr('rowspan');
					
					if(colspan == undefined){
						colspan = 1;
					}
					
					if(rowspan == undefined){
						rowspan = 1;
					}
					
					thJson += '{"colspan":"' + colspan + '",';
					thJson += '"rowspan":"' + rowspan + '",' ;
					thJson += '"text":"' + $(k).text() + '"},';
				}
			});
			thJson = thJson.substring(0,thJson.length-1);
			theadJson +='{"tr":[' + thJson + ']},';
		});
		theadJson = theadJson.substring(0,theadJson.length-1);
		theadJson = "\"thead\":[" + theadJson + "]";
		return theadJson;
	},
	getTfootJSON:	function(tableId){
		var tfootJson = "";
		$.each($('#' + tableId).find('tfoot').first().find('td'),function(i, v){
			$.each($('#' + tableId).find('tbody').first().find("tr").first().find('td'),function(j, k){
				if($(k).css('display') != 'none' && j === i){
					tfootJson += '{"indexOf":"' + j + '","id":"' + $(v).attr('id') + '"},';
				}
			});
		});
		tfootJson = tfootJson.substring(0,tfootJson.length-1);
		return '"tfoot":[' + tfootJson + ']';
	},
	getTitleJSON:	function(tableId){
		//var title = $('#titleSpan').text();
		var title = $('#titleText').val();
		return '"title":"' + title + '"';
	},
	getShuomingJSON:	function(tableId){
		//var shuoming = $('#shuomingSpan').text();
		var shuoming = $('#kssj').val()+'--'+$('#jssj').val();
		return '"shuoming":"' + shuoming + '"';
	},
	fixedThead:	function(tableId){
		
				
	},
	displayTfoot:	function(tableId){
		 $('#' + tableId).find('tfoot').css('display','none');
	},
	lockTable:	function(tableId){
		/*
		var lockId = $('#' + tableId).parent().attr('id');
		var locktb=new Kkctf.table.lockTableSingle({
            tMain:$('#' + lockId),             //table的层
            padWidth:0,                        //单元格左右的padding的值总和数值
            borWidth:0,                      //表格左右边框宽度总和值
            subtHeig:60,                      //表格高度减去多少
            autoHeight:true                   //表格窗口是否随着窗口的高度改变自动调整高度(可选)
        });
		*/
	}
}

function getOrgLevel(code){
	var leve;
	
	if (code==null || code == ''){
		
		leve = 0;
	}
	else if (code.substring(2, 4)=="00")
	{
		leve = 1;
	}
	// 市级
	else if (code.substring(4, 6) == "00")
	{
		leve = 2;
	}
	// 县级
	else if (code.substring(6, 8) == "00")
	{
		leve = 3;
	}
	//派出所
	else if (code.substring(8, 10) == "00")
	{
		leve = 4;
	}
	//其他警务室/区
	else
	{
		leve = 5;
	}
	
	return leve;
}

function numberFormat(value, step, splitor){
	
	var reg = /^-?[1-9][0-9]*$/g;
	if(reg.test(value)){
		
		var str = value.toString();
		var len = str.length;
		
		if(len > step){
			var _11 = len%step;
			var _12 = parseInt(len/step);
			var arr = [];
			var first = str.substr(0,_11);
			if(first != ''){
				arr.push(first);
			}
			for(var i=0;i<_12; i++){
				arr.push(str.substr(_11 + i*step,step));
			}
			value = arr.join(splitor);
		}
	}
	return value;
}

function  exportAllExcel(){
	if($('#exportform').attr('name') == undefined){
		$('#queryDiv').append('<form id="exportform" name="exportform" method="post" action="' + contextPath + '/export/export.action"></form>');
		$('#exportform').append('<input type="hidden" id="exportData" name="exportData" value="" />');
		var path = $('#searchform').find('input[type=hidden][name=path]').first().val();
		$('#exportform').append('<input type="hidden" name="path" value="' + path + '" />');
	}
	
	var tableId = 'resultTable';
	if(tableId == null || tableId == ''){
			alert('参数不正确...!');
			return;
		}
		
	var title = report.getTitleJSON(tableId);
	
	var tbodyHtml = "";
	
	$.each($('#' + tableId).find('tbody').find('tr'), function(){
		var trHtml = "";
		if($(this).attr('class') == 'tablegrid_tbody'){
			$.each($(this).find('td'),function(i,v){
				//trHtml += "\"" + i + "\":\"" + $(this).text() + "\",";
				var colspan = $(this).attr('colspan');
				var rowspan = $(this).attr('rowspan');
				
				if(colspan == undefined){
					colspan = 1;
				}
				
				if(rowspan == undefined){
					rowspan = 1;
				}
				
				trHtml += '{"colspan":"' + colspan + '",';
				trHtml += '"rowspan":"' + rowspan + '",' ;
				trHtml += '"text":"' + $(this).text() + '"},';
			});
			trHtml = trHtml.substring(0,trHtml.length-1);
			tbodyHtml +="{\"tr\":["+trHtml+"]},";
		}
	});
	tbodyHtml = tbodyHtml.substring(0,tbodyHtml.length-1);
	
	
	tbodyHtml = "\"tbody\":["+tbodyHtml+"]";
	
	var shuoming = report.getShuomingJSON(tableId);
	
	var tfootJson = "";
	var theadJson = "";
	$.each($('#thead_' + tableId).find('th'),function(i, v){
		
		var colspan = $(i).attr('colspan');
		var rowspan = $(i).attr('rowspan');
		
		if(colspan == undefined){
			colspan = 1;
		}
		if(rowspan == undefined){
			rowspan = 1;
		}
		theadJson += '{"colspan":"' + colspan + '",';
		theadJson += '"rowspan":"' + rowspan + '",' ;
		theadJson += '"text":"' + $(this).text() + '"},';
		
		tfootJson += '{"indexOf":"' + i + '","id":"' + i + '"},';
	});
	theadJson = theadJson.substring(0,theadJson.length-1);
	theadJson ='{"tr":[' + theadJson + ']}';
	theadJson = "\"thead\":[" + theadJson + "]";
	
	tfootJson = tfootJson.substring(0,tfootJson.length-1);
	tfootJson = '"tfoot":[' + tfootJson + ']';
	
	var tbodyObj = $.parseJSON("{" + tbodyHtml + "}");
	
	if(tbodyObj.tbody == null || tbodyObj.tbody == ''){
		alert('没有相关数据导出!!');
		return ;
	}
	
	var reportDates = '{' + title + ','+shuoming+',"table":{' + theadJson + ',' + tfootJson + ',' + tbodyHtml + '}}'
	$('#exportData').val(reportDates);
	
	$('#exportform').submit();
}



