<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<creator:view title="协管队员信息">
	<script type="text/javascript" src="${contextPath}/jsp/afgl/js/xgdyxx.js"></script>
	<script type="text/javascript" src="${contextPath}/jsp/afgl/js/af.js"></script>
	
	<creator:tbar id="tbar">
		<cps:button value="保存" onclick="addXgdyxx();"></cps:button>
		<cps:button value="关闭" onclick="window.close();"></cps:button>
	</creator:tbar>
	<creator:panel id="addXgdyxx" tbarId="tbar" title="${xgdyxxBean.czbs=='1' ?'登记':'修改'}协管队员信息">
	<form id="add_xgdyxx_form" action="${contextPath}/xgdyxx/addXgdyxx.action" method="post">
				<input type="hidden" id="dybh" name="xgdyxxBean.dybh" value="${xgdyxxBean.dybh }"/>
				<input type="hidden" id="czbs" name="xgdyxxBean.czbs" value="${xgdyxxBean.czbs }"/>
				<%-- 	<cps:row id="clear_row1">
						<cps:tdLabel cssStyle="width:13%"><font color="red">*</font>协管队名称：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							<input id="xgdbh" name="xgdyxxBean.xgdbh" value="${xgdyxxBean.xgdbh }" type="hidden"/>
							<cps:textfield id="xgdmc" name="xgdyxxBean.xgdmc" value="${xgdyxxBean.xgdmc }"
								cssClass="validate[required]"  cssStyle="width:50%" ondblclick="openSelectXgdxx('xgdbh', 'xgdmc')"></cps:textfield>
							<cps:button value="选择" onclick="openSelectXgdxx('xgdbh', 'xgdmc')"></cps:button>
						</cps:tdContent>
						<cps:tdLabel cssStyle="width:12%"><font color="red">*</font>所在社区：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							<input type="hidden" id="sssqbh" name="xgdyxxBean.sssqbh"  value="${xgdyxxBean.sssqbh }"/>
							<cps:textfield id="sssqmc" name="xgdyxxBean.sssqmc"  cssStyle="width:50%"  value="${xgdyxxBean.sssqmc }"
										cssClass="validate[required]" ondblclick="openSqxxSelectWin('sssqbh','sssqmc')"></cps:textfield>
							<cps:button value="选择" onclick="openSqxxSelectWin('sssqbh','sssqmc')"></cps:button>
							
						</cps:tdContent>
						<cps:tdLabel cssStyle="width:13%"><font color="red">*</font>组建日期：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							<cps:date id="zjrq" name="xgdyxxBean.zjrq" dateFmt="yyyy-MM-dd"  value="${xgdyxxBean.zjrq }"
								cssClass="validate[required] cps-input" cssStyle="width:80%"></cps:date>
						</cps:tdContent>
					</cps:row>
					<cps:row id="clear_row2">
						<cps:tdLabel cssStyle="width:13%">责任人姓名：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							<cps:textfield id="fzrxm" name="xgdyxxBean.fzrxm" value="${xgdyxxBean.fzrxm }" cssStyle="width:80%"></cps:textfield>
						</cps:tdContent>
						<cps:tdLabel cssStyle="width:12%">责任人电话：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							<cps:textfield id="fzrlxdh" name="xgdyxxBean.fzrlxdh" cssClass="validate[custom[phone]] cps-input" value="${xgdyxxBean.fzrlxdh }" cssStyle="width:80%"></cps:textfield>
						</cps:tdContent>
						<cps:tdLabel cssStyle="width:12%">&nbsp;</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							&nbsp;
						</cps:tdContent>
					</cps:row>
					--%>
			<cps:table id="gbxxtable">
			<cps:row>
				<cps:tdContent width="85%">
					<cps:table>
					<cps:row id="sq_row">
						<cps:tdLabel cssStyle="width:10%"><font color="red">*</font>队员身份证号：</cps:tdLabel>
						<cps:tdContent cssStyle="width:30%">
							<cps:textfield id="dysfzh" name="xgdyxxBean.dysfzh" value="${xgdyxxBean.dysfzh }" 
								 onblur="isExistSfzhInOrg(this.value)"  isSfzh="true" cssClass="validate[required]"></cps:textfield>
						</cps:tdContent>
						<cps:tdLabel cssStyle="width:10%"><font color="red">*</font>姓名：</cps:tdLabel>
						<cps:tdContent cssStyle="width:30%">
							<cps:textfield id="dyxm" name="xgdyxxBean.dyxm" readonly="true" value="${xgdyxxBean.dyxm }"	required="true"></cps:textfield>
						</cps:tdContent>
						</cps:row>
					    <cps:row>
						<cps:tdLabel cssStyle="width:12%">性别：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							<cps:select id="dyxb" name="xgdyxxBean.dyxb"  value="${xgdyxxBean.dyxb }" zdlb="GB_XB" headerValue=" " headerKey="" disabled="true" enableEdit="true"></cps:select>
						</cps:tdContent>
						<cps:tdLabel cssStyle="width:13%">出生日期：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							<cps:textfield id="dycsrq" name="xgdyxxBean.dycsrq" value="${xgdyxxBean.dycsrq}" readonly="true" ></cps:textfield>
						</cps:tdContent>
						</cps:row>
					    <cps:row>
						<cps:tdLabel cssStyle="width:12%">联系电话：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							<cps:textfield id="dylxdh" name="xgdyxxBean.dylxdh" value="${xgdyxxBean.dylxdh }"></cps:textfield>
						</cps:tdContent>
						<cps:tdLabel cssStyle="width:12%">文化程度</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							<cps:select id="whcd" name="xgdyxxBean.whcd"  value="${xgdyxxBean.whcd }"
										 zdlb="GB_WHCD"  headerKey="" headerValue="--选择--">
							</cps:select>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel cssStyle="width:13%">户籍地：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							<cps:textfield id="dyhjdxz"  name="xgdyxxBean.dyhjdxz" ondblclick="selectXzqh('dyhjdqh','dyhjdxz')"  value="${xgdyxxBean.dyhjdxz }" maxlength="100"></cps:textfield>
							<input type="hidden" id="dyhjdqh"/>
						</cps:tdContent>
						<cps:tdLabel cssStyle="width:12%">现住地：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							<cps:textfield id="dyxzdxz"  name="xgdyxxBean.dyxzdxz"  value="${xgdyxxBean.dyxzdxz }" maxlength="100"></cps:textfield>
						</cps:tdContent>
						</cps:row>
					   
					<cps:row id="clear_row5">
						<cps:tdLabel cssStyle="width:13%">上岗时间：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							<cps:date id="sgrq" name="xgdyxxBean.sgrq" dateFmt="yyyy-MM-dd" value="${xgdyxxBean.sgrq }"   maxDate="#F{$dp.$D('lgrq')}"></cps:date>
						</cps:tdContent>
						<cps:tdLabel cssStyle="width:12%">离岗时间：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							<cps:date id="lgrq" name="xgdyxxBean.lgrq" dateFmt="yyyy-MM-dd" value="${xgdyxxBean.lgrq }"   minDate="#F{$dp.$D('sgrq')}"></cps:date>
						</cps:tdContent>
						</cps:row>
					<cps:row>
						<cps:tdLabel cssStyle="width:12%">工作表现：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							<cps:select id="gzbx" name="xgdyxxBean.gzbx" value="${xgdyxxBean.gzbx}" headerValue="--选择--" headerKey="" zdlb="AF_GZBX"></cps:select>
						</cps:tdContent>
						<cps:tdLabel cssStyle="width:12%">工龄：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							<cps:textfield id="gl"  name="xgdyxxBean.gl"  value="${xgdyxxBean.gl }" inputType="number"></cps:textfield>年
						</cps:tdContent>
						
					</cps:row>
						</cps:table>
				</cps:tdContent>
				<cps:tdContent valign="top">
					<div id="zpxx" style="text-align: center;background-color: #DFF0F8">
				<img src="<c:url value='/cps/common/showPoto.action'/>?sfzh=${xgdyxxBean.dysfzh}" title="全国人口库照片" alt="全国人口库照片" height="140" width="130"/>
			        </div>
				</cps:tdContent>
			</cps:row>
		</cps:table>
					<cps:table width="100%">
					<cps:row id="clear_row6">
						<cps:tdLabel cssStyle="width:13%">社会关系：</cps:tdLabel>
						<cps:tdContent colspan="5">
							<cps:textfield id="shgx" name="xgdyxxBean.shgx"  value="${xgdyxxBean.shgx }" 
								cssStyle="width:93%;height:80px;"  type="textarea" maxlength="150"></cps:textfield>
						</cps:tdContent>
					</cps:row>
					<cps:row id="clear_row6">
						<cps:tdLabel cssStyle="width:10%">队员简历：</cps:tdLabel>
						<cps:tdContent colspan="5">
							<cps:textfield id="dyjl" name="xgdyxxBean.dyjl"  value="${xgdyxxBean.dyjl }" 
								cssStyle="width:93%;height:80px;"  type="textarea" maxlength="1500"></cps:textfield>
						</cps:tdContent>
					</cps:row>
					
					<cps:row id="clear_row6">
						<cps:tdLabel cssStyle="width:10%">培训情况：</cps:tdLabel>
						<cps:tdContent colspan="5">
							<cps:textfield id="pxqk" name="xgdyxxBean.pxqk"  value="${xgdyxxBean.pxqk }" 
								cssStyle="width:93%;height:80px;"  type="textarea" maxlength="150"></cps:textfield>
						</cps:tdContent>
					</cps:row>
					<cps:row>
					<cps:tdLabel>备注：</cps:tdLabel>
						<cps:tdContent colspan="5">
							<cps:textfield id="bz"  name="xgdyxxBean.bz"  value="${xgdyxxBean.bz }" 
								cssStyle="width:93%;height:80px;"	type="textarea" maxlength="60"></cps:textfield>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel cssStyle="width:10%">登记人：</cps:tdLabel>
						<cps:tdContent cssStyle="width:25%">
							<cps:textfield id="djrxm" name="xgdyxxBean.djrxm"
								 value="${loginInfo.realname}" readonly="true" ></cps:textfield>
							<input type="hidden" id="djrjh" name="xgdyxxBean.djrjh"
								value="${loginInfo.username }" />
						</cps:tdContent>
						<cps:tdLabel cssStyle="width:10%">登记时间：</cps:tdLabel>
						<cps:tdContent cssStyle="width:23%">
							<c:if test="${xgdyxxBean.czbs eq '1'}">
							<cps:date id="djsj" name="xgdyxxBean.djsj"  defaultSystemDate="true"  readOnly="true"></cps:date>
							</c:if>
							<c:if test="${xgdyxxBean.czbs eq '2'}">
							<cps:textfield id="djsj" name="xgdyxxBean.djsj"   readonly="true" value="${xgdyxxBean.djsj}" ></cps:textfield>
							</c:if>
						</cps:tdContent>
						<cps:tdLabel cssStyle="width:10%">登记单位：</cps:tdLabel>
						<cps:tdContent cssStyle="width:23%">
							<cps:textfield id="djrdwmc" name="xgdyxxBean.djrdwmc"
								value="${loginInfo.orgname }" readonly="true"></cps:textfield>
							<input id="djrdwdm" name="xgdyxxBean.djrdwdm" type="hidden""
								value="${loginInfo.orgcode }" />
						</cps:tdContent>
					</cps:row>
				</cps:table>
					</form>
			</creator:panel>	
		
	
	<%-- 
	<c:if test="${xgdyxxBean.czbs eq '1'}">
	<cps:tableGrid id="xgdyxxList" pageSize="15" usepager="true"
			 url="/xgdyxx/xgdyxxList.action"
			mutilSelect="true" autoload="true" isAsynch="true">
			<cps:column isNumber="true" title="序号"></cps:column>
			<cps:column title="协管员姓名" field="dyxm"></cps:column>
			<cps:column title="身份证号" field="dysfzh"></cps:column>
			<cps:column title="联系电话" field="dylxdh"></cps:column>
			<cps:column title="所属协管队" field="xgdmc"></cps:column>
			<cps:column title="所属社区" field="sssqmc"></cps:column>
			<cps:column title="注消标识" field="zxbsmc"></cps:column>
		</cps:tableGrid>
		</c:if>
		<c:if test="${xgdyxxBean.czbs eq '2'}">
	<cps:tableGrid id="xgdyxxList" pageSize="15" usepager="true"
			searchform="add_xgdyxx_form" 
			 url="/xgdyxx/xgdyxxList.action"
			mutilSelect="true" autoload="true" click="setValueToForm">
			<cps:column isNumber="true" title="序号"></cps:column>
			<cps:column title="协管员姓名" field="dyxm"></cps:column>
			<cps:column title="身份证号" field="dysfzh"></cps:column>
			<cps:column title="联系电话" field="dylxdh"></cps:column>
			<cps:column title="所属协管队" field="xgdmc"></cps:column>
			<cps:column title="所属社区" field="sssqmc"></cps:column>
			<cps:column title="注消标识" field="zxbsmc"></cps:column>
		</cps:tableGrid>
		</c:if>--%>
		
			<%-- <div id="head_djxgdyxx">
				<table width="100%" border="0" cellspacing="0" cellpadding="0" class="box_title">
				    <tr>
				      <td width="23"><img src="<c:url value='/template/cps/images/img_title.jpg'/>" width="23" height="28" /></td>
				      <td id="title_id">
				      	<c:if test="${xgdyxxBean.czbs eq '1' }">登记协管队员信息</c:if>
				      	<c:if test="${xgdyxxBean.czbs eq '2' }">修改协管队员信息</c:if>
				      </td>
				      <td width="28"><a href="javascript:void(0)"><img id="img_djxgdyxx" src="<c:url value='/template/cps/images/cx_zk.jpg'/>" width="28" height="28" /></a></td>
				    </tr>
				</table>
			
			<form id="add_xgdyxx_form" action="${contextPath}/xgdyxx/addXgdyxx.action" method="post">
				<input type="hidden" id="dybh" name="xgdyxxBean.dybh" value="${xgdyxxBean.dybh }"/>
				<input type="hidden" id="czbs" name="xgdyxxBean.czbs" value="${xgdyxxBean.czbs }"/>
				<cps:table>
					<cps:row>
						<cps:tdLabel cssStyle="width:13%">协管队名称：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							<input id="xgdbh" name="xgdyxxBean.xgdbh" value="${xgdyxxBean.xgdbh }" type="hidden"/>
							<cps:textfield id="xgdmc" name="xgdyxxBean.xgdmc" value="${xgdyxxBean.xgdmc }"
								cssClass="validate[required]"  cssStyle="width:50%" ondblclick="openSelectXgdxx('xgdbh', 'xgdmc')"></cps:textfield>
							<cps:button value="选择" onclick="openSelectXgdxx('xgdbh', 'xgdmc')"></cps:button>
							<font color="red">*</font>
						</cps:tdContent>
						<cps:tdLabel cssStyle="width:12%">所在社区：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							<input type="hidden" id="sssqbh" name="xgdyxxBean.sssqbh"  value="${xgdyxxBean.sssqbh }"/>
							<cps:textfield id="sssqmc" name="xgdyxxBean.sssqmc"  cssStyle="width:50%"  value="${xgdyxxBean.sssqmc }"
										cssClass="validate[required]" ondblclick="openSqxxSelectWin('sssqbh','sssqmc')"></cps:textfield>
							<cps:button value="选择" onclick="openSqxxSelectWin('sssqbh','sssqmc')"></cps:button>
							<font color="red">*</font>
						</cps:tdContent>
						<cps:tdLabel cssStyle="width:13%">组建日期：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							<cps:date id="zjrq" name="xgdyxxBean.zjrq" dateFmt="yyyy-MM-dd"  value="${xgdyxxBean.zjrq }"
								cssClass="validate[required] cps-input" cssStyle="width:80%"></cps:date>
							<font color="red">*</font>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel cssStyle="width:13%">责任人姓名：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							<cps:textfield id="fzrxm" name="xgdyxxBean.fzrxm" value="${xgdyxxBean.fzrxm }" cssStyle="width:80%"></cps:textfield>
						</cps:tdContent>
						<cps:tdLabel cssStyle="width:12%">责任人电话：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							<cps:textfield id="fzrlxdh" name="xgdyxxBean.fzrlxdh" cssClass="validate[custom[phone]] cps-input" value="${xgdyxxBean.fzrlxdh }" cssStyle="width:80%"></cps:textfield>
						</cps:tdContent>
						<cps:tdLabel cssStyle="width:12%">&nbsp;</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							&nbsp;
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel cssStyle="width:13%">队员身份证号：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							<cps:textfield id="dysfzh" name="xgdyxxBean.dysfzh" value="${xgdyxxBean.dysfzh }" 
								 onblur="getXgdyxxBySfzh(this)" cssStyle="width:80%" isSfzh="true"></cps:textfield>
						</cps:tdContent>
						<cps:tdLabel cssStyle="width:12%">姓名：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							<cps:textfield id="dyxm" name="xgdyxxBean.dyxm" value="${xgdyxxBean.dyxm }"
								cssStyle="width:80%"></cps:textfield>
						</cps:tdContent>
						<cps:tdLabel cssStyle="width:12%">性别</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							<cps:select id="dyxb" name="xgdyxxBean.dyxb"  value="${xgdyxxBean.dyxb }" zdlb="GB_XB"
								 cssStyle="width:80%" headerValue="---选择--" headerKey=""></cps:select>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel cssStyle="width:13%">出生日期：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							<cps:date id="dycsrq" name="xgdyxxBean.dycsrq" dateFmt="yyyy-MM-dd" value="${xgdyxxBean.dycsrq }" 
								cssStyle="width:80%"></cps:date>
						</cps:tdContent>
						<cps:tdLabel cssStyle="width:12%">联系电话：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							<cps:textfield id="dylxdh" name="xgdyxxBean.dylxdh" value="${xgdyxxBean.dylxdh }"
								cssStyle="width:80%"></cps:textfield>
						</cps:tdContent>
						<cps:tdLabel cssStyle="width:12%">文化程度</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							<cps:select id="whcd" name="xgdyxxBean.whcd"  value="${xgdyxxBean.whcd }"
										 zdlb="AF_WHCD" cssStyle="width:80%" headerKey="" headerValue="--选择--">
							</cps:select>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel cssStyle="width:13%">户籍地：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							<cps:textfield id="dyhjdxz"  name="xgdyxxBean.dyhjdxz" cssStyle="width:50%" ondblclick="selectXzqh('dyhjdqh','dyhjdxz')"  value="${xgdyxxBean.dyhjdxz }"></cps:textfield>
							<input type="hidden" id="dyhjdqh"/>
							<cps:button value="选择" onclick="selectXzqh('dyhjdqh','dyhjdxz')"></cps:button>
						</cps:tdContent>
						<cps:tdLabel cssStyle="width:12%">现住地：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							<cps:textfield id="dyxzdxz"  name="xgdyxxBean.dyxzdxz"  value="${xgdyxxBean.dyxzdxz }" 
									cssStyle="width:80%"></cps:textfield>
						</cps:tdContent>
						<cps:tdLabel cssStyle="width:12%">备注：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							<cps:textfield id="bz"  name="xgdyxxBean.bz"  value="${xgdyxxBean.bz }" 
									cssStyle="width:80%"></cps:textfield>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel cssStyle="width:13%">调入时间：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							<cps:date id="sgrq" name="xgdyxxBean.sgrq" dateFmt="yyyy-MM-dd" value="${xgdyxxBean.sgrq }" 
								cssStyle="width:80%" onblur="calGl()" maxDate="#F{$dp.$D('lgrq')}"></cps:date>
						</cps:tdContent>
						<cps:tdLabel cssStyle="width:12%">调出时间：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							<cps:date id="lgrq" name="xgdyxxBean.lgrq" dateFmt="yyyy-MM-dd" value="${xgdyxxBean.lgrq }" 
								cssStyle="width:80%" onblur="calGl()" minDate="#F{$dp.$D('sgrq')}"></cps:date>
						</cps:tdContent>
						<cps:tdLabel cssStyle="width:12%">工龄：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							<cps:textfield id="gl"  name="xgdyxxBean.gl"  value="${xgdyxxBean.gl }" 
									cssStyle="width:80%" disabled="true"></cps:textfield>年
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel cssStyle="width:13%">培训情况：</cps:tdLabel>
						<cps:tdContent colspan="5">
							<cps:textfield id="pxqk" name="xgdyxxBean.pxqk"  value="${xgdyxxBean.pxqk }" 
								cssStyle="width:92%"  ></cps:textfield>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel cssStyle="width:13%">登记人：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							<cps:textfield id="djrxm" name="xgdyxxBean.djrxm"
								 value="${loginInfo.realname}" readonly="true" cssStyle="width:80%"></cps:textfield>
							<input type="hidden" id="djrjh" name="xgdyxxBean.djrjh"
								value="${loginInfo.username }" />
						</cps:tdContent>
						<cps:tdLabel cssStyle="width:12%">登记时间：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							<cps:textfield id="djsj" name="xgdyxxBean.djsj"  cssStyle="width:80%"
								 value="<%=new SimpleDateFormat(\"yyyy-MM-dd HH:mm:ss\").format(new Date()) %>" readonly="true"></cps:textfield>
						</cps:tdContent>
						<cps:tdLabel cssStyle="width:12%">登记单位：</cps:tdLabel>
						<cps:tdContent cssStyle="width:20%">
							<cps:textfield id="djrdwmc" name="xgdyxxBean.djrdwmc" cssStyle="width:80%"
								value="${loginInfo.orgname }" readonly="true"></cps:textfield>
							<input id="djrdwdm" name="xgdyxxBean.djrdwdm" type="hidden""
								value="${loginInfo.orgcode }" />
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdContent colspan="6" align="center">
							<cps:button value="新增" onclick="pageAddXgdyxx();"></cps:button>
							
						</cps:tdContent>
					</cps:row>
				</cps:table>
			</form>
		</div>
		<cps:tableGrid id="xgdyxxList" pageSize="15" usepager="true"
			searchform="searchform" autothead="false" url="/xgdyxx/xgdyxxList.action"
			mutilSelect="true" autoload="true">
			<cps:column isNumber="true" title="序号"></cps:column>
			<cps:column title="操作" field="cz" rowcallback="addCzRowCallback"></cps:column>
			<cps:column title="协管员姓名" field="dyxm"></cps:column>
			<cps:column title="身份证号" field="dysfzh"></cps:column>
			<cps:column title="联系电话" field="dylxdh"></cps:column>
			<cps:column title="所属协管队" field="xgdmc"></cps:column>
			<cps:column title="所属社区" field="sssqmc"></cps:column>
			<cps:column title="注消标识" field="zxbsmc"></cps:column>
		</cps:tableGrid>
		--%>
</creator:view>