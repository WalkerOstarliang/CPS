<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view>
	<creator:panel id="dzhelp" title="地址帮助" >
		<b>1、	什么是地址?</b><br>
		答：地址即对一个明确的目的地的描述，即能根据这个对目的地的描述找到我想到达的位置。<br>
		<b>2、	地址与实体的区别?</b><br>
		答：实体表示一个建筑物，地址比建筑物表示得更细更准确，例如某某小区1栋是一个实体，但地址可以精确到1栋的某一个房间，例如某某小区1栋1单元205室。在本系统中地址建立在实体之上。<br>
		<b>3、	怎么样添加一个标准地址?</b><br>
		答：
		A、	添加地址时系统要会要求您选择一个实体，在选中实体后点击新增地址，出现如下图所示页面。<br>
		<img src="../help/images/fwxx.jpg" width="800" height="560" />
		<br>
		B、	在上方的填充框中填充对应的单元号、楼层号、房间号、附属地址。点击“保存”按钮即可。弹出框中的地图仅用来做参考。
	</creator:panel>
</creator:view>
