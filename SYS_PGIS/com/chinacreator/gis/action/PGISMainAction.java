package com.chinacreator.gis.action;

import java.util.List;

import com.chinacreator.common.cps.action.CPSBaseAction;
import com.chinacreator.common.helper.DictionaryCacheHellper;
import com.chinacreator.dzgl.query.DzxxQueryBean;
import com.chinacreator.gis.bean.StxxBean;
import com.chinacreator.gis.query.StxxQueryBean;
import com.chinacreator.gis.service.StxxService;

public class PGISMainAction extends CPSBaseAction
{

	private static final long serialVersionUID = 239332921523433992L;

	private StxxService stxxService = new StxxService();
	public StxxQueryBean stxxQuery = new StxxQueryBean();
	private DzxxQueryBean queryBean;
	
	private String currentXzdm;
	
	public PGISMainAction()
	{
		queryBean = new DzxxQueryBean();
	}
	
	public String toMain()
	{
		return "toMain";
	}

	public String toIndex()
	{
		super.initQueryBean(queryBean);
		currentXzdm = DictionaryCacheHellper.getSystemParamenterValueByKey("current.xzdm");
		return "toIndex";
	}
	
	public void queryPgisSqdm()
	{
		String pgisdm = stxxService.queryPgisSqdmByJwqdm(queryBean.getJwsqdm());
		responseWrite(pgisdm);
	}
	
	/**
	 * 查询pgis代码通过社区代码
	 * 
	 * @date Jul 16, 2014 11:11:46 AM
	 */
	public void queryPgisdmBySqdm()
	{
		String pgisdm = stxxService.queryPgisdmBySqdm(queryBean.getSqdm());
		responseWrite(pgisdm);
	}
	
	public void queryStxx()
	{
		List<StxxBean> lstStxx = stxxService.queryStxx(stxxQuery);
		responseWrite(lstStxx);
	}

	public DzxxQueryBean getQueryBean()
	{
		return queryBean;
	}

	public void setQueryBean(DzxxQueryBean queryBean)
	{
		this.queryBean = queryBean;
	}

	public String getCurrentXzdm()
	{
		return currentXzdm;
	}

	public void setCurrentXzdm(String currentXzdm)
	{
		this.currentXzdm = currentXzdm;
	}
	
}
