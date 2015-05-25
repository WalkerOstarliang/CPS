package com.chinacreator.khkp.action;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import com.chinacreator.common.cps.action.CPSBaseAction;
import com.chinacreator.common.helper.DateTimeHelper;
import com.chinacreator.khkp.query.LssjTjQueryBean;
import com.chinacreator.khkp.services.LssjTjService;
import com.chinacreator.khkp.services.impl.LssjTjServiceImpl;

/**
 * 数据录入核查
 * 
 * @filename SjlrhcAction.java
 * @author mingchun.xiong
 * @date May 29, 2014
 *
 */
public class SjlrhcAction extends CPSBaseAction
{

	/**
	 * 
	 */
	private static final long	serialVersionUID	= 6388985165286754179L;
	private LssjTjService service;
	private LssjTjQueryBean queryBean;
	
	private Map<String, String> columns = new LinkedHashMap<String, String>();
	
	private List<Map<String, String>> resultList = new ArrayList<Map<String, String>>(); 
	
	public SjlrhcAction()
	{
		super();
		service = new LssjTjServiceImpl();
		queryBean = new LssjTjQueryBean();
	}
	
	public String toRsdydfxPage()
	{
		return "toRsdydfxPage";
	}
	
	public String loadRsdydfxList()
	{
		resultList = service.queryRsdfxList(queryBean);
		return "loadRsdydfxList";
	}
	
	public String exportRsdydfxxls()
	{
		resultList = service.queryRsdfxList(queryBean);
		return "exportRsdydfxxls";
	}
	
	public LssjTjQueryBean getQueryBean()
	{
		return queryBean;
	}

	public void setQueryBean(LssjTjQueryBean queryBean)
	{
		this.queryBean = queryBean;
	}

	public Map<String, String> getColumns()
	{
		for (int i=13;i >= 0;i--)
		{
			Calendar calen = Calendar.getInstance();
			calen.add(Calendar.MONTH, -i);
			String str = DateTimeHelper.converTimeToStr(calen.getTimeInMillis(), "yyyy/MM");
			columns.put("TH_" + str, str);
		}
		return columns;
	}

	public void setColumns(Map<String, String> columns)
	{
		this.columns = columns;
	}

	public List<Map<String, String>> getResultList()
	{
		return resultList;
	}

	public void setResultList(List<Map<String, String>> resultList)
	{
		this.resultList = resultList;
	}

	 
}
