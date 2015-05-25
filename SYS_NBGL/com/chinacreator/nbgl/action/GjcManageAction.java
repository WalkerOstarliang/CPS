package com.chinacreator.nbgl.action;

import com.chinacreator.common.cps.action.CPSBaseAction;
import com.chinacreator.nbgl.bean.GjcBean;
import com.chinacreator.nbgl.bean.GjcQueryBean;
import com.chinacreator.nbgl.service.GjcService;
import com.chinacreator.nbgl.service.impl.GjcServiceImpl;

/**
 * 关键词管理 
 */
public class GjcManageAction extends CPSBaseAction {

	private static final long serialVersionUID = -4297043028906206541L;
	
	private GjcService service;
	private GjcBean gjc;
	private GjcQueryBean query;
	
	public GjcManageAction(){
		super();
		service = new GjcServiceImpl();
		gjc = new GjcBean();
		query = new GjcQueryBean();
	}
	
	
	/**
	 * 跳转到关键词列表页面
	 * @return
	 */
	public String toGjcListPage(){
		return "toGjcListPage";
	}
	
	/**
	 * 查询关键词列表
	 */
	public void queryGjcList(){
		responseWrite(service.queryGjcList(query, getPageInfo()));
	}
	
	/**
	 * 保存关键词
	 */
	public void saveGjc(){
		responseWrite(service.saveGjc(gjc));
	}
	
	/**
	 * 删除关键词
	 */
	public void deleteGjc(){
		responseWrite(service.deleteGjc(query.getId()));
	}
	
	/**
	 * 检查关键词是否存在
	 */
	public void checkGjcIsExists(){
		responseWrite(service.checkGjcIsExists(query.getGjc()));
	}


	public GjcBean getGjc() {
		return gjc;
	}

	public void setGjc(GjcBean gjc) {
		this.gjc = gjc;
	}

	public GjcQueryBean getQuery() {
		return query;
	}
	
	public void setQuery(GjcQueryBean query) {
		this.query = query;
	}
	
}
