package com.chinacreator.xqgk.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.apache.commons.lang.StringUtils;

import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.xqgk.bean.XqgkQueryInfo;
import com.chinacreator.xqgk.bean.XqgkQueryInfoDetail;
import com.chinacreator.xqgk.bean.base.MapHandler;
import com.chinacreator.xqgk.bean.base.OrgBean;
import com.chinacreator.xqgk.bean.query.XqfaQueryBean;
import com.chinacreator.xqgk.bean.query.XqgjQueryBean;
import com.chinacreator.xqgk.bean.query.XqgkQueryBean;
import com.chinacreator.xqgk.bean.show.JsjzBean;
import com.chinacreator.xqgk.bean.show.QbhsBean;
import com.chinacreator.xqgk.bean.show.SqjdBean;
import com.chinacreator.xqgk.bean.show.SqkfBean;
import com.chinacreator.xqgk.bean.show.XqgkBean;
import com.chinacreator.xqgk.utils.DateUtils;
import com.chinacreator.xqgk.utils.DeptUtils;
import com.chinacreator.xqgk.utils.UtilsConf;
import com.chinacreator.xqgk.utils.XqgkBaseCache;
import com.frameworkset.common.poolman.ConfigSQLExecutor;
import com.frameworkset.common.poolman.PreparedDBUtil;
import com.frameworkset.common.poolman.SQLParams;
import com.frameworkset.util.ListInfo;

@SuppressWarnings("unchecked")
public class XqgkDataDao implements java.io.Serializable {

	private static final long serialVersionUID = 3876705845854938497L;

	public static XqgkDataDao getInstance(){
		return new XqgkDataDao();
	}
	
	private ConfigSQLExecutor executor = new ConfigSQLExecutor(
			"com/chinacreator/xqgk/dao/sql/xqgkData-sql.xml");

	/**
	 * 获取所有辖区概况基本信息对象
	 * @return
	 * @throws SQLException
	 */
	public List<XqgkQueryInfo> getAllQuery() throws SQLException{
		List<XqgkQueryInfo> queryList = XqgkBaseCache.getInstance().getAllDataFromCache();
		if(queryList == null || queryList.isEmpty()){
			queryList = executor.queryListWithDBName(XqgkQueryInfo.class, CommonConstant.DBNAME_SQJW, "getAllXqgkQuery");
			List<XqgkQueryInfoDetail> queryDetialList = executor.queryListWithDBName(XqgkQueryInfoDetail.class, CommonConstant.DBNAME_SQJW, "getAllXqgkQueryDetail");
			for(XqgkQueryInfo queryInfo : queryList){
				for(XqgkQueryInfoDetail detail : queryDetialList){
					if(queryInfo.getCode().equals(detail.getCode())){
						queryInfo.addData2List(detail);
					}
				}
				XqgkBaseCache.getInstance().addData2Cache(queryInfo.getCode(), queryInfo);
			}
		}
		return queryList;
	}
	
	public XqgkQueryInfo getQueryByCode(String code){
		return XqgkBaseCache.getInstance().getDataFromCache(code);
	}
	
	public int getDataOfQueryInfo(String deptCode, XqgkQueryInfoDetail detail) throws SQLException{
		String ds = detail.getDbSource();
		String sql = detail.getCountSql();
		
		if(StringUtils.isEmpty(ds) || StringUtils.isEmpty(sql)){
			return 0;
		}
		
		if(detail.getIsLikeParam().equals("1")){
			deptCode = DeptUtils.getLevelCode(deptCode) + "%";
		}
		
		SQLParams param = new SQLParams();
		param.addSQLParam("deptCode", deptCode, SQLParams.STRING);
		if("1".equals(detail.getNeedTime())){
			param.addSQLParam("tjMonth", DateUtils.getDateTime(detail.getTimeFormat(), new Date()), SQLParams.STRING);
		}else if("2".equals(detail.getNeedTime())){
			param.addSQLParam("startTime", DateUtils.getDateTime(detail.getTimeFormat(), DateUtils.getFirstTimeOfDayNumBeforeToday(-30)), SQLParams.STRING);
			param.addSQLParam("endTime", DateUtils.getDateTime(detail.getTimeFormat(), DateUtils.getLastTimeBeforeToday(-1)), SQLParams.STRING);
		}
		
		PreparedDBUtil pdb = new PreparedDBUtil();
		pdb.preparedSelect(param, ds, sql);
		pdb.executePrepared();
		
		if(pdb.size() > 0){
			return pdb.getInt(0, 0);
		}else{
			return 0;
		}
	}
	
