<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<table width="3479" border="0" cellpadding="0" cellspacing="0" style='width:2609.25pt;border-collapse:collapse;table-layout:fixed;'>
   <tr height="18" style='height:13.50pt;'>
    <td class="xl23" height="54" width="59" rowspan="3" style='height:40.50pt;width:120.25pt;border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;text'>单<br/>位</td>
    <td class="xl23" width="71" rowspan="3" style='width:53.25pt;border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;'>总<br/>数</td>
    <td class="xl24" width="533" colspan="9" style='width:399.75pt;border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;'>
    	第一周(${fn:substring(weekBean.onestart,4,8)}-${fn:substring(weekBean.oneend,4,8)})
    	<c:choose>
    		<c:when test="${weekBean.firstweekisvalid == '1'}"><font color='green'>有效周</font></c:when>
    		<c:otherwise><font color='red'>无效周</font></c:otherwise>
    	</c:choose>
    </td>
    <td class="xl24" width="531" colspan="9" style='width:398.25pt;border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;'>
    	第二周(${fn:substring(weekBean.twostart,4,8)}-${fn:substring(weekBean.twoend,4,8)})
    	<c:choose>
    		<c:when test="${weekBean.secondweekisvalid == '1'}"><font color='green'>有效周</font></c:when>
    		<c:otherwise><font color='red'>无效周</font></c:otherwise>
    	</c:choose>
    </td>
    <td class="xl25" width="531" colspan="9" style='width:398.25pt;border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;'>
    	第三周(${fn:substring(weekBean.threestart,4,8)}-${fn:substring(weekBean.threeend,4,8)})
    	<c:choose>
    		<c:when test="${weekBean.thirdweekisvalid == '1'}"><font color='green'>有效周</font></c:when>
    		<c:otherwise><font color='red'>无效周</font></c:otherwise>
    	</c:choose>
    </td>
    <td class="xl25" width="531" colspan="9" style='width:398.25pt;border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;'>
    	第四周(${fn:substring(weekBean.fourstart,4,8)}-${fn:substring(weekBean.fourend,4,8)})
    	<c:choose>
    		<c:when test="${weekBean.fourthweekisvalid == '1'}"><font color='green'>有效周</font></c:when>
    		<c:otherwise><font color='red'>无效周</font></c:otherwise>
    	</c:choose>
    </td>
    <td class="xl25" width="531" colspan="9" style='width:398.25pt;border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;'>
    	第五周(${fn:substring(weekBean.fivestart,4,8)}-${fn:substring(weekBean.fiveend,4,8)})
    	<c:choose>
    		<c:when test="${weekBean.fifthweekisvalid == '1'}"><font color='green'>有效周</font></c:when>
    		<c:otherwise><font color='red'>无效周</font></c:otherwise>
    	</c:choose>
    </td>
    <td class="xl25" width="535" colspan="9" style='width:401.25pt;border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;'>
    	第六周(${fn:substring(weekBean.sixstart,4,8)}-${fn:substring(weekBean.sixend,4,8)})
    	<c:choose>
    		<c:when test="${weekBean.sixthweekisvalid == '1'}"><font color='green'>有效周</font></c:when>
    		<c:otherwise><font color='red'>无效周</font></c:otherwise>
    	</c:choose>
    </td>
    <td class="xl23" width="51" rowspan="3" style='width:38.25pt;border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;'>警务<br/>区数</td>
    <td class="xl23" width="53" rowspan="3" style='width:39.75pt;border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;'>任务为<br/>完成警<br/>务区数</td>
    <td class="xl23" width="53" rowspan="3" style='width:39.75pt;border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;'>任务未<br/>完成周<br/>次数</td>
   </tr>
   <tr height="18" style='height:13.50pt;'>
    <td class="xl24" colspan="3" style='border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;'>基础数据</td>
    <td class="xl24" colspan="3" style='border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;'>入户走访</td>
    <td class="xl24" colspan="3" style='border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;'>巡逻盘查</td>
    <td class="xl24" colspan="3" style='border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;'>基础数据</td>
    <td class="xl24" colspan="3" style='border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;'>入户走访</td>
    <td class="xl24" colspan="3" style='border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;'>巡逻盘查</td>
    <td class="xl24" colspan="3" style='border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;'>基础数据</td>
    <td class="xl24" colspan="3" style='border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;'>入户走访</td>
    <td class="xl24" colspan="3" style='border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;'>巡逻盘查</td>
    <td class="xl24" colspan="3" style='border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;'>基础数据</td>
    <td class="xl24" colspan="3" style='border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;'>入户走访</td>
    <td class="xl24" colspan="3" style='border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;'>巡逻盘查</td>
    <td class="xl24" colspan="3" style='border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;'>基础数据</td>
    <td class="xl24" colspan="3" style='border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;'>入户走访</td>
    <td class="xl24" colspan="3" style='border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;'>巡逻盘查</td>
    <td class="xl24" colspan="3" style='border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;'>基础数据</td>
    <td class="xl24" colspan="3" style='border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;'>入户走访</td>
    <td class="xl24" colspan="3" style='border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;'>巡逻盘查</td>
   </tr>
   <tr height="18" style='height:13.50pt;'>
    <td class="xl26">总数</td>
    <td class="xl26">社区</td>
    <td class="xl26">农村</td>
    <td class="xl26">总数</td>
    <td class="xl26">社区</td>
    <td class="xl26">农村</td>
    <td class="xl26">总数</td>
    <td class="xl26">社区</td>
    <td class="xl26">农村</td>
    <td class="xl26">总数</td>
    <td class="xl26">社区</td>
    <td class="xl26">农村</td>
    <td class="xl26">总数</td>
    <td class="xl26">社区</td>
    <td class="xl26">农村</td>
    <td class="xl26">总数</td>
    <td class="xl26">社区</td>
    <td class="xl26">农村</td>
    <td class="xl26">总数</td>
    <td class="xl26">社区</td>
    <td class="xl26">农村</td>
    <td class="xl26">总数</td>
    <td class="xl26">社区</td>
    <td class="xl26">农村</td>
    <td class="xl26">总数</td>
    <td class="xl26">社区</td>
    <td class="xl26">农村</td>
    <td class="xl26">总数</td>
    <td class="xl26">社区</td>
    <td class="xl26">农村</td>
    <td class="xl26">总数</td>
    <td class="xl26">社区</td>
    <td class="xl26">农村</td>
    <td class="xl26">总数</td>
    <td class="xl26">社区</td>
    <td class="xl26">农村</td>
    <td class="xl26">总数</td>
    <td class="xl26">社区</td>
    <td class="xl26">农村</td>
    <td class="xl26">总数</td>
    <td class="xl26">社区</td>
    <td class="xl26">农村</td>
    <td class="xl26">总数</td>
    <td class="xl26">社区</td>
    <td class="xl26">农村</td>
    <td class="xl26">总数</td>
    <td class="xl26">社区</td>
    <td class="xl26">农村</td>
    <td class="xl26">总数</td>
    <td class="xl26">社区</td>
    <td class="xl26">农村</td>
    <td class="xl26">总数</td>
    <td class="xl26">社区</td>
    <td class="xl26">农村</td>
   </tr>
   <c:forEach items="${weektableBeans}" var="bean">
   <tr height="18" style='height:13.50pt;'>
    <td class="xl26" height="18" style='height:13.50pt;text-align: left'>&nbsp;${bean.orgname }</td>
    
    <td class="xl27">${bean.zcjs}</td>
    
    <td class="xl27">${bean.onezs}</td>
    <td class="xl27">${bean.onesqs}</td>
    <td class="xl27">${bean.onencs}</td>
    <td class="xl27">${bean.onerhzfzs }</td>
    <td class="xl27">${bean.onerhzfsqs }</td>
    <td class="xl27">${bean.onerhzfncs }</td>
    <td class="xl27">${bean.onezaxlzs }</td>
    <td class="xl27">${bean.onezaxlsqs }</td>
    <td class="xl27">${bean.onezaxlncs }</td>
    
    <td class="xl27">${bean.twozs}</td>
    <td class="xl27">${bean.twosqs}</td>
    <td class="xl27">${bean.twoncs}</td>
    <td class="xl27">${bean.tworhzfzs }</td>
    <td class="xl27">${bean.tworhzfsqs }</td>
    <td class="xl27">${bean.tworhzfncs }</td>
    <td class="xl27">${bean.twozaxlzs }</td>
    <td class="xl27">${bean.twozaxlsqs }</td>
    <td class="xl27">${bean.twozaxlncs }</td>
    
    <td class="xl27">${bean.threezs}</td>
    <td class="xl27">${bean.threesqs}</td>
    <td class="xl27">${bean.threencs}</td>
    <td class="xl27">${bean.threerhzfzs }</td>
    <td class="xl27">${bean.threerhzfsqs }</td>
    <td class="xl27">${bean.threerhzfncs }</td>
    <td class="xl27">${bean.threezaxlzs }</td>
    <td class="xl27">${bean.threezaxlsqs }</td>
    <td class="xl27">${bean.threezaxlncs }</td>
    
    
    <td class="xl27">${bean.fourzs}</td>
    <td class="xl27">${bean.foursqs}</td>
    <td class="xl27">${bean.fourncs}</td>
    <td class="xl27">${bean.fourrhzfzs }</td>
    <td class="xl27">${bean.fourrhzfsqs }</td>
    <td class="xl27">${bean.fourrhzfncs }</td>
    <td class="xl27">${bean.fourzaxlzs }</td>
    <td class="xl27">${bean.fourzaxlsqs }</td>
    <td class="xl27">${bean.fourzaxlncs }</td>
    
    
    <td class="xl27">${bean.fivezs}</td>
    <td class="xl27">${bean.fivesqs}</td>
    <td class="xl27">${bean.fivencs}</td>
    <td class="xl27">${bean.fiverhzfzs }</td>
    <td class="xl27">${bean.fiverhzfsqs }</td>
    <td class="xl27">${bean.fiverhzfncs }</td>
    <td class="xl27">${bean.fivezaxlzs }</td>
    <td class="xl27">${bean.fivezaxlsqs }</td>
    <td class="xl27">${bean.fivezaxlncs }</td>
    
    <td class="xl27">${bean.sixzs}</td>
    <td class="xl27">${bean.sixsqs}</td>
    <td class="xl27">${bean.sixncs}</td>
    <td class="xl27">${bean.sixrhzfzs }</td>
    <td class="xl27">${bean.sixrhzfsqs }</td>
    <td class="xl27">${bean.sixrhzfncs }</td>
    <td class="xl27">${bean.sixzaxlzs }</td>
    <td class="xl27">${bean.sixzaxlsqs }</td>
    <td class="xl27">${bean.sixzaxlncs }</td>
    
    <td class="xl27">${bean.jwqzs}</td>
    <td class="xl27">${bean.wwcrwjwqs}</td>
    <td class="xl27">${bean.wwczcjrwcs}</td>
   </tr>
   </c:forEach>
  </table>