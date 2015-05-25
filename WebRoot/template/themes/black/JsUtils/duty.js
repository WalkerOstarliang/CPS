	//将值班信息生成html
	function addDutyInfo(resData){
		var tb = $("#qwgl_dutyTab");//表对象
		tb.html("");
		if(resData.length == 0){//没有数据
			$("#noDutyDiv").show();
		}else{
			$("#noDutyDiv").hide();
			for(var i = 0; i < resData.length; i ++){//有多个分组的排班信息
				var html = "";
				if(resData[i].length == 1){//只有一个时间段
					var du = resData[i][0];
					html += "<tr>";
					if(du.dutyTimeName == ''){
						html += "<th colspan='2' width='50%' nowrap='nowrap'>" + du.dutyGroupName + "</th>";
					}else{
						html += "<th width='30%' nowrap='nowrap'>" + du.dutyGroupName + "</th>";
						html += "<th width='20%'>" + du.dutyTimeName + "</th>";						
					}
	
					var nameArr = du.dutyUserNames.split(",");
					
					html += "<td width='50%'>";
					for(var j = 0; j < nameArr.length; j ++){
						html += nameArr[j] + "<br/>";
					}
					html += "</td>";
					html += "</tr>";
				}else{//有多个时间段
					for(var j = 0; j < resData[i].length; j ++){
						var du = resData[i][j];
						html += "<tr>";
						if(j == 0){
							html += "<th width='30%' nowrap='nowrap' rowspan='" + resData[i].length + "'>" + du.dutyGroupName + "</th>";
						}
						html += "<th width='20%'>" + du.dutyTimeName + "</th>";
	                    html += "<td width='50%'>";
	                    var nameArr = du.dutyUserNames.split(",");
	                    for(var x = 0; x < nameArr.length; x ++){
							html += nameArr[x] + "<br/>";
						}
						html += "</td>";
					}
				}
				tb.append(html);
			}
		}
		if(window.parent.loadMainFrameHeihgt){
			window.parent.loadMainFrameHeihgt();
		}
	}