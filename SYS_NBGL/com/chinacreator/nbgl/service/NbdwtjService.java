package com.chinacreator.nbgl.service;

import java.io.Serializable;
import java.util.List;

import com.chinacreator.common.bean.QueryBean;
import com.chinacreator.nbgl.bean.AjtjByDwflBean;
import com.chinacreator.nbgl.bean.NbfatjBean;
/**
 * 内保单位发案统计
 * @author Administrator
 *
 */
public interface NbdwtjService extends Serializable {
	/**
	 * 统计内保单位发案情况
	 * @return
	 */
	public List<NbfatjBean> queryNbdwfatjlist(QueryBean query);
	
	public List<AjtjByDwflBean> queryAjtjByDwfl(QueryBean query);
}
