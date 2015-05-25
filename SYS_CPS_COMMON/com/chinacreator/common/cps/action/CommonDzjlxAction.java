package com.chinacreator.common.cps.action;

import com.chinacreator.common.bean.LoginInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.cps.bean.CommonDZJlx;
import com.chinacreator.common.cps.bean.XqzBean;
import com.chinacreator.common.cps.dao.CommonDzxxDao;
import com.chinacreator.common.cps.dao.impl.CommonDzxxDaoImpl;
import com.chinacreator.common.helper.ActionContextHelper;
import com.chinacreator.common.helper.DateTimeHelper;
import com.chinacreator.common.helper.ValidateHelper;

public class CommonDzjlxAction  extends CPSBaseAction{

	/**
	 * 
	 */
	private static final long serialVersionUID = 5993884355621314725L;
	private CommonDZJlx jlxBean;
	private CommonDzxxDao dao;
	private XqzBean	xqzBean;
	private String operType;
	
	private String checkboxvalue;
	public CommonDzjlxAction()
	{
		super();
		jlxBean=new CommonDZJlx();
		dao= new CommonDzxxDaoImpl();
		xqzBean = new XqzBean();
	}
	
	
	/**
	 * 跳转
	 */
	public String toDzJlxPageInfo(){
		initQueryBean();
		return "toDzJlxPageInfo";
	}
	
	public String toJlxSelectPage()
	{
		LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
		//正常地区
		if (!loginInfo.getIsGxdz())
		{
			jlxBean.setCountrydm(ActionContextHelper.getLoginInfo().getCountrydm());
		}
		//高新地区，但是对应一个行政社区
		else if (loginInfo.getIsGxdz() && loginInfo.getGxYxzqhList().size() == 1)
		{
			jlxBean.setCountrydm(loginInfo.getGxYxzqhList().get(0));
		}
		return "toJlxSelectPage";
	}
	
	public String toXqzSelectPage()
	{
		String sqdm = xqzBean.getSqdm();
		super.initQueryBean(xqzBean);
		xqzBean.setSqdm(sqdm);
		return "toXqzSelectPage";
	}
	
	public void queryXzqPageResult()
	{
		PageResultInfo<XqzBean> pageResult = null;
		try
		{
			pageResult = dao.queryXzqBeanPageResult(xqzBean, getPageInfo());
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		responseWrite(pageResult);
	}
	
	/**
	 * 跳转到新增界面
	 * @throws Exception 
	 */
	public String openJlxWin() throws Exception{
		if(CommonConstant.OPERTYPE_ADD.equals(operType)){
			LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
			jlxBean.setDjrjh(loginInfo.getUsername());
			jlxBean.setDjrxm(loginInfo.getRealname());
			jlxBean.setDjdwdm(loginInfo.getOrgcode());
			jlxBean.setDjdwmc(loginInfo.getOrgname());
			jlxBean.setDjsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss"));
		}else{
			jlxBean = dao.queryDzJlxInfoById(jlxBean.getId());
		}
		return "openJlxWin";	
	}
	/**
	 * 分页查询
	 * @throws Exception
	 */
	public void queryCommonDzJlx() throws Exception
	{
		PageResultInfo<CommonDZJlx> listInfo= dao.queryCommonDZJlxPageResult(jlxBean, getPageInfo());
		responseWrite(listInfo);
	}
	
	/**
	 * 插入
	 * @throws Exception
	 */
	public void insertCommonDzJlxInfo() throws Exception
	{
		if(ValidateHelper.isEmptyString(jlxBean.getId())){
			dao.insertCommonDZJlx(jlxBean);
		}else{
			dao.updateCommonDzjlx(jlxBean);
		}
		responseWrite(true);
	}
	
	public void isExistJlxMc() throws Exception{
		boolean flag=dao.isExistJlxMc(jlxBean.getMc(),jlxBean.getSsxzqh());
		responseWrite(flag);
	}
	
	
	public void initQueryBean()
	{
		LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
		jlxBean.setCitygajgjgdm(loginInfo.getCitygajgdm());
		jlxBean.setCountrygajgjgdm(loginInfo.getCountrygajgdm());
		jlxBean.setPcsdm(loginInfo.getPcsdm());
	}
	
	public void deleteJlx(){
		try {
			dao.deleteCommonDzjlx(jlxBean);
			responseWrite(true);
		} catch (Exception e) {
			responseWrite(false);
			e.printStackTrace();
		}
	}
	
	public void  queryDZJlxInfoInStxx() throws Exception
	{
		PageResultInfo<CommonDZJlx> list=null;
		if("0".equals(checkboxvalue))
		{
			list = dao.queryDzjlxInfoInStxx(jlxBean, getPageInfo());
		}
		else
		{
			list = dao.queryCommonDZJlxPageResult(jlxBean, getPageInfo());
		}
		responseWrite(list);
	}
	
	public CommonDZJlx getJlxBean() {
		return jlxBean;
	}
	public void setJlxBean(CommonDZJlx jlxBean) {
		this.jlxBean = jlxBean;
	}
	public CommonDzxxDao getDao() {
		return dao;
	}
	public void setDao(CommonDzxxDao dao) {
		this.dao = dao;
	}
	public String getOperType() {
		return operType;
	}

	public void setOperType(String operType) {
		this.operType = operType;
	}


	public String getCheckboxvalue() {
		return checkboxvalue;
	}


	public void setCheckboxvalue(String checkboxvalue) {
		this.checkboxvalue = checkboxvalue;
	}


	public XqzBean getXqzBean()
	{
		return xqzBean;
	}


	public void setXqzBean(XqzBean xqzBean)
	{
		this.xqzBean = xqzBean;
	}


	 
	
	
}