	/**
	 * 获取辖区内所有派出所数量
	 * @param deptCode
	 * @return
	 * @throws SQLException
	 */
	public String getNumOfAllChildJWQ(String deptCode) throws SQLException{
		return executor.queryFieldWithDBName(CommonConstant.DBNAME_SQJW, "getNumOfAllChildJWQ", deptCode);
	}
	
	/**
	 * 获取辖区内所有社区数量
	 * @param deptCode
	 * @return
	 * @throws SQLException
	 */
	public String getNumOfAllChildSQ(String deptCode) throws SQLException{
		return executor.queryFieldWithDBName(CommonConstant.DBNAME_SQJW, "getNumOfAllChildSQ", deptCode);
	}
	
	/**
	 * 获取辖区内所有社区（行政社区）
	 * @param deptCode
	 * @return
	 * @throws SQLException
	 */
	public List<HashMap> getAllSQOfDept(String deptCode) throws SQLException{
		String param = DeptUtils.getLevelCode(deptCode) + "%";
		return executor.queryListWithDBNameByRowHandler(new MapHandler(),
				HashMap.class, CommonConstant.DBNAME_SQJW, "getAllSQOfDept", param);
	}
	
	/**
	 * 获取辖区内近期全部发案
	 * @param deptCode
	 * @param startTime
	 * @param endTime
	 * @return
	 * @throws SQLException
	 */
	public List<HashMap> getLatestAJInfo(XqfaQueryBean query) throws SQLException {
		return executor.queryListBeanWithDBNameByRowHandler(new MapHandler(),
				HashMap.class, UtilsConf.DBNAME_ZFBA, "getLatestAJInfo", query);
	}
	
	/**
	 * 获取辖区内所有重点人员轨迹(带翻页)
	 * @param pageInfo
	 * @param deptCode
	 * @return
	 * @throws SQLException
	 */
	public List<HashMap> getLatestRYInfo(PageInfo pageInfo, XqgjQueryBean query) throws SQLException{
		List list = new ArrayList();
		if(pageInfo == null){
			list = executor.queryListBeanWithDBNameByRowHandler(
					new MapHandler(), HashMap.class, UtilsConf.DBNAME_QBPT, 
					"getLatestRYInfo", query);
		}else{
			ListInfo listInfo = executor.queryListInfoBeanWithDBNameByRowHandler(
					new MapHandler(), HashMap.class, UtilsConf.DBNAME_QBPT,
					"getLatestRYInfo", pageInfo.getOffset(), pageInfo.getPageSize(), query);
			list = listInfo.getDatas();
		}
		return list;
	}
	/**
	 * 获取辖区全年发案
	 * @param query
	 * @return
	 * @throws Exception
	 */
	public String queryYearXqzaInfoOfDept(XqfaQueryBean query) throws Exception {
		return executor.queryFieldBeanWithDBName(CommonConstant.DBNAME_SQJW, "queryYearXqzaInfoOfDept", query);
	}
	
	/**
	 * 获取机构对象
	 * @param deptCode
	 * @return
	 * @throws SQLException
	 */
	public OrgBean getOrgBeanByCode(String deptCode) throws SQLException{
		return executor.queryObjectWithDBName(OrgBean.class, CommonConstant.DBNAME_SQJW, "getOrgBeanByCode", deptCode);
	}
	
