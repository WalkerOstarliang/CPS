<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<creator:view title="盘查信息">
		<div id="head_djkkpcxx">
				<table width="100%" border="0" cellspacing="0" cellpadding="0" class="box_title">
				    <tr>
				      <td width="23"><img src="<c:url value='/template/cps/images/img_title.jpg'/>" width="23" height="28" /></td>
				      <td id="title_id">
				      	<c:if test="${kkpcxxBean.czbs eq '1' }">登记盘查信息</c:if>
				      	<c:if test="${kkpcxxBean.czbs eq '2' }">修改盘查信息</c:if>
				      </td>
				      <td width="28"><a href="javascript:void(0)"><img id="img_djkkxx" src="<c:url value='/template/cps/images/cx_zk.jpg'/>" width="28" height="28" /></a></td>
				    </tr>
				</table>
			<form id="add_kkpcxx_form"  action="${contextPath }/kkpcxx/addKkpcxx.action" method="post">
				<c:if test="${kkpcxxBean.czbs eq '1' }">
					<input type="hidden" id="pcbh" name="kkpcxxBean.pcbh" value=""/>
				</c:if>
				<c:if test="${kkpcxxBean.czbs eq '2' }">
					<input type="hidden" id="pcbh" name="kkpcxxBean.pcbh" value="${kkpcxxBean.pcbh }"/>
				</c:if>
				
				<input type="hidden" id="czbs" name="kkpcxxBean.czbs" value="${kkpcxxBean.czbs }"/>
				<cps:table>
					<cps:row>
						<cps:tdLabel width="12%">盘查类型：</cps:tdLabel>
						<cps:tdContent width="20%">
							<cps:select id="pclb" name="kkpcxxBean.pclb"  cssStyle="width:80%"  value="${kkpcxxBean.pclb }"
										zdlb="AF_PCLX" headerValue="--选择--" headerKey="" cssClass="validate[required]"></cps:select>
							<font color="red">*</font>
						</cps:tdContent>
						<cps:tdLabel width="15%">卡口名称：</cps:tdLabel>
						<cps:tdContent width="20%">
							<input type="hidden" id="kkbh" name="kkpcxxBean.kkbh" value="${kkpcxxBean.kkbh }"/>
							<cps:textfield id="kkmc" name="kkpcxxBean.kkmc" value="${kkpcxxBean.kkmc }" disabled="true"
								cssStyle="width:50%" ondblclick="selectKkxx('kkpcxxQuery')"  cssClass="validate[required]"></cps:textfield>
							<cps:button value="选择" onclick="selectKkxx('kkpcxxQuery')"></cps:button>
							<font color="red">*</font>
						</cps:tdContent>
						<cps:tdLabel width="12%">卡口位置：</cps:tdLabel>
						<cps:tdContent width="20%">
							<cps:textfield id="kkwz" name="kkpcxxBean.kkwz" disabled="true" value="${kkpcxxBean.kkwz }" cssStyle="width:80%" ></cps:textfield>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel width="12%">卡口范围：</cps:tdLabel>
						<cps:tdContent colspan="5">
							<cps:textfield id="kkfw" name="kkpcxxBean.kkfw" disabled="true" value="${kkpcxxBean.kkfw }" cssStyle="width:93%" ></cps:textfield>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel width="15%">被盘查人身份证号：</cps:tdLabel>
						<cps:tdContent width="20%">
							<cps:textfield id="bpcrsfzh" name="kkpcxxBean.bpcrsfzh"  cssStyle="width:80%" 
											cssClass="validate[required,funcCall[checkIDC],maxSize[18]]" maxlength="18"
											onblur="getRyjbxxBySfzh(this)" value="${kkpcxxBean.bpcrsfzh }"></cps:textfield>
							<font color="red">*</font>	
						</cps:tdContent>
						<cps:tdLabel width="12%">性别：</cps:tdLabel>
						<cps:tdContent width="20%">
							<cps:select id="bpcrxb" name="kkpcxxBean.bpcrxb"  cssStyle="width:80%" 
									zdlb="GB_XB" headerValue="--选择--" headerKey=""  value="${kkpcxxBean.bpcrxb }"></cps:select>
						</cps:tdContent>
						<cps:tdLabel width="12%">出生日期：</cps:tdLabel>
						<cps:tdContent width="20%">
							<cps:date id="bpcrcsrq" name="kkpcxxBean.bpcrcsrq"  value="${kkpcxxBean.bpcrcsrq }"
								dateFmt="yyyy-MM-dd" cssClass="cps-input" maxDate="${currentSystemDate}" cssStyle="width:80%" ></cps:date>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel width="15%">姓名：</cps:tdLabel>
						<cps:tdContent width="20%">
							<cps:textfield id="bpcrxm" name="kkpcxxBean.bpcrxm"  cssStyle="width:80%"   
								cssClass="validate[required]" value="${kkpcxxBean.bpcrxm }"></cps:textfield>
							<font color="red">*</font>	
						</cps:tdContent>
						<cps:tdLabel width="12%">户籍地：</cps:tdLabel>
						<cps:tdContent width="20%">
							<cps:textfield id="bpcrhjdxz"  name="kkpcxxBean.bpcrhjdxz" cssStyle="width:50%" ondblclick="selectXzqh('bpcrhjdqh','bpcrhjdxz')"  value="${kkpcxxBean.bpcrhjdxz }"></cps:textfield>
							<input type="hidden" id="bpcrhjdqh" name="kkpcxxBean.bpcrhjdqh"   value="${kkpcxxBean.bpcrhjdqh }"/>
							<cps:button value="选择" onclick="selectXzqh('bpcrhjdqh','bpcrhjdxz')"></cps:button>
						</cps:tdContent>
						<cps:tdLabel width="12%">现住地：</cps:tdLabel>
						<cps:tdContent width="20%">
							<cps:textfield id="bpcrxzdxz" name="kkpcxxBean.bpcrxzdxz"  cssStyle="width:80%"   value="${kkpcxxBean.bpcrxzdxz }"></cps:textfield>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel width="15%">处理结果：</cps:tdLabel>
						<cps:tdContent width="20%">
							<cps:textfield id="cljg" name="kkpcxxBean.cljg"  cssStyle="width:80%" cssClass="validate[required]"  value="${kkpcxxBean.cljg }" ></cps:textfield>
							<font color="red">*</font>	
						</cps:tdContent>
						<cps:tdLabel width="12%">车架号：</cps:tdLabel>
						<cps:tdContent width="20%">
							<cps:textfield id="pcclcjh" name="kkpcxxBean.pcclcjh"  cssStyle="width:80%"  value="${kkpcxxBean.pcclcjh }"></cps:textfield>
						</cps:tdContent>
						<cps:tdLabel width="12%">车牌号：</cps:tdLabel>
						<cps:tdContent width="20%">
							<cps:textfield id="pcclcph" name="kkpcxxBean.pcclcph"  cssStyle="width:80%"  value="${kkpcxxBean.pcclcph }"></cps:textfield>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel width="15%">被盘查车辆类型：</cps:tdLabel>
						<cps:tdContent width="20%">
							<cps:select  id="pccllx" name="kkpcxxBean.pccllx"  value="${kkpcxxBean.pccllx }" cssStyle="width:80%" zdlb="GB_CLLX" headerValue="--选择--" headerKey=""></cps:select>
						</cps:tdContent>
						<cps:tdLabel width="12%">发动机号：</cps:tdLabel>
						<cps:tdContent width="20%">
							<cps:textfield id="pcclfdjh" name="kkpcxxBean.pcclfdjh"  cssStyle="width:80%"  value="${kkpcxxBean.pcclfdjh }"></cps:textfield>
						</cps:tdContent>
						<cps:tdLabel width="12%">车牌所属人：</cps:tdLabel>
						<cps:tdContent width="20%">
							<cps:textfield id="pcclcpssr" name="kkpcxxBean.pcclcpssr"  cssStyle="width:80%"  value="${kkpcxxBean.pcclcpssr }"></cps:textfield>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel width="15%">处理情况：</cps:tdLabel>
						<cps:tdContent width="20%">
							<cps:textfield id="pcclqk" name="kkpcxxBean.pcclqk"  cssClass="validate[required]" cssStyle="width:80%"   value="${kkpcxxBean.pcclqk }"></cps:textfield>
							<font color="red">*</font>
						</cps:tdContent>
						<cps:tdLabel width="12%">盘查民警：</cps:tdLabel>
						<cps:tdContent width="20%">
							<input type="hidden" id="pcmjjh" name="kkpcxxBean.pcmjjh"  value="${kkpcxxBean.pcmjjh }"/>
							<cps:textfield id="pcmjxm" name="kkpcxxBean.pcmjxm"   value="${kkpcxxBean.pcmjxm }"
								 cssClass="validate[required]" cssStyle="width:50%" 
								 ondblclick="selectDwry('${loginInfo.orgcode }','pcmjjh','pcmjxm','pcdwdm','pcdwmc')"></cps:textfield>
							<cps:button value="选择" onclick="selectDwry('${loginInfo.orgcode }','pcmjjh','pcmjxm','pcdwdm','pcdwmc')"></cps:button>
							<font color="red">*</font>
						</cps:tdContent>
						<cps:tdLabel width="12%">参与盘查人员：</cps:tdLabel>
						<cps:tdContent width="20%">
							<cps:textfield id="cypcry" name="kkpcxxBean.cypcry"  cssStyle="width:80%"  value="${kkpcxxBean.cypcry }"></cps:textfield>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel width="15%">盘查民警所在单位：</cps:tdLabel>
						<cps:tdContent width="20%">
							<input type="hidden" id="pcdwdm" name="kkpcxxBean.pcdwdm"  value="${kkpcxxBean.pcdwdm }"/>
							<cps:textfield id="pcdwmc" name="kkpcxxBean.pcdwmc"  value="${kkpcxxBean.pcdwmc }"
								 cssClass="validate[required]" cssStyle="width:50%" ondblclick="selectDw('${loginInfo.orgcode }','pcdwdm','pcdwmc')"></cps:textfield>
							<cps:button value="选择" onclick="selectDw('${loginInfo.orgcode }','pcdwdm','pcdwmc')"></cps:button>
							<font color="red">*</font>
						</cps:tdContent>
						<cps:tdLabel width="12%">盘查原因：</cps:tdLabel>
						<cps:tdContent width="20%">
							<cps:select id="pcyy" name="kkpcxxBean.pcyy"  cssStyle="width:80%"  value="${kkpcxxBean.pcyy }"
										cssClass="validate[required]" zdlb="AF_PCYY" headerValue="--选择--" headerKey=""></cps:select>
							<font color="red">*</font>
						</cps:tdContent>
						<cps:tdLabel width="12%">盘查时间：</cps:tdLabel>
						<cps:tdContent width="20%">
							<cps:date id="pcsj" name="kkpcxxBean.pcsj" dateFmt="yyyy-MM-dd HH:mm:ss"  value="${kkpcxxBean.pcsj }"
								cssClass="validate[required] cps-input"  cssStyle="width:80%" ></cps:date>
							<font color="red">*</font>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel width="15%">盘查地点：</cps:tdLabel>
						<cps:tdContent width="20%">
							<cps:textfield id="pcdd" name="kkpcxxBean.pcdd" cssClass="validate[required]"  cssStyle="width:80%"  value="${kkpcxxBean.pcdd }"></cps:textfield>
							<font color="red">*</font>
						</cps:tdContent>
						
						<cps:tdLabel width="12%">&nbsp;</cps:tdLabel>
						<cps:tdContent width="20%">
							&nbsp;
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel width="15%">登记人：</cps:tdLabel>
						<cps:tdContent width="20%">
							<cps:textfield id="djrxm" name="kkpcxxBean.djrxm"  cssStyle="width:80%" 
								value="${loginInfo.realname}" readonly="true"></cps:textfield>
							<input type="hidden" id="djrjh" name="kkpcxxBean.djrjh"
								value="${loginInfo.username }" />
						</cps:tdContent>
						<cps:tdLabel width="12%">登记时间：</cps:tdLabel>
						<cps:tdContent width="20%">
							<cps:textfield id="djsj" name="kkpcxxBean.djsj"  cssStyle="width:80%" 
								value="<%=new SimpleDateFormat(\"yyyy-MM-dd HH:mm:ss\").format(new Date()) %>"
								readonly="true"></cps:textfield>
						</cps:tdContent>
						<cps:tdLabel width="12%">登记单位：</cps:tdLabel>
						<cps:tdContent width="20%">
							<cps:textfield id="djdwmc" name="kkpcxxBean.djdwmc"  cssStyle="width:80%" 
								value="${loginInfo.orgname }" readonly="true"></cps:textfield>
							<input id="djdwdm" name="kkpcxxBean.djdwdm" type="hidden"
								"
								value="${loginInfo.orgcode }" />
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdContent colspan="6" align="center">
							<cps:button value="新增" onclick="pageAddKkpcxx();"></cps:button>
							<cps:button value="保存" onclick="addKkpcxx();"></cps:button>
							<cps:button value="清空" type="reset"></cps:button>
							<cps:button value="关闭" onclick="window.close();"></cps:button>
						</cps:tdContent>
					</cps:row>
				</cps:table>
			</form>
		</div>
		<cps:tableGrid id="kkpcxxList" pageSize="15" usepager="true" autothead="true"
			url="/kkpcxx/kkpcxxList.action" mutilSelect="true" autoload="true">
			<cps:column isNumber="true" title="序号"></cps:column>
			<cps:column isCheckbox="true"></cps:column>
			<cps:column title="操作" field="cz" rowcallback="updateKkpcxxCzRowCallback"></cps:column>
			<cps:column title="卡口名称" field="kkmc"></cps:column>
			<cps:column title="盘查原因" field="pcyymc"></cps:column>
			<cps:column title="盘查民警" field="pcmjxm"></cps:column>
			<cps:column title="被盘查人" field="bpcrxm"></cps:column>
			<cps:column title="盘查时间" field="pcsj"></cps:column>
			<cps:column title="登记时间" field="djsj"></cps:column>
			<cps:column title="有无可疑物品" field="hasKywp" rowcallback="hasKywpRowCallback"></cps:column>
		</cps:tableGrid>
				<script type="text/javascript" src="${contextPath}/jsp/afgl/js/af.js"></script>
		<script type="text/javascript" src="${contextPath}/jsp/afgl/js/kkpcxx.js"></script>
</creator:view>