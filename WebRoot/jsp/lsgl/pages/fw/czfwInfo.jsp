<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view>
<creator:Script src="/jsp/lsgl/js/czfwczxx.js"></creator:Script>
<creator:tbar id="fwtooltbar">
	<c:if test="${operType != 'detail'}">
		<cps:button value="保存" onclick="saveCzjlInfo()"></cps:button>
	</c:if>
	<cps:button value="关闭" onclick="parent.layer.close(parent.layerObj)"></cps:button>
</creator:tbar>
<creator:panel id="fwquerypanel" title="出租记录信息" tbarId="fwtooltbar">
	<form id="czjlform"> 
		<div id="czwxxxx">
			<cps:table>
				<input id="isczfdj"   type="hidden" name="fwBean.isczfdj"  value="1">
				<input id="czfwid"   type="hidden" name="fwBean.fwid"  value="${fwBean.czfwBean.fwbh}">
				<input id="czfwfwbh" type="hidden" name="fwBean.czfwBean.fwbh"  value="${fwBean.czfwBean.fwbh}">
				<input id="czfwid"   type="hidden" name="fwBean.czfwBean.id"  value="${fwBean.czfwBean.id}">
				<input id="cqlx" type="hidden" name="fwBean.cqlx" value="${fwBean.cqlx }">
				<input id="closeParentWin" type="hidden" value="${closeParentWin }">
				<cps:row>
					<cps:tdLabel width="13%">出租屋编码：</cps:tdLabel>
					<cps:tdContent width="22%">
						<cps:textfield id="czfwbh" name="fwBean.czfwBean.czfwbh" value="${fwBean.czfwBean.czfwbh}" readonly="true" maxlength="50"></cps:textfield>
					</cps:tdContent>
					<cps:tdLabel width="11%">出租屋标牌码：</cps:tdLabel>
					<cps:tdContent colspan="3">
						<cps:textfield id="czfwbpbm" name="fwBean.czfwBean.czfwbpbm" value="${fwBean.czfwBean.czfwbpbm}"  maxlength="50" cssStyle="width:94%" readonly="true"></cps:textfield>
					</cps:tdContent>
				</cps:row>
				<cps:row id="hzxx">
					<cps:tdLabel id="hzsfzhlabel">
						<c:choose>
							<c:when test="${fwBean.cqlx=='2'}">
								<font color="red">*</font>房主证件号码：
							</c:when>
							<c:otherwise>
								法人证件号码：
							</c:otherwise>
						</c:choose>
					</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield id="fzsfzh" name="fwBean.czfwBean.fzsfzh" value="${fwBean.czfwBean.fzsfzh}" required="${fwBean.cqlx=='2'}" onblur="loadFwfzInfo(this.value)" maxlength="18" onkeyup="this.value=this.value.replace('x','X');" ></cps:textfield>
					</cps:tdContent>
					<cps:tdLabel  id="hzxmlabel">
						<c:choose>
							<c:when test="${fwBean.cqlx=='2'}">
								<font color="red">*</font>房主姓名：
							</c:when>
							<c:otherwise>
								法人姓名：
							</c:otherwise>
						</c:choose>
					</cps:tdLabel>
					<cps:tdContent >
						<cps:textfield id="fzxm" name="fwBean.czfwBean.fzxm" value="${fwBean.czfwBean.fzxm}" maxlength="15" required="${fwBean.cqlx=='2'}"></cps:textfield>
					</cps:tdContent>
					<cps:tdLabel id="hzlxdhlabel">联系电话：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield id="lxdh" name="fwBean.czfwBean.lxdh" value="${fwBean.czfwBean.lxdh}" isPhone="true" minlength="7" maxlength="20"></cps:textfield>
					</cps:tdContent>
				</cps:row >
				<cps:row  id="clear_row10">
					<cps:tdLabel width="12%"><font color="red">*</font>承租用途：</cps:tdLabel>
					<cps:tdContent width="22%">
						<cps:select zdlb="ZDY_CZYT" required="true" id="czyt" name="fwBean.czfwBean.czyt" value="${fwBean.czfwBean.czyt}" headerKey="" headerValue=" " ></cps:select>
					</cps:tdContent>
					<cps:tdLabel width="12%"><font color="red">*</font>出租时间：</cps:tdLabel>
					<cps:tdContent width="22%">
						<cps:date id="czsj" name="fwBean.czfwBean.czsj" value="${fwBean.czfwBean.czsj}" dateFmt="yyyy-MM-dd" required="true"></cps:date>
					</cps:tdContent>
					<cps:tdLabel width="12%"><font color="red">*</font>出租间数：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield id="czjs" name="fwBean.czfwBean.czjs" value="${fwBean.czfwBean.czjs}" inputType="number" maxlength="2"></cps:textfield>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel><font color="red">*</font>是否签订责任书：</cps:tdLabel>
					<cps:tdContent>
						<cps:select zdlb="ZDY_ZDSF"  id="sfqdzrz" name="fwBean.czfwBean.sfqdzrz" value="${fwBean.czfwBean.sfqdzrz}" headerKey="" headerValue=" " required="true"></cps:select>
					</cps:tdContent>
					<cps:tdLabel>租赁备案证号：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield id="djbh" name="fwBean.czfwBean.djbh" value="${fwBean.czfwBean.djbh}" maxlength="15"></cps:textfield>
					</cps:tdContent>
					<cps:tdLabel>最新核签时间：</cps:tdLabel>
					<cps:tdContent>
						<cps:date id="zxhqsj" name="fwBean.czfwBean.zxhqsj" value="${fwBean.czfwBean.zxhqsj}" dateFmt="yyyy-MM-dd"></cps:date>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel >租住类型：</cps:tdLabel>
					<cps:tdContent>
						<cps:select zdlb="ZDY_ZZLX" id="zzlx" name="fwBean.czfwBean.zzlx" value="${fwBean.czfwBean.zzlx}" headerKey="" headerValue=" " ></cps:select>
					</cps:tdContent>
					<cps:tdLabel>出租面积<font>(㎡)</font>：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield id="czmj" name="fwBean.czfwBean.czmj" value="${fwBean.czfwBean.czmj}" inputType="number" maxlength="5"></cps:textfield>
					</cps:tdContent>
					<cps:tdLabel width="12%">月租金(元)：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield id="czyz" name="fwBean.czfwBean.czyz" value="${fwBean.czfwBean.czyz}" inputType="number" maxlength="20"></cps:textfield>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>治安责任人身份证：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield id="dlrsfzh" name="fwBean.czfwBean.dlrsfzh" value="${fwBean.czfwBean.dlrsfzh}"  isSfzh="true" maxlength="20" onblur="queryRkBean(this.value,callbackZazrrxx)"></cps:textfield>
					</cps:tdContent>
					<cps:tdLabel>治安责任人：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield id="dlr" name="fwBean.czfwBean.dlr" value="${fwBean.czfwBean.dlr}"  maxlength="15"></cps:textfield>
					</cps:tdContent>
					<cps:tdLabel>责任人联系电话：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield id="dlrlxfs" name="fwBean.czfwBean.dlrlxfs" value="${fwBean.czfwBean.dlrlxfs}" minlength="7" isPhone="true" maxlength="20"></cps:textfield>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>房屋状态：</cps:tdLabel>
					<cps:tdContent>
						<s:select id="fwzt" list="#{'0':'正常','1' : '停租'}" name="fwBean.czfwBean.fwzt" cssClass="cps-select"/>
					</cps:tdContent>
					<cps:tdLabel>出租终止时间：</cps:tdLabel>
					<cps:tdContent>
						<cps:date id="czzzsj" name="fwBean.czfwBean.czzzsj" value="${fwBean.czfwBean.czzzsj}" dateFmt="yyyy-MM-dd"></cps:date>
					</cps:tdContent>
					<cps:tdLabel>注销原因：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield id="zxyy" name="fwBean.czfwBean.zxyy" value="${fwBean.czfwBean.zxyy}" maxlength="100"></cps:textfield>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>备注：</cps:tdLabel>
					<cps:tdContent colspan="5">
						<cps:textfield type="textarea" id="bz" name="fwBean.czfwBean.bz" value="${fwBean.czfwBean.bz}" cssStyle="width:97%;"  maxlength="200"></cps:textfield>
					</cps:tdContent>
				</cps:row>
			</cps:table>
		</div>
	</form>
</creator:panel>
</creator:view>

