package com.chinacreator.xqgk.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.xqgk.bean.SqDetailColumnInfo;
import com.chinacreator.xqgk.bean.SqDetailQueryInfo;
import com.chinacreator.xqgk.bean.base.MapHandler;
import com.chinacreator.xqgk.utils.SqDetailQueryCache;
import com.frameworkset.common.poolman.ConfigSQLExecutor;
import com.frameworkset.common.poolman.DBUtil;

@SuppressWarnings("unchecked")
public class SqDetailDao implements java.io.Serializable {

	private static final long serialVersionUID = 3876705845854938497L;

	public static SqDetailDao getInstance(){
		return new SqDetailDao();
	}
	
	private ConfigSQLExecutor executor = new ConfigSQLExecutor(
			"com/chinacreator/xqgk/dao/sql/sqDetail-sql.xml");

	/**
	 * 获取所有辖区概况基本信息对象
	 * @return
	 * @throws SQLException
	 */
	public List<SqDetailQueryInfo> getAllQuery() throws Exception{
		List<SqDetailQueryInfo> queryList = SqDetailQueryCache.getInstance().getAllDataFromCache();
		if(queryList == null || queryList.isEmpty()){
			queryList = executor.queryListWithDBName(SqDetailQueryInfo.class, CommonConstant.DBNAME_SQJW, "getAllSqDetailQuery");
			List<SqDetailColumnInfo> queryColumnList = executor.queryListWithDBName(SqDetailColumnInfo.class, CommonConstant.DBNAME_SQJW, "getAllSqDetailColumn");
			for(SqDetailQueryInfo queryInfo : queryList){
				for(SqDetailColumnInfo columnInfo : queryColumnList){
					if(queryInfo.getCode().equals(columnInfo.getCode())){
						queryInfo.addData2List(columnInfo);
					}
				}
				SqDetailQueryCache.getInstance().addData2Cache(queryInfo.getCode(), queryInfo);
			}
		}
		return queryList;
	}
	
	public SqDetailQueryInfo getQueryByCode(String code){
		return SqDetailQueryCache.getInstance().getDataFromCache(code);
	}
	
	public Map getDataOfQueryInfo(String sql, PageInfo pageInfo) throws Exception{
		Map res = new HashMap();
		
		DBUtil db = new DBUtil();
		List resList = db.executeSelectForList(
				CommonConstant.DBNAME_SQJW, sql, pageInfo.getOffset(), 
				pageInfo.getPageSize(), HashMap.class, new MapHandler());
		int total = db.getTotalSize();
		
		res.put("data", resList);
		res.put("total", total);
//		PageResultInfo res = PaginationHelper.wrapPageResultInfo(pageInfo, (long)db.getTotalSize(), resList);
		return res;
	}
	
}
