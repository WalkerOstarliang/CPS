<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%-- 危爆单位基本信息 --%>
<creator:view>
	<creator:Script src="/jsp/dwdj/js/dwop.js"></creator:Script>
	<cps:PanelView>
		<cps:tbar>
			<c:choose>
				<c:when test="${operType=='detail'}">
				<!-- 
					<cps:button value="确&nbsp;定" onclick="$.closeWindow()"></cps:button>
					<cps:button value="打&nbsp;印" onclick="print(1)"></cps:button>
				 -->	
				</c:when>
				<c:when test="${operType=='add'}">
					<cps:button id="save" value="保&nbsp;存" onclick="submitSaveWbdwxx()"></cps:button>
					<cps:button value="取&nbsp;消" onclick="$.closeWindow()"></cps:button>
				</c:when>
				<c:when test="${operType=='update'}">
					<cps:button id="save" value="保&nbsp;存" onclick="submitSaveWbdwxx()"></cps:button>
					<cps:button value="取&nbsp;消" onclick="$.closeWindow()"></cps:button>
				</c:when>
			</c:choose>
		</cps:tbar>
		<form id="wbdwform" name="wbdwform"  action="/sydw/dwop/saveWbdwBean.action" method="post">
			<s:hidden id="operType" name="operType"></s:hidden>
			<s:hidden id="ywzjid" name="wbdw.ywzjid"></s:hidden>
			<cps:panel title="危爆单位基本信息">
				<cps:table id="wbdwTable">	
					<cps:row>
						<cps:tdLabel width="10%"><font color="red">*</font>单位名称：</cps:tdLabel>
						<cps:tdContent width="18%">
							<cps:textfield id="dwmc" name="wbdw.dwmc" cssClass="validate[maxSize[400],required]"></cps:textfield>
						</cps:tdContent>
						<cps:tdLabel width="12%">行业类别：</cps:tdLabel>
						<cps:tdContent width="18%">
							危险物品单位
							<s:hidden id="hylb" name="wbdw.hylb" value="04"></s:hidden>
						</cps:tdContent>
						<cps:tdLabel width="10%">单位类别：</cps:tdLabel>
						<cps:tdContent width="30%">
							生化及危险物品单位
							<s:hidden id="dwlb" name="wbdw.dwlb" value="2800"></s:hidden>
						</cps:tdContent>
					</cps:row>	
					<cps:row>
						<cps:tdLabel width="12%"><font color="red">*</font>法人代表姓名：</cps:tdLabel>
						<cps:tdContent width="18%">
							<cps:textfield  id="frdbxm"  name="wbdw.frdbxm" cssClass="validate[maxSize[30],required]"></cps:textfield>
						</cps:tdContent>
						<cps:tdLabel width="12%"><font color="red">*</font>法人代表身份证号：</cps:tdLabel>
						<cps:tdContent width="18%">
							<cps:textfield  id="frdbsfzh"  name="wbdw.frdbsfzh" cssClass="validate[maxSize[30],required]" isSfzh="true"></cps:textfield>
						</cps:tdContent>
						<cps:tdLabel width="12%">营业执照：</cps:tdLabel>
						<cps:tdContent width="30%">
							<cps:textfield  id="yyzzhm" name="wbdw.yyzzhm" cssClass="validate[maxSize[60]]"></cps:textfield>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel width="12%">法人代表联系电话：</cps:tdLabel>
						<cps:tdContent width="18%">
							<cps:textfield  id="frdblxdh" name="wbdw.frdblxdh" cssClass="validate[maxSize[30]]"></cps:textfield>
						</cps:tdContent>
						<cps:tdLabel width="12%">单位电话：</cps:tdLabel>
						<cps:tdContent width="18%">
							<cps:textfield id="dwdh" name="wbdw.dwdh" cssClass="validate[maxSize[30]]"></cps:textfield>
						</cps:tdContent>
						<cps:tdLabel width="12%">组织机构代码：</cps:tdLabel>
						<cps:tdContent width="30%">
							<cps:textfield id="zzjgdm" name="wbdw.zzjgdm" cssClass="validate[maxSize[40]]"></cps:textfield>
						</cps:tdContent>
					</cps:row>	
					<cps:row>
						<cps:tdLabel width="12%"><font color="red">*</font>单位地址：</cps:tdLabel>
						<cps:tdContent width="100%" colspan="5">
							<s:textarea id="dwdz"  name="wbdw.dwdz" rows="4" cssStyle="width:100%" cssClass="validate[maxSize[500],required]"></s:textarea>
						</cps:tdContent>
					</cps:row>
					<cps:row>	
						<cps:tdLabel width="12%">开业日期：</cps:tdLabel>
						<cps:tdContent width="18%">
							<cps:date id="kyrq" name="wbdw.kyrq"  maxDate="${wbdw.djsj}" dateFmt="yyyy-MM-dd"></cps:date>
						</cps:tdContent>
						<cps:tdLabel width="12%"><font color="red">*</font>责任单位：</cps:tdLabel>
						<cps:tdContent width="18%">
							<input type="hidden" name="wbdw.sszrdwdm" id="sszrdwdm"  />
							<cps:textfield id="sszrdwdmmc" onclick="selectOrg('${wbdw.dwdm}', 'sszrdwdm', 'sszrdwdmmc')"  appendPopuBtn="true"/>
						</cps:tdContent>
						<cps:tdLabel width="12%">所属社区：</cps:tdLabel>
						<cps:tdContent width="18%">
							<s:hidden id="sssqdm" name="wbdw.sssqdm" ></s:hidden>
							<select id="oneSeleid"  style="width:155px" >
							</select>
						</cps:tdContent>
					</cps:row>
					<!--危险物品单位表字段 start -->
					<cps:row>
					<cps:tdLabel width="12%"><font color="red">*</font>货物类别：</cps:tdLabel>
					<cps:tdContent width="25%">
						<cps:select zdlb="ZDY_HWLB" id="hwlb" name="wbdw.hwlb"  required="true" headerKey="" headerValue=" "></cps:select>
					</cps:tdContent>
					<cps:tdLabel width="12%"><font color="red">*</font>单位分类：</cps:tdLabel>
					<cps:tdContent colspan="3">
						<s:checkboxlist list="wxpdwflList" id="dwflchk" name="wbdw.dwfls" listKey="dm" listValue="mc" required="true" ></s:checkboxlist>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel width="12%">生产地址：</cps:tdLabel>
					<cps:tdContent colspan="5">
						<cps:textfield id="scdz" name="wbdw.scdz" value="${wbdw.scdz}"  maxlength="100" cssStyle="width: 93%;"/>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel width="12%">储存设备：</cps:tdLabel>
					<cps:tdContent colspan="5">
						<cps:textfield id="cssb" name="wbdw.cssb" value="${wbdw.cssb}"  maxlength="100" cssStyle="width: 93%;"/>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel width="12%">许可范围：</cps:tdLabel>
					<cps:tdContent colspan="5">
						<cps:textfield id="fbxkfw" type="textarea" name="wbdw.fbxkfw" value="${wbdw.fbxkfw}"  maxlength="250" cssStyle="width: 93%; height: 60px;"/>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel width="12%">备注：</cps:tdLabel>
					<cps:tdContent colspan="5">
						<cps:textfield id="bz" type="textarea" name="wbdw.bz" value="${wbdw.bz}" maxlength="150" cssStyle="width: 93%; height: 60px;"></cps:textfield>
					</cps:tdContent>
				</cps:row>
					
				<!-- end -->
					
					<cps:row>
						<cps:tdLabel width="12%">登记人：</cps:tdLabel>
						<cps:tdContent width="18%">
							${wbdw.djrxm}
							<s:hidden id="djrxm" name="wbdw.djrxm" ></s:hidden>
							<s:hidden id="djrjh" name="wbdw.djrjh" ></s:hidden>
						</cps:tdContent>
						<cps:tdLabel width="12%">登记时间：</cps:tdLabel>
						<cps:tdContent width="18%">
							${wbdw.djsj}
							<s:hidden id="djsj" name="wbdw.djsj" ></s:hidden>
						</cps:tdContent>
						<cps:tdLabel width="12%">登记单位：</cps:tdLabel>
						<cps:tdContent width="100%"  colspan="3">
							${wbdw.djdwmc}
							<s:hidden id="djdwdm" name="wbdw.djdwdm" ></s:hidden>
							<s:hidden id="djdwmc" name="wbdw.djdwmc" ></s:hidden>
						</cps:tdContent>
					</cps:row>
					<s:hidden id="qsbs" name="wbdw.qsbs" value="0"></s:hidden>
					<s:hidden id="glbm" name="wbdw.glbm" value="1"></s:hidden>
					<s:hidden id="glzt" name="wbdw.glzt" value="0"></s:hidden>
					<s:hidden id="ywxtdwlx" name="wbdw.ywxtdwlx" value="05"></s:hidden>
				</cps:table>	
			</cps:panel>
		</form>
	</cps:PanelView>
</creator:view>