<%@page contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Frameset//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>社区警务</title>
<%@include file="/template/include.inc" %>
<script type="text/javascript" src="/CPS/jsp/common/js/common.js"></script>

<script type="text/javascript">
	function opendwryselecttree()
	{
		openDwRySelect({
			rootOrgCode : "430000000000",
			mutilSelect : false
		},
		function(userbeans)
		{
			if (userbeans)
			{
				$("#username").val(userbeans.realname)
			}
			
		});
	}
	
	function opendwselecttree()
	{
		openDwSelect({
			rootOrgCode : "430000000000",
      		mutilSelect : false,
       		nodeSelectedType : "ps",
       		nodeNotSelectedType : "ps"
		},function(orgbeans){
			alert(orgbeans.name)
		})
	}
	
	function openXzqhSelectTree()
	{
		openXzqhTree({
			rootOrgCode : "430700",
      		mutilSelect : false,
       		nodeSelectedType : "ps",
       		nodeNotSelectedType : "ps"
		},function(xzqhBean){
			alert(xzqhBean.name)
			alert(xzqhBean[0].id)
		})
	}
</script>
</head>

<body>
</body> 
	<cps:doubleSelect id="a1" zdlb="HN_XZQH" displayfield="jc" parentdm="430000" doubleSelectId="a2"  headerKey="" headerValue="--市级区划--" cssStyle="width:20%"></cps:doubleSelect>
	<cps:doubleSelect id="a2" zdlb="HN_XZQH" displayfield="jc" dependSelectId="a1" doubleSelectId="a3" headerKey="" headerValue="--县级区划--" cssStyle="width:20%"></cps:doubleSelect>
	<cps:doubleSelect id="a3" zdlb="HN_XZQH" displayfield="jc" dependSelectId="a2" doubleSelectId="a4" headerKey="" headerValue="--乡镇街道--" cssStyle="width:20%"></cps:doubleSelect>
	<cps:doubleSelect id="a4" zdlb="HN_XZQH" displayfield="jc" dependSelectId="a3" headerKey="" headerValue="--社区/农村--" cssStyle="width:30%"></cps:doubleSelect>
	

 	姓名:<input type="text" id="username"><cps:button id="aa" value="选择" onclick="opendwryselecttree()"></cps:button>
 	<br/>
 	单位名称:<input type="text" id="orgname"><cps:button value="选择" onclick="opendwselecttree()"></cps:button>
 	<br/>
 	行政区划:<input type="text" id="orgname"><cps:button value="选择" onclick="openXzqhSelectTree()"></cps:button>
</html>
