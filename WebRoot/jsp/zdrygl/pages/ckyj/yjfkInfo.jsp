<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<creator:view>
<creator:Script src="/jsp/zdrygl/js/ckyj.js"></creator:Script>
<creator:tbar id="op">
	<c:if test="${!(operType == 'detail')}">
		<cps:button value="重置" onclick="resetForm('fkxxForm')"></cps:button>
		<cps:button value="保存" onclick="saveFkxx()"></cps:button>
	</c:if>
	<cps:button value="关闭" onclick="window.close()"></cps:button>
</creator:tbar>
	<creator:panel id="zdryxx" title="重点人员信息" tbarId="op">
		<cps:table>
			<cps:row>
				<cps:tdLabel width="13%">重点人员编号：</cps:tdLabel>
				<cps:tdContent width="16%">
					${ckxx.ckyj.zdrybh}&nbsp;
				</cps:tdContent>
				
				<cps:tdLabel width="13%">重点人员姓名：</cps:tdLabel>
				<cps:tdContent width="16%">
					${ckxx.ckyj.zdryxm}&nbsp;
				</cps:tdContent>
				
				<cps:tdLabel  width="13%">公民身份证号码：</cps:tdLabel>
				<cps:tdContent>
					${ckxx.ckyj.sfzh}&nbsp;
				</cps:tdContent>
				
				<cps:tdLabel rowspan="4" width="120">
					<img id="rkzpxx" src="<c:url value='/cps/common/showPoto.action'/>?sfzh=${ckxx.ckyj.sfzh}" width="120px" height="130px" title="全国人口库照片" alt="全国人口库照片"/>
				</cps:tdLabel>
			</cps:row>
			
			<cps:row>
				<cps:tdLabel>重点人员外文名：</cps:tdLabel>
				<cps:tdContent>
					${ckxx.ckyj.zdrywwxm}&nbsp;
				</cps:tdContent>
				
				<cps:tdLabel>其他证件号码：</cps:tdLabel>
				<cps:tdContent>
					${ckxx.ckyj.qtzjhm}&nbsp;
				</cps:tdContent>
				<cps:tdLabel>人员类别标识：</cps:tdLabel>
				
				<cps:tdContent>
					${ckxx.ckyj.zdrylbbjmc}&nbsp;
				</cps:tdContent>
			</cps:row>
		
			<cps:row>
				<cps:tdLabel>重点人员细类：</cps:tdLabel>
				<cps:tdContent>
					${ckxx.ckyj.zdryxlmc}&nbsp;
				</cps:tdContent>
				
				<cps:tdLabel>活动发生地点：</cps:tdLabel>
				<cps:tdContent colspan="3">
					${ckxx.ckyj.hdfsddxz}&nbsp;
				</cps:tdContent>
			</cps:row>
				
			<cps:row>
				<cps:tdLabel>活动发生时间：</cps:tdLabel>
				<cps:tdContent>
					${ckxx.ckyj.hdfssj}&nbsp;
				</cps:tdContent>
				
				<cps:tdLabel>所属社会场所：</cps:tdLabel>
				<cps:tdContent colspan="3">
					${ckxx.ckyj.hdfsddssshcs}&nbsp;
				</cps:tdContent>
			</cps:row>
		</cps:table>
	</creator:panel>

	<creator:panel id="yjfk" title="预警反馈信息">
		<div id="fkxx_div">
		<form id="fkxxForm">
			<input type="hidden" name="ckxx.yjfk.id" value="${ckxx.yjfk.id}"  id="id"/>
			<input type="hidden" name="ckxx.yjfk.ldxxbh" value="${ckxx.yjfk.ldxxbh}" id="ldxxbh" />
			<input type="hidden" name="ckxx.yjfk.czfkxxbh" value="${ckxx.yjfk.czfkxxbh}" id="czfkxxbh" />
			<input type="hidden" name="ckxx.yjfk.yjxxbh" value="${ckxx.yjfk.yjxxbh}" id="yjxxbh" />
			<input type="hidden" name="operType" value="${operType}" id="operType" />
			<input type="hidden" name="modeName" value="重点人员预警反馈" id="modeName" />
			
			<cps:table>
				<cps:row>
					<cps:tdLabel width="15%">动态信息类别：</cps:tdLabel>
					<cps:tdContent width="18%">
						<cps:select zdlb="ZDRY_DTXXLB" name="ckxx.yjfk.dtxxlb" id="dtxxlb" value="${ckxx.yjfk.dtxxlb}" headerValue=" " headerKey=""  />
					</cps:tdContent>
					
					<cps:tdLabel width="15%">发现目标社会场所：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield name="ckxx.yjfk.hdfsddssshcs" id="hdfsddssshcs" value="${ckxx.yjfk.hdfsddssshcs}" maxlength="60"/>
					</cps:tdContent>
					
					<cps:tdLabel width="15%"><font color="red">*</font>目标发现状态：</cps:tdLabel>
					<cps:tdContent width="18%">
						<cps:select zdlb="ZDRY_MBFXZT" name="ckxx.yjfk.mbfxzt" id="mbfxzt" value="${ckxx.yjfk.mbfxzt}"  headerValue=" " headerKey="" required="true"/>
					</cps:tdContent>
				</cps:row>
				
				<cps:row>
					<cps:tdLabel>发现活动地点：</cps:tdLabel>
					<cps:tdContent colspan="5">
						<cps:textfield name="ckxx.yjfk.hdfsddxz" value="${ckxx.yjfk.hdfsddxz}" id="hdfsddxz" maxlength="50" cssStyle="width:93.5%" />
					</cps:tdContent>
				</cps:row>
				
				<cps:row>
					<cps:tdLabel>发现活动相关信息：</cps:tdLabel>
					<cps:tdContent colspan="5">
						<cps:textfield type="textarea" name="ckxx.yjfk.fxhdxgxx" value="${ckxx.yjfk.fxhdxgxx}" id="fxhdxgxx" maxlength="200" cssStyle="width:93.5%;height:40px;" />
					</cps:tdContent>
				</cps:row>
				
				<cps:row>
					<cps:tdLabel>发现目标民警：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield name="ckxx.yjfk.fxmbzrmjxm" value="${ckxx.yjfk.fxmbzrmjxm}" maxlength="15" id="fxmbzrmjxm" appendPopuBtn="true" onclick="orgUserSelect('${loginInfo.rootOrgCode}','fxrsfz','fxrxm')" />
					</cps:tdContent>
					
					<cps:tdLabel>民警身份证号码：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield name="ckxx.yjfk.fxmbzrmjsfzh" maxlength='18' value="${ckxx.yjfk.fxmbzrmjsfzh}" id="fxmbzrmjsfzh"  />
					</cps:tdContent>
					
					<cps:tdLabel>发现活动时间：</cps:tdLabel>
					<cps:tdContent>
						<cps:date name="ckxx.yjfk.hdfssj" value="${ckxx.yjfk.hdfssj}"  id="hdfssj" dateFmt="yyyy-MM-dd HH:mm:ss"/>
					</cps:tdContent>
				</cps:row>
				
				<cps:row>
					<cps:tdLabel>发现目标单位：</cps:tdLabel>
					<cps:tdContent colspan="5">
						<cps:textfield name="ckxx.yjfk.fxmbzrdw" value="${ckxx.yjfk.fxmbzrdw}"  cssStyle="width:93.5%" readonly="true" id="fxmbzrdw" onclick="selectOrg('${loginInfo.rootOrgCode}','fxmbzrdw','fxmbzrdwjgdm')" appendPopuBtn="true"/>
						<input type="hidden" name="ckxx.yjfk.fxmbzrdwjgdm" value="${ckxx.yjfk.fxmbzrdwjgdm}" id="fxmbzrdwjgdm" />
					</cps:tdContent>
				</cps:row>
				
				<cps:row>
					<cps:tdLabel><font color='red'>*</font>采取处置措施：</cps:tdLabel>
					<cps:tdContent>
						<cps:select zdlb='ZDRY_CZCSLX'  name="ckxx.yjfk.cqczcs" value="${ckxx.yjfk.cqczcs}" id="cqczcs" headerValue=" " headerKey="" required="true"/>
					</cps:tdContent>
					
					<cps:tdLabel><font color='red'>*</font>处置措施细类：</cps:tdLabel>
					<cps:tdContent>
						<cps:select zdlb='ZDRY_CZCSXL' name="ckxx.yjfk.czcsxl" value="${ckxx.yjfk.czcsxl}" id="czcsxl" headerValue=" " headerKey="" required="true"/>
					</cps:tdContent>
					
					<cps:tdLabel>处置结果：</cps:tdLabel>
					<cps:tdContent>
						<cps:select zdlb="ZDRY_CZJG" name="ckxx.yjfk.czjg" id="czjg" value="${ckxx.yjfk.czjg}" headerValue=" " headerKey="" />
					</cps:tdContent>	
				</cps:row>
				
				<cps:row>
					<cps:tdLabel>处置详址：</cps:tdLabel>
					<cps:tdContent colspan="5">
						<cps:textfield name="ckxx.yjfk.czddxz" value="${ckxx.yjfk.czddzx}" id="czddxz" maxlength="50" cssStyle="width:93.5%"/>
					</cps:tdContent>
				</cps:row>
				
				<cps:row>
					<cps:tdLabel>处置反馈补充信息：</cps:tdLabel>
					<cps:tdContent colspan="5">
						<cps:textfield type="textarea" name="ckxx.yjfk.czfkbcxx" value="${ckxx.yjfk.czfkbcxx}" id="czfkbcxx" maxlength="100" cssStyle="width:93.5%;height:40px;"/>
					</cps:tdContent>
				</cps:row>
				
				<cps:row>
					<cps:tdLabel>处置经过描述：</cps:tdLabel>
					<cps:tdContent colspan="5">
						<cps:textfield type="textarea" name="ckxx.yjfk.czjgms" id="czjgms" value="${ckxx.yjfk.czjgms}" cssStyle="width:93.5%;height:38px;" />
					</cps:tdContent>
				</cps:row>
				
				<cps:row>
					<cps:tdLabel>毒品尿检信息：</cps:tdLabel>
					<cps:tdContent colspan="5">
						<cps:textfield name="ckxx.yjfk.xdchnjxx" value="${ckxx.yjfk.xdchnjxx}" id="xdchnjxx" maxlength="32" cssStyle="width:93.5%" />
					</cps:tdContent>
				</cps:row>
				
				<cps:row>
					<cps:tdLabel>现场物品信息：</cps:tdLabel>
					<cps:tdContent colspan="5">
						<cps:textfield name="ckxx.yjfk.xcchwpxx" value="${ckxx.yjfk.xcchwpxx}" maxlength="200" id="xcchwpxx" type="textarea" cssStyle="width:93.5%;height:40px;"/>
					</cps:tdContent>
				</cps:row>
				
				<cps:row>
					<cps:tdLabel><font color='red'>*</font>处置责任民警：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield name="ckxx.yjfk.czzrmjxm" id="czzrmjxm" value="${ckxx.yjfk.czzrmjxm}" maxlength="15" appendPopuBtn="true" onclick="orgUserSelect('${loginInfo.rootOrgCode}','zrmjsfzh','zrmjxm')" required="true"/>
					</cps:tdContent>
					
					<cps:tdLabel><font color='red'>*</font>责任民警身份证号码：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield name="ckxx.yjfk.czzrmjsfzh" maxlength="18" value="${ckxx.yjfk.czzrmjsfzh}" id="czzrmjsfzh" required="true"/>
					</cps:tdContent>
					
					<cps:tdLabel>处置时间：</cps:tdLabel>
					<cps:tdContent>
						<cps:date name="ckxx.yjfk.czsj" value="${ckxx.yjfk.czsj}" id="czsj" dateFmt="yyyy-MM-dd HH:mm:ss"/>
					</cps:tdContent>
				</cps:row>
				
				<cps:row>
					<cps:tdLabel><font color='red'>*</font>处置单位：</cps:tdLabel>
					<cps:tdContent colspan="5">
						<input type="hidden" name="ckxx.yjfk.czzrdwjgdm" value="${ckxx.yjfk.czzrdwjgdm}" id="czzrdwjgdm" />
						<cps:textfield name="ckxx.yjfk.czzrdw" value="${ckxx.yjfk.czzrdw}" cssStyle="width:93.5%"  readonly="true" id="czzrdw" onclick="selectOrg('${loginInfo.rootOrgCode}','czzrdwjgdm','czzrdw')" appendPopuBtn="true" required="true"/>
					</cps:tdContent>
				</cps:row>
				
				<cps:row>
					<cps:tdLabel>是否本人预警：</cps:tdLabel>
					<cps:tdContent>
						<cps:select zdlb="ZDY_ZDRY_SFBRYJ" name="ckxx.yjfk.sfbryj" value="${ckxx.yjfk.sfbryj}" id="sfbryj"  headerValue=" " headerKey=""/>
					</cps:tdContent>
					
					<cps:tdLabel>非本人预警产生原因：</cps:tdLabel>
					<cps:tdContent>
						<cps:select zdlb="ZDY_ZDRY_FBRYJCSYY" name="ckxx.yjfk.fbryjcsyy" value="${ckxx.yjfk.fbryjcsyy}" id="fbryjcsyy" headerValue=" " headerKey="" />
					</cps:tdContent>
					
					<cps:tdLabel>&nbsp;</cps:tdLabel>
					<cps:tdContent>&nbsp;</cps:tdContent>
				</cps:row>
				
				<cps:row>
					<cps:tdLabel>反馈人：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield name="ckxx.yjfk.fkrxm" value="${ckxx.yjfk.fkrxm}" maxlength="15" id="fkrxm" appendPopuBtn="true" onclick="orgUserSelect('${loginInfo.rootOrgCode}','fkrsfz','fkrxm')" />
					</cps:tdContent>
					
					<cps:tdLabel>反馈人身份证号码：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield name="ckxx.yjfk.fkrsfzh" maxlength="18" value="${ckxx.yjfk.fkrsfzh}" id="fkrsfzh"  />
					</cps:tdContent>
					
					<cps:tdLabel>反馈时间：</cps:tdLabel>
					<cps:tdContent>
						<cps:date name="ckxx.yjfk.fksj" value="${ckxx.yjfk.fksj}" id="fksj" dateFmt="yyyy-MM-dd HH:mm:ss"/>
					</cps:tdContent>
				</cps:row>
				
				<cps:row>
					<cps:tdLabel>反馈单位：</cps:tdLabel>
					<cps:tdContent colspan="5">
						<input type="hidden" name="ckxx.yjfk.fkdwjgdm" value="${ckxx.yjfk.fkdwjgdm}" id="fkdwjgdm" />
						<cps:textfield name="ckxx.yjfk.fkdw" value="${ckxx.yjfk.fkdw}"  cssStyle="width:93.5%" readonly="true" id="fkdw" onclick="selectOrg('${loginInfo.rootOrgCode}','fkdwjgdm','fkdw')" appendPopuBtn="true"/>
					</cps:tdContent>
				</cps:row>
				
				<cps:row>
					<cps:tdLabel>立线侦查工作评估：</cps:tdLabel>
					<cps:tdContent>
						<cps:select zdlb='ZDRY_LXZCGZPG' name="ckxx.yjfk.lxzcgzpg" id="lxzcgzpg" value="${ckxx.yjfk.lxzcgzpg}" headerValue=" " headerKey="" />
					</cps:tdContent>
					
					<cps:tdLabel>目标从事职业类型：</cps:tdLabel>
					<cps:tdContent>
						<cps:select zdlb='ZDRY_ZYLX' name="ckxx.yjfk.mbcszylx" value="${ckxx.yjfk.mbcszylx}" id="mbcszylx" headerValue=" " headerKey="" />
					</cps:tdContent>
					
					<cps:tdLabel>&nbsp;</cps:tdLabel>
					<cps:tdContent>&nbsp;</cps:tdContent>
				</cps:row>
				
				<cps:row>
					<cps:tdLabel>立线侦查工作评估依据：</cps:tdLabel>
					<cps:tdContent colspan="5">
						<cps:textfield name="ckxx.yjfk.lxzcgzpgyj" value="${ckxx.yjfk.lxzcgzpgyj}" type="textarea" maxlength="450" id="lxzcgzpgyj"  cssStyle="width:93.5%;height:38px" />
					</cps:tdContent>
				</cps:row>
			</cps:table>
		</form>
		</div>
	</creator:panel>
	<c:if test="${operType != 'detail'}">
		<cps:tableGrid list="${ckxx.yjfkList}" id="fkxxList" autoload="true"
			width="99.5%" height="200" isAsynch="false" title="反馈信息列表"
			mutilSelect="false" usepager="false" click="fullYjfkForm">
			<cps:column isNumber="true" title="序号" width="5%"></cps:column>
			<cps:column title="处置人姓名" field="czzrmjxm" align="left"></cps:column>
			<cps:column title="处置时间" field="czsj" ></cps:column>
			<cps:column title="采取处置措施" field="cqczcsmc" align="left"></cps:column>
			<cps:column title="处置措施细类" field="czcsxlmc" align="left"></cps:column>
			<cps:column title="处置结果" field="czjgmc" align="left"></cps:column>
		</cps:tableGrid>
	</c:if>
</creator:view>