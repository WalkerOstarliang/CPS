<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<creator:view title="治保会信息">
        <script type="text/javascript" src="${contextPath}/jsp/afgl/js/zbhxx.js"></script>
			<creator:tbar id="tbar">
				<cps:button value="保存" onclick="addZbhxx();"></cps:button>
		    	<cps:button value="关闭" onclick="window.close();"></cps:button>
		    </creator:tbar>
		    <creator:panel id="zbhxxPanel" tbarId="tbar" title="治保会信息">
			<form id="add_zbhxx_form" action="${contextPath}/zbhxx/addZbhxx.action" method="post">
				<input type="hidden" id="zbhbh" name="zbhxxBean.zbhbh" value="${zbhxxBean.zbhbh }"/>
				<input type="hidden" id="czbs" name="zbhxxBean.czbs" value="${zbhxxBean.czbs }"/>
				<input type="hidden" id="sssqjwdm" name="zbhxxBean.sssqjwdm" value="${zbhxxBean.sssqjwdm}">
				<input type="hidden" id="sssqjwmc" name="zbhxxBean.sssqjwmc" value="${zbhxxBean.sssqjwmc}">
				<input type="hidden" id="sspcsdm" name="zbhxxBean.sspcsdm" value="${zbhxxBean.sspcsdm}">
				<input type="hidden" id="sspcsmc" name="zbhxxBean.sspcsmc" value="${zbhxxBean.sspcsmc}">
				<cps:table>
					<cps:row>
						<cps:tdLabel>所属社区：</cps:tdLabel>
						<cps:tdContent colspan="3">
							<input type="hidden" id="sssqdm" name="zbhxxBean.sssqdm" value="${zbhxxBean.sssqdm}">
							<cps:textfield id="sssqmc"  name="zbhxxBean.sssqmc" value="${zbhxxBean.sssqmc}" cssClass="validate[required] cps-input" appendPopuBtn="true" cssStyle="width:94%" readonly="true" onclick="openSqxxSelectWin(setSqxxToPage)"></cps:textfield>
						</cps:tdContent>
						<cps:tdLabel><font color="red">*</font>治保会名称：</cps:tdLabel>
						<cps:tdContent>
							<cps:textfield id="zbhmc" name="zbhxxBean.zbhmc" value="${zbhxxBean.zbhmc }" cssClass="validate[required]"  maxlength="60"  onblur="isExistZbhmc(this.value);"></cps:textfield>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel cssStyle="width:12%">负责人姓名：</cps:tdLabel>
						<cps:tdContent cssStyle="width:22%">
							<cps:textfield id="zbhfzrxm" name="zbhxxBean.zbhfzrxm" value="${zbhxxBean.zbhfzrxm }" maxlength="15"></cps:textfield>
						</cps:tdContent>
						<cps:tdLabel cssStyle="width:12%">负责人电话：</cps:tdLabel>
						<cps:tdContent cssStyle="width:22%">
							<cps:textfield id="zbhfzrlxdh" name="zbhxxBean.zbhfzrlxdh" isPhone="true" minlength="7" value="${zbhxxBean.zbhfzrlxdh }" ></cps:textfield>
						</cps:tdContent>
						<cps:tdLabel cssStyle="width:12%"><font color="red">*</font>成立日期：</cps:tdLabel>
						<cps:tdContent cssStyle="width:25%">
							<cps:date id="cjsj" name="zbhxxBean.cjsj" dateFmt="yyyy-MM-dd"  value="${zbhxxBean.cjsj}" cssClass="validate[required] cps-input" ></cps:date>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel cssStyle="width:10%">登记人：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							<cps:textfield id="djrxm" name="zbhxxBean.djrxm" value="${loginInfo.realname}" readonly="true"></cps:textfield>
							<input type="hidden" id="djrjh" name="zbhxxBean.djrjh" value="${loginInfo.username }" />
						</cps:tdContent>
						<cps:tdLabel cssStyle="width:10%">登记时间：</cps:tdLabel>
						<cps:tdContent cssStyle="width:25%">
							<cps:date id="djsj" name="zbhxxBean.djsj" defaultSystemDate="true" readOnly="true"></cps:date>
						</cps:tdContent>
						<cps:tdLabel cssStyle="width:10%">登记单位：</cps:tdLabel>
						<cps:tdContent cssStyle="width:25%">
							<cps:textfield id="djdwmc" name="zbhxxBean.djdwmc" value="${loginInfo.orgname }" readonly="true"></cps:textfield>
							<input id="djdwdm" name="zbhxxBean.djdwdm" type="hidden" value="${loginInfo.orgcode }" />
						</cps:tdContent>
					</cps:row>
				</cps:table>
			</form>
			<creator:tbar id="addcytbar">
				<cps:button value="添加成员" onclick="saveAndadd()"></cps:button>
				<cps:button id="refrece" value="刷新" onclick="queryZbhcyxx()"></cps:button>
			</creator:tbar>
			<cps:tableGrid id="zbhcyxxList" title="治保会成员列表" 
							pageSize="10" usepager="true" tbarId="addcytbar"
							searchform="add_zbhxx_form" autothead="false" 
							url="/zbhxx/zbhcyxxList.action"
							mutilSelect="true" autoload="true" width="99.8%">
				<cps:column isNumber="true" title="序号"></cps:column>
				<cps:column title="操作" field="cz" rowcallback="zbhcyczrowcallback"></cps:column>
				<cps:column title="姓名" field="xm"></cps:column>
				<cps:column title="性别" field="xbmc"></cps:column>
				<cps:column title="身份证号" field="sfzh"></cps:column>
				<cps:column title="治保会" field="zbhmc"></cps:column>
				<cps:column title="参加日期" field="cjrq"></cps:column>
				<cps:column title="注销标识" field="tcbsmc"></cps:column>
			</cps:tableGrid>
		</creator:panel>
</creator:view>