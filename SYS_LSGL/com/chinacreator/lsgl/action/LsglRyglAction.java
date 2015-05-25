package com.chinacreator.lsgl.action;

import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.cps.action.CPSBaseAction;
import com.chinacreator.lsgl.bean.CzrkxxBean;
import com.chinacreator.lsgl.bean.RkfwglBean;
import com.chinacreator.lsgl.bean.TzryBean;
import com.chinacreator.lsgl.services.LsglRyglService;
import com.chinacreator.lsgl.services.impl.LsglRyglServiceImpl;

/**
 * 人员关联 （同户人员信息、同址人员信息、历史从业记录）
 * @company  chinacreator
 * @author zhun.liu
 * @date  Nov 27, 2013  2:04:45 PM
 */
public class LsglRyglAction extends CPSBaseAction{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private CzrkxxBean czrkBean;
	private TzryBean tzryBean;
	private LsglRyglService ryglService;
	private String zxbs;
	private String fwid;
	private String inputdqjzlkzlfw;
	public  LsglRyglAction(){
		super();
		czrkBean= new CzrkxxBean();
		tzryBean=new TzryBean();
		ryglService=new LsglRyglServiceImpl();
	}
	
	/**
	 * 分页查询同户人员
	 * @throws Exception 
	 */
	public void queryThryBeanPageInfo() throws Exception{
		PageResultInfo<CzrkxxBean> list=ryglService.queryThryByRybh(czrkBean.getRybh(), getPageInfo());
		responseWrite(list);
	}
	
	/**
	 * 分页查询同址人员
	 * @throws Exception 
	 */
	public void queryTzryBeanPageInfo() throws Exception{
		PageResultInfo<TzryBean> list=ryglService.queryTzryPageInfoByRybh(tzryBean.getRybh(), getPageInfo());
		responseWrite(list);
	}
	
	public void queryJzryBeanPageInfo() throws Exception{
		PageResultInfo<TzryBean> list=ryglService.queryTzryPageInfoByFwid(fwid, zxbs, getPageInfo());
		responseWrite(list);
	}
	
	//现同住人员
	public void queryXtzryPageInfo() throws Exception
	{   
		PageResultInfo<RkfwglBean> list  = ryglService.queryXtzryPageInfoByFwid(fwid,zxbs,getPageInfo());
		responseWrite(list);
	}
	

	public CzrkxxBean getCzrkBean() {
		return czrkBean;
	}

	public void setCzrkBean(CzrkxxBean czrkBean) {
		this.czrkBean = czrkBean;
	}

	public TzryBean getTzryBean() {
		return tzryBean;
	}

	public void setTzryBean(TzryBean tzryBean) {
		this.tzryBean = tzryBean;
	}

	public String getZxbs() {
		return zxbs;
	}

	public void setZxbs(String zxbs) {
		this.zxbs = zxbs;
	}

	public String getFwid() {
		return fwid;
	}

	public void setFwid(String fwid) {
		this.fwid = fwid;
	}

	public String getInputdqjzlkzlfw() {
		return inputdqjzlkzlfw;
	}

	public void setInputdqjzlkzlfw(String inputdqjzlkzlfw) {
		this.inputdqjzlkzlfw = inputdqjzlkzlfw;
	}
}
