package com.chinacreator.common.cps.dao.impl;

import java.util.List;

import com.chinacreator.common.bean.LoginInfo;
import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.cps.bean.CommonDZJlx;
import com.chinacreator.common.cps.bean.DzxxBean;
import com.chinacreator.common.cps.bean.XqzBean;
import com.chinacreator.common.cps.dao.CommonDzxxDao;
import com.chinacreator.common.cps.helper.CommonSequenceHelper;
import com.chinacreator.common.helper.ActionContextHelper;
import com.chinacreator.common.helper.CommonDBBaseHelper;
import com.chinacreator.common.helper.DictionaryCacheHellper;
import com.chinacreator.common.helper.PaginationHelper;
import com.chinacreator.common.helper.Pinyin;
import com.chinacreator.common.helper.ValidateHelper;
import com.chinacreator.lsgl.query.DzQueryBean;
import com.frameworkset.common.poolman.ConfigSQLExecutor;
import com.frameworkset.util.ListInfo;

/**
 * 公共地址信息操作
 * 
 * @filename CommonDzxxDao.java
 * @author mingchun.xiong
 * @date 2013-8-13
 *
 */
public class CommonDzxxDaoImpl implements CommonDzxxDao
{
	private static ConfigSQLExecutor executor = new ConfigSQLExecutor("com/chinacreator/common/cps/dao/dzxx-sql.xml");
	
	/**
	 * 插入地址信息
	 * @param dzxxBean 地址ID
	 * @return
	 * @throws Exception
	 * @date 2013-8-13 下午03:18:30
	 */
	public DzxxBean insertDzxxBean(DzxxBean dzxxBean) throws Exception
	{
		LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
		String xzqh = DictionaryCacheHellper.getSystemParamenterValueByKey("current.xzdm");
		dzxxBean.setDzid(xzqh+loginInfo.getOrgcode().substring(0,4)+CommonDBBaseHelper.getSequence(CommonConstant.DBNAME_SQJW, "seq_common_dzid"));
		dzxxBean.setDzbm(CommonSequenceHelper.getDzbm(dzxxBean.getSsxqdm()));
		dzxxBean.setDjrdwdm(loginInfo.getOrgcode());
		dzxxBean.setDjrdwmc(loginInfo.getOrgname());
		dzxxBean.setDjrxm(loginInfo.getRealname());
		executor.insertBean(CommonConstant.DBNAME_SQJW, "insertDzxxBean", dzxxBean);
		return dzxxBean;
	}
	
	/**查询地址信息
	 * @param dzId 地址ID
	 * @throws Exception
	 * @date 2013-8-13 下午03:19:19
	 */
	public DzxxBean queryDzxxBeanByDzId(String dzId) throws Exception
	{
		return executor.queryObjectWithDBName(DzxxBean.class, CommonConstant.DBNAME_SQJW, "queryDzxxByDzId", dzId);
	}
	
	/**
	 * 更新地址信息
	 * @param dzxxBean
	 * @throws Exception
	 * @date 2013-8-13 下午03:19:52
	 */
	public DzxxBean updateDzxxBean(DzxxBean dzxxBean) throws Exception
	{
		executor.updateBean(CommonConstant.DBNAME_SQJW, "updateDzxxByDzbh",dzxxBean);
		return dzxxBean;
	}
	
	/**
	 * 街路巷的插入
	 */
	public void insertCommonDZJlx(CommonDZJlx jlxBean) throws Exception 
	{
		LoginInfo loginInfo=ActionContextHelper.getLoginInfo();
		String xzqh = DictionaryCacheHellper.getSystemParamenterValueByKey("current.xzdm");

		String id=xzqh+CommonDBBaseHelper.getSequence(CommonConstant.DBNAME_SQJW, "T_COMMON_DZJLX_ID");
		String dm=CommonSequenceHelper.getJlxDm(loginInfo.getOrgcode().substring(0, 4)+"00");
		jlxBean.setId(id);
		jlxBean.setDm(dm);
		String jlxpy= Pinyin.getPinYingJC(jlxBean.getMc());
		jlxBean.setJlxpy(jlxpy);
		jlxBean.setDjdwdm(loginInfo.getOrgcode());
		jlxBean.setDjdwmc(loginInfo.getOrgname());
		jlxBean.setDjrjh(loginInfo.getUsername());
		jlxBean.setDjrsfzh(loginInfo.getSfzh());
		jlxBean.setDjrxm(loginInfo.getRealname());
		executor.insertBean(CommonConstant.DBNAME_SQJW, "insertCommonDZJlx", jlxBean);
	}
	
