package com.chinacreator.lsgl.dao.impl;
/**
 * 居住证Dao实现类
 */
import java.sql.SQLException;
import java.util.List;

import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.cps.bean.RkJbxxBean;
import com.chinacreator.common.helper.PaginationHelper;
import com.chinacreator.common.helper.ValidateHelper;
import com.chinacreator.lsgl.bean.FatjBean;
import com.chinacreator.lsgl.bean.JzzTjBean;
import com.chinacreator.lsgl.bean.LdrkJzzxxBean;
import com.chinacreator.lsgl.bean.LdrkTjBean;
import com.chinacreator.lsgl.bean.LdrkxxBean;
import com.chinacreator.lsgl.bean.RsdfxBean;
import com.chinacreator.lsgl.dao.LsglLdrkJzzxxDao;
import com.chinacreator.lsgl.query.JzzQueryBean;
import com.chinacreator.lsgl.query.TjQueryBean;
import com.frameworkset.common.poolman.ConfigSQLExecutor;
import com.frameworkset.common.poolman.SQLExecutor;
import com.frameworkset.common.poolman.SQLParams;
import com.frameworkset.util.ListInfo;

public class LsglLdrkJzzxxDaoImpl implements LsglLdrkJzzxxDao
{

	private static ConfigSQLExecutor executor = new  ConfigSQLExecutor("com/chinacreator/lsgl/dao/ldrkjzzxx-sql.xml");
	
	public void insertJzzxxBean(LdrkJzzxxBean jzzxxBean) throws Exception {
		executor.insertBean(CommonConstant.DBNAME_SQJW, "insertJzzxxBean", jzzxxBean);
	}

	public LdrkJzzxxBean queryJzzxxBeanByRybh(String rybh) throws Exception {
		return executor.queryObjectWithDBName(LdrkJzzxxBean.class, CommonConstant.DBNAME_SQJW, "queryJzzxxBeanByRybh", rybh);
	}

	public PageResultInfo<LdrkJzzxxBean> queryJzzxxPageByRybh(String rybh,
			PageInfo pageInfo) throws Exception {
		ListInfo listInfo = executor.queryListInfoWithDBName(LdrkJzzxxBean.class, CommonConstant.DBNAME_SQJW, "queryJzzxxPageByRybh", pageInfo.getOffset(), pageInfo.getPageSize(), rybh);
		return PaginationHelper.wrapPageResultInfo(pageInfo, listInfo);
	}

	public void updateJzzxxBean(LdrkJzzxxBean jzzxxBean)
			throws Exception {
		executor.updateBean(CommonConstant.DBNAME_SQJW, "updateJzzxxBean", jzzxxBean);
	}

	public PageResultInfo<LdrkJzzxxBean> queryJzzxxBeanPageInfo(
			JzzQueryBean queryBean, PageInfo pageInfo) throws Exception 
	{
		ListInfo listInfo = executor.queryListInfoBeanWithDBName(LdrkJzzxxBean.class, CommonConstant.DBNAME_SQJW, "queryJzzxxBeanPageInfo",pageInfo.getOffset(),pageInfo.getPageSize(),queryBean);
		return PaginationHelper.wrapPageResultInfo(pageInfo, listInfo);
	}
	
	@Override
	public List<LdrkJzzxxBean> queryJzzxxList(JzzQueryBean queryBean) throws SQLException{
		return executor.queryListBeanWithDBName(LdrkJzzxxBean.class, CommonConstant.DBNAME_SQJW, "queryJzzxxBeanPageInfo",queryBean);
	}
	
	public void updateJzzxxBeanDyZt(LdrkJzzxxBean jzzxxBean) throws Exception {
		executor.updateBean(CommonConstant.DBNAME_SQJW, "updateJzzxxBeanDyZt", jzzxxBean);
	}

