<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>

<creator:view>
	<creator:Script src="/jsp/gzgl/js/jws.js"></creator:Script>
	<creator:tbar  id="pcstbar">
		<cps:button id="savebtn" value="修&nbsp;改" onclick="updatePcsInfo('','update')"></cps:button>
	</creator:tbar>
	<creator:panel id="pcsglpanel" title="派出所基本信息" tbarId="pcstbar">
		<form id="pcsform">
				<input type="text" id="id" name="pcsBean.id" value="${pcsBean.id }"/>
				<input type="hidden" id="orgcode" name="pcsBean.orgcode" value="${pcsBean.orgcode }"/>
				<input type="hidden" id="ispcs" name="pcsBean.ispcs" value="${pcsBean.ispcs }"/>
			<cps:table>
				<cps:row id="clear_row2">
					<cps:tdLabel width="12%"><font color="red">*</font>派出所名称：</cps:tdLabel>
					<cps:tdContent width="22%">
						&nbsp;${pcsBean.orgname}
					</cps:tdContent>
					<cps:tdLabel width="12%"><font color="red">*</font>级别：</cps:tdLabel>
					<cps:tdContent width="22%">
						&nbsp;${pcsBean.jb}
					</cps:tdContent>
					<cps:tdLabel width="12%">等级：</cps:tdLabel>
					<cps:tdContent width="22%">
						&nbsp;${pcsBean.dj}
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>办公地点类型：</cps:tdLabel>
					<cps:tdContent>
						&nbsp;${pcsBean.bgddlx}
					</cps:tdContent>
					<cps:tdLabel >网络接入方式：</cps:tdLabel>
					<cps:tdContent >
						&nbsp;${pcsBean.wljrfs}
					</cps:tdContent>
					<cps:tdLabel>&nbsp;</cps:tdLabel>
					<cps:tdContent>&nbsp;</cps:tdContent>
				</cps:row>
				<cps:row id="clear_row3">
					<cps:tdLabel>类别：</cps:tdLabel>
					<cps:tdContent>
						&nbsp;${pcsBean.lb}
					</cps:tdContent>
					<cps:tdLabel>编制数：</cps:tdLabel>
					<cps:tdContent>
						&nbsp;${pcsBean.bzs}
					</cps:tdContent>
					<cps:tdLabel>警力数：</cps:tdLabel>
					<cps:tdContent>
						&nbsp;${pcsBean.jls}
					</cps:tdContent>
				</cps:row>
				<cps:row id="clear_row5">
					<cps:tdLabel>辅警数：</cps:tdLabel>
					<cps:tdContent>
						&nbsp;${pcsBean.fjs}
					</cps:tdContent>
					<cps:tdLabel>其中社区（驻村）民警配备辅警数：</cps:tdLabel>
					<cps:tdContent>
						&nbsp;${pcsBean.sqmjpbfjs}
					</cps:tdContent>
					<cps:tdLabel>所长是否进乡镇（街道）班子：</cps:tdLabel>
					<cps:tdContent>
						&nbsp;${pcsBean.szsfjrxzbz}
					</cps:tdContent>
				</cps:row>
			 	<cps:row>
					<cps:tdLabel >警务模式：</cps:tdLabel>
					<cps:tdContent >
						&nbsp;${pcsBean.jwmsd}队
						&nbsp;${pcsBean.jwmss}室
					</cps:tdContent>
					<cps:tdLabel >队室名称(一队)：</cps:tdLabel>
					<cps:tdContent >
						&nbsp;${pcsBean.dsmc1}
					</cps:tdContent>
					<cps:tdLabel >队室名称(二队)：</cps:tdLabel>
					<cps:tdContent >
						&nbsp;${pcsBean.dsmc2}
					</cps:tdContent>
				</cps:row>
				<cps:row id="clear_row7">
					<cps:tdLabel >队室名称(三队)：</cps:tdLabel>
					<cps:tdContent >
						&nbsp;${pcsBean.dsmc3}
					</cps:tdContent>
					<cps:tdLabel >队室名称(室)：</cps:tdLabel>
					<cps:tdContent >
						&nbsp;${pcsBean.dsmc4}
					</cps:tdContent>
					<cps:tdLabel>值班模式：</cps:tdLabel>
					<cps:tdContent>
						&nbsp;${pcsBean.zbmsb}队
						&nbsp;${pcsBean.zbmsl}室
					</cps:tdContent>
				</cps:row>
				 
				<cps:row>
					<cps:tdLabel>值班警车(台)：</cps:tdLabel>
					<cps:tdContent>
						&nbsp;${pcsBean.zbjc}
					</cps:tdContent>
					<cps:tdLabel>值班人数(警力)：</cps:tdLabel>
					<cps:tdContent>
						&nbsp;${pcsBean.zbrsjl}
					</cps:tdContent>
					<cps:tdLabel>值班人数(领导数)：</cps:tdLabel>
					<cps:tdContent>
						&nbsp;${pcsBean.zbrslds}
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>值班人数(辅警数)：</cps:tdLabel>
					<cps:tdContent>
						&nbsp;${pcsBean.zbrsfjs}
					</cps:tdContent>
					<cps:tdLabel>乡镇(街道)：</cps:tdLabel>
					<cps:tdContent>
						&nbsp;${pcsBean.xzjd}
					</cps:tdContent>
					<cps:tdLabel>&nbsp;</cps:tdLabel>
					<cps:tdContent>
						&nbsp;
					</cps:tdContent>
					
				</cps:row>
				<cps:row>
					<cps:tdLabel>社区数：</cps:tdLabel>
					<cps:tdContent>
						&nbsp;${pcsBean.sqs}
					</cps:tdContent>
					<cps:tdLabel>行政村数：</cps:tdLabel>
					<cps:tdContent>
						&nbsp;${pcsBean.xzcs}
					</cps:tdContent>
					<cps:tdLabel>警务区数：</cps:tdLabel>
					<cps:tdContent>
						&nbsp;${pcsBean.sqjwss}
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>社区民警数：</cps:tdLabel>
					<cps:tdContent>
						&nbsp;${pcsBean.sqmjs}
					</cps:tdContent>
					<cps:tdLabel>专职社区民警：</cps:tdLabel>
					<cps:tdContent>
						&nbsp;${pcsBean.zzsqmjs}
					</cps:tdContent>
					<cps:tdLabel>社区民警占警力比：</cps:tdLabel>
					<cps:tdContent>
						&nbsp;${pcsBean.sqmjzjlb}
					</cps:tdContent>
				</cps:row>
				
				<cps:row>
					<cps:tdLabel>辖区面积：</cps:tdLabel>
					<cps:tdContent>
						&nbsp;${pcsBean.xqmj}
					</cps:tdContent>
					<cps:tdLabel>户籍人口数：</cps:tdLabel>
					<cps:tdContent>
						&nbsp;${pcsBean.hjrks}
					</cps:tdContent>
					<cps:tdLabel>暂住人口数：</cps:tdLabel>
					<cps:tdContent>
						&nbsp;${pcsBean.zzrks}
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>重点对象数：</cps:tdLabel>
					<cps:tdContent>
						&nbsp;${pcsBean.zddxs}
					</cps:tdContent>
					<cps:tdLabel>重点单位数：</cps:tdLabel>
					<cps:tdContent>
						&nbsp;${pcsBean.zddws}
					</cps:tdContent>
					<cps:tdLabel>重点场所数：</cps:tdLabel>
					<cps:tdContent>
						&nbsp;${pcsBean.zdcss}
					</cps:tdContent>
				</cps:row>
			</cps:table>
		</form>
	</creator:panel> 
</creator:view>