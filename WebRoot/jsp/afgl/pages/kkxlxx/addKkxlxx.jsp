<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<creator:view title="卡口巡逻信息">
		<div id="head_djkkxlxx">
				<table width="100%" border="0" cellspacing="0" cellpadding="0" class="box_title">
				    <tr>
				      <td width="23"><img src="<c:url value='/template/cps/images/img_title.jpg'/>" width="23" height="28" /></td>
				      <td id="title_id">
				      	<c:if test="${kkxlxxBean.czbs eq '1' }">登记卡口巡逻信息</c:if>
				      	<c:if test="${kkxlxxBean.czbs eq '2' }">修改卡口巡逻信息</c:if>
				      </td>
				      <td width="28"><a href="javascript:void(0)"><img id="img_djkkxx" src="<c:url value='/template/cps/images/cx_zk.jpg'/>" width="28" height="28" /></a></td>
				    </tr>
				</table>
			<form id="add_kkxlxx_form"  action="${contextPath }/kkxlxx/addKkxlxx.action" method="post">
				<c:if test="${kkxlxxBean.czbs eq '1' }">
					<input type="hidden" id="xlbh" name="kkxlxxBean.xlbh" value=""/>
				</c:if>
				<c:if test="${kkxlxxBean.czbs eq '2' }">
					<input type="hidden" id="xlbh" name="kkxlxxBean.xlbh" value="${kkxlxxBean.xlbh }"/>
				</c:if>
				<input type="hidden" id="czbs" name="kkxlxxBean.czbs" value="${kkxlxxBean.czbs }"/>
				<cps:table>
					<cps:row>
						<cps:tdLabel width="13%">卡口名称：</cps:tdLabel>
						<cps:tdContent width="20%">
							<input type="hidden" id="kkbh" name="kkxlxxBean.kkbh" value="${kkxlxxBean.kkbh }"/>
							<cps:textfield id="kkmc" name="kkxlxxBean.kkmc" value="${kkxlxxBean.kkmc }"  disabled="true"
								cssClass="validate[required]" cssStyle="width:50%" ondblclick="selectKkxx('kkxlxxQuery')"></cps:textfield>
							<cps:button value="选择" onclick="selectKkxx('kkxlxxQuery')"></cps:button>
							<font color="red">*</font>
						</cps:tdContent>
						<cps:tdLabel width="12%">卡口位置：</cps:tdLabel>
						<cps:tdContent width="20%">
							<cps:textfield id="kkwz" name="kkxlxxBean.kkwz"  disabled="true" value="${kkxlxxBean.kkwz }" cssStyle="width:80%" ></cps:textfield>
						</cps:tdContent>
						<cps:tdLabel width="12%">卡口范围：</cps:tdLabel>
						<cps:tdContent width="20%">
							<cps:textfield id="kkfw" name="kkxlxxBean.kkfw"  disabled="true" value="${kkxlxxBean.kkfw }" cssStyle="width:80%" ></cps:textfield>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel width="13%">开始时间：</cps:tdLabel>
						<cps:tdContent width="20%">
							<cps:date id="xlkssj" name="kkxlxxBean.xlkssj"
								dateFmt="yyyy-MM-dd HH:mm:ss" cssClass="validate[required] cps-input" cssStyle="width:80%"  value="${kkxlxxBean.xlkssj }"></cps:date>
							<font color="red">*</font>
						</cps:tdContent>
						<cps:tdLabel width="12%">结束时间：</cps:tdLabel>
						<cps:tdContent width="20%">
							<cps:date id="xljssj" name="kkxlxxBean.xljssj"
								dateFmt="yyyy-MM-dd HH:mm:ss" cssClass="validate[required] cps-input" cssStyle="width:80%"  value="${kkxlxxBean.xljssj }"></cps:date>
							<font color="red">*</font>
						</cps:tdContent>
						<cps:tdLabel width="12%">巡逻民警：</cps:tdLabel>
						<cps:tdContent width="20%">
							<input type="hidden" id="xlmjjh" name="kkxlxxBean.xlmjjh" value="${kkxlxxBean.xlmjjh }"/>
							<cps:textfield id="xlmj" name="kkxlxxBean.xlmj" value="${kkxlxxBean.xlmj }"
								cssClass="validate[required]" cssStyle="width:50%" ondblclick="selectDwry('${loginInfo.orgcode }','xlmjjh','xlmj')"></cps:textfield>
							<cps:button value="选择" onclick="selectDwry('${loginInfo.orgcode }','xlmjjh','xlmj')"></cps:button>
							<font color="red">*</font>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel width="13%">参与巡逻人员：</cps:tdLabel>
						<cps:tdContent width="20%">
							<cps:textfield id="cyxlry" name="kkxlxxBean.cyxlry" value="${kkxlxxBean.cyxlry }" cssStyle="width:80%" ></cps:textfield>
						</cps:tdContent>
						<cps:tdLabel width="12%">巡逻情况：</cps:tdLabel>
						<cps:tdContent width="20%">
							<cps:textfield id="xlqk" name="kkxlxxBean.xlqk" value="${kkxlxxBean.xlqk }" cssStyle="width:80%" ></cps:textfield>
						</cps:tdContent>
						<cps:tdLabel width="12%">盘查情况：</cps:tdLabel>
						<cps:tdContent width="20%">
							<cps:textfield id="pcqk" name="kkxlxxBean.pcqk" value="${kkxlxxBean.pcqk }" cssStyle="width:80%" ></cps:textfield>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel width="13%">巡逻接班时间：</cps:tdLabel>
						<cps:tdContent width="20%">
							<cps:date id="xljbsj" name="kkxlxxBean.xljbsj"  cssStyle="width:80%" 
								dateFmt="yyyy-MM-dd HH:mm:ss" cssClass="validate[required] cps-input" value="${kkxlxxBean.xljbsj }"></cps:date>
							<font color="red">*</font>
						</cps:tdContent>
						<cps:tdLabel width="12%">巡逻接班民警：</cps:tdLabel>
						<cps:tdContent width="20%">
							<input type="hidden" id="xljbmjjh" name="kkxlxxBean.xljbmjjh"  value="${kkxlxxBean.xljbmjjh }"/>
							<cps:textfield id="xljbmj" name="kkxlxxBean.xljbmj"  value="${kkxlxxBean.xljbmj }"
								cssClass="validate[required]" cssStyle="width:50%" ondblclick="selectDwry('${loginInfo.orgcode }','xljbmjjh','xljbmj')"></cps:textfield>
							<cps:button value="选择" onclick="selectDwry('${loginInfo.orgcode }','xljbmjjh','xljbmj')"></cps:button>
							<font color="red">*</font>
						</cps:tdContent>
						<cps:tdLabel width="12%">&nbsp;</cps:tdLabel>
						<cps:tdContent width="20%">
							&nbsp;
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel width="13%">登记人：</cps:tdLabel>
						<cps:tdContent width="20%">
							<cps:textfield id="djrxm" name="kkxlxxBean.djrxm"  cssStyle="width:80%" 
								value="${loginInfo.realname}" readonly="true"></cps:textfield>
							<input type="hidden" id="djrjh" name="kkxlxxBean.djrjh"
								value="${loginInfo.username }" />
						</cps:tdContent>
						<cps:tdLabel width="12%">登记时间：</cps:tdLabel>
						<cps:tdContent width="20%">
							<cps:textfield id="djsj" name="kkxlxxBean.djsj"  cssStyle="width:80%" 
								value="<%=new SimpleDateFormat(\"yyyy-MM-dd HH:mm:ss\").format(new Date()) %>"
								readonly="true"></cps:textfield>
						</cps:tdContent>
						<cps:tdLabel width="12%">登记单位：</cps:tdLabel>
						<cps:tdContent width="20%">
							<cps:textfield id="djdwmc" name="kkxlxxBean.djdwmc"  cssStyle="width:80%" 
								value="${loginInfo.orgname }" readonly="true"></cps:textfield>
							<input id="djdwdm" name="kkxlxxBean.djdwdm" type="hidden" value="${loginInfo.orgcode }" />
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdContent colspan="6" align="center">
							<cps:button value="新增" onclick="pageAddKkxlxx();"></cps:button>
							<cps:button value="保存" onclick="addKkxlxx();"></cps:button>
							<cps:button value="清空"  type="reset"></cps:button>
							<cps:button value="关闭" onclick="window.close();"></cps:button>
						</cps:tdContent>
					</cps:row>
				</cps:table>
			</form>
		</div>
		<br>
		<cps:tableGrid id="kkxlxxList" pageSize="15" usepager="true"
			searchform="searchform" autothead="true"
			url="/kkxlxx/kkxlxxList.action" mutilSelect="true" autoload="true">
			<cps:column isNumber="true" title="序号"></cps:column>
			<cps:column isCheckbox="true"></cps:column>
			<cps:column title="操作" field="cz" rowcallback="updateKkxlxxCzRowCallback"></cps:column>
			<cps:column title="卡口名称" field="kkmc"></cps:column>
			<cps:column title="卡口位置" field="kkwz"></cps:column>
			<cps:column title="警务责任区" field="sszrqmc"></cps:column>
			<cps:column title="巡逻开始日期" field="xlkssj"></cps:column>
			<cps:column title="巡逻结束日期" field="xljssj"></cps:column>
			<cps:column title="巡逻民警" field="xlmj"></cps:column>
		</cps:tableGrid>
		<script type="text/javascript" src="${contextPath}/jsp/afgl/js/af.js"></script>
		<script type="text/javascript"
			src="${contextPath}/jsp/afgl/js/kkxlxx.js"></script>
</creator:view>