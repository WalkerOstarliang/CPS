(function($){
	$.extend({
		/**
		 * {
		 * 	id : "",
		 *  title : "",
		 *  width : 1,
		 *  height : 2,
		 *  textId : ""
		 *  text : "",
		 *  show : true;
		 *  
		 * }
		 * @param {Object} params
		 */
		messagebox : function(param)
		{
			var params = $.extend({
				id : "messagebox",
				title : "消息提示",
				width : 200,
				height : 150,
				html : null,
				textId : null,
				show : true
			},param)
			var array = new Array();
			array.push("<div id='"+params.id+"' style='border:#b9c9ef 1px solid;z-index:100;display:none;background:#cfdef4; position: absolute; display: none; bottom: 0; right: 0; overflow: hidden;height: "+params.height+";width: "+params.width+"'>");
			array.push("   <div style='border:1px solid #fff;border-bottom:none;width:100%;height:25px;font-size:12px;overflow:hidden;color:#1f336b;'>");
			array.push("     <span style='float:right;padding:5px 0 5px 0;width:16px;line-height:auto;color:red;font-size:12px;font-weight:bold;text-align:center;cursor:pointer;overflow:hidden;' onclick=\"document.getElementById('"+params.id+"').style.display='none'\">×</span>");
			array.push("     <div style='padding:5px 0px 5px 5px;width:100%;line-height:18px;text-align:left;overflow:hidden;'><strong>"+params.title +"</strong></div>");
			array.push("     <div style='clear:both;'></div>");
			array.push("   </div>");
		    
			array.push("   <div style='padding-bottom:5px;border:1px solid #fff;border-top:none;width:100%;height:auto;font-size:12px;'>");
			array.push("      <div style='margin:0 5px 0 5px;border:#b9c9ef 1px solid;padding:10px 0 10px 5px;font-size:12px;width:"+ (params.width - 20) + "px;height:"+ (params.height - 30) +"px;color:#1f336b;text-align:left;overflow:hidden;'>");
			
			if (params.html && params.html != null)
			{
				array.push(params.html);
			}
			else if (params.textId && params.textId != null && params.textId != "")
			{
				array.push($("#" + params.textId).html());
			}
			array.push("    </div>");
			array.push("  </div>");
			array.push("</div>");
			
			$("body").append(array.join(""));
			if (params.show)
			{
				 $("#" + params.id).show("slow");
			}
		}
	});
})(jQuery);