package com.chinacreator.common.cps.business;

import java.sql.Blob;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.chinacreator.common.bean.LoginInfo;
import com.chinacreator.common.bean.OrganizationBean;
import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.bean.SystemDictionaryBean;
import com.chinacreator.common.bean.UserBean;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.cps.bean.RkJbxxBean;
import com.chinacreator.common.cps.bean.SqJbxxBean;
import com.chinacreator.common.cps.bean.TreeNode;
import com.chinacreator.common.cps.bean.UserLxfsBean;
import com.chinacreator.common.cps.bean.XqxxBean;
import com.chinacreator.common.helper.ActionContextHelper;
import com.chinacreator.common.helper.DateTimeHelper;
import com.chinacreator.common.helper.PaginationHelper;
import com.chinacreator.common.helper.ValidateHelper;
import com.chinacreator.lsgl.bean.CzrkxxBean;
import com.chinacreator.remote.bean.CzrkInfoBean;
import com.chinacreator.remote.business.RemoteRequestService;
import com.frameworkset.common.poolman.ConfigSQLExecutor;
import com.frameworkset.common.poolman.DBUtil;
import com.frameworkset.common.poolman.SQLExecutor;
import com.frameworkset.common.poolman.SQLParams;
import com.frameworkset.util.ListInfo;

public class OrgUserbusiness
{
	private static ConfigSQLExecutor executor =  new ConfigSQLExecutor("com/chinacreator/common/cps/business/orguserbusiness-sql.xml");
	
