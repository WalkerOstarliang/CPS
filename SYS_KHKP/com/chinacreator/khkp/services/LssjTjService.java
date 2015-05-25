package com.chinacreator.khkp.services;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.khkp.bean.LssjTjBean;
import com.chinacreator.khkp.query.LssjTjQueryBean;

public interface LssjTjService extends Serializable {
	
	/**
	 * 查询两实数据统计结果
	 * @param query
	 * @param pageInfo
	 * @return
	 */
	public PageResultInfo<LssjTjBean> queryLssj(LssjTjQueryBean query, PageInfo pageInfo);
	
	/**
	 * 查询入室盗当月分析
	 * @param queryBean
	 * @return
	 * @date Aug 14, 2014 4:57:44 PM
	 */
	public List<Map<String, String>> queryRsdfxList(LssjTjQueryBean queryBean);
}
