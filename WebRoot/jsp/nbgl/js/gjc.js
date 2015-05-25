/**
 * 打开关键词编辑层
 */
var gjcEditPanel ; 
function openGjcEditPanel(){
    gjcEditPanel = $.layer({
        type: 1,
        title: '关键词编辑',
        area: ['400px', 'auto'],
        shift:'top',
        page:{dom:"#gjcEdit"}
     });
}

/**
 * 关闭关键词编辑层
 */
function closeGjcEdit(){
    if(gjcEditPanel){
        layer.close(gjcEditPanel);
    }
}

/**
 * 新增关键词
 */
function addGjc(){
    $("#gjcid").val("");
    $("#gjc").val("");
    $("#gjc_old").val("");
    openGjcEditPanel();
}


/**
 * 保存关键词
 */
function saveGjc(){
    if ($.validateform("editForm")) {
         $.ajax({
	        url:contextPath + "/nbgl/gjc/checkGjcIsExists.action",
	        data:{"query.gjc":$("#gjc").val()},
	        type:"post",
	        dataType:"json",
	        success:function(result){
	            eval("var s = " + result);
	            if(s){
	                alert("新增的关键字已经存在");
	            }else{
                   $("#editForm").ajaxSubmit({
		                type:"post",
		                dataType : "json",
		                url : contextPath + "/nbgl/gjc/saveGjc.action?t="+new Date().getTime(),
		                success : function(result) 
		                {
		                    if(result){
		                        alert("保存成功.");
		                        closeGjcEdit();
		                        queryGjc();
		                    }else{
		                        alert("保存失败.");
		                    }
		                }
		            });
                }
	        },
	        error:function(){
	            alert("请求错误.");
	        }
        });
   }
}


/**
 * 查询关键词列表
 */
function queryGjc(){
  $("#gjclist").query("F","seachForm");  
}

/**
 * 显示操作列
 */
function showOp(rowObj,data){
    var html = "<span class=\'cps_span_href\' onclick=\"editGjc('" + data.id + "','" + data.gjc + "')\" style=\"color:green\">修改</span>&nbsp;";
    html += "<span class=\'cps_span_href\' onclick=\"deleteGjc('" + data.id + "')\" style=\"color:green\">删除</span>";
    return html;
}

/**
 * 重置查询条件
 */
function resetForm(){
    $("#seachForm").reset();
    $("#query_gjc").focus();
}

/**
 * 修改关键词
 */
function editGjc(id,gjc){
    $("#gjcid").val(id);
    $("#gjc").val(gjc);
    $("#gjc_old").val(gjc);
    
    openGjcEditPanel();
}

/**
 * 删除关键词
 */
function deleteGjc(id){
    if(confirm("确认删除？")){
	    $.ajax({
	        url:contextPath + "/nbgl/gjc/deleteGjc.action",
	        data:{"query.id":id},
	        type:"post",
	        dataType:"json",
	        success:function(result){
	            eval("var s = " + result);
	            if(result){
	                alert("操作成功.");
                    queryGjc();
	            }else{
	                alert("操作失败.");
	            }
	        },
	        error:function(){
	            alert("请求错误.");
	        }
	    });
    }
}