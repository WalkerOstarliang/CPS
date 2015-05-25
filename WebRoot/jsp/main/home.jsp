<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<creator:view>
	<script type="text/javascript">
		function clickImage()
		{
			window.open("showbigimage.jsp","win");
		}
	</script>
	<creator:box>
		<div style="text-align: center;">
			<h1>社区警务主要数据逻辑关系示意图</h1>
		</div>
		<div style="width: 100%;height: 98%;border-bottom: 1px solid #CEE8FF;" >
			<div style="float: left;width: 40%;height: 100%;border-right: 1px solid #CEE8FF; ">
				<img id="myimage" src="111.jpg" alt="" width="100%" height="100%" onclick="clickImage()"/>
			</div>
			<div style="width: 58%;height: 100%;float: right;border-left: 0px solid #CEE8FF;padding-left: 5px;">
				<h1 style="color: red">社区警务几大核心要素：</h1><br>
					a)、地址库：基于行政区划与PGIS建立标准地址库。<br>
					b)、实有房屋：基于地址信息建立基于实有房屋信息。<br>
					c)、实有人口：基于房屋上建立实有人口信息。<br>
					d)、实有单位：基于房屋建立实有单位信息。<br>
				
				<h1  style="color: red">社区警务数据处理流程：</h1><br>
					a)、登录湖南省警务综合平台->机构人员信息维护子系统。完成社区警务区机构建立，并完成警务区与民警对应关系建立。<br>
					b)、建立社区警务区和行政区划的社区对应关系。<br>
					c)、基于行政社区建立标准地址库。<br>
					d)、基于标准地址库进行实有房屋采集。<br>
					e)、基于实有房屋进行实有人口和实有单位的采集。<br>
				&nbsp;&nbsp;&nbsp;&nbsp;i.  基于实有人口进行各类人员的登记、补充、完善。<br>
				&nbsp;&nbsp;&nbsp;&nbsp;ii. 基于实有单位进行各类单位信息的登记、补充、完善。<br>
			</div>
		</div>
	</creator:box>
	
</creator:view>
