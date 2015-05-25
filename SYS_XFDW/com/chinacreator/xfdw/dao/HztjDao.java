package com.chinacreator.xfdw.dao;

import java.io.Serializable;
import java.sql.SQLException;
import java.util.List;

import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.helper.PaginationHelper;
import com.chinacreator.xfdw.bean.HzldBean;
import com.chinacreator.xfdw.bean.QueryBean;
import com.frameworkset.common.poolman.ConfigSQLExecutor;
import com.frameworkset.util.ListInfo;

/**
 * @ClassName: HztjDao
 * @author 罗昭
 * @date Mar 19, 20153:47:48 PM
 * @Description: TODO 火灾统计数据访问类
 *
 *
 */

public class HztjDao implements Serializable {
	private static final long serialVersionUID = 841541490145981942L;

	private ConfigSQLExecutor executor = new ConfigSQLExecutor("com/chinacreator/xfdw/dao/hztj-sql.xml");
	
	public static HztjDao getInstance() {
		return new HztjDao();
	}
	
	/**
	 * 火灾统计查询
	 * @param query
	 * @return
	 * @throws SQLException
	 */
	public List<HzldBean> queryHztj(QueryBean query) throws SQLException{
		List<HzldBean> list = executor.queryListBeanWithDBName(HzldBean.class, CommonConstant.DBNAME_SQJW, "queryHztj", query);
		return list;
	}
	public PageResultInfo<HzldBean>  queryHzxq(QueryBean query,PageInfo pageinfo) throws SQLException{
		ListInfo listInfo = executor.queryListInfoBeanWithDBName(HzldBean.class, CommonConstant.DBNAME_SQJW, "queryHzxq", pageinfo.getOffset(), pageinfo.getPageSize(), query);
		return PaginationHelper.wrapPageResultInfo(pageinfo, listInfo);
	}
	
}