	/**
	 * 通过机构代码查询树根节点
	 * @param orgCode
	 * @return
	 */
	public TreeNode queryOrganizationByOrgCode(String orgCode)
	{
		TreeNode tn = null;
		try
		{
			tn = executor.queryObjectWithDBName(TreeNode.class, CommonConstant.DBNAME_SQJW, "queryOrganizationByOrgCode", orgCode);
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		return tn;
	}
	
	public int queryCzrkStCount(String sfzh)
	{
		String sql = "select count(1) from t_lsgl_rk_czrk_st where sfhm=? and glzt not in ('2','3','4')";
		try
		{
			String tn = SQLExecutor.queryFieldWithDBName(CommonConstant.DBNAME_SQJW, sql, sfzh);
			return Integer.parseInt(tn);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return 0;
	}
	
	/**
	 * 根据父代码查询子机构
	 * @param parentcode 父代码
	 * @return
	 */
	public List<TreeNode> queryOrganizationListByParentCode(String parentcode)
	{
		List<TreeNode> list = null;
		try
		{
			list = executor.queryListWithDBName(TreeNode.class, CommonConstant.DBNAME_SQJW, "queryOrganizationListByParentCode", parentcode);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return list;
	}
	
	/**
	 * 根据父代码查询子机构
	 * @param parentcode 父代码
	 * @return
	 */
	public List<TreeNode> queryOrganizationListByParentCode2(String parent_dm,int leve)
	{
		List<TreeNode> list = null;
		try
		{
			TreeNode bean = new TreeNode();
			bean.setParentId(parent_dm);
			bean.setLeve(leve + "");
			list = executor.queryListBeanWithDBName(TreeNode.class, CommonConstant.DBNAME_SQJW, "queryOrganizationListByParentCode2", bean);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return list;
	}
	
	
	public List<TreeNode> queryOrganizationListByParentCode3(String parent_dm,int leve)
	{
		List<TreeNode> list = null;
		try
		{
			TreeNode bean = new TreeNode();
			bean.setParentId(parent_dm);
			bean.setLeve(leve + "");
			list = executor.queryListBeanWithDBName(TreeNode.class, CommonConstant.DBNAME_SQJW, "queryOrganizationListByParentCode3", bean);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return list;
	}
	
	/**
	 * 搜索机构代码通过searchname
	 * @param searchname
	 * @return
	 */
	public List<TreeNode> searchOrganizationListBySearchName(String searchname)
	{
		List<TreeNode> list = null;
		try
		{
			list = executor.queryListWithDBName(TreeNode.class, CommonConstant.DBNAME_SQJW, "queryOrganizationListBySearchName", searchname);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return list;
	}
	
	/**
	 * 通过机构代码获取用户集合
	 * @param orgcode
	 * @return
	 */
	public List<UserBean> queryUserListByOrgCode(String orgcode,int pageNum)
	{
		List<UserBean> list = null;
		try
		{
			list = executor.queryListWithDBName(UserBean.class, CommonConstant.DBNAME_SQJW, "queryUserListByOrgCode", orgcode, (pageNum - 1) * 50 + 1, (pageNum - 1) * 50 + 50);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return list;
	}
	
	public PageResultInfo<UserLxfsBean>  queryUserListPageInfoByOrgCode(String orgcode,PageInfo pageInfo) throws Exception
	{
		ListInfo listInfo = executor.queryListInfoWithDBName(UserLxfsBean.class, CommonConstant.DBNAME_SQJW, "queryUserListPageInfoByOrgCode", pageInfo.getOffset(), pageInfo.getPageSize(), orgcode);
		return PaginationHelper.wrapPageResultInfo(pageInfo, listInfo);
	}
	
	public PageResultInfo<UserLxfsBean>  queryUserListOfPcsPageInfoByOrgCode(String orgcode,PageInfo pageInfo) throws Exception
	{
		ListInfo listInfo = executor.queryListInfoWithDBName(UserLxfsBean.class, CommonConstant.DBNAME_SQJW, "queryUserListOfPcsPageInfoByOrgCode", pageInfo.getOffset(), pageInfo.getPageSize(), orgcode);
		return PaginationHelper.wrapPageResultInfo(pageInfo, listInfo);
	}
	/**
	 * 通过名字模糊查询
	 * @param searchname
	 * @return
	 */
	public List<UserBean> seachUserBeanListBySearchName(String searchname)
	{
		List<UserBean> list = null;
		try
		{
			list = executor.queryListWithDBName(UserBean.class, CommonConstant.DBNAME_SQJW, "seachUserBeanListBySearchName", searchname,searchname,searchname);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return list;
	}
	
	/**
	 * 查询结构子节点
	 * @param orgCode
	 * @param leve
	 * @return
	 */
	public List<OrganizationBean> queryOrgChildOrgListByParentCode(String orgCode, int leve)
	{
		List<OrganizationBean> list = null;
		try
		{
			list = executor.queryListWithDBName(OrganizationBean.class, CommonConstant.DBNAME_SQJW, "queryOrgChildOrgListByParentCode", orgCode,leve);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return list;
	}
	
	/**
	 * 通过附代码查询所有的孩子行政区划包括自身
	 * @param parentDm
	 * @return
	 */
	public List<TreeNode> queryChildXzqhListByParentDm(String parentDm)
	{
		List<TreeNode> list = null;
		try
		{
			list = executor.queryListWithDBName(TreeNode.class, CommonConstant.DBNAME_SQJW, "queryChildXzqhListByParentDm", parentDm);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return list;
	}
	
	/**
	 * 通过父行政区划代码查询下级行政区划代码，不包括自身
	 * @param parentDM
	 * @return
	 */
	public List<SystemDictionaryBean> queryLeafXzqhListByParentDm(String parentDm)
	{
		List<SystemDictionaryBean> list = null;
		try
		{
			list = executor.queryListWithDBName(SystemDictionaryBean.class, CommonConstant.DBNAME_SQJW, "queryLeafXzqhListByParentDm", parentDm);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return list;
	}
	
	/**
	 * 查询全部的行政区划
	 * @return
	 */
	public List<TreeNode> queryAllXzqhList()
	{
		List<TreeNode> list = null;
		try
		{
			list = executor.queryListWithDBName(TreeNode.class, CommonConstant.DBNAME_SQJW, "queryAllXzqhList");
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return list;
	}
	
	/**
	 * 查询孩子行政区划
	 * @param parentDm
	 * @return
	 * @date 2013-8-24 上午10:46:07
	 */
	public List<TreeNode> queryChildXzqhByParentDm(String parentDm)
	{
		List<TreeNode> list = null;
		try
		{
			list = executor.queryListWithDBName(TreeNode.class, CommonConstant.DBNAME_SQJW, "queryChildXzqhByParentDm", parentDm);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return list;
	}
	
	/**
	 * 查询派出所
	 * @param parentDm
	 * @return
	 */
	public List<OrganizationBean> queryPcsOrgListByParentDm(String parentDm)
	{
		List<OrganizationBean> list = null;
		try
		{
			list = executor.queryListWithDBName(OrganizationBean.class, CommonConstant.DBNAME_SQJW, "queryPcsOrgListByParentDm", parentDm);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		if (list == null)
		{
			list = new ArrayList<OrganizationBean>();
		}
		return list;
	}
	
	/**
	 * 通过派出所代码加载出警务室/社区机构
	 * @param pcsdm
	 * @return
	 */
	public List<OrganizationBean> queryJwsqOrgListByParentDm(String pcsdm)
	{
		List<OrganizationBean> list = null;
		try
		{
			if (ValidateHelper.isNotEmptyString(pcsdm) && pcsdm.length() > 8)
			{
				String zdqdm = pcsdm.subSequence(0, 8) + "3100";
				list = queryPcsOrgListByParentDm(zdqdm);
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return list;
	}

	/**
	 * 
	 * @param sfzh
	 * @param usersfzh
	 * @param realname
	 * @param orgcode
	 * @return
	 * @date Jan 10, 2015 12:27:23 PM
	 */
	public CzrkxxBean queryRyxxBeanByUserInfo(String sfzh,String usersfzh, String realname, String orgcode)
	{
		CzrkInfoBean bean = null;
		try
		{
			RemoteRequestService service = new RemoteRequestService();
			bean = service.queryCzrkInfoBySfzhAndUserInfo(sfzh,usersfzh, realname, orgcode);
			if (bean != null && ValidateHelper.isNotEmptyString(bean.getCsrq()))
			{
				bean.setCsrq(DateTimeHelper.convert(DateTimeHelper.convertToTimestamp(bean.getCsrq(), "yyyyMMdd"), "yyyy-MM-dd"));
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		CzrkxxBean czrkBean = null;
		if (bean != null)
		{
			czrkBean = new CzrkxxBean();
			converRemoteRkInfoToCzrkxxBean(czrkBean, bean);
		}
		return czrkBean;
	}
	/**
	 * 通过身份证号查询人员信息，调用联动服务接口查询
	 */
	public CzrkxxBean queryRyxxBean(String sfzh) 
	{
		CzrkInfoBean bean = null;
		try
		{
			RemoteRequestService service = new RemoteRequestService();
			List<CzrkInfoBean> czrkBeanList = service.queryCzrkInfoBySfzh(sfzh);
			if (ValidateHelper.isNotEmptyCollection(czrkBeanList)) 
			{
				bean = czrkBeanList.get(0);
				if (ValidateHelper.isNotEmptyString(bean.getCsrq()))
				{
					bean.setCsrq(DateTimeHelper.convert(DateTimeHelper.convertToTimestamp(bean.getCsrq(), "yyyyMMdd"), "yyyy-MM-dd"));
				}
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		CzrkxxBean czrkBean = null;
		if (bean != null)
		{
			czrkBean = new CzrkxxBean();
			converRemoteRkInfoToCzrkxxBean(czrkBean, bean);
		}
		return czrkBean;
	}
	
	private void converRemoteRkInfoToCzrkxxBean(CzrkxxBean czrkBean, CzrkInfoBean bean)
	{
		czrkBean.setXm(bean.getXm());
		czrkBean.setXb(bean.getXb());
		czrkBean.setBmch(bean.getCym());
		czrkBean.setMz(bean.getMz());
		czrkBean.setCsrq(bean.getCsrq());
		czrkBean.setZzssxq(bean.getZzssxq());
		czrkBean.setZzxz(bean.getZzxz());
		czrkBean.setQtzzssxq(bean.getQtzzxq());
		czrkBean.setQtzzxz(bean.getQtzzxz());
		czrkBean.setJg(bean.getCsd());
		czrkBean.setCsd(bean.getCsd());
		czrkBean.setSfzh(bean.getSfzh());
		czrkBean.setWhcd(bean.getWhcd());
		czrkBean.setHyzk(bean.getHyzk());
		czrkBean.setSg(bean.getSg());
		czrkBean.setZydm(bean.getZy());
		czrkBean.setFwcs(bean.getFwcs());
		czrkBean.setBdsj(DateTimeHelper.conver(DateTimeHelper.convertToDate(bean.getBdrq(), "yyyyMMdd"), "yyyy-MM-dd"));
		czrkBean.setBdyy(bean.getBdyy());
		czrkBean.setQrsj(DateTimeHelper.conver(DateTimeHelper.convertToDate(bean.getHsqr(), "yyyyMMdd"), "yyyy-MM-dd"));
		czrkBean.setHdqrxz(bean.getHdqr());
		czrkBean.setZrdwdm(bean.getSspcsjgdm());
		czrkBean.setZrdwmc(bean.getSspcsmc());
		czrkBean.setHklb(bean.getHlx());
		czrkBean.setHh(bean.getHh());
		czrkBean.setYhzgx(bean.getYhzgx());
		czrkBean.setHjdqh(bean.getZzssxq());
		czrkBean.setHjdxz(bean.getZzxz());
		czrkBean.setSsgajgjgdm(bean.getSsgajgjgdm());
		czrkBean.setSsgajgjgmc(bean.getSsgajgmc());
		czrkBean.setSspcsdm(bean.getSspcsjgdm());
		czrkBean.setSspcsmc(bean.getSspcsmc());
		czrkBean.setXzzqh(bean.getZzssxq());
		czrkBean.setXzzqhmc(bean.getZzssxqmc());
		czrkBean.setXzzxz(bean.getZzxz());
	}
	
	/**
	 * 通过派出所代码获取社区
	 * @param pcsdm
	 * @return
	 */
	public List<SqJbxxBean> findSqBeanByPcsdm(String pcsdm)
	{
		LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
		List<SqJbxxBean> list = null;
		try
		{
			SQLParams params = new SQLParams();
			params.addSQLParam("leve", loginInfo.getLeve(), SQLParams.INT);
			params.addSQLParam("orgcode", loginInfo.getOrgcode(), SQLParams.STRING);
			params.addSQLParam("pcsdm", pcsdm, SQLParams.STRING);
			
			list = executor.queryListBeanWithDBName(SqJbxxBean.class, CommonConstant.DBNAME_SQJW, "findSqBeanByPcsdm", params);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return list;
	}
	
	/**
	 * 通过社区编号找小区
	 * @param sqbh
	 * @return
	 */
	public List<XqxxBean> findXqxxBeanListBySqbh(String sqbh)
	{
		List<XqxxBean> list = null;
		try
		{
			list = executor.queryListWithDBName(XqxxBean.class, CommonConstant.DBNAME_SQJW, "findXqxxBeanListBySqbh", sqbh);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return list;
	}
	
	/**
	 * 找人口基本信息通过身份证
	 * @param sfzh
	 * @return
	 */
	public RkJbxxBean findRkJbxxBySfzh(String sfzh)
	{
		RkJbxxBean bean = null;
		try
		{
			bean = executor.queryObjectWithDBName(RkJbxxBean.class, CommonConstant.DBNAME_SQJW, "findRkJbxxBySfzh", sfzh);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return bean;
	}
	
	/**
	 * 找境外人口信息通过国籍，证件种类，证件号码
	 * @param gj
	 * @param zjzl
	 * @param zjhm
	 * @return
	 * @date 2013-9-4 下午04:08:55
	 */
	public RkJbxxBean findJwrkxxByQueryCondition(String gj, String zjzl, String zjhm)
	{
		RkJbxxBean bean = null;
		try
		{
			bean = executor.queryObjectWithDBName(RkJbxxBean.class, CommonConstant.DBNAME_SQJW, "findJwrkxxByQueryCondition", gj, zjzl, zjhm);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return bean;
	}
	
	public List<SystemDictionaryBean> queryXzsqDicBeanByJdxzdmAndJwqdm(String jdxzdm, String jwqdm)
	{
		try
		{
			return executor.queryListWithDBName(SystemDictionaryBean.class, CommonConstant.DBNAME_SQJW, "queryXzsqDicBeanByJdxzdmAndJwqdm", jdxzdm,jwqdm);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return new ArrayList<SystemDictionaryBean>();
	}
	
	public List<SystemDictionaryBean> querySqxxByJdxzdmAndPcsdm(String jdxzdm,String pcsdm)
	{
		try
		{
			return executor.queryListWithDBName(SystemDictionaryBean.class, CommonConstant.DBNAME_SQJW, "querySqxxByJdxzdmAndPcsdm", jdxzdm,pcsdm);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return new ArrayList<SystemDictionaryBean>();
	}
	
	/**
	 * 获取人口照片信息 首先获取远程服务照片的本地存储的照片
	 * @param zpid
	 * @return
	 * @throws Exception
	 * @date 2013-8-24 下午04:44:29
	 */
	public Blob getRkzpBlob(String sfzh)
	{
		try
		{
			String sql = " select zp from t_lsgl_rk_zpxx where rxfw='01' and sfzh='" + sfzh + "' order by ycfwzp,djsj asc";
			DBUtil util = new DBUtil();
			util.executeSelect(CommonConstant.DBNAME_SQJW, sql);
			if (util.size() > 0)
			{
				Blob blob = util.getBlob(0, "zp");
				return blob;
			}
			else
			{
				return null;
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
			return null;
		}
	}
	
	/**
	 * 获取人口照片信息 首先获取远程服务照片的本地存储的照片
	 * @param zpid
	 * @return
	 * @throws Exception
	 * @date 2013-8-24 下午04:44:29
	 */
	public Blob getJwrkzpBlob(String rybh)
	{
		try
		{
			String sql = " select zp from t_lsgl_rk_zpxx where zxbs='0' and rybh='" + rybh + "' order by ycfwzp,djsj desc";
			DBUtil util = new DBUtil();
			util.executeSelect(CommonConstant.DBNAME_SQJW, sql);
			if (util.size() > 0)
			{
				Blob blob = util.getBlob(0, "zp");
				return blob;
			}
			else
			{
				return null;
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
			return null;
		}
	}
	
	
	/**
	 * 查询人境大队
	 * @return
	 */
	public List<TreeNode> queryRjOrg()
	{
		List<TreeNode> list = null;
		try
		{
			String sql = executor.getSql(CommonConstant.DBNAME_SQJW, "queryRjOrg");
			list = SQLExecutor.queryListBeanWithDBName(TreeNode.class,CommonConstant.DBNAME_SQJW, sql,"");
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return list;
	}
	
	/**
	 * 根据用户名获取用户所属机构
	 * @param userName
	 * @return
	 */
	public OrganizationBean queryOrgByUser(String userName) throws SQLException{
		OrganizationBean org = null;
		String sql = executor.getSql(CommonConstant.DBNAME_SQJW, "queryOrgByUser");
		org = SQLExecutor.queryObjectWithDBName(OrganizationBean.class, CommonConstant.DBNAME_SQJW, sql, userName);
		return org;
	}
	
	/**
	 * 根据用户名获取用户信息
	 * @param userName
	 * @return
	 * @throws SQLException
	 */
	public UserBean queryUserByUserName(String userName) throws SQLException{
		UserBean user = null;
		String sql = executor.getSql(CommonConstant.DBNAME_SQJW, "queryUserByUserName");
		user = SQLExecutor.queryObjectWithDBName(UserBean.class, CommonConstant.DBNAME_SQJW, sql, userName);
		return user;
	}
}
