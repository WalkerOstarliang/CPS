package com.chinacreator.lsgl.action;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.cps.action.CPSBaseAction;
import com.chinacreator.lsgl.bean.ZdryGzdxBean;
import com.chinacreator.lsgl.bean.ZdryZkDjTjBean;
import com.chinacreator.lsgl.bean.ZdryZkDjTjQueryBean;
import com.chinacreator.lsgl.services.LsglZdryZkdjTjService;
import com.chinacreator.lsgl.services.impl.LsglZdryZkdjTjServiceImpl;

public class LsglZdryZkDjTjAction extends CPSBaseAction{

	/**
	 * 小龙
	 */
	private static final long serialVersionUID = 1L;
	private ZdryZkDjTjQueryBean	queryBean;
	private LsglZdryZkdjTjService zdryZkDjTjService;
	private List<ZdryZkDjTjBean> zdryzkdjtjList;
	private PageResultInfo<ZdryGzdxBean> zdryzkdjtjqueryList;
	
	public LsglZdryZkDjTjAction(){
		super();
		queryBean=new ZdryZkDjTjQueryBean();
		zdryZkDjTjService =new LsglZdryZkdjTjServiceImpl();
	}
	
	public void initQueryBean()
	{
		super.initQueryBean(queryBean);
	}
	
	public String toZdryZkDjTjPage(){
		initQueryBean();
		queryBean.setSqdm("");
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		Calendar c =Calendar.getInstance();
		c.add(Calendar.MONTH, 0);
		c.set(Calendar.DAY_OF_MONTH, 1);  // 设置为1号，当前日期即为本月第一天
		String firstday =format.format(c.getTime());
		queryBean.setDjdateStart(firstday);
		//System.out.println(queryBean.getDjdateStart());
		return "toZdryZkDjTjPage";
	}
	/**
		统计重点人员在控登记情况
	 * @throws Exception 
	 * queryZdryZkdjTjListPage
	 */
	public void queryZdryZkdjTjListPage(){
		PageResultInfo<ZdryZkDjTjBean> pageResult = null;
		try
		{   
			pageResult = zdryZkDjTjService.queryZdryGzdxPageResult(queryBean,getPageInfo());
		}
		catch(Exception e)
		{
			pageResult = new PageResultInfo<ZdryZkDjTjBean>();
			e.printStackTrace();
		}
		responseWrite(pageResult);
	}
	/**
	 * 跳转到统计重点人员数结果详情
	 * toZdryZkDjTjInfoPage
	 * @return
	 * @throws Exception 
	 */
	public String toZdryZkDjTjInfoPage() throws Exception{
		return  "toZdryZkDjTjInfoPage";
	}
/**
 * 跳转到统计在控登记数结果详情
 */
	public String toZdryZkDjTjDJSInfoPage() throws Exception{
		return "toZdryZkDjTjDJSInfoPage";
	}
	/**
	 * 跳转到统计在控登记在控数结果详情
	 */
	public String toZdryZkDjTjZKSInfoPage() throws Exception{
		return "toZdryZkDjTjZKSInfoPage";
	}
	/**
	 * 跳转到统计在控登记失控数结果详情
	 */
	public String toZdryZkDjTjSKSInfoPage() throws Exception{
		return "toZdryZkDjTjSKSInfoPage";
	}
	
	/*
	 * 自动加载重点人员数结果
	 * */
	public void querZdryZkxxxx()
	{
		PageResultInfo<ZdryGzdxBean> pageResult = null;
		try 
		{
			pageResult = zdryZkDjTjService.queryZdryPageResult(queryBean,getPageInfo());
		} 
		catch (Exception e) 
		{
			pageResult = new PageResultInfo<ZdryGzdxBean>();
			e.printStackTrace();
		}
		responseWrite(pageResult);
	}
	/**
	 * 自动加载在控登记数结果
	 */
	public void querZdryZkdjsxxxx(){
		PageResultInfo<ZdryGzdxBean> pageResult = null;
		try 
		{
			pageResult = zdryZkDjTjService.queryZdryZKDJSPageResult(queryBean,getPageInfo());
		} 
		catch (Exception e) 
		{
			pageResult = new PageResultInfo<ZdryGzdxBean>();
			e.printStackTrace();
		}
		responseWrite(pageResult);	
	}
	/**
	 * 自动加载在控登记在控数结果
	 */
	
	public void querZdryZkzksxxxx(){
		PageResultInfo<ZdryGzdxBean> pageResult = null;
		try 
		{
			pageResult = zdryZkDjTjService.queryZdryZKZKSPageResult(queryBean,getPageInfo());
		} 
		catch (Exception e) 
		{
			pageResult = new PageResultInfo<ZdryGzdxBean>();
			e.printStackTrace();
		}
		responseWrite(pageResult);	
	}
	/**
	 * 自动加载在控登记失控数结果
	 */
	
	public void querZdryZksksxxxx(){
		PageResultInfo<ZdryGzdxBean> pageResult = null;
		try 
		{
			pageResult = zdryZkDjTjService.queryZdryZKSKSPageResult(queryBean,getPageInfo());
		} 
		catch (Exception e) 
		{
			pageResult = new PageResultInfo<ZdryGzdxBean>();
			e.printStackTrace();
		}
		responseWrite(pageResult);	
	}
	/**
	 * 导出在控登记统计情况数据
	 * @return
	 */
	public String downloadZdryZkDjTj(){
		try
		{
			zdryzkdjtjList = zdryZkDjTjService.queryZdryZkDjTjListDown(queryBean);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return "downloadZdryZkDjTj";
	}
	
	public ZdryZkDjTjQueryBean getQueryBean() {
		return queryBean;
	}

	public void setQueryBean(ZdryZkDjTjQueryBean queryBean) {
		this.queryBean = queryBean;
	}

	public List<ZdryZkDjTjBean> getZdryzkdjtjList() {
		return zdryzkdjtjList;
	}

	public void setZdryzkdjtjList(List<ZdryZkDjTjBean> zdryzkdjtjList) {
		this.zdryzkdjtjList = zdryzkdjtjList;
	}

	public LsglZdryZkdjTjService getZdryZkDjTjService() {
		return zdryZkDjTjService;
	}

	public void setZdryZkDjTjService(LsglZdryZkdjTjService zdryZkDjTjService) {
		this.zdryZkDjTjService = zdryZkDjTjService;
	}

	public PageResultInfo<ZdryGzdxBean> getZdryzkdjtjqueryList() {
		return zdryzkdjtjqueryList;
	}

	public void setZdryzkdjtjqueryList(
			PageResultInfo<ZdryGzdxBean> zdryzkdjtjqueryList) {
		this.zdryzkdjtjqueryList = zdryzkdjtjqueryList;
	}

	

	

}
