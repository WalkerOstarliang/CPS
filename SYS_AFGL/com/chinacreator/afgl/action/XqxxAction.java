package com.chinacreator.afgl.action;

import java.util.ArrayList;
import java.util.List;

import com.chinacreator.afgl.bean.XqxxBean;
import com.chinacreator.afgl.query.XqxxQuery;
import com.chinacreator.afgl.services.XqxxService;
import com.chinacreator.common.bean.LoginInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.cps.action.CPSBaseAction;
import com.chinacreator.common.helper.ActionContextHelper;

/**
 * 小区信息
 */
public class XqxxAction extends CPSBaseAction{

	private static final long serialVersionUID = 7309901752134378580L;

	private XqxxService xqxxService;
	private XqxxBean xqxxBean;
	private XqxxQuery xqxxQuery;
	private List<XqxxBean> xqxxList;
	
	private String xqbh;
	private String cxbs;
	
	public XqxxAction(){
		xqxxService = new XqxxService();
		xqxxBean = new XqxxBean();
		xqxxQuery = new XqxxQuery();
		xqxxList = new ArrayList<XqxxBean>();
	}
	
	/**
	 * 跳转到小区信息列表
	 */
	public String toXqxxList(){
		LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
		xqxxQuery.setCitygajgjgdm(loginInfo.getCitygajgdm());
		xqxxQuery.setCountrygajgjgdm(loginInfo.getCountrygajgdm());
		xqxxQuery.setPcsdm(loginInfo.getPcsdm());
		return "toXqxxList";
	}
	
	/**
	 * 查询小区信息列表并写到页面
	 */
	public void xqxxList() throws Exception
	{
		PageResultInfo<XqxxBean> xqxxResultInfo= xqxxService.queryXqxxBeanPageList(getPageInfo(), xqxxQuery);
		responseWrite(xqxxResultInfo);
	}
	
	/**
	 * 跳转到新增小区信息页面
	 * @return
	 */
	public String toAddXqxx()
	{
		return "toAddXqxx";
	}
	
	/**
	 * 提交小区表单
	 * @return
	 */
	public void addXqxx() throws Exception
	{
		xqxxService.saveXqxxBean(xqxxBean, operType);
		responseWrite(true);
	}
	
	/**
	 * 跳转到修改小区信息页面
	 * @return
	 */
	public String toUpdateXqxxByXqbh() throws Exception
	{
		xqxxBean = xqxxService.queryXqxxBeanByXqbh(xqxxQuery.getXqbh());
		return "toUpdateXqxxByXqbh";
	}
	
	/**
	 * 改变小区基本信息状态
	 * @throws Exception
	 */
	public void changeXqxxBeanSatusByXqbh() throws Exception
	{
		xqxxService.changeXqxxBeanByXqbh(xqbh, cxbs);
		responseWrite(true);
	}
	
	/**
	 * 跳转到选择小区信息列表
	 * @return
	 */
	public String toSelectXqxx(){
		initQueryBean(xqxxQuery);
		return "toSelectXqxx";
	}
	
	/**
	 * 跳转到高级查询小区信息列表
	 * @return
	 */
	public String toGjQueryXqxx(){
		initQueryBean(xqxxQuery);
		return "toGjQueryXqxx";
	}

	public XqxxBean getXqxxBean() {
		return xqxxBean;
	}

	public void setXqxxBean(XqxxBean xqxxBean) {
		this.xqxxBean = xqxxBean;
	}

	public XqxxQuery getXqxxQuery() {
		return xqxxQuery;
	}

	public void setXqxxQuery(XqxxQuery xqxxQuery) {
		this.xqxxQuery = xqxxQuery;
	}

	public List<XqxxBean> getXqxxList() {
		return xqxxList;
	}

	public void setXqxxList(List<XqxxBean> xqxxList) {
		this.xqxxList = xqxxList;
	}

	public String getXqbh()
	{
		return xqbh;
	}

	public void setXqbh(String xqbh)
	{
		this.xqbh = xqbh;
	}

	public String getCxbs()
	{
		return cxbs;
	}

	public void setCxbs(String cxbs)
	{
		this.cxbs = cxbs;
	}

	

}
