<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view>
	<creator:Style href="../../jcrop/css/jquery.Jcrop.css"></creator:Style>
	<creator:Script src="../../jcrop/js/jquery.Jcrop.min.js"></creator:Script>
	
	<creator:panel title="图片剪裁" id="sss">
		<form id="pic_form">
			<input type="file" name="pic_file" onchange="showImg(this.value)"/>
			<input type="hidden" name="x" id="x" />
			<input type="hidden" name="y" id="y" />
			<input type="hidden" name="w" id="w" />
			<input type="hidden" name="h" id="h" />
			 
			<div id="pic_div" style="display:none">
				<img src="" id="pic" />
			</div>
		</form>
	</creator:panel>
</creator:view>

<script type="text/javascript">
	$.ready(function(){
		$("#pic").Jcrop({
			onChange:getSize
		});
	});
	
	function getSize(c){
		$("#x").val(c.x);
		$("#y").val(c.y);
		$("#w").val(c.w);
		$("#h").val(c.h);
	}
	
	function showImg(value){
		$("#pic").attr("src",value);
		$("#pic_div").show();
	}
	
</script>