	@Override
	public List<LdrkTjBean> queryLdrkTjBean(JzzQueryBean queryBean) throws Exception {
		StringBuffer sb = new StringBuffer();
		int leve = queryBean.getLeve();
		int leve2=leve;
		if(leve==4){
			leve2 =leve+1;
		}
		sb.append("select o.orgcode, o.orgname, nvl(s.total, 0) as count ");
		sb.append("from t_common_organization_sjjs o ");
		sb.append("left join ");
		sb.append("(select substr(lk.djdwdm, 1, (to_number("+leve2+")+1)*2) as dm,count(1) as total ");
		sb.append("from t_lsgl_rk_ldrkzzxx lk inner join t_lsgl_rk_jbxx jb on lk.rybh = jb.rybh ");
		sb.append("where lk.djdwdm is not null ");
		sb.append("and (lk.zxbs='0' or lk.zxbs is null) ");
		if(ValidateHelper.isNotEmptyString(queryBean.getMz())){
			sb.append(" and jb.mz ='"+queryBean.getMz()+"' ");
		}
		if(ValidateHelper.isNotEmptyString(queryBean.getHjdqh())){
			sb.append(" and jb.hjdqh = '"+queryBean.getHjdqh()+"' ");
		}
		if(ValidateHelper.isNotEmptyString(queryBean.getDjsj_start())){
			sb.append(" and lk.djsj >= to_date('"+queryBean.getDjsj_start()+" 00:00:00'"+",'yyyy-mm-dd hh24:mi:ss') ");
		}
		if(ValidateHelper.isNotEmptyString(queryBean.getDjsj_end())){
			sb.append(" and lk.djsj <= to_date('"+queryBean.getDjsj_end()+" 23:59:59'"+",'yyyy-mm-dd hh24:mi:ss') ");
		}
		sb.append("group by substr(lk.djdwdm, 1, (to_number("+leve2+")+1)*2)) s ");
		sb.append("on substr(o.orgcode, 1, (to_number("+leve2+")+1)*2) = s.dm ");
		sb.append("where o.orgcode like substr("+queryBean.getOrgcode()+",1,to_number("+leve+")*2)||'%' ");
		if(1==leve)
		{
			sb.append("and substr(orgcode, 3, 2) <> '00' ");
			sb.append("and substr(orgcode, 5, 8) = '00000000' ");
		}
		else if(2==leve)
		{
			sb.append("and substr(orgcode, 5, 2) <> '00' ");
			sb.append("and substr(orgcode, 7, 6) = '000000' ");
		}
		else if(3==leve)
		{
			sb.append("and substr(orgcode, 7, 2) > '40' and substr(orgcode, 7, 2)<'83' ");
			sb.append("and substr(orgcode, 9, 4) = '0000' ");
		}
		else if(4==leve)
		{
			sb.append("and substr(orgcode, 9, 2) = '31' ");
			sb.append("and substr(orgcode, 11, 2) <> '00' ");
		}
		else if(5==leve)
		{
			sb.append("and orgcode ="+queryBean.getOrgcode()+"");
		}
		String sql = sb.toString();
//		String sql =executor.getSql("queryLdrkTjBean");
		return SQLExecutor.queryListWithDBName(LdrkTjBean.class, CommonConstant.DBNAME_SQJW, sql);
	//	return executor.queryListBeanWithDBName(LdrkTjBean.class,CommonConstant.DBNAME_SQJW, "queryLdrkTjBean", queryBean);
	}

	@Override
	public PageResultInfo<LdrkxxBean> queryLdrkZhQueryPageResult(JzzQueryBean queryBean, PageInfo pageInfo) throws Exception
	{
		if (queryBean.isUsePage())
		{
			ListInfo listInfo = executor.queryListInfoBeanWithDBName(LdrkxxBean.class, CommonConstant.DBNAME_SQJW, "queryLdrkZhQueryPageResult", pageInfo.getOffset(), pageInfo.getPageSize(), queryBean);
			return PaginationHelper.wrapPageResultInfo(pageInfo, listInfo);
		}
		else
		{
			List<LdrkxxBean> list = executor.queryListBeanWithDBName(LdrkxxBean.class, CommonConstant.DBNAME_SQJW, "queryLdrkZhQueryPageResult", queryBean);
			return PaginationHelper.wrapPageResultInfo(pageInfo, (long)list.size(), list);
		}
	}

	@Override
	public List<FatjBean> queryFatjBean(TjQueryBean tjqueryBean)
			throws Exception {
		//String sql = executor.getSql("queryFatjBean");
		List<FatjBean> list = executor.queryListBeanWithDBName(FatjBean.class, CommonConstant.DBNAME_SQJW, "queryFatjBean2", tjqueryBean);
		return list;
	}

