<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view title="图片上传">
	<creator:panel id="pic_panel" title="图片上传">
		<table broder="0" cellpadding="0" cellspacing="0">
			<tr>
				<td>
					<form id="pic_form">
						<input type="file" name="pic.pic" />
						<button onclick="sc()">上传</button>
					</form>
				</td>
			</tr>
			<tr>
				<td>
					<img src="" id="pic_img" />
				</td>
			</tr>
			<tr>
				<td>
					<from id="picInfo_form">
						<input type="hidden" name="picInfo.x" id="x" />
						<input type="hidden" name="picInfo.y" id="y" />
						<input type="hidden" name="picInfo.width" id="width" />
						<input type="hidden" name="picInfo.height" id="height" />
						<input type="hidden" name="picInfo.pic_id" id="pic_id" />
						<button onclick="jc()">剪裁</button>
					</form>
				</td>
			</tr>
		</table>
		
		<script type="text/javascript">
			function sc(){
				$.ajax({
					url:contextPath + "",
				});
			}
			
			function jc(){
			
			}
		</script>
	</creator:panel>	
</creator:view>