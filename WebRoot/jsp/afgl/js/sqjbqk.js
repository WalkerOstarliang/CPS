function doubleJswAndSqxx(pcsdm)
{
	doubleSelectJWS(pcsdm,"jwsselect")
}

function loadSqjbqkxxByCity()
{
	var url = contextPath + "/afgl/sqgl/loadSqjbqkxxByCity.action";
	var data = {
		citydm : $("#citydm").val()
	}
	$.post(url,data, function(jbqkBean){
		$.each(jbqkBean,function(key,value){
			$("#" + key).html(value);
		});
	});
}

function loadSqjbqkxxByXqdm()
{
	var url = contextPath + "/afgl/sqgl/loadSqjbqkxxByCity.action";
	var data = {
		xqdm : $("#countrydmselect").val()
	}
	$.post(url,data, function(jbqkBean){
		$.each(jbqkBean,function(key,value){
			$("#" + key).html(value);
		});
	});
}

function loadSqjbqkxxByPcsdm()
{
	var url = contextPath + "/afgl/sqgl/loadSqjbqkxxByPcsdm.action";
	var data = {
		pcsdm : $("#pcsdmselect").val()
	}
	$.post(url,data, function(jbqkBean){
		$.each(jbqkBean,function(key,value){
			$("#" + key).html(value);
		});
	});
}

function loadSqJbqkxxByJwsdm()
{
	var url = contextPath + "/afgl/sqgl/loadSqJbqkByJwsdm.action";
	var data = {
		jwsdm :  $("#jwsselect").val()
	};
	$.post(url,data, function(jbqkBean){
		$.each(jbqkBean,function(key,value){
			$("#" + key).html(value);
		});
	});
}

function loadXQkms()
{
	$.ajax({
		type : "post",
		url : contextPath + "",
		dataType : "json",
		success : function(sqjbqkBean)
		{
			if (sqjbqkBean != null)
			{
				$.each(sqjbqkBean,function(key,value){
					$("#" + key).val(value);
				});
			}
		}
		
	})
}

function queryXqqk(){
	$("#xqQueryForm").ajaxSubmit({
		type : "post",
		url : contextPath + "/afgl/sqjbgl/queryXqqk.action",
		dataType : "json",
		beforeSend : function(xhr){
			var data =["czrk","ldrk","jzrk","jwrk","zdrk","ztry","xdry","jsbr","tzhy",
						"ggcs","ylcs","qsydw","wxwp","zddws","xx","yey","lg","wb","fw",
						"czw","sq","zbh","sqgb","xld"];
			$.each(data,function(index,key){
				$("#" + key).html("<img src=\"" + contextPath + "/template/cps/images/someloading.gif\"/>");
			});			
		},
		success : function(xqBean){
			$.each(xqBean,function(key,value){
				$("#" + key).html(value);
			});
		}
	});
}

$(function(){
	queryXqqk();
})