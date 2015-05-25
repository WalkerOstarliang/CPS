<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view>
	<creator:panel id="dzhelp" title="实体帮助" >
		<b>1、	什么是实体?</b><br>
		答：简单的说实体即一个实体建筑物，例如说，某某小区的某一栋楼为一个实体；<br>
		<b>2、	为什么要添加实体?</b><br>
		答：添加一个实体，主要用于地图上标记一个建筑物，方便在后期应用中能快速的定位某一个地点，例如说指挥中心在接到报警后能迅速的在地图上找到我们采集的实体，而进行派警处理。<br>
		<b>3、	怎么添加一个标准的实体?</b><br>
		答：
		A、	如下图所示，尽可能的填充相关信息，特别请注意填充“实体名称”等标红色星号的填充框，楼栋详址只需要写是第几栋即可，例如说 “1栋” 而不需要写成“阳光花园1栋”，系统会自动拼接地址全称。<br>
		<img src="../help/images/stxx.jpg" width="800" height="560" />
		<br>
		B、	在完成相关信息填充后，请注意点击地图标注，然后在地图上选择一个粉色的建筑物图标。标实完后请点击“保存实体地理位置”，再点右上角的“保存”按钮完成实体新增。
	</creator:panel>
</creator:view>
