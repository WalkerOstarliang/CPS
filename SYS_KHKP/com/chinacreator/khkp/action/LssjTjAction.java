package com.chinacreator.khkp.action;

import com.chinacreator.common.cps.action.CPSBaseAction;
import com.chinacreator.khkp.query.LssjTjQueryBean;
import com.chinacreator.khkp.services.LssjTjService;
import com.chinacreator.khkp.services.impl.LssjTjServiceImpl;

/**
 * 两实数据统计
 */
public class LssjTjAction extends CPSBaseAction {
	
	private static final long serialVersionUID = 3990465569077889653L;
	
	/**
	 * 查询条件
	 */
	private LssjTjQueryBean query;
	
	private LssjTjService service;
	
	public LssjTjAction(){
		super();
		query = new LssjTjQueryBean();
		service = new LssjTjServiceImpl();
	}
	
	/**
	 * 跳转到统计页面
	 * @return
	 */
	public String toLssjTjPage(){
		initQueryBean(query);
		return "toLssjTjPage";
	}
	
	/**
	 * 查询统计结果
	 */
	public void queryResult(){
		responseWrite(service.queryLssj(query, getPageInfo()));
	}

	
/**********************************************************/
	public LssjTjQueryBean getQuery() {
		return query;
	}

	public void setQuery(LssjTjQueryBean query) {
		this.query = query;
	}
}
