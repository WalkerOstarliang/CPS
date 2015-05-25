package com.chinacreator.zdry.dao;

import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.helper.PaginationHelper;
import com.chinacreator.zdry.query.LgdqtxQueryBean;
import com.frameworkset.common.poolman.ConfigSQLExecutor;
import com.frameworkset.util.ListInfo;

/**   
 * @author 禹文超
 * @mail wenchao.yu@chinacreator.com
 * @Description: TODO(首页访问层类)
 * @date Mar 7, 2013 3:08:37 PM
 */
public class IndexDao implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -8298185206969080102L;

	private static ConfigSQLExecutor executor = new ConfigSQLExecutor("com/chinacreator/zdry/dao/index-sql.xml");

	@SuppressWarnings("unchecked")
	public static PageResultInfo<LgdqtxQueryBean> queryLgdqtxList(LgdqtxQueryBean lgdqtx, PageInfo pageInfo) throws Exception {
		ListInfo listInfo = executor.queryListInfoBeanWithDBName(
										LgdqtxQueryBean.class, 
										CommonConstant.DBNAME_SQJW,
										"queryLgdqtx", 
										pageInfo.getOffset(), 
										pageInfo.getPageSize(),
										lgdqtx);

		return PaginationHelper.wrapPageResultInfo(pageInfo, listInfo.getTotalSize(), listInfo.getDatas());
	}

}
