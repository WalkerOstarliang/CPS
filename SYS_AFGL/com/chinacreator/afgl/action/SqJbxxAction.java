package com.chinacreator.afgl.action;

import java.util.ArrayList;
import java.util.List;

import com.chinacreator.afgl.bean.SqJbqktjBean;
import com.chinacreator.afgl.query.SqJbxxQueryBean;
import com.chinacreator.common.cps.action.CPSBaseAction;

/**
 * 社区基本信息
 * @author mingchun.xiong
 *
 */
public class SqJbxxAction extends CPSBaseAction
{

	/**
	 * 
	 */
	private static final long	serialVersionUID	= 5822574876883197756L;
	//private SqJbxxService service;
	private SqJbxxQueryBean queryBean;
	private String citydm;
	private String xqdm;
	private String pcsdm;
	private String jwsdm;
	private String sqbh;
	private List<SqJbqktjBean> sqjbqkList = new ArrayList<SqJbqktjBean>();
	
	public SqJbxxAction()
	{
		super();
		queryBean = new SqJbxxQueryBean();
		
	}
	
	/**
	 * 进入社区基本情况页面
	 * @return
	 */
	public String toSqJbxxPage()
	{
		initQueryBean(queryBean);
		return "toSqJbxxPage";
	}
	
	/**
	 * 通过市级代码加载社区基本情况
	 * @return
	 * @date 2013-10-22 下午04:57:05
	 */
	public void loadSqjbqkxxByCity()
	{
		SqJbqktjBean jbqkBean = new SqJbqktjBean();
		responseWrite(jbqkBean);
	}
	
	/**
	 * 通过县区代码查询社区基本情况
	 * @return
	 * @date 2013-10-22 下午04:56:29
	 */
	public void loadSqjbqkxxByXqdm()
	{
		SqJbqktjBean jbqkBean = new SqJbqktjBean();
		responseWrite(jbqkBean);
	}
	
	/**
	 * 通过派出所代码加载社区基本情况
	 * @return
	 * @date 2013-10-22 下午05:06:16
	 */
	public void loadSqjbqkxxByPcsdm()
	{
		SqJbqktjBean jbqkBean = new SqJbqktjBean();
		responseWrite(jbqkBean);
	}
	
	/**
	 * 加载社区基本情况通过警务室代码
	 * @return
	 */
	public void loadSqJbqkByJwsdm()
	{
		SqJbqktjBean jbqkBean = new SqJbqktjBean();
		responseWrite(jbqkBean);
	}
	
	
	public SqJbxxQueryBean getQueryBean() {
		return queryBean;
	}

	public void setQueryBean(SqJbxxQueryBean queryBean) {
		this.queryBean = queryBean;
	}

	public String getJwsdm()
	{
		return jwsdm;
	}

	public void setJwsdm(String jwsdm)
	{
		this.jwsdm = jwsdm;
	}

	public String getSqbh()
	{
		return sqbh;
	}

	public void setSqbh(String sqbh)
	{
		this.sqbh = sqbh;
	}

	public List<SqJbqktjBean> getSqjbqkList()
	{
		return sqjbqkList;
	}

	public void setSqjbqkList(List<SqJbqktjBean> sqjbqkList)
	{
		this.sqjbqkList = sqjbqkList;
	}

	public String getCitydm()
	{
		return citydm;
	}

	public void setCitydm(String citydm)
	{
		this.citydm = citydm;
	}

	public String getXqdm()
	{
		return xqdm;
	}

	public void setXqdm(String xqdm)
	{
		this.xqdm = xqdm;
	}

	public String getPcsdm()
	{
		return pcsdm;
	}

	public void setPcsdm(String pcsdm)
	{
		this.pcsdm = pcsdm;
	}
	
	
}