	/**
	 * 获取辖区内重点人员分类情况
	 * @deprecated
	 * @param deptCode
	 * @return
	 * @throws Exception
	 */
	public List<HashMap> showZdryInfoOfDept(String deptCode) throws Exception{
		StringBuilder sb = new StringBuilder();
		sb.append("select b.mc, nvl(a.cou, 0) as cou from ");
		sb.append("(select substr(dm,2,1) code, t.mc from t_dm_ga t where substr(dm,3,2) = '00') b ");
		sb.append(" left join ");
		sb.append("(select instr(t.zdrylbbj,'1') code, count(distinct t.sfzh) cou from t_zdry_idx_jxxx t where t.yxx = '1'and t.gxdwjgdm like #[deptCode] group by instr(t.zdrylbbj,'1')) a");		
		sb.append(" on a.code = b.code order by cou desc, b.code asc");
		
		SQLParams param = new SQLParams();
		String pCode = DeptUtils.getLevelCode(deptCode) + "%";
		param.addSQLParam("deptCode", pCode, SQLParams.STRING);
		
		PreparedDBUtil pdb = new PreparedDBUtil();
		pdb.preparedSelect(param, UtilsConf.DBNAME_QBPT, sb.toString());
		List<HashMap> res = pdb.executePreparedForList(HashMap.class, new MapHandler());
		return res;
	}
	
	/**
	 * @deprecated
	 * @param deptCode
	 * @return
	 * @throws Exception
	 */
	public int getGjCountOfYear(String deptCode) throws Exception{
		Calendar cal = Calendar.getInstance();
		String startTime = cal.get(Calendar.YEAR) + "-01-01 00:00:00";
		String endTime = cal.get(Calendar.YEAR) + "-12-31 23:59:59";
		String queryCode = DeptUtils.getLevelCode(deptCode) + "%";
		String res = executor.queryFieldWithDBName(UtilsConf.DBNAME_QBPT, "getGjCountOfYear", startTime, endTime, queryCode);
		try{
			return Integer.parseInt(res);
		}catch(Exception e){
			return 0;
		}
	}
	
	/**
	 * 检索辖区基本信息
	 * @param queryBean
	 * @return
	 * @throws Exception
	 */
	public XqgkBean getXqgkBean(XqgkQueryBean queryBean) throws Exception{
		StringBuilder sb = new StringBuilder();
		sb.append("select * from (");
		sb.append("select a.orgcode, a.num, rownum as rankNum, b.jgCou as rankTotal from ");
		sb.append("(select orgcode, " + queryBean.getNumCol() + " as num from t_common_xqtjqk t where leve = #[level]  order by num desc) a, ");		
		sb.append("(select count(1) jgCou from t_common_xqtjqk t where leve = #[level]) b ");
		sb.append(") where orgcode = #[deptCode]");
		
		SQLParams param = new SQLParams();
		param.addSQLParam("level", queryBean.getLevel(), SQLParams.STRING);
		param.addSQLParam("deptCode", queryBean.getOrgCode(), SQLParams.STRING);
		param.addSQLParam("tjDate", queryBean.getTjDate(), SQLParams.STRING);
		
		PreparedDBUtil pdb = new PreparedDBUtil();
		pdb.preparedSelect(param, CommonConstant.DBNAME_SQJW, sb.toString());
		
		XqgkBean res = (XqgkBean) pdb.executePreparedForObject(XqgkBean.class);
		if(res == null){
			res = new XqgkBean();
		}
		res.setType(queryBean.getType());
		return res;
	}
	
	public List<QbhsBean> getQbhsOfDept(String deptCode) throws Exception{
		String paramCode = DeptUtils.getLevelCode(deptCode) + "%";
		return executor.queryListWithDBName(QbhsBean.class, CommonConstant.DBNAME_SQJW, "getQbhsOfDept", paramCode);
	}
	
