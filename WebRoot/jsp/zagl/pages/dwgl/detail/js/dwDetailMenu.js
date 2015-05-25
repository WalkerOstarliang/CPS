function menuClick(url,obj,hylb){
	var jgbh = $("#jgbh",parent.document).val();
	
	var uri = contextPath + "/zagl/dw/" + url + ".action?dw.dwjbxx.jgbh=" + jgbh + "&dw.dwjbxx.hylb=" +hylb;
	if($(obj).attr("id") == "cyry"){
		uri += "&cyrycx.zxbs=0";
	}else if($(obj).attr("id") == "lscyry"){
		uri += "&cyrycx.zxbs=1";
	}else if($(obj).attr("id") == "abry"){
		uri += "&cyrycx.zxbs=0&cyrycx.sfabry=1";
	}
	
	$("#menu").find(".dialog_menu_selected").removeAttr("class");
	$(obj).attr("class","dialog_menu_selected");
	$("#dwDetai_main",parent.document).attr("src",uri);
	 
}

$(function(){
	 
 
	var hylbs = $("#hylb",parent.document).val();
	if(hylbs != "" && hylbs != null && hylbs != "null"){
		var hylb_array = hylbs.split(",");
		
		for(var i = 0 ; i < hylb_array.length ; i++){
			if(hylb_array[i] == '01'){
				$("#hllbinfo_01").show();
			}else if(hylb_array[i] == '02'){
				$("#hllbinfo_02").show();
			}else if(hylb_array[i] == '03'){
				$("#hllbinfo_03").show();
				
				$("#afxt").show();
				$("#abry").show();
				$("#bwjg").show();
				$("#tfsj").show();
				$("#badys").show();
				$("#zhsg").show();
				$("#aqyh").show();
			}else if(hylb_array[i] == '04'){
				$("#hllbinfo_04").show();
			}else if(hylb_array[i] == '05'){
				$("#hllbinfo_05").show();
			}else if(hylb_array[i] == '06'){
				$("#hllbinfo_06").show();
			}else if(hylb_array[i] == '09'){
				$("#hllbinfo_09").show();
			}
		}
		
		if(hylb_array[0] == '01'){
			$("#hllbinfo_01").addClass("dialog_menu_selected");
		}else if(hylb_array[0] == '02'){
			$("#hllbinfo_02").addClass("dialog_menu_selected");
		}else if(hylb_array[0] == '03'){
			$("#hllbinfo_03").addClass("dialog_menu_selected");
		}else if(hylb_array[0] == '04'){
			$("#hllbinfo_04").addClass("dialog_menu_selected");
		}else if(hylb_array[0] == '05'){
			$("#hllbinfo_05").addClass("dialog_menu_selected");
		}else if(hylb_array[0] == '06'){
			$("#hllbinfo_06").addClass("dialog_menu_selected");
		}else if(hylb_array[0] == '09'){
			$("#hllbinfo_09").addClass("dialog_menu_selected");
		}else{
			$("#cyry").trigger("click");
		
		}
	}else{
		$("#cyry").trigger("click");
	}
	 
});