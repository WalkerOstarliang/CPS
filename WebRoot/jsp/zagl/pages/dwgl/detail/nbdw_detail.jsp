<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view>
	<cps:table>
		<cps:row>
			<cps:tdLabel><font color="red">*</font>单位分类：</cps:tdLabel>
			<cps:tdContent colspan="3">
				${dw.nbdw.dwflmc}&nbsp;${dw.nbdw.dwxlmc}
			</cps:tdContent>

			<cps:tdLabel>重点级别：</cps:tdLabel>
			<cps:tdContent>
				${dw.nbdw.zddjmc}&nbsp;
			</cps:tdContent>
		</cps:row>
		<cps:row>
			<cps:tdLabel width="15%">保卫负责人：</cps:tdLabel>
			<cps:tdContent width="18%">
				${dw.nbdw.bwbmfzr}&nbsp;
			</cps:tdContent>
			<cps:tdLabel width="15%">负责人身份证：</cps:tdLabel>
			<cps:tdContent width="18%">
				${dw.nbdw.bwbmfzrsfzh}&nbsp;
			</cps:tdContent>
			<cps:tdLabel width="15%">负责人电话：</cps:tdLabel>
			<cps:tdContent>
				${dw.nbdw.bwfzrlxdh}&nbsp;
			</cps:tdContent>
		</cps:row>
		<cps:row>
			<cps:tdLabel>单位性质：</cps:tdLabel>
			<cps:tdContent>
				${dw.nbdw.dwxzmc}&nbsp;
			</cps:tdContent>

			<cps:tdLabel>单位联络人：</cps:tdLabel>
			<cps:tdContent>
				${dw.nbdw.dwllr}&nbsp;
			</cps:tdContent>
			
			<cps:tdLabel>内外网互通：</cps:tdLabel>
			<cps:tdContent>
				<c:choose>
					<c:when test="${dw.nbdw.sfnwwht eq '1'}">是</c:when>
					<c:when test="${dw.nbdw.sfnwwht eq '0'}">否</c:when>
					<c:otherwise>&nbsp;</c:otherwise>
				</c:choose>
			</cps:tdContent>
		</cps:row>
		
		<cps:row>
			<cps:tdLabel>因特网站域名：</cps:tdLabel>
			<cps:tdContent>
				${dw.nbdw.ytwzym}&nbsp;
			</cps:tdContent>
			<cps:tdLabel>内部局域网名称：</cps:tdLabel>
			<cps:tdContent>
				${dw.nbdw.nbjywmc}&nbsp;
			</cps:tdContent>
			<cps:tdLabel>内部BBS名称：</cps:tdLabel>
			<cps:tdContent>
				${dw.nbdw.nbbbsmc}&nbsp;
			</cps:tdContent>
		</cps:row>
		
		<cps:row>
			<cps:tdLabel>保卫机构设置：</cps:tdLabel>
			<cps:tdContent>
				${dw.nbdw.bwjgsz}&nbsp;
			</cps:tdContent>
			<cps:tdLabel>年利润：</cps:tdLabel>
			<cps:tdContent>
				${dw.nbdw.nlr}(万元)
			</cps:tdContent>

			<cps:tdLabel>年销售额：</cps:tdLabel>
			<cps:tdContent>
				${dw.nbdw.nxse}(万元)
			</cps:tdContent>
		</cps:row>
		
		<cps:row>
			<cps:tdLabel>签订责任书日期：</cps:tdLabel>
			<cps:tdContent>
				${dw.nbdw.qdzazrssj}&nbsp;
			</cps:tdContent>
			<cps:tdLabel>经营状况：</cps:tdLabel>
			<cps:tdContent>
				${dw.nbdw.scjyzk}&nbsp;
			</cps:tdContent>

			<cps:tdLabel>技防情况：</cps:tdLabel>
			<cps:tdContent>
				${dw.nbdw.jfqk}
			</cps:tdContent>

		</cps:row>
		<cps:row>
			<cps:tdContent colspan="6" cssStyle="background-color:#FFF0B2;font-weight:600">单位员工情况：</cps:tdContent>
		</cps:row>
		<cps:row>
			<cps:tdLabel>在岗职工数：</cps:tdLabel>
			<cps:tdContent>
				${dw.nbdw.zgzgs}(人)
			</cps:tdContent>
			
			<cps:tdLabel>临时职工数：</cps:tdLabel>
			<cps:tdContent>
				${dw.nbdw.lsgs}(人)
			</cps:tdContent>
			
			<cps:tdLabel>职工(学生)数：</cps:tdLabel>
			<cps:tdContent>
				${dw.nbdw.zgxsrs}(人)
			</cps:tdContent>
		</cps:row>
		
		<cps:row>
			<cps:tdLabel>外聘专家数：</cps:tdLabel>
			<cps:tdContent>
				${dw.nbdw.wpzjs}(人)
			</cps:tdContent>

			<cps:tdLabel>外籍员工数：</cps:tdLabel>
			<cps:tdContent>
				${dw.nbdw.wjssygs}(人)
			</cps:tdContent>

			<cps:tdLabel>港澳台员工数：</cps:tdLabel>
			<cps:tdContent>
				${dw.nbdw.gatssygs}(人)
			</cps:tdContent>
		</cps:row>
		
		<cps:row>
			<cps:tdLabel>少数民族员工数：</cps:tdLabel>
			<cps:tdContent>
				${dw.nbdw.ssmzssygs}(人)
			</cps:tdContent>
			<cps:tdLabel>新疆员工数：</cps:tdLabel>
			<cps:tdContent>
				${dw.nbdw.xjygs}(人)
			</cps:tdContent>
			<cps:tdLabel>离退休人员数：</cps:tdLabel>
			<cps:tdContent>
				${dw.nbdw.ltxrys}(人)
			</cps:tdContent>
		</cps:row>
		
		<cps:row>
			<cps:tdLabel>下岗职工数：</cps:tdLabel>
			<cps:tdContent>
				${dw.nbdw.xgzgs}(人)
			</cps:tdContent>
			<cps:tdLabel>&nbsp;</cps:tdLabel>
			<cps:tdContent>
				&nbsp;
			</cps:tdContent>
			<cps:tdLabel>&nbsp;</cps:tdLabel>
			<cps:tdContent>
				&nbsp;
			</cps:tdContent>
		</cps:row>
		
		<cps:row>
			<cps:tdContent colspan="6" cssStyle="background-color:#FFF0B2;font-weight:600">保卫力量情况：</cps:tdContent>
		</cps:row>
			<cps:row>
			<cps:tdLabel>专职保卫数：</cps:tdLabel>
			<cps:tdContent>
				${dw.nbdw.zzbwgbs}(人)
			</cps:tdContent>

			<cps:tdLabel>兼职保卫数：</cps:tdLabel>
			<cps:tdContent>
				${dw.nbdw.jzbwgbs}(人)
			</cps:tdContent>

			<cps:tdLabel>护卫人数：</cps:tdLabel>
			<cps:tdContent>
				${dw.nbdw.hwrs}(人)
			</cps:tdContent>
		</cps:row>
		<cps:row>
			<cps:tdLabel>经警数：</cps:tdLabel>
			<cps:tdContent>
				${dw.nbdw.jjs}(人)
			</cps:tdContent>
			
			<cps:tdLabel>保安数：</cps:tdLabel>
			<cps:tdContent>
				${dw.nbdw.bas}(人)
			</cps:tdContent>
			
			<cps:tdLabel>保卫犬数：</cps:tdLabel>
			<cps:tdContent>
				${dw.nbdw.hwqs}(头)
			</cps:tdContent>
		</cps:row>
		
		<cps:row>
			<cps:tdLabel>警棍数：</cps:tdLabel>
			<cps:tdContent>
				${dw.nbdw.jgs}(根)
			</cps:tdContent>
			
			<cps:tdLabel>装备摩托车数：</cps:tdLabel>
			<cps:tdContent>
				${dw.nbdw.zbmtcs}(辆)
			</cps:tdContent>
			<cps:tdLabel>装备汽车数：</cps:tdLabel>
			<cps:tdContent>
				<${dw.nbdw.zbqcs}(辆)
			</cps:tdContent>
		</cps:row>
		<cps:row>
			<cps:tdLabel>装备电台数：</cps:tdLabel>
			<cps:tdContent>
				${dw.nbdw.zbdts}(部)
			</cps:tdContent>
			
			<cps:tdLabel>要害部位数：</cps:tdLabel>
			<cps:tdContent>
				${dw.nbdw.yhbws}&nbsp;
			</cps:tdContent>
			
			<cps:tdLabel>夜间是否值班：</cps:tdLabel>
			<cps:tdContent>
				<c:choose>
					<c:when test="${dw.nbdw.sfyjzb eq '1'}" >是</c:when>
					<c:when test="${dw.nbdw.sfyjzb eq '0'}" >否</c:when>
					<c:otherwise></c:otherwise>
				</c:choose>
			</cps:tdContent>
		</cps:row>

		<cps:row>
			<cps:tdLabel>其他装备情况：</cps:tdLabel>
			<cps:tdContent colspan="5">
				${dw.nbdw.zbqk}&nbsp;
			</cps:tdContent>
		</cps:row>
	</cps:table>
</creator:view>