	public List<JsjzBean> getJsjzOfDept(String deptCode) throws Exception{
		String paramCode = DeptUtils.getLevelCode(deptCode) + "%";
		return executor.queryListWithDBName(JsjzBean.class, CommonConstant.DBNAME_SQJW, "getJsjzOfDept", paramCode);
	}
	
	public List<SqjdBean> getSqjdOfDept(String deptCode) throws Exception{
		String paramCode = DeptUtils.getLevelCode(deptCode) + "%";
		return executor.queryListWithDBName(SqjdBean.class, CommonConstant.DBNAME_SQJW, "getSqjdOfDept", paramCode);
	}
	
	public List<SqkfBean> getSqkfOfDept(String deptCode) throws Exception{
		String paramCode = DeptUtils.getLevelCode(deptCode) + "%";
		return executor.queryListWithDBName(SqkfBean.class, CommonConstant.DBNAME_SQJW, "getSqkfOfDept", paramCode);
	}
	
	public List<QbhsBean> getDclQbhsOfDept(String deptCode) throws Exception{
		String paramCode = DeptUtils.getLevelCode(deptCode) + "%";
		String kcbgTime = DateUtils.getDateTime("yyyy-MM-dd", DateUtils.getLastTimeBeforeToday(-(30 - 7)));//考察报告30天填写一次，提前7天提醒
		String kcbTime = DateUtils.getDateTime("yyyy-MM-dd", DateUtils.getLastTimeBeforeToday(-(90 - 7)));//考察报告90天填写一次，提前7天提醒
		return executor.queryListWithDBName(QbhsBean.class, UtilsConf.DBNAME_DXFZFBA, "getDclQbhsOfDept", paramCode, kcbgTime, kcbTime);
	}
	
	public List<JsjzBean> getDclJsjzOfDept(String deptCode) throws Exception{
		String paramCode = DeptUtils.getLevelCode(deptCode) + "%";
		String kcbgTime = DateUtils.getDateTime("yyyy-MM-dd", DateUtils.getLastTimeBeforeToday(-(30 - 7)));//考察报告30天填写一次，提前7天提醒
		String kcbTime = DateUtils.getDateTime("yyyy-MM-dd", DateUtils.getLastTimeBeforeToday(-(90 - 7)));//考察报告90天填写一次，提前7天提醒
		return executor.queryListWithDBName(JsjzBean.class, UtilsConf.DBNAME_DXFZFBA, "getDclJsjzOfDept", paramCode, kcbgTime, kcbTime);
	}

	public List<SqjdBean> getDclSqjdOfDept(String deptCode) throws Exception{
		String paramCode = DeptUtils.getLevelCode(deptCode) + "%";
		String kcbgTime = DateUtils.getDateTime("yyyy-MM-dd", DateUtils.getLastTimeBeforeToday(-(30 - 7)));
		String kcbTime = DateUtils.getDateTime("yyyy-MM-dd", DateUtils.getLastTimeBeforeToday(-(30 - 7)));
		return executor.queryListWithDBName(SqjdBean.class, UtilsConf.DBNAME_DXFZFBA, "getDclSqjdOfDept", paramCode, kcbgTime, kcbTime);
	}
	public List<SqkfBean> getDclSqkfOfDept(String deptCode) throws Exception{
		String paramCode = DeptUtils.getLevelCode(deptCode) + "%";
		String kcbgTime = DateUtils.getDateTime("yyyy-MM-dd", DateUtils.getLastTimeBeforeToday(-(30 - 7)));
		String kcbTime = DateUtils.getDateTime("yyyy-MM-dd", DateUtils.getLastTimeBeforeToday(-(30 - 7)));
		return executor.queryListWithDBName(SqkfBean.class, UtilsConf.DBNAME_DXFZFBA, "getDclSqkfOfDept", paramCode, kcbgTime, kcbTime);
	}
}
