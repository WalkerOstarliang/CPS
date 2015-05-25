<%@tag pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@attribute name="id" required="true" rtexprvalue="true"%>
<%@attribute name="width" required="false" rtexprvalue="true"%>
<%@attribute name="height" required="false" rtexprvalue="true"%>
<div id="${id}" class="imageswitch" height="${height }" width="${width }">
	<div class="imagebig" style="display: none;position: absolute;border: 0px #CCCCCC;border-style: outset;">
		<img alt="大图片" src=""/>
	</div>
	<div class="spec-list">
		<div>
			<jsp:doBody></jsp:doBody>
		</div>
	</div>
	<div>
		<span class="spec-left cps_span_href">上一张</span>
		<span class="spec-right cps_span_href">下一张</span>
	</div>
</div>
