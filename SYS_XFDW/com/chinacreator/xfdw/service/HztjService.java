package com.chinacreator.xfdw.service;

import java.sql.SQLException;
import java.util.List;

import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.xfdw.bean.HzldBean;
import com.chinacreator.xfdw.bean.QueryBean;
import com.chinacreator.xfdw.dao.HztjDao;

/**
 * @ClassName: HztjService
 * @author 罗昭
 * @date Mar 19, 20153:48:12 PM
 * @Description: TODO 火灾统计逻辑处理类
 *
 *
 */
public class HztjService {
	public static HztjService getInstance(){
		return new HztjService();
	}
	public List<HzldBean> queryHztj(QueryBean query) throws SQLException{
		return HztjDao.getInstance().queryHztj(query);
	}
	public PageResultInfo<HzldBean>  queryHzxq(QueryBean query , PageInfo pageinfo) throws SQLException{
		return HztjDao.getInstance().queryHzxq(query,pageinfo);
	}
}
