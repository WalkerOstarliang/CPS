<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>说明</title>
		<style type="text/css">
			body {background-color: #E8F2FE;font-family: "宋体";font-size: 14px;}
			ol li{width: 100%;}
			li {list-style:none; line-height: 150%;}
			p {text-indent:24px;margin:0px 0px;}
		</style>
		<script type="text/javascript">
			function zipFieldDown(fjid,fileName)
			{
				window.location.href = "<c:url value='/download.action'/>?tableName=t_yjcj_xxfj&blobfield=upload&pkfield=fjid&pid=" + fjid +"&fileName=" + fileName;
			}
		</script>
	</head>
	<body>
	 	<div>科创支持电话：0731-84597427</div>
		<div>${xxfbBean.content}</div>
		<div>
			<span>附件列表：</span>
		</div>
		<div>
			<c:forEach items="${xxfbBean.fjBeans}" var="fjBean">
				<div style="margin-top: 10px"><a href="javascript:void(0)" onclick="zipFieldDown('${fjBean.fjid}','${fjBean.uploadfilename}')" target="_blank">${fjBean.uploadfilename}</a></div>
			</c:forEach>
		</div>
		<%--
		<div>
			<span style="text-align: center; width: 100%;">
				<h4>
					<strong><font color="red">重要通知</font></strong><br>
				</h4> 
			</span>
			<hr size="2">
			<ol>
				<li>
					<font style="color:red;">
						&nbsp;&nbsp;&nbsp;&nbsp;前段时间，省厅下发了《关于加强公安派出所建设工作情况的通报》，其中涉及社区警务信息系统相关派出所和警务区数据核对情况。现今再次统计，系统统计的各地数据与省厅掌握的总数仍有一定差距。因年底绩效评估在即，届时会以系统中有关数据做重要参考，也为了以后方便大家了解本地实际情况，特请大家重视、督导各地将数据填报准确。现阶段集中时间主要核对事项有三项：
					</font>
				</li>
				<li>
					1、请各地对照已有的派出所，在省厅警综平台机构人员维护系统（非本社区系统）中将实际上未运行的派出所全部删除（各地有不少为减少麻烦而将保牌未运行的派出所录入在内）。
				</li>
				<li>
					2、不少派出所未将本所全部民警维护进去，请各地如实在省厅警综平台机构人员维护系统（非本社区系统）中将派出所全部在职在岗人员、警务区、社区民警等信息补全，以便全面分析统计。
				</li>
				<li>
					3、请各地通知各派出所长（分管基础工作的副所长）或行政内勤在社区警务系统中派出所管理栏目内将本派出所相关情况维护到系统中，并请社区、驻村民警将本社区农村警务区的情况（弹出框内）维护到系统中，特别是协辅警、流动人口协管员、巡防队员等信息（在派出所管理栏目中辅助人员管理内或派出所信息、警务区信息内都可，三者共享）。
				</li>
				<li>
					4、以下是《人员机构系统》提供给的治安单位的管理员权限的用户，点击可以进行下载：
				</li>
				<li>
					<div>
						&nbsp;&nbsp;
						<a href="<c:url value='/download.action'/>?filePath=/down/sqjwglypxb1.xls&fileName=sqjwglypxb1.xls" target="_blank">社区警务信息系统班一期(打印).xls</a>
						&nbsp;
						<a href="<c:url value='/download.action'/>?filePath=/down/sqjwglypxb2.xls&fileName=sqjwglypxb2.xls" target="_blank">社区警务信息系统班二期(打印).xls</a>
						
					</div>
				</li>
			</ol>
		</div>
		<hr size="2">
		<div>
			<span style="text-align: center; width: 100%;">
				<h4>
					<strong>说明</strong><br>
				</h4> 
			</span>
			<hr size="2">
			<ol>
				<li>
					<strong style="color:red;">通知：请各派出所所长或派出所内勤在"派出所管理"模块内完善派出所信息和警务室信息的录入工作。</strong>
				</li>
				<li>1、只有社区民警才有数据采集权限。</li>
				<li>2、采集数据前必须去<a href="http://10.142.56.122:8888" target="_bank">省厅机构代码维护系统</a>中进行警员机构关系维护,建立缺失的警务区/室。</li>
				<li>3、维护好警员机构关系后，前往<span>地址管理 -> 行政社区管理</span>中维护行政机构与公安机构的对应关系。</li>
				<li>4、内容发布系统管理员账户文件下载<a href="<c:url value='/download.action'/>?filePath=/down/nrfbxtglywjxz.xls&fileName=nrfbxtglywjxz.xls" target="_blank">点击这里</a>。</li>
				<li style="text-align:right;"><strong>科创支持电话：0731-84597427</strong></li>
			</ol>
			
			<span style="text-align: left; width: 100%;margin-left:8%">
				<h4 style="line-height: 120%;">
					<strong>常见问题：</strong>
				</h4> 
			</span>
			<ol style="margin-left:10%;width: 100%;margin-top:0px;">
				<li>
					<strong>1、	地址管理->行政区划管理，列表中为空白，无法选择。</strong>
					<p>请联系管理员，并讲清楚分局与行政社区的关系，例如“长沙市高新区公安局行政区划对应长沙市岳麓区”。</p>
				</li>
				<li>
					<strong>2、	新增实体时无法选择对应的“社区/村”。</strong>
					<p>一、请确认在“行政社区管理”中正确的维护了警务区与行政社区的关系。</p>
					<p>二、维护好对应的关系好请点击系统右上方的退出按钮，重新登记系统即可。</p>
				</li>
				<li>
					<strong>3、	地图采集无法打开地图。</strong>
					<p>目前情况下地图不能满足采集要求，所以暂时不支持采集，请从地址管理->实体管理中进行实体采集。</p>
				</li>
				<li>
					<strong>4、	实体管理中没有新增实体、实增房屋等功能按钮。</strong>
					<p>实体采集必须是由社区民警进行，非社区民警帐号不能进行相关信息采集。（社区民警账号必须存在于警务区机构下）。</p>
				</li>
				<li>
					<strong>5、	实有人口新增时人员类别判断。</strong>
					<p>系统会自动进行人员类别判断处理，请注意“户籍地详址”与“户籍责任区”与房屋所属单位之前的关系。相同则为常口，否则为其他类型。</p>
				</li>
				<li>
					<strong>6、	加强完善派出所与警务区的信息。</strong>
					<p>
						<font color="red">在弹出的内容窗口中完善派出所以及警务区的相关信息，同时也可以到派出所管理->派出所管理中，选择派出所以及警务区节点，完善相关信息。</font>
					</p>
				</li>
				
			</ol>
		</div>
		--%>
	</body>
</html>
