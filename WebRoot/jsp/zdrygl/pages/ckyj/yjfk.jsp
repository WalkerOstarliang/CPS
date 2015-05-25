<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<creator:view>
	<creator:panel title="常控预警反馈信息">
		<fieldset>
			<legend>预警信息</legend>
			<cps:table>
				<cps:row>
					<cps:tdLabel>预警级别</cps:tdLabel>
					<cps:tdLabel>重点人员编号</cps:tdLabel>
					<cps:tdLabel>重点人员姓名</cps:tdLabel>
					<cps:tdLabel>身份证号码</cps:tdLabel>
					<cps:tdLabel>重点人员类别</cps:tdLabel>
					<cps:tdLabel>重点人员细类</cps:tdLabel>
				</cps:row>
				<cps:row>
					<cps:tdContent>${ckxx.ckyj.yjjb}&nbsp;</cps:tdContent>
					<cps:tdContent>${ckxx.ckyj.zdrybh}&nbsp;</cps:tdContent>
					<cps:tdContent>${ckxx.ckyj.zdryxm}&nbsp;</cps:tdContent>
					<cps:tdContent>${ckxx.ckyj.sfzh}&nbsp;</cps:tdContent>
					<cps:tdContent>${ckxx.ckyj.zdrylbbj}&nbsp;</cps:tdContent>
					<cps:tdContent>${ckxx.ckyj.zdryxl}&nbsp;</cps:tdContent>
				</cps:row>
			</cps:table>
		</fieldset>
		
		<fieldset>
			<legend>签收信息</legend>
			<cps:table>
				<cps:row>
					<cps:tdLabel>预警信息编号：</cps:tdLabel>
					<cps:tdContent>${ckxx.ckyj.yjxxbh}&nbsp;</cps:tdContent>
					
					<cps:tdLabel>签收人姓名：</cps:tdLabel>
					<cps:tdContent>${ckxx.yjqs.qsrxm}&nbsp;</cps:tdContent>
					
					<cps:tdLabel>身份证号码：</cps:tdLabel>
					<cps:tdContent>${ckxx.yjqs.qsrsfzh}&nbsp;</cps:tdContent>
				</cps:row>
				
				<cps:row>
					<cps:tdLabel>签收单位：</cps:tdLabel>
					<cps:tdContent colspan="3">${ckxx.yjqs.qsdw}&nbsp;</cps:tdContent>
					
					<cps:tdLabel>签收时间：</cps:tdLabel>
					<cps:tdContent>${ckxx.yjqs.qssj}&nbsp;</cps:tdContent>
				</cps:row>
			</cps:table>
		</fieldset>
		
			<cps:tableGrid list="${ckxx.yjfkList}" id="fkxxList" autoload="true"
				width="99.5%" height="150" isAsynch="false" click=""
				mutilSelect="false" usepager="false">
				<cps:column isNumber="true" title="序号" width="5%"></cps:column>
				<cps:column title="姓名" field="xtmc"></cps:column>
				<cps:column title="处置时间" field="afglsxmc" ></cps:column>
				<cps:column title="采取处置措施" field="xtjcqkmc" ></cps:column>
				<cps:column title="管控措施" field="afxtgly"></cps:column>
				<cps:column title="处置结果" field="afxtzsdh" ></cps:column>
				<cps:column title="省级处置结果" field="afxtzsdh" ></cps:column>
			</cps:tableGrid>
			
			<form id="fkxxForm">
				<input type="hidden" name="" value="" />
				<input type="hidden" name="" value="" />
				<input type="hidden" name="" value="" />
				
				<cps:table>
					<cps:row>
						<cps:tdLabel>目标发现状态：</cps:tdLabel>
						<cps:tdContent>
							<cps:textfield name="${ckxx.yjfk.}" value="${ckxx.yjfk.}"  />
						</cps:tdContent>
						
						<cps:tdLabel>目标活动类型：</cps:tdLabel>
						<cps:tdContent>
							<cps:textfield name="${ckxx.yjfk.}" value="${ckxx.yjfk.}"  />
						</cps:tdContent>
						
						<cps:tdLabel>发现活动时间：</cps:tdLabel>
						<cps:tdContent>
							<cps:textfield name="${ckxx.yjfk.}" value="${ckxx.yjfk.}"  />
						</cps:tdContent>
					</cps:row>
					
					<cps:row>
						<cps:tdLabel>发现活动地点：</cps:tdLabel>
						<cps:tdContent colspan="3">
							<cps:textfield name="${ckxx.yjfk.}" value="${ckxx.yjfk.}"  />
						</cps:tdContent>
						
						<cps:tdLabel>发现目标社会场所：</cps:tdLabel>
						<cps:tdContent>
							<cps:textfield name="${ckxx.yjfk.}" value="${ckxx.yjfk.}"  />
						</cps:tdContent>
					</cps:row>
					
					<cps:row>
						<cps:tdLabel>发现活动相关信息：</cps:tdLabel>
						<cps:tdContent>
							<cps:textfield name="${ckxx.yjfk.}" value="${ckxx.yjfk.}"  />
						</cps:tdContent>
					</cps:row>
					
					<cps:row>
						<cps:tdLabel>发现目标民警：</cps:tdLabel>
						<cps:tdContent>
							<cps:textfield name="${ckxx.yjfk.}" value="${ckxx.yjfk.}"  />
						</cps:tdContent>
						
						<cps:tdLabel>民警身份证号码：</cps:tdLabel>
						<cps:tdContent>
							<cps:textfield name="${ckxx.yjfk.}" value="${ckxx.yjfk.}"  />
						</cps:tdContent>
						
						<cps:tdLabel>发现目标单位：</cps:tdLabel>
						<cps:tdContent>
							<cps:textfield name="${ckxx.yjfk.}" value="${ckxx.yjfk.}"  />
						</cps:tdContent>
					</cps:row>
					
					<cps:row>
						<cps:tdLabel>采取处置措施：</cps:tdLabel>
						<cps:tdContent>
							<cps:textfield name="${ckxx.yjfk.}" value="${ckxx.yjfk.}"  />
						</cps:tdContent>
						
						<cps:tdLabel>处置措施细类：</cps:tdLabel>
						<cps:tdContent>
							<cps:textfield name="${ckxx.yjfk.}" value="${ckxx.yjfk.}"  />
						</cps:tdContent>
						
						<cps:tdLabel>处置地点：</cps:tdLabel>
						<cps:tdContent>
							<cps:textfield name="${ckxx.yjfk.}" value="${ckxx.yjfk.}"  />
						</cps:tdContent>
					</cps:row>
					
					<cps:row>
						<cps:tdLabel>处置结果：</cps:tdLabel>
						<cps:tdContent>
							<cps:textfield name="${ckxx.yjfk.}" value="${ckxx.yjfk.}"  />
						</cps:tdContent>
						
						<cps:tdLabel>处置时间：</cps:tdLabel>
						<cps:tdContent>
							<cps:textfield name="${ckxx.yjfk.}" value="${ckxx.yjfk.}"  />
						</cps:tdContent>
						
						<cps:tdLabel>处置责任民警：</cps:tdLabel>
						<cps:tdContent>
							<cps:textfield name="${ckxx.yjfk.}" value="${ckxx.yjfk.}"  />
						</cps:tdContent>
					</cps:row>
					
					<cps:row>
						<cps:tdLabel>处置单位：</cps:tdLabel>
						<cps:tdContent>
							<cps:textfield name="${ckxx.yjfk.}" value="${ckxx.yjfk.}"  />
						</cps:tdContent>
						
						<cps:tdLabel>责任民警身份证号码：：</cps:tdLabel>
						<cps:tdContent>
							<cps:textfield name="${ckxx.yjfk.}" value="${ckxx.yjfk.}"  />
						</cps:tdContent>
						
						<cps:tdLabel>反馈人身份证号码：</cps:tdLabel>
						<cps:tdContent>
							<cps:textfield name="${ckxx.yjfk.}" value="${ckxx.yjfk.}"  />
						</cps:tdContent>
					</cps:row>
					
					<cps:row>
						<cps:tdLabel>反馈单位：</cps:tdLabel>
						<cps:tdContent>
							<cps:textfield name="${ckxx.yjfk.}" value="${ckxx.yjfk.}"  />
						</cps:tdContent>
						
						<cps:tdLabel>反馈人：：</cps:tdLabel>
						<cps:tdContent>
							<cps:textfield name="${ckxx.yjfk.}" value="${ckxx.yjfk.}"  />
						</cps:tdContent>
						
						<cps:tdLabel>反馈时间：</cps:tdLabel>
						<cps:tdContent>
							<cps:textfield name="${ckxx.yjfk.}" value="${ckxx.yjfk.}"  />
						</cps:tdContent>
					</cps:row>
					
					<cps:row>
						<cps:tdLabel>毒品尿检信息：</cps:tdLabel>
						<cps:tdContent>
							<cps:textfield name="${ckxx.yjfk.}" value="${ckxx.yjfk.}"  />
						</cps:tdContent>
					</cps:row>
					
					<cps:row>
						<cps:tdLabel>现场物品信息：</cps:tdLabel>
						<cps:tdContent>
							<cps:textfield name="${ckxx.yjfk.}" value="${ckxx.yjfk.}"  />
						</cps:tdContent>
					</cps:row>
					
					<cps:row>
						<cps:tdLabel>处置经过描述：</cps:tdLabel>
						<cps:tdContent>
							<cps:textfield name="${ckxx.yjfk.}" value="${ckxx.yjfk.}"  />
						</cps:tdContent>
					</cps:row>
				</cps:table>
			</form>
	</creator:panel>
</creator:view>