	/**
	 * 分页查询街路巷
	 */
	public PageResultInfo<CommonDZJlx> queryCommonDZJlxPageResult(
			CommonDZJlx bean, PageInfo pageInfo) throws Exception 
	{
		ListInfo listInfo=executor.queryListInfoBeanWithDBName(CommonDZJlx.class, CommonConstant.DBNAME_SQJW, "queryDzjlxPageResult", pageInfo.getOffset(), pageInfo.getPageSize(), bean);
		return PaginationHelper.wrapPageResultInfo(pageInfo, listInfo);
	}


	public boolean isExistJlxMc(String mc,String ssxzqh) throws Exception{
		List<CommonDZJlx> list=executor.queryListWithDBName(CommonDZJlx.class, CommonConstant.DBNAME_SQJW, "isExistJlxMc", mc,ssxzqh);
		if(list.size()>0){
			return true;
		}
		return false;
	}
	
	public PageResultInfo<DzxxBean> queryDzxxPageResultInfo(DzQueryBean bean,PageInfo pageInfo) throws Exception{
		ListInfo listInfo=executor.queryListInfoBeanWithDBName(DzxxBean.class, CommonConstant.DBNAME_SQJW, "queryDzxxWithPageInfoResult", pageInfo.getOffset(), pageInfo.getPageSize(), bean);
		return PaginationHelper.wrapPageResultInfo(pageInfo, listInfo);
	}

	public CommonDZJlx queryDzJlxInfoById(String id) throws Exception {
		return executor.queryObjectWithDBName(CommonDZJlx.class, CommonConstant.DBNAME_SQJW, "queryDzJlxInfoById", id);
	}

	public void updateCommonDzjlx(CommonDZJlx jlxBean) throws Exception 
	{
		LoginInfo loginInfo=ActionContextHelper.getLoginInfo();
		String jlxpy= Pinyin.getPinYingJC(jlxBean.getMc());
		jlxBean.setJlxpy(jlxpy);
		if (ValidateHelper.isEmptyString(jlxBean.getDjdwdm()))
		{
			jlxBean.setDjdwdm(loginInfo.getOrgcode());
			jlxBean.setDjdwmc(loginInfo.getOrgname());
			jlxBean.setDjrjh(loginInfo.getUsername());
			jlxBean.setDjrsfzh(loginInfo.getSfzh());
			jlxBean.setDjrxm(loginInfo.getRealname());
		}
		executor.updateBean(CommonConstant.DBNAME_SQJW, "updateCommonDzjlx", jlxBean);
	}

	public void deleteCommonDzjlx(CommonDZJlx jlxBean) throws Exception {
		executor.updateBean(CommonConstant.DBNAME_SQJW, "deleteCommonDzjlx", jlxBean);
	}

	public PageResultInfo<CommonDZJlx> queryDzjlxInfoInStxx(CommonDZJlx jlxBean,PageInfo pageInfo)
			throws Exception {
		ListInfo listInfo = executor.queryListInfoBeanWithDBName(CommonDZJlx.class, CommonConstant.DBNAME_SQJW, "queryDzjlxInfoInStxx", pageInfo.getOffset(), pageInfo.getPageSize(), jlxBean);
		return PaginationHelper.wrapPageResultInfo(pageInfo, listInfo);
	}

	@Override
	public PageResultInfo<XqzBean> queryXzqBeanPageResult(XqzBean queryBean,
			PageInfo pageInfo) throws Exception
	{
		ListInfo listInfo = executor.queryListInfoBeanWithDBName(XqzBean.class, CommonConstant.DBNAME_SQJW, "queryXzqBeanPageResult", pageInfo.getOffset(), pageInfo.getPageSize(), queryBean);
		return PaginationHelper.wrapPageResultInfo(pageInfo, listInfo);
	}


	
}
