<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>

<creator:view>
	<creator:Script src="/jsp/zdrygl/js/staffsurvey.js"></creator:Script>
	<link type="text/css"
		href="<c:url value='/jsp/zdrygl/images/css.css'/>" rel="stylesheet" />
	<creator:panel id="gzxx" title="动态信息 > 工作信息">
		<form id="gzxxForm">
			<input type="hidden" name="gzxx.sfzh" id="sfzh" value="${sfzh }" /> 
			<cps:table>
				<cps:row>
					<cps:tdLabel cssStyle="width:13%">档案号：</cps:tdLabel>
					<cps:tdContent cssStyle="width:20%">
						<cps:textfield id="dah" name="gzxx.dah" value="${gzxx.dah }"></cps:textfield>
					</cps:tdContent>
					<cps:tdLabel cssStyle="width:13%">法律文书编号：</cps:tdLabel>
					<cps:tdContent cssStyle="width:20%">
						<cps:textfield id="flwsbh" name="gzxx.flwsbh" value="${gzxx.flwsbh }"></cps:textfield>
					</cps:tdContent>
					<cps:tdLabel cssStyle="width:13%">法律文书名称：</cps:tdLabel>
					<cps:tdContent cssStyle="width:20%">
						<cps:textfield id="flwsmc" name="gzxx.flwsmc" value="${gzxx.flwsmc }"></cps:textfield>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel cssStyle="width:13%">工作对象分类：</cps:tdLabel>
					<cps:tdContent cssStyle="width:20%">
						<cps:textfield id="gzdxfl" name="gzxx.gzdxfl" value="${gzxx.gzdxfl }"></cps:textfield>
					</cps:tdContent>
					<cps:tdLabel cssStyle="width:13%">别名绰号：</cps:tdLabel>
					<cps:tdContent cssStyle="width:20%">
						<cps:textfield id="bmch" name="gzxx.bmch" value="${gzxx.bmch }"></cps:textfield>
					</cps:tdContent>
					<cps:tdLabel cssStyle="width:13%">居住地址：</cps:tdLabel>
					<cps:tdContent cssStyle="width:20%">
						<cps:textfield id="jzdz" name="gzxx.jzdz" value="${gzxx.jzdz }"></cps:textfield>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel cssStyle="width:13%">管理派出所：</cps:tdLabel>
					<cps:tdContent cssStyle="width:20%">
						<cps:textfield id="glpcs" name="gzxx.glpcs" value="${gzxx.glpcs }"></cps:textfield>
					</cps:tdContent>
					<cps:tdLabel cssStyle="width:13%">居委会：</cps:tdLabel>
					<cps:tdContent cssStyle="width:20%">
						<cps:textfield id="jwh" name="gzxx.jwh" value="${gzxx.jwh }"></cps:textfield>
					</cps:tdContent>
					<cps:tdLabel cssStyle="width:13%">消费水平：</cps:tdLabel>
					<cps:tdContent cssStyle="width:20%">
						<cps:textfield id="xfsp" name="gzxx.xfsp" value="${gzxx.xfsp }"></cps:textfield>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel cssStyle="width:13%">特别嗜好：</cps:tdLabel>
					<cps:tdContent cssStyle="width:20%">
						<cps:select id="tbsh" name="gzxx.tbsh" zdlb="ZDRY_TBSH" value="${gzxx.tbsh}" headerKey=""
									headerValue="--请选择--"></cps:select>
					</cps:tdContent>
					<cps:tdLabel cssStyle="width:13%">在逃标识：</cps:tdLabel>
					<cps:tdContent cssStyle="width:20%">
						<cps:textfield id="ztbs" name="gzxx.ztbs" value="${gzxx.ztbs }"></cps:textfield>
					</cps:tdContent>
					<cps:tdLabel cssStyle="width:13%">信息采集依据：</cps:tdLabel>
					<cps:tdContent cssStyle="width:20%">
						<cps:textfield id="xxcjyj" name="gzxx.xxcjyj" value="${gzxx.xxcjyj }"></cps:textfield>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel cssStyle="width:13%">指纹采集情况：</cps:tdLabel>
					<cps:tdContent cssStyle="width:20%">
						<cps:textfield id="zwcjqk" name="gzxx.zwcjqk" value="${gzxx.zwcjqk }"></cps:textfield>
					</cps:tdContent>
					<cps:tdLabel cssStyle="width:13%">笔记采集情况：</cps:tdLabel>
					<cps:tdContent cssStyle="width:20%">
						<cps:textfield id="bjcjqk" name="gzxx.bjcjqk" value="${gzxx.bjcjqk }"></cps:textfield>
					</cps:tdContent>
					<cps:tdLabel cssStyle="width:13%">监督办案部门：</cps:tdLabel>
					<cps:tdContent cssStyle="width:20%">
						<cps:textfield id="jdbabm" name="gzxx.jdbabm" value="${gzxx.jdbabm }"></cps:textfield>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel cssStyle="width:13%">现实状况：</cps:tdLabel>
					<cps:tdContent cssStyle="width:20%">
						<cps:select id="xszk" name="gzxx.xszk" zdlb="ZDRY_XSZK" value="${gzxx.xszk}" headerKey=""
									headerValue="--请选择--"></cps:select>
					</cps:tdContent>
					<cps:tdLabel cssStyle="width:13%">管区民警：</cps:tdLabel>
					<cps:tdContent cssStyle="width:20%">
						<cps:textfield id="gqmj" name="gzxx.gqmj" value="${gzxx.gqmj }"></cps:textfield>
					</cps:tdContent>
					<cps:tdLabel cssStyle="width:13%">管理基本：</cps:tdLabel>
					<cps:tdContent cssStyle="width:20%">
						<cps:textfield id="gljb" name="gzxx.gljb" value="${gzxx.gljb }"></cps:textfield>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel cssStyle="width:13%">采集人员：</cps:tdLabel>
					<cps:tdContent cssStyle="width:20%">
						<cps:textfield id="cjry" name="gzxx.cjry" value="${gzxx.cjry }"></cps:textfield>
					</cps:tdContent>
					<cps:tdLabel cssStyle="width:13%">采集时间：</cps:tdLabel>
					<cps:tdContent cssStyle="width:20%">
						<cps:date name="gzxx.toChar_cjsj" value="${gzxx.toChar_cjsj}" id="toChar_cjsj"></cps:date>
					</cps:tdContent>
					<cps:tdLabel cssStyle="width:13%">签发机关：</cps:tdLabel>
					<cps:tdContent cssStyle="width:20%">
						<cps:textfield id="qfjg" name="gzxx.qfjg" value="${gzxx.qfjg }"></cps:textfield>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel cssStyle="width:13%">签发时间：</cps:tdLabel>
					<cps:tdContent cssStyle="width:20%">
						<cps:date name="gzxx.toChar_qfsj" value="${gzxx.toChar_qfsj}" id="toChar_qfsj"></cps:date>
					</cps:tdContent>
					<cps:tdLabel cssStyle="width:13%">管理方法：</cps:tdLabel>
					<cps:tdContent cssStyle="width:20%">
						<cps:textfield id="glff" name="gzxx.glff" value="${gzxx.glff }"></cps:textfield>
					</cps:tdContent>
					<cps:tdLabel cssStyle="width:13%"> &nbsp;</cps:tdLabel>
					<cps:tdContent cssStyle="width:20%">
						&nbsp;
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel cssStyle="width:13%">管理类别：</cps:tdLabel>
					<cps:tdContent cssStyle="width:20%" colspan="5">
						<cps:select id="gllb" name="gzxx.gllb" zdlb="ZDRY_GLLB" value="${gzxx.gllb}" headerKey="" cssClass="select260"
									headerValue="--请选择--"></cps:select>
					</cps:tdContent>	
				</cps:row>
				<cps:row>
					<cps:tdLabel cssStyle="width:13%">信息采集简述：</cps:tdLabel>
					<cps:tdContent colspan="5">
						<cps:textfield id="xxcjjs" name="gzxx.xxcjjs" value="${gzxx.xxcjjs }"></cps:textfield>
					</cps:tdContent>
				</cps:row>
			</cps:table>
		</form>
	</creator:panel>
	<cps:button value="保存" onclick="saveValue('gzxxForm','gzxx');"></cps:button>
</creator:view>