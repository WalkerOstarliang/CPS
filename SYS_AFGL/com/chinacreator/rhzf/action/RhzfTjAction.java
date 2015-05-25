package com.chinacreator.rhzf.action;

import java.util.ArrayList;
import java.util.List;

import com.chinacreator.common.cps.action.CPSBaseAction;
import com.chinacreator.rhzf.bean.RhzfTjBean;
import com.chinacreator.rhzf.bean.RhzfTjQueryBean;
import com.chinacreator.rhzf.service.impl.RhzfTjService;

/**
 * 入户走访 统计
 */
public class RhzfTjAction extends CPSBaseAction {

	private static final long serialVersionUID = -1718007957305987054L;
	
	private List<RhzfTjBean> tjList;
	private RhzfTjService service;
	private RhzfTjQueryBean query;
	
	/**
	 * 是否导出
	 */
	private String isExp;
	
	public RhzfTjAction(){
		super();
		tjList = new ArrayList<RhzfTjBean>();
		service = new RhzfTjService();
		query = new RhzfTjQueryBean();
	}
	
	/**
	 * 跳转到入户走访统计页面
	 * @return
	 */
	public String toRhzfTjPage(){
		return "toRhzfTjPage";
	}
	
	public String toRhzfTjData(){
		tjList = service.queryRhzfTj(query);
		if("true".equals(isExp)){
			return "toExpRhzfPage";
		}else{
			return "toRhzfTjData";
		}
	}

	public List<RhzfTjBean> getTjList() {
		return tjList;
	}

	public void setTjList(List<RhzfTjBean> tjList) {
		this.tjList = tjList;
	}

	public RhzfTjQueryBean getQuery() {
		return query;
	}

	public void setQuery(RhzfTjQueryBean query) {
		this.query = query;
	}

	public String getIsExp() {
		return isExp;
	}

	public void setIsExp(String isExp) {
		this.isExp = isExp;
	}
}
