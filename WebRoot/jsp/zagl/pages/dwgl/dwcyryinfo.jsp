<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<div>
	<div style="width: 45%; float: left;">
		<cps:tableGrid id="cyryList"
			url="/zagl/dw/queryCyryLsByRybh.action?cyrycx.rybh=${dw.cyry.rybh}&cyrycx.cyrybh=${dw.cyry.cyrybh}" 
			autoload="true" click="showCyry"
			isAsynch="true" width="99.5%"
			pageSize="8" usepager="true" autothead="false">
			<cps:column isNumber="true" title="序号"></cps:column>
			<cps:column title="操作" rowcallback="dwDetail"></cps:column>
			<cps:column title="工作单位" field="dwmc" maxlength="5"></cps:column>
			<cps:column title="登记时间" field="djsj"></cps:column>
			<cps:column title="注销日期" field="zxrq"></cps:column>
		</cps:tableGrid>
		<fieldset>
			<legend>从业人员反馈信息</legend>
			<cps:table>
				<cps:row>
					<cps:tdLabel width="20%">反馈人：</cps:tdLabel>
					<cps:tdContent width="30%">
						${dw.cyry.fkrxm}&nbsp;
					</cps:tdContent>
					<cps:tdLabel width="20%">反馈时间：</cps:tdLabel>
					<cps:tdContent width="30%">
						${dw.cyry.fksj}&nbsp;
					</cps:tdContent>
				</cps:row>
				
				<cps:row>
					<cps:tdLabel>反馈单位：</cps:tdLabel>
					<cps:tdContent colspan="3">
						${dw.cyry.fkdwmc}&nbsp;
					</cps:tdContent>
				</cps:row>
				
				<cps:row>
					<cps:tdLabel>反馈内容：</cps:tdLabel>
					<cps:tdContent colspan="3">
						${dw.cyry.fknr}&nbsp;
					</cps:tdContent>
				</cps:row>
			</cps:table>
		</fieldset>
	</div>
	<div style="width: 54.5%; float: right;">
		<cps:table>
			<cps:row>
				<cps:tdLabel width="11%">居住地派出所：</cps:tdLabel>
				<cps:tdContent id="jzdsq" colspan="3">
					${dw.cyry.jzdpcsmc}&nbsp;
				</cps:tdContent>
			</cps:row>
		
			<cps:row>
				<cps:tdLabel width="11%">居住地社区：</cps:tdLabel>
				<cps:tdContent id="jzdsq" colspan="3">
					${dw.cyry.jzdsqmc}&nbsp;
				</cps:tdContent>
			</cps:row>
			
			<cps:row>
				<cps:tdLabel width="11%">居住地址：</cps:tdLabel>
				<cps:tdContent width="22%" id="jzdz" colspan="3">
					${dw.cyry.xzdz}&nbsp;
				</cps:tdContent>
			</cps:row>
			
			<cps:row>
				<cps:tdLabel width="11%">工作单位：</cps:tdLabel>
				<cps:tdContent width="22%" id="dwmc">
					${dw.cyry.dwmc}&nbsp;
				</cps:tdContent>
				
				<cps:tdLabel width="11%">所在部门：</cps:tdLabel>
				<cps:tdContent width="22%" id="bmmc">
					${dw.cyry.bmmc}&nbsp;
				</cps:tdContent>
			</cps:row>

			<cps:row>
				<cps:tdLabel width="11%">
					<font color="red">*</font>职务类别：</cps:tdLabel>
				<cps:tdContent width="22%" id="zwlbmc">
					${dw.cyry.zwlbmc}&nbsp;
				</cps:tdContent>
				
				<cps:tdLabel width="11%">聘用年限(年)：</cps:tdLabel>
				<cps:tdContent id="pynx">
						${dw.cyry.pynx}&nbsp;
				</cps:tdContent>
			</cps:row>

			<cps:row>
				<cps:tdLabel>手机号码：</cps:tdLabel>
				<cps:tdContent id="sjhm">
					${dw.cyry.sjhm}&nbsp;
				</cps:tdContent>
			
				<cps:tdLabel>员工号：</cps:tdLabel>
				<cps:tdContent id="cyryygh">
					${dw.cyry.cyryygh}&nbsp;
				</cps:tdContent>
			</cps:row>
			
			<cps:row>
				<cps:tdLabel>入职时间：</cps:tdLabel>
				<cps:tdContent id="rzsj">
					${dw.cyry.rzsj}&nbsp;
				</cps:tdContent>
			
				 <cps:tdLabel>离职时间：</cps:tdLabel>
				 <cps:tdContent id="lzsj">
				 	${dw.cyry.lzsj}&nbsp;
				 </cps:tdContent>
			</cps:row>
			
			<cps:row>
				<cps:tdLabel>居住地：</cps:tdLabel>
				<cps:tdContent colspan="3" id="xzdz">
					${dw.cyry.xzdz}&nbsp;
				</cps:tdContent>
			</cps:row>
			
			<cps:row>
				<cps:tdLabel>培训证书：</cps:tdLabel>
				<cps:tdContent id="pxzs">
					${dw.cyry.pxzs}&nbsp;
				</cps:tdContent>

				<cps:tdLabel>培训证号：</cps:tdLabel>
				<cps:tdContent id="pxzh">
					${dw.cyry.pxzh}&nbsp;
				</cps:tdContent>
			</cps:row>

			<cps:row>
				<cps:tdLabel>服务对象：</cps:tdLabel>
				<cps:tdContent id="fwdx">
					${dw.cyry.pxzh}&nbsp;
				</cps:tdContent>
				
				<cps:tdLabel>工资来源：</cps:tdLabel>
				<cps:tdContent id="gzly">
					${dw.cyry.gzly}&nbsp;
				</cps:tdContent>
			</cps:row>

			<cps:row>
				<cps:tdLabel>保卫措施：</cps:tdLabel>
				<cps:tdContent id="bwcs">
					${dw.cyry.bwcs}&nbsp;
				</cps:tdContent>
				
				<cps:tdLabel>控制措施：</cps:tdLabel>
				<cps:tdContent id="kzcs">
					${dw.cyry.kzcs}&nbsp;
				</cps:tdContent>
			</cps:row>

			<cps:row>
				<cps:tdLabel>主要贡献：</cps:tdLabel>
				<cps:tdContent id="zygx">
					${dw.cyry.zygx}&nbsp;
				</cps:tdContent>

				<cps:tdLabel>主要问题：</cps:tdLabel>
				<cps:tdContent id="zywt">
					${dw.cyry.zywt}&nbsp;
				</cps:tdContent>
			</cps:row>
			
			<cps:row>
				<cps:tdLabel>政审情况：</cps:tdLabel>
				<cps:tdContent id="zsqk">
					${dw.cyry.zsqk}&nbsp;
				</cps:tdContent>
			
				<cps:tdLabel>奖惩情况：</cps:tdLabel>
				<cps:tdContent id="jcqk">
					${dw.cyry.jcqk}&nbsp;
				</cps:tdContent>
			</cps:row>
			
			<cps:row>
				<cps:tdLabel>备注：</cps:tdLabel>
				<cps:tdContent width="15%" id="bz">
					${dw.cyry.bz}&nbsp;
				</cps:tdContent>
				
				<cps:tdLabel>派发时间：</cps:tdLabel>
				<cps:tdContent width="15%" id="pfsj">
					${dw.cyry.pfsj}&nbsp;
				</cps:tdContent>
			</cps:row>

			<cps:row>
				<cps:tdLabel width="11%">注销标识：</cps:tdLabel>
				<cps:tdContent width="22%" id="zxbs">
					<c:choose>
						<c:when test="${dw.cyry.zxbs eq '0'}">正常</c:when>
						<c:when test="${dw.cyry.zxbs eq '1'}">注销</c:when>
						<c:otherwise>&nbsp;</c:otherwise>
					</c:choose>
				</cps:tdContent>

				<cps:tdLabel width="11%">注销日期：</cps:tdLabel>
				<cps:tdContent width="22%" id="zxrq">
					${dw.cyry.zxrq}&nbsp;
				</cps:tdContent>
			</cps:row>

			<cps:row>
				<cps:tdLabel>注销原因：</cps:tdLabel>
				<cps:tdContent id="zxyy">
					${dw.cyry.zxyy}&nbsp;
				</cps:tdContent>
				<cps:tdLabel width="10%">登记人姓名：</cps:tdLabel>
				<cps:tdContent width="20%" id="djrxm">
					${dw.cyry.djrxm}&nbsp;
				</cps:tdContent>
			</cps:row>
			
			<cps:row>
				<cps:tdLabel width="10%">登记时间：</cps:tdLabel>
				<cps:tdContent width="20%" id="djsj">
					${dw.cyry.djsj}&nbsp;
				</cps:tdContent>

				<cps:tdLabel width="10%">登记单位：</cps:tdLabel>
				<cps:tdContent id="djdwmc">
					${dw.cyry.djdwmc}&nbsp;
				</cps:tdContent>
			</cps:row>
		</cps:table>
	</div>
</div>