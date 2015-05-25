package com.chinacreator.lsgl.action;

import java.sql.SQLException;

import com.chinacreator.common.cps.action.CPSBaseAction;
import com.chinacreator.common.cps.constants.CommonFinalParams;
import com.chinacreator.common.cps.helper.CommonSequenceHelper;
import com.chinacreator.common.helper.ValidateHelper;
import com.chinacreator.lsgl.bean.CzrkxxBean;
import com.chinacreator.lsgl.bean.RkxxBean;
import com.chinacreator.lsgl.bean.ZdryXsbxBean;
import com.chinacreator.lsgl.query.RkQueryBean;
import com.chinacreator.lsgl.services.LsglRkService;
import com.chinacreator.lsgl.services.XsbxService;
import com.chinacreator.lsgl.services.impl.LsglRkServiceImpl;

public class LsglXsbxAction extends CPSBaseAction{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1573239850002254716L;
	private LsglRkService rkService;
	private RkxxBean rkBean;
	private String sfzh;
	private String jsppage;
	private String msgtype;
	private XsbxService xsbxService;
	private ZdryXsbxBean xsbxBean;
	private RkQueryBean queryBean;
	private String modename;
	public LsglXsbxAction(){
		rkBean = new RkxxBean();
		xsbxBean = new ZdryXsbxBean();
		rkService = new LsglRkServiceImpl();
		xsbxService = new XsbxService();
	}
	
	public String toSfhsPageAction(){
		return "toSfhsPage";
	}
	
	public  String toXsbxDetailPage() throws Exception{
		toRkInfoPage();
		return "toZdryloadinfo";
	}
	
	
	/**
	 * 跳转到人口信息业务
	 * @return
	 * @date 2013-8-19 上午08:26:15
	 */
	public String toRkInfoPage() throws Exception
	{
		if (ValidateHelper.isNotEmptyString(queryBean.getRylb()))
		{
			rkBean.getJbxxBean().setSfzh(queryBean.getSfzh());
		}
		else
		{
			String rylb = CommonSequenceHelper.getRylb(queryBean.getSfzh(), queryBean.getFwid());
			queryBean.setRylb(rylb);
		}
		if ("1".equals(queryBean.getRylb()))
		{
			modename = "常住人口";
		}
		else if ("2".equals(queryBean.getRylb()))
		{
			modename = "流动人口";
		}
		else if ("3".equals(queryBean.getRylb()))
		{
			modename = "未落户人口";
		}
		else if ("4".equals(queryBean.getRylb()))
		{
			modename = "境外人口";
		}
		else if("5".equals(queryBean.getRylb()))
		{
			modename = "寄住人口";
		}
		return "toRkInfoPage";
	}

	/*
	 * 保存现实表现信息
	 */
	public void saveXsbxBean() throws SQLException{
		ZdryXsbxBean xsbxbean = xsbxService.saveXsbxBean(xsbxBean);
		responseWrite(xsbxbean);
	}
	
	public String loadZdryInfoPage() throws Exception{
		if (ValidateHelper.isNotEmptyString(queryBean.getRybh()))
		{
			rkBean = rkService.queryRkxxBeanByRybh(queryBean.getRylb(), queryBean.getRybh(), msgtype, operType);
		}
		else
		{
			rkBean = rkService.queryRkxxBeanBySfzh(queryBean.getRylb(), queryBean.getSfzh(), msgtype);
		}
		
		if (ValidateHelper.isNotEmptyString(rkBean.getJbxxBean().getRybh()) 
				&& CommonFinalParams.RYLB_CZRK.equals(rkBean.getRylb()))
		{
			CzrkxxBean czrkBean = rkService.queryDqCzrkxxBeanByRybh(rkBean.getJbxxBean().getRybh());
			rkBean.setCzrkBean(czrkBean);
		}
		
		if (ValidateHelper.isEmptyString(rkBean.getJbxxBean().getRybh()))
		{
			operType = "add";
		}
		xsbxBean = xsbxService.queryXsbxBeansBySfzh(queryBean.getSfzh());
		return jsppage;
	}
	public String getSfzh() {
		return sfzh;
	}

	public void setSfzh(String sfzh) {
		this.sfzh = sfzh;
	}

	public RkxxBean getRkBean() {
		return rkBean;
	}

	public void setRkBean(RkxxBean rkBean) {
		this.rkBean = rkBean;
	}

	public String getJsppage() {
		return jsppage;
	}

	public void setJsppage(String jsppage) {
		this.jsppage = jsppage;
	}

	public String getMsgtype() {
		return msgtype;
	}

	public void setMsgtype(String msgtype) {
		this.msgtype = msgtype;
	}

	public ZdryXsbxBean getXsbxBean() {
		return xsbxBean;
	}

	public void setXsbxBean(ZdryXsbxBean xsbxBean) {
		this.xsbxBean = xsbxBean;
	}


	public RkQueryBean getQueryBean() {
		return queryBean;
	}

	public void setQueryBean(RkQueryBean queryBean) {
		this.queryBean = queryBean;
	}

	public String getModename() {
		return modename;
	}

	public void setModename(String modename) {
		this.modename = modename;
	}
	
	
	
	
}