	@Override
	public PageResultInfo<RsdfxBean> queryRsdfxBeansPageResult(
			JzzQueryBean queryBean, PageInfo pageInfo) throws Exception
	{
		PageResultInfo<RsdfxBean> pageResultInfo = null;
		if (queryBean.isUsePage())
		{
			ListInfo listInfo = executor.queryListInfoBeanWithDBName(RsdfxBean.class, CommonConstant.DBNAME_SQJW, "queryRsdfxBeansPageResult", pageInfo.getOffset(), pageInfo.getPageSize(), queryBean);
			pageResultInfo = PaginationHelper.wrapPageResultInfo(pageInfo, listInfo);
		}
		else
		{
			List<RsdfxBean> list = executor.queryListBeanWithDBName(RsdfxBean.class, CommonConstant.DBNAME_SQJW, "queryRsdfxBeansPageResult", queryBean);
			pageResultInfo = PaginationHelper.wrapPageResultInfo(pageInfo, (long)list.size(), list);
		}
		return pageResultInfo;
	}
	
	@Override
	public List<JzzTjBean> queryJzztjBeanList(JzzQueryBean queryBean) throws SQLException{
		return executor.queryListBeanWithDBName(JzzTjBean.class, CommonConstant.DBNAME_SQJW, "queryJzztjBeanList", queryBean);
	}
	
	/**
	 * 通过暂住编号查询居住证信息
	 */
	@Override
	public LdrkJzzxxBean queryJzzxxBeanByZzbh(String zzbh) throws Exception
	{
		return executor.queryObjectWithDBName(LdrkJzzxxBean.class, CommonConstant.DBNAME_SQJW, "queryJzzxxBeanByZzbh", zzbh);
	}

	@Override
	public PageResultInfo<LdrkJzzxxBean> queryJzzxxPageByZzbh(String zzbh,
			PageInfo pageInfo) throws Exception
	{
		ListInfo listInfo = executor.queryListInfoWithDBName(LdrkJzzxxBean.class, CommonConstant.DBNAME_SQJW, "queryJzzxxPageByZzbh", pageInfo.getOffset(), pageInfo.getPageSize(), zzbh);
		return PaginationHelper.wrapPageResultInfo(pageInfo, listInfo);
	}

	@Override
	public void zxJzzxxBean(String jzzxxbh) throws Exception
	{
		SQLParams params = new SQLParams();
		params.addSQLParam("jzzxxbh", jzzxxbh, SQLParams.STRING);
		executor.updateBean(CommonConstant.DBNAME_SQJW, "zxJzzxxBean", params);
	}

	@Override
	public LdrkJzzxxBean queryJzzxxBeanByJzzbh(String jzzbh) throws Exception
	{
		SQLParams params = new SQLParams();
		params.addSQLParam("jzzxxbh", jzzbh, SQLParams.STRING);
		return executor.queryObjectBeanWithDBName(LdrkJzzxxBean.class, CommonConstant.DBNAME_SQJW, "queryJzzxxBeanByJzzbh", params);
	}

	@Override
	public RkJbxxBean queryRkJbxxBeanByRybh(String rybh) throws Exception
	{
		SQLParams params = new SQLParams();
		params.addSQLParam("rybh", rybh, SQLParams.STRING);
		return executor.queryObjectBeanWithDBName(RkJbxxBean.class, CommonConstant.DBNAME_SQJW, "queryRkJbxxBeanByRybh", params);
	}

	@Override
	public LdrkxxBean getLdrkShorBeanInfo(String zzbh) throws Exception
	{
		return executor.queryObjectWithDBName(LdrkxxBean.class,CommonConstant.DBNAME_SQJW, "getLdrkXzzxz", zzbh);
	}

	@Override
	public void zxLdrkJzzxx(String rybh) throws Exception
	{
		SQLParams params = new SQLParams();
		params.addSQLParam("rybh", rybh, SQLParams.STRING);
		executor.updateBean(CommonConstant.DBNAME_SQJW, "zxLdrkJzzxx", params);
	}
}
