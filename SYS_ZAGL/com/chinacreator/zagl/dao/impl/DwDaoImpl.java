package com.chinacreator.zagl.dao.impl;

import java.sql.Blob;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.derby.client.am.SqlException;

import com.chinacreator.common.bean.LoginInfo;
import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.bean.QueryBean;
import com.chinacreator.common.bean.SystemDictionaryBean;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.cps.helper.CommonSequenceHelper;
import com.chinacreator.common.helper.ActionContextHelper;
import com.chinacreator.common.helper.PaginationHelper;
import com.chinacreator.common.helper.ValidateHelper;
import com.chinacreator.zagl.bean.AqyhBean;
import com.chinacreator.zagl.bean.BadysBean;
import com.chinacreator.zagl.bean.BwjgBean;
import com.chinacreator.zagl.bean.BwjysBean;
import com.chinacreator.zagl.bean.BwzdBean;
import com.chinacreator.zagl.bean.CyryPfBean;
import com.chinacreator.zagl.bean.CyryPfListBean;
import com.chinacreator.zagl.bean.CyrytjBean;
import com.chinacreator.zagl.bean.DwAqsbBean;
import com.chinacreator.zagl.bean.DwabryBean;
import com.chinacreator.zagl.bean.DwabssBean;
import com.chinacreator.zagl.bean.DwaqjcBean;
import com.chinacreator.zagl.bean.DwcyryBean;
import com.chinacreator.zagl.bean.DwfwglBean;
import com.chinacreator.zagl.bean.DwjbxxBean;
import com.chinacreator.zagl.bean.DwjcBean;
import com.chinacreator.zagl.bean.DwzpxxBean;
import com.chinacreator.zagl.bean.GgcsBean;
import com.chinacreator.zagl.bean.JfdwBean;
import com.chinacreator.zagl.bean.JfdwNsxxBean;
import com.chinacreator.zagl.bean.NbDwTjBean;
import com.chinacreator.zagl.bean.NbdwBean;
import com.chinacreator.zagl.bean.SwdwBean;
import com.chinacreator.zagl.bean.SwfwcsBean;
import com.chinacreator.zagl.bean.TfsjyaBean;
import com.chinacreator.zagl.bean.ThksyBean;
import com.chinacreator.zagl.bean.ThlgyBean;
import com.chinacreator.zagl.bean.TzhyBean;
import com.chinacreator.zagl.bean.WxwpdwBean;
import com.chinacreator.zagl.bean.YaylBean;
import com.chinacreator.zagl.bean.ZdyhbwBean;
import com.chinacreator.zagl.bean.ZdyhbwZpBean;
import com.chinacreator.zagl.bean.ZhsgBean;
import com.chinacreator.zagl.dao.DwDao;
import com.chinacreator.zagl.query.CyryQueryBean;
import com.chinacreator.zagl.query.DwQueryBean;
import com.frameworkset.common.poolman.ConfigSQLExecutor;
import com.frameworkset.common.poolman.DBUtil;
import com.frameworkset.common.poolman.PreparedDBUtil;
import com.frameworkset.common.poolman.SQLExecutor;
import com.frameworkset.util.ListInfo;

public class DwDaoImpl implements DwDao 
{

	private static final long serialVersionUID = 6960412729066723173L;

	private ConfigSQLExecutor executor = new ConfigSQLExecutor(
			"com/chinacreator/zagl/dao/sql/dw-sql.xml");
	private ConfigSQLExecutor executorb = new ConfigSQLExecutor(
	"com/chinacreator/zagl/dao/sql/cyrytj-sql.xml");
	/**
	 * 新增安保人员
	 */
	public DwabryBean insertDwabry(DwabryBean bean) throws SQLException {

		bean.setBh(CommonSequenceHelper.getABRYBH());
		executor.insertBean(CommonConstant.DBNAME_SQJW, "insertDwabry", bean);
		return bean;
	}

	/**
	 * 根据编号查询安保人员
	 */
	public DwabryBean queryDwabryByBh(String bh) throws SQLException {
		return executor.queryObjectWithDBName(DwabryBean.class,
				CommonConstant.DBNAME_SQJW, "queryDwabryByBh", bh);
	}

	/**
	 * 根据机构编号分页查询安保人员
	 */
	public PageResultInfo<DwabryBean> queryDwabryPageResultInfoByJgbh(
			PageInfo pageInfo, String jgbh) throws SQLException {
		ListInfo listInfo = executor.queryListInfoWithDBName(DwabryBean.class,
				CommonConstant.DBNAME_SQJW, "queryDwabryByJgbh", pageInfo
						.getOffset(), pageInfo.getPageSize(), jgbh);
		return PaginationHelper.wrapPageResultInfo(pageInfo, listInfo);
	}

	/**
	 * 修改安保人员
	 */
	public DwabryBean updateDwabry(DwabryBean bean) throws SQLException {
		executor.updateBean(CommonConstant.DBNAME_SQJW, "updateDwabry", bean);
		return bean;
	}

	/**
	 * 删除安保人员
	 */
	public void deleteDwabry(DwabryBean bean) throws SQLException {
		executor.updateWithDBName(CommonConstant.DBNAME_SQJW, "deleteDwabry",
				bean);
	}

	/**
	 * 新增安保设施
	 */
	public DwabssBean insertDwabss(DwabssBean bean) throws SQLException {
		bean.setSsbh(CommonSequenceHelper.getABSSBH(ActionContextHelper
				.getLoginInfo().getOrgcode()));
		executor.insertBean(CommonConstant.DBNAME_SQJW, "insertDwabss",bean);
		return bean;
	}

	/**
	 * 根据编号查询安保设施
	 */
	public DwabssBean queryDwabssBySsbh(String bh) throws SQLException {
		return executor.queryObjectWithDBName(DwabssBean.class,
				CommonConstant.DBNAME_SQJW, "queryDwabssByBh", bh);
	}

	/**
	 * 根据机构编号分页查询安保设施
	 */
	public PageResultInfo<DwabssBean> queryDwabssPageResultInfoByJgbh(
			PageInfo pageInfo, String jgbh) throws SQLException {
		ListInfo listInfo = executor.queryListInfoWithDBName(DwabssBean.class,
				CommonConstant.DBNAME_SQJW, "queryDwabssByJgbh", pageInfo
						.getOffset(), pageInfo.getPageSize(), jgbh);
		return PaginationHelper.wrapPageResultInfo(pageInfo, listInfo);
	}

	/**
	 * 修改安保设施
	 */
	public DwabssBean updateDwabss(DwabssBean bean) throws SQLException {
		executor.updateBean(CommonConstant.DBNAME_SQJW, "updateDwabss", bean);
		return bean;
	}

	/**
	 * 删除安保设施
	 */
	public void deleteDwabss(DwabssBean bean) throws SQLException {
		executor.updateBean(CommonConstant.DBNAME_SQJW, "deleteDwabss",bean);
	}

	/**
	 * 新增单位安全检查
	 */
	public DwaqjcBean insertDwaqjc(DwaqjcBean bean) throws SQLException {
		executor.insertBean(CommonConstant.DBNAME_SQJW, "insertDwaqjc", bean);
		return bean;
	}

	/**
	 * 根据编号查询安全检查
	 */
	public DwaqjcBean queryDwaqjcByJlbh(String jlbh) throws SQLException {
		return executor.queryObjectWithDBName(DwaqjcBean.class,
				CommonConstant.DBNAME_SQJW, "queryDwaqjcByBh", jlbh);
	}

	/**
	 * 根据机构编号分页查询安全检查
	 */
	public PageResultInfo<DwaqjcBean> queryDwaqjcPageResultInfoByJgbh(
			PageInfo pageInfo, String jgbh) throws SQLException {
		ListInfo listInfo = executor.queryListInfoWithDBName(DwaqjcBean.class,
				CommonConstant.DBNAME_SQJW, "queryDwaqjcByJgbh", pageInfo
						.getOffset(), pageInfo.getPageSize(), jgbh);
		return PaginationHelper.wrapPageResultInfo(pageInfo, listInfo);
	}

	/**
	 * 修改安全检查
	 */
	public DwaqjcBean updateDwaqjc(DwaqjcBean bean) throws SQLException {
		executor.updateBean(CommonConstant.DBNAME_SQJW, "updateDwaqjc", bean);
		return bean;
	}

	/**
	 * 删除安全检查
	 */
	public void deleteDwaqjc(DwaqjcBean bean) throws SQLException {
		executor.updateWithDBName(CommonConstant.DBNAME_SQJW, "deleteDwaqjc",
				bean);
	}

	/**
	 * 新增从业人员
	 */
	public DwcyryBean insertDwcyry(DwcyryBean bean) throws SQLException {
		executor.insertBean(CommonConstant.DBNAME_SQJW, "insertDwcyry", bean);
		return bean;
	}

	/**
	 * 根据人员编号查询从业人员
	 */
	public DwcyryBean queryDwcyryByCyrybh(String cyrybh) throws SQLException {
		return executor.queryObjectWithDBName(DwcyryBean.class,
				CommonConstant.DBNAME_SQJW, "queryDwcyryByBh", cyrybh);
	}

	/**
	 * 根据机构编号分页查询从业人员
	 */
	public PageResultInfo<DwcyryBean> queryDwcyryPageResultInfoByJgbh(
			PageInfo pageInfo, String jgbh) throws SQLException {
		ListInfo listInfo = executor.queryListInfoWithDBName(DwcyryBean.class,
				CommonConstant.DBNAME_SQJW, "queryDwcyryByJgbh", pageInfo
						.getOffset(), pageInfo.getPageSize(), jgbh);
		return PaginationHelper.wrapPageResultInfo(pageInfo, listInfo);
	}
	
	/**
	 * 查询单位下的所有从业人员
	 * @param jgbh
	 * @return
	 * @throws SQLException
	 */
	public List<DwcyryBean> queryDwcyryList(String jgbh) throws SQLException{
		return executor.queryListWithDBName(DwcyryBean.class, CommonConstant.DBNAME_SQJW, "queryDwcyryByJgbh", jgbh);
	}

	/**
	 * 分页查询所有从业人员
	 */
	public PageResultInfo<DwcyryBean> queryDwCyryPageResultInfo(PageInfo pageInfo, QueryBean bean) throws SQLException 
	{
		ListInfo listInfo = executor.queryListInfoBeanWithDBName(
				DwcyryBean.class, CommonConstant.DBNAME_SQJW,"queryDwCyryPageResultInfo", pageInfo.getOffset(), pageInfo.getPageSize(), bean);
		return PaginationHelper.wrapPageResultInfo(pageInfo, listInfo);
	}

	/**
	 * 修改从业人员
	 */
	public DwcyryBean updateDwcyry(DwcyryBean bean) throws SQLException {
		executor.updateBean(CommonConstant.DBNAME_SQJW, "updateDwcyry", bean);
		return bean;
	}

	/**
	 * 删除从业人员
	 */
	public void deleteDwcyry(DwcyryBean bean) throws SQLException {
		executor.updateBean(CommonConstant.DBNAME_SQJW, "deleteDwcyry",
				bean);
	}

	/**
	 * 新增单位基本信息
	 */
	public DwjbxxBean insertDwjbxx(DwjbxxBean dwjbxx) throws SQLException {
		executor.insertBean(CommonConstant.DBNAME_SQJW, "insertDwjbxx", dwjbxx);
		return dwjbxx;
	}

	/**
	 * 根据机构编号查询单位基本信息
	 */
	public DwjbxxBean queryDwjbxxByJgbh(String jgbh) throws SQLException {
		return executor.queryObjectWithDBName(DwjbxxBean.class,
				CommonConstant.DBNAME_SQJW, "queryDwjbxxByJgbh", jgbh);
	}

	/**
	 * 分页查询单位基本信息
	 */
	public PageResultInfo<DwjbxxBean> queryDwjbxxPageResInfo(PageInfo pageInfo,
			QueryBean bean) throws SQLException 
	{
		ListInfo listInfo = executor.queryListInfoBeanWithDBName(DwjbxxBean.class, CommonConstant.DBNAME_SQJW, "queryDwjbxxPageResInfo", pageInfo.getOffset(), pageInfo.getPageSize(), bean);
		return PaginationHelper.wrapPageResultInfo(pageInfo, listInfo);
	}

	/**
	 * 修改单位基本信息
	 */
	public DwjbxxBean updateDwjbxx(DwjbxxBean dwjbxx) throws SQLException {
		try {

			executor.updateBean(CommonConstant.DBNAME_SQJW, "updateDwjbxx", dwjbxx);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dwjbxx;
	}

	/**
	 * 单位注销
	 */
	public DwjbxxBean deleteDwjbxx(DwjbxxBean dwjbxx) throws SQLException {
		executor.updateBean(CommonConstant.DBNAME_SQJW, "deleteDwjbxx", dwjbxx);
		return dwjbxx;
	}

	/**
	 * 新增单位奖惩信息
	 */
	public DwjcBean insertDwjc(DwjcBean bean) throws SQLException {
		executor.insertBean(CommonConstant.DBNAME_SQJW, "insertDwjc", bean);
		return bean;
	}

	/**
	 * 根据编号查询单位奖惩信息
	 */
	public DwjcBean queryDwjcByBh(String bh) throws SQLException {
		return executor.queryObjectWithDBName(DwjcBean.class,
				CommonConstant.DBNAME_SQJW, "queryDwjcByBh", bh);
	}

	/**
	 * 根据机构编号分页查询单位奖惩信息
	 */
	public PageResultInfo<DwjcBean> queryDwjcPageResultInfoByJgbh(
			PageInfo pageInfo, String jgbh) throws SQLException {
		ListInfo listInfo = executor.queryListInfoWithDBName(DwjcBean.class,
				CommonConstant.DBNAME_SQJW, "queryDwjcByJgbh", pageInfo
						.getOffset(), pageInfo.getPageSize(), jgbh);
		return PaginationHelper.wrapPageResultInfo(pageInfo, listInfo);
	}

	/**
	 * 修改单位奖惩信息
	 */
	public DwjcBean updateDwjc(DwjcBean bean) throws SQLException {
		executor.updateBean(CommonConstant.DBNAME_SQJW, "updateDwjc", bean);
		return bean;
	}

	/**
	 * 删除单位奖惩信息
	 */
	public void deleteDwjc(DwjcBean bean) throws SQLException {
		executor.updateWithDBName(CommonConstant.DBNAME_SQJW, "deleteDwjc",
				bean);
	}

	/**
	 * 新增重点要害部位
	 */
	public ZdyhbwBean insertZdyhbw(ZdyhbwBean bean) throws SQLException {
		executor.insertBean(CommonConstant.DBNAME_SQJW, "insertZdyhbw", bean);
		return bean;
	}

	/**
	 * 根据要害部位编号查询重点要害部位
	 */
	public ZdyhbwBean queryZdyhbwByYhbwbh(String yhbwbh) throws SQLException {
		return executor.queryObjectWithDBName(ZdyhbwBean.class,
				CommonConstant.DBNAME_SQJW, "queryZdyhbwByBh", yhbwbh);
	}

	/**
	 * 根据机构编号分页查询重点要害部位
	 */
	public PageResultInfo<ZdyhbwBean> queryZdyhbwPageResultInfoByJgbh(
			PageInfo pageInfo, String jgbh) throws SQLException {
		ListInfo listInfo = executor.queryListInfoWithDBName(ZdyhbwBean.class,
				CommonConstant.DBNAME_SQJW, "queryZdyhbwByJgbh", pageInfo
						.getOffset(), pageInfo.getPageSize(), jgbh);
		return PaginationHelper.wrapPageResultInfo(pageInfo, listInfo);
	}

	/**
	 * 修改重点要害部位
	 */
	public ZdyhbwBean updateZdyhbw(ZdyhbwBean bean) throws SQLException {
		executor.updateBean(CommonConstant.DBNAME_SQJW, "updateZdyhbw", bean);
		return bean;
	}

	/**
	 * 删除重点要害部位
	 */
	public void deleteZdyhbw(ZdyhbwBean bean) throws SQLException {
		executor.updateWithDBName(CommonConstant.DBNAME_SQJW, "deleteZdyhbw",
				bean);
	}

	/**
	 * 新增公共场所
	 */
	public GgcsBean insertGgcs(GgcsBean ggcs) throws SQLException {
		executor.insertBean(CommonConstant.DBNAME_SQJW, "insertGgcs", ggcs);
		return ggcs;
	}

	/**
	 * 根据机构编号查询公共场所
	 */
	public GgcsBean queryGgcsByJgbh(String jgbh) throws SQLException {
		return executor.queryObjectWithDBName(GgcsBean.class,
				CommonConstant.DBNAME_SQJW, "queryGgcsByJgbh", jgbh);
	}

	/**
	 * 修改公共场所
	 */
	public GgcsBean updateGgcs(GgcsBean ggcs) throws SQLException {
		executor.updateBean(CommonConstant.DBNAME_SQJW, "updateGgcs", ggcs);
		return ggcs;
	}

	/**
	 * 新增内保单位
	 */
	public NbdwBean insertNbdw(NbdwBean nbdw) throws SQLException {
		executor.insertBean(CommonConstant.DBNAME_SQJW, "insertNbdw", nbdw);
		return nbdw;
	}

	/**
	 * 根据机构编号查询内保单位
	 */
	public NbdwBean queryNbdwByJgbh(String jgbh) throws SQLException {
		return executor.queryObjectWithDBName(NbdwBean.class,
				CommonConstant.DBNAME_SQJW, "queryNbdwByJgbh", jgbh);
	}

	/**
	 * 修改内保单位
	 */
	public NbdwBean updateNbdw(NbdwBean nbdw) throws SQLException {
		executor.updateBean(CommonConstant.DBNAME_SQJW, "updateNbdw", nbdw);
		return nbdw;
	}

	/**
	 * 新增特种行业
	 */
	public TzhyBean insertTzhy(TzhyBean tzhy) throws SQLException {
		executor.insertBean(CommonConstant.DBNAME_SQJW, "insertTzhy", tzhy);
		return tzhy;
	}

	/**
	 * 新增特行旅馆业
	 */
	public ThlgyBean inserThlgy(ThlgyBean thly) throws SQLException {
		executor.insertBean(CommonConstant.DBNAME_SQJW, "insertThlg", thly);
		return thly;
	}

	/**
	 * 根据特行编号查询特种行业信息
	 */
	public TzhyBean queryTzhyByThbh(String thbh) throws SQLException {
		return executor.queryObjectWithDBName(TzhyBean.class,
				CommonConstant.DBNAME_SQJW, "queryTzhyByThbh", thbh);
	}

	/**
	 * 根据机构编号查询特行信息
	 */
	public TzhyBean queryTzhyByJgbh(String jgbh) throws SQLException {
		return executor.queryObjectWithDBName(TzhyBean.class,
				CommonConstant.DBNAME_SQJW, "queryTzhyByJgbh", jgbh);
	}

	/**
	 * 根据机构编号查询特行旅业
	 */
	public ThlgyBean queryThlgyByJgbh(String jgbh) throws SQLException {
		return executor.queryObjectWithDBName(ThlgyBean.class,
				CommonConstant.DBNAME_SQJW, "queryThlgByThbh", jgbh);
	}

	/**
	 * 修改特行信息
	 */
	public TzhyBean updateTzhy(TzhyBean tzhy) throws SQLException {
		executor.updateBean(CommonConstant.DBNAME_SQJW, "updateTzhy", tzhy);
		return tzhy;
	}

	/**
	 * 修改特行旅馆业
	 */
	public ThlgyBean updateThlgy(ThlgyBean thlgy) throws SQLException {
		executor.updateBean(CommonConstant.DBNAME_SQJW, "updateThlg", thlgy);
		return thlgy;
	}

	/**
	 * 查询单位的安保人员
	 */
	public List<DwabryBean> queryDwabryListByJgbh(String jgbh)
			throws SQLException {
		return executor.queryListWithDBName(DwabryBean.class,
				CommonConstant.DBNAME_SQJW, "queryDwabryByJgbh", jgbh);
	}

	/**
	 * 查询单位的所有安保设施
	 */
	public List<DwabssBean> queryAbssListByJgbh(String jgbh)
			throws SQLException {
		return executor.queryListWithDBName(DwabssBean.class,
				CommonConstant.DBNAME_SQJW, "queryDwabssByJgbh", jgbh);
	}

	/**
	 * 查询单位的所有安全检查信息
	 */
	public List<DwaqjcBean> queryAqjcListByJgbh(String jgbh)
			throws SQLException {
		return executor.queryListWithDBName(DwaqjcBean.class,
				CommonConstant.DBNAME_SQJW, "queryDwaqjcByJgbh", jgbh);
	}

	/**
	 * 查询单位的所有从业人员
	 */
	public List<DwcyryBean> queryCyryListByJgbh(String jgbh)
			throws SQLException {
		return executor.queryListWithDBName(DwcyryBean.class,
				CommonConstant.DBNAME_SQJW, "queryDwcyryByJgbh", jgbh);
	}

	/**
	 * 查询单位的所有奖惩信息
	 */
	public List<DwjcBean> queryDwJcListByJgbh(String jgbh) throws SQLException {
		return executor.queryListWithDBName(DwjcBean.class,
				CommonConstant.DBNAME_SQJW, "queryDwjcByJgbh", jgbh);
	}

	/**
	 * 查询单位的所有重点要害部位
	 */
	public List<ZdyhbwBean> queryZdyhbwListByJgbh(String jgbh)
			throws SQLException {
		return executor.queryListWithDBName(ZdyhbwBean.class,
				CommonConstant.DBNAME_SQJW, "queryZdyhbwByJgbh", jgbh);
	}

	/**
	 * 新增上网服务场所
	 */
	public SwfwcsBean insertSwfwcs(SwfwcsBean swfwcs) throws SQLException {
		executor.insertBean(CommonConstant.DBNAME_SQJW, "insertSwfwcs", swfwcs);
		return swfwcs;
	}

	/**
	 * 根据机构编号查询上网服务场所
	 */
	public SwfwcsBean querySwfwcsByJgbh(String jgbh) throws SQLException {
		return executor.queryObjectWithDBName(SwfwcsBean.class,
				CommonConstant.DBNAME_SQJW, "querySwfwcsByJgbh", jgbh);
	}

	/**
	 * 修改上网服务场所
	 */
	public SwfwcsBean updateSwfwcs(SwfwcsBean swfwcs) throws SQLException {
		executor.updateBean(CommonConstant.DBNAME_SQJW, "updateSwfwcs", swfwcs);
		return swfwcs;
	}

	/**
	 * 根据机构编号查询单位照片
	 */
	public List<DwzpxxBean> queryDwzpByJgbh(String jgbh) throws Exception {
		return executor.queryListWithDBName(DwzpxxBean.class,
				CommonConstant.DBNAME_SQJW, "queryDwzpByJgbh", jgbh);
	}

	/**
	 * 新增单位照片
	 */
	public void insertDwzp(List<DwzpxxBean> zpList) throws Exception {
		String sql = executor.getSql("insertDwzp");
		for (DwzpxxBean dwzp : zpList) 
		{
			PreparedDBUtil util = new PreparedDBUtil();
			util.preparedInsert(CommonConstant.DBNAME_SQJW, sql);
			util.setString(1, dwzp.getId());
			util.setString(2, dwzp.getJgbh());
			util.setBlob(3, dwzp.getZp());
			util.setString(4, dwzp.getDjsj());
			util.setString(5, dwzp.getMs());
			util.setString(6, dwzp.getDjrxm());
			util.setString(7, dwzp.getDjdwmc());
			util.setString(8, dwzp.getDjdwdm());
			util.executePrepared();
		}
	}

	/**
	 * 删除照片
	 */
	public void deleteDwzpByZpid(String zpid) throws Exception {
		executor.deleteWithDBName(CommonConstant.DBNAME_SQJW,
				"deleteDwzpByZpid", zpid);
	}

	/**
	 * 根据照片ID查询单位照片
	 */
	public Blob queryDwzpByZpid(String zpId) throws SQLException {
		String sql = " select zp from t_za_jg_zpxx where id='" + zpId + "'";
		DBUtil util = new DBUtil();
		util.executeSelect(CommonConstant.DBNAME_SQJW, sql);
		Blob blob = null;
		if (util.size() > 0)
		{
			blob = util.getBlob(0, "zp");
		}
		return blob;
	}

	/**
	 * 根据照片ID查询要害部位照片
	 */
	public Blob queryYhbwzpByZpId(String zpId) throws SQLException {
		return null;
	}

	/**
	 * 获取行业类别字典
	 * 
	 * @return
	 * @throws SQLException
	 */
	public List<SystemDictionaryBean> getHylbZd() throws SQLException {
		return executor.queryListBeanWithDBName(SystemDictionaryBean.class,
				CommonConstant.DBNAME_SQJW, "getHylbZd", new Object());
	}

	/**
	 * 插入单位房屋管理对象
	 * 
	 * @param dwfwglBean
	 * @throws Exception
	 * @date 2013-10-12 下午04:37:54
	 */
	public void insertDwFwglBean(DwfwglBean dwfwglBean) throws Exception {
		executor.insertBean(CommonConstant.DBNAME_SQJW, "insertDwFwglBean",
				dwfwglBean);
	}

	/**
	 * 注销单位房屋管理地址
	 * 
	 * @param dwfwglid
	 * @throws Exception
	 * @date 2013-10-12 下午04:52:29
	 */
	public void zxDwfwglBean(String dwfwglid) throws Exception {
		LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
		executor.updateWithDBName(CommonConstant.DBNAME_SQJW, "zxDwfwglBean",
				loginInfo.getRealname(), loginInfo.getOrgcode(), loginInfo
						.getOrgname(), dwfwglid);
	}

	/**
	 * 
	 * 查询单位房屋关联对象
	 * 
	 * @param jgbh
	 * @return
	 * @throws SQLException
	 * @date 2013-10-12 下午06:59:20
	 */
	public DwfwglBean queryDwfwglBean(String jgbh) throws SQLException {
		return executor.queryObjectWithDBName(DwfwglBean.class,
				CommonConstant.DBNAME_SQJW, "queryDwfwglBean", jgbh);
	}

	/**
	 * 更新单位的操作时间及标示
	 * 
	 * @param czlx
	 * @param czrxm
	 * @param czdwdm
	 * @param czdwmc
	 * @date 2013-10-14 下午01:33:13
	 */
	public void updateDwczlx(String jgbh,String czbs, String czrxm, String czdwdm,
			String czdwmc) {
		String sql = "update t_za_jg_jbxx set CZBS=?,CZSJ=sysdate,CZRXM=?,CZDWDM=?,CZDWMC=? where jgbh = ?";
		try {
			SQLExecutor.updateWithDBName(CommonConstant.DBNAME_SQJW, sql, czbs,
					czrxm, czdwdm, czdwmc,jgbh);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * 插入特行开锁业对象
	 * 
	 * @param thksyBean
	 * @throws Exception
	 * @date 2013-10-15 上午09:04:47
	 */
	public void insertThksyBean(ThksyBean thksyBean) throws Exception {
		executor.insertBean(CommonConstant.DBNAME_SQJW, "insertThksyBean",
				thksyBean);
	}

	/**
	 * 更新特行开锁业信息
	 * 
	 * @param thksyBean
	 * @throws Exception
	 * @date 2013-10-15 上午09:05:36
	 */
	public void updateThksyBean(ThksyBean thksyBean) throws Exception {
		executor.updateBean(CommonConstant.DBNAME_SQJW, "updateThksyBean",
				thksyBean);
	}

	/**
	 * 查询开锁业信息
	 * 
	 * @param jgbh
	 * @return
	 * @throws Exception
	 * @date 2013-10-15 上午09:39:22
	 */
	public ThksyBean queryThksyBean(String jgbh) throws Exception {
		return executor.queryObjectWithDBName(ThksyBean.class,
				CommonConstant.DBNAME_SQJW, "queryThksyBean", jgbh);
	}

	/**
	 * 插入涉外单位
	 * 
	 * @param swdwBean
	 * @throws Exception
	 * @date 2013-10-16 上午09:09:43
	 */
	public void insertSwdwBean(SwdwBean swdwBean) throws Exception {
		executor.insertBean(CommonConstant.DBNAME_SQJW, "insertSwdwBean",
				swdwBean);
	}

	/**
	 * 插入涉外单位
	 * 
	 * @param swdwBean
	 * @throws Exception
	 * @date 2013-10-16 上午09:09:43
	 */
	public SwdwBean querySwdwBeanByJgbh(String jgbh) throws Exception {
		return executor.queryObjectWithDBName(SwdwBean.class,
				CommonConstant.DBNAME_SQJW, "querySwdwBeanByJgbh", jgbh);
	}

	/**
	 * 更新涉外单位
	 * 
	 * @param swdwBean
	 * @throws Exception
	 * @date 2013-10-16 上午09:10:02
	 */
	public void updateSwdwBean(SwdwBean swdwBean) throws Exception {
		executor.updateBean(CommonConstant.DBNAME_SQJW, "updateSwdwBean",
				swdwBean);
	}

	/**
	 * 插入危险品单位
	 * 
	 * @param wxwpdwBean
	 * @throws Exception
	 * @date 2013-10-16 上午10:32:22
	 */
	public void insertWxwpdwBean(WxwpdwBean wxwpdwBean) throws Exception {
		executor.insertBean(CommonConstant.DBNAME_SQJW, "insertWxwpdwBean",
				wxwpdwBean);
	}

	/**
	 * 通过机构编号查询危险物品单位
	 * 
	 * @param jgbh
	 * @return
	 * @throws Exception
	 * @date 2013-10-16 上午10:32:02
	 */
	public WxwpdwBean queryWxwpdwBean(String jgbh) throws Exception {
		return executor.queryObjectWithDBName(WxwpdwBean.class,
				CommonConstant.DBNAME_SQJW, "queryWxwpdwBean", jgbh);
	}

	/**
	 * 更新危险品单位
	 * 
	 * @param wxwpdwBean
	 * @throws Exception
	 * @date 2013-10-16 上午10:34:30
	 */
	public void updateWxwpdwBean(WxwpdwBean wxwpdwBean) throws Exception {
		executor.updateBean(CommonConstant.DBNAME_SQJW, "updateWxwpdwBean",
				wxwpdwBean);

	}

	/**
	 * 分页查询单位安全检查信息
	 * 
	 * @param pageInfo
	 * @param queryBean
	 * @return
	 * @date 2013-10-17 上午10:11:12
	 */
	public PageResultInfo<DwaqjcBean> queryDwAqjcPageResultInfoByJgbh(
			PageInfo pageInfo, DwQueryBean queryBean) {
		ListInfo listInfo = null;
		try {
			listInfo = executor.queryListInfoBeanWithDBName(DwaqjcBean.class,CommonConstant.DBNAME_SQJW,"queryDwAqjcPageResultInfoByJgbh", pageInfo.getOffset(),pageInfo.getPageSize(), queryBean);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return PaginationHelper.wrapPageResultInfo(pageInfo, listInfo);
	}
	
	public void resetDw(DwjbxxBean dwjbxx) throws SQLException{
		executor.updateBean(CommonConstant.DBNAME_SQJW, "deleteDwjbxx", dwjbxx);
	}

	public DwAqsbBean insertDwAqsb(DwAqsbBean bean) throws Exception {
		executor.insertBean(CommonConstant.DBNAME_SQJW, "insertDwAqsb", bean);
		return bean;
	}

	public DwAqsbBean queryDwAqsbByJgbh(String jgbh) throws Exception {
		return executor.queryObjectWithDBName(DwAqsbBean.class, CommonConstant.DBNAME_SQJW, "queryDwAqsbByJgbh", jgbh);
	}

	public DwAqsbBean updateDwAqsb(DwAqsbBean bean) throws Exception {
		executor.updateBean(CommonConstant.DBNAME_SQJW, "updateDwAqsb", bean);
		return bean;
	}

	public void delAqyh(AqyhBean aqyh) throws SQLException {
		executor.updateBean(CommonConstant.DBNAME_SQJW, "delAqyh", aqyh);
	}

	public void delBadys(BadysBean badys) throws SQLException {
		executor.updateBean(CommonConstant.DBNAME_SQJW, "delBadys", badys);
	}

	public void delBwjg(BwjgBean bwjg) throws SQLException {
		executor.updateBean(CommonConstant.DBNAME_SQJW, "delBwjg", bwjg);
	}

	public void delBwjys(BwjysBean bwjys) throws SQLException {
		executor.updateBean(CommonConstant.DBNAME_SQJW, "delBwjys", bwjys);
	}

	public void delBwzd(BwzdBean bwzd) throws SQLException {
		executor.updateBean(CommonConstant.DBNAME_SQJW, "delBwzd", bwzd);
	}

	public void delTfsjya(TfsjyaBean tfsjya) throws SQLException {
		executor.updateBean(CommonConstant.DBNAME_SQJW, "delTfsjya", tfsjya);
	}

	public void delYayl(YaylBean yayl) throws SQLException {
		executor.updateBean(CommonConstant.DBNAME_SQJW, "delYayl", yayl);
	}

	public void delZhsg(ZhsgBean zhsg) throws SQLException {
		executor.updateBean(CommonConstant.DBNAME_SQJW, "delZhsg", zhsg);
	}

	public AqyhBean insertAqyh(AqyhBean aqyh) throws SQLException {
		executor.insertBean(CommonConstant.DBNAME_SQJW, "insertAqyh", aqyh);
		return aqyh;
	}

	public BadysBean insertBadys(BadysBean badys) throws SQLException {
		executor.insertBean(CommonConstant.DBNAME_SQJW, "insertBadys", badys);
		return badys;
	}

	public BwjgBean insertBwjg(BwjgBean bwjg) throws SQLException {
		executor.insertBean(CommonConstant.DBNAME_SQJW, "insertBwjg", bwjg);
		return bwjg;
	}

	public BwjysBean insertBwjys(BwjysBean bwjys) throws SQLException {
		executor.insertBean(CommonConstant.DBNAME_SQJW, "insertBwjys", bwjys);
		return bwjys;
	}

	public BwzdBean insertBwzd(BwzdBean bwzd) throws SQLException {
		try{
			
			executor.insertBean(CommonConstant.DBNAME_SQJW, "insertBwzd", bwzd);
		}catch(Exception e){
			e.printStackTrace();
		}
		return bwzd;
	}

	public TfsjyaBean insertTfsjya(TfsjyaBean tfsjya) throws SQLException {
		executor.insertBean(CommonConstant.DBNAME_SQJW, "insertTfsjya", tfsjya);
		return tfsjya;
	}

	public YaylBean insertYayl(YaylBean yayl) throws SQLException {
		executor.insertBean(CommonConstant.DBNAME_SQJW, "insertYayl", yayl);
		return yayl;
	}

	public ZhsgBean insertZhsg(ZhsgBean zhsg) throws SQLException {
		executor.insertBean(CommonConstant.DBNAME_SQJW, "insertZhsg", zhsg);
		return zhsg;
	}

	public AqyhBean queryAqyhByBh(String bh) throws SQLException {
		return executor.queryObjectWithDBName(AqyhBean.class, CommonConstant.DBNAME_SQJW, "queryAqyhByBh", bh);
	}

	public List<AqyhBean> queryAqyhByJgbh(String jgbh) throws SQLException {
		return executor.queryListWithDBName(AqyhBean.class, CommonConstant.DBNAME_SQJW, "queryAqyhByJgbh", jgbh);
	}

	public BadysBean queryBadysByBh(String bh) throws SQLException {
		return executor.queryObjectWithDBName(BadysBean.class, CommonConstant.DBNAME_SQJW, "queryBadysByBh", bh);
	}

	public List<BadysBean> queryBadysByJgbh(String jgbh) throws SQLException {
		return executor.queryListWithDBName(BadysBean.class, CommonConstant.DBNAME_SQJW, "queryBadysByJgbh", jgbh);
	}

	public BwjgBean queryBwjgByBwjgbh(String bwjgbh) throws SQLException {
		return executor.queryObjectWithDBName(BwjgBean.class, CommonConstant.DBNAME_SQJW, "queryBwjgByBwjgbh", bwjgbh);
	}

	public List<BwjgBean> queryBwjgByJgbh(String jgbh) throws SQLException {
		return executor.queryListWithDBName(BwjgBean.class, CommonConstant.DBNAME_SQJW, "queryBwjgByJgbh", jgbh);
	}

	public BwjysBean queryBwjysByBwjysbh(String jysbh) throws SQLException {
		return executor.queryObjectWithDBName(BwjysBean.class, CommonConstant.DBNAME_SQJW, "queryBwjysByJysbh", jysbh);
	}

	public List<BwjysBean> queryBwjysByJgbh(String jgbh) throws SQLException {
		return executor.queryListWithDBName(BwjysBean.class, CommonConstant.DBNAME_SQJW, "queryBwjysByJgbh", jgbh);
	}

	public BwzdBean queryBwzdByBwzdbh(String zdbh) throws SQLException {
		return executor.queryObjectWithDBName(BwzdBean.class, CommonConstant.DBNAME_SQJW, "queryBwzdByBwzdbh", zdbh);
	}

	public List<BwzdBean> queryBwzdByJgbh(String jgbh) throws SQLException {
		return executor.queryListWithDBName(BwzdBean.class, CommonConstant.DBNAME_SQJW, "queryBwzdByJgbh", jgbh);
	}

	public List<TfsjyaBean> queryTfsjyaByJgbh(String jgbh) throws SQLException {
		return executor.queryListWithDBName(TfsjyaBean.class, CommonConstant.DBNAME_SQJW, "queryTfsjyaByJgbh", jgbh);
	}

	public TfsjyaBean queryTfsjyaByYabh(String yabh) throws SQLException {
		return executor.queryObjectWithDBName(TfsjyaBean.class, CommonConstant.DBNAME_SQJW, "queryTfsjyaByYabh", yabh);
	}

	public YaylBean queryYaylByBh(String bh) throws SQLException {
		return executor.queryObjectWithDBName(YaylBean.class, CommonConstant.DBNAME_SQJW, "queryYaylByBh", bh);
	}
	
	public PageResultInfo<YaylBean> queryYaylByYabh(String yabh,PageInfo pageinfo) throws SQLException{
		ListInfo listInfo = executor.queryListInfoWithDBName(YaylBean.class, CommonConstant.DBNAME_SQJW, "queryYaylByYabh", pageinfo.getOffset(), pageinfo.getPageSize(), yabh);
		return PaginationHelper.wrapPageResultInfo(pageinfo, listInfo);
	}

	public List<YaylBean> queryYaylByYabh(String yabh) throws SQLException {
		return executor.queryListWithDBName(YaylBean.class, CommonConstant.DBNAME_SQJW, "queryYaylByYabh", yabh);
	}

	public ZhsgBean queryZhsgByBh(String bh) throws SQLException {
		return executor.queryObjectWithDBName(ZhsgBean.class, CommonConstant.DBNAME_SQJW, "ZhsgBean", bh);
	}

	public List<ZhsgBean> queryZhsgByJgbh(String jgbh) throws SQLException {
		return executor.queryListWithDBName(ZhsgBean.class, CommonConstant.DBNAME_SQJW, "queryZhsgByJgbh", jgbh);
	}

	public AqyhBean updateAqyh(AqyhBean aqyh) throws SQLException {
		executor.updateBean(CommonConstant.DBNAME_SQJW, "updateAqyh", aqyh);
		return aqyh;
	}

	public BadysBean updateBadys(BadysBean badys) throws SQLException {
		executor.updateBean(CommonConstant.DBNAME_SQJW, "updateBadys", badys);
		return badys;
	}

	public BwjgBean updateBwjg(BwjgBean bwjg) throws SQLException {
		executor.updateBean(CommonConstant.DBNAME_SQJW, "updateBwjg", bwjg);
		return bwjg;
	}

	public BwjysBean updateBwjys(BwjysBean bwjys) throws SQLException {
		executor.updateBean(CommonConstant.DBNAME_SQJW, "updateBwjys", bwjys);
		return bwjys;
	}

	public BwzdBean updateBwzd(BwzdBean bwzd) throws SQLException {
		executor.updateBean(CommonConstant.DBNAME_SQJW, "updateBwzd", bwzd);
		return bwzd;
	}

	public TfsjyaBean updateTfsjya(TfsjyaBean tfsjya) throws SQLException {
		executor.updateBean(CommonConstant.DBNAME_SQJW, "updateTfsjya", tfsjya);
		return tfsjya;
	}

	public YaylBean updateYayl(YaylBean yayl) throws SQLException {
		executor.updateBean(CommonConstant.DBNAME_SQJW, "updateYayl", yayl);
		return yayl;
	}

	public ZhsgBean updateZhsg(ZhsgBean zhsg) throws SQLException {
		executor.updateBean(CommonConstant.DBNAME_SQJW, "updateZhsg", zhsg);
		return zhsg;
	}
	
	/**
	 * 根据机构编号删除特种行业
	 * @param jgbh
	 */
	public void deleteTzhy(String jgbh) throws SQLException{
		executor.deleteWithDBName(CommonConstant.DBNAME_SQJW, "deleteTzhy", jgbh);
	}
	
	/**
	 * 根据机构编号删除公共场所
	 * @param jgbh
	 */
	public void deleteGgcs(String jgbh) throws SQLException{
		executor.deleteWithDBName(CommonConstant.DBNAME_SQJW, "deleteGgcs", jgbh);
	}
	
	/**
	 * 根据机构编号删除企事业单位
	 * @param jgbh
	 */
	public void deleteNbdw(String jgbh) throws SQLException{
		executor.deleteWithDBName(CommonConstant.DBNAME_SQJW, "deleteNbdw", jgbh);
	}
	
	/**
	 * 根据机构编号删除危险物品单位
	 * @param jgbh
	 */
	public void deleteWxwpdw(String jgbh) throws SQLException{
		executor.deleteWithDBName(CommonConstant.DBNAME_SQJW, "deleteWxwpdw", jgbh);
	}
	
	/**
	 * 根据机构编号删除上网服务场所
	 * @param jgbh
	 */
	public void deleteSwfwcs(String jgbh) throws SQLException{
		executor.deleteWithDBName(CommonConstant.DBNAME_SQJW, "deleteSwfwcs", jgbh);
	}
	
	/**
	 * 根据机构编号删除涉外单位
	 * @param jgbh
	 */
	public void deleteSwdw(String jgbh) throws SQLException{
		executor.deleteWithDBName(CommonConstant.DBNAME_SQJW, "deleteSwdw", jgbh);
	}
	
	/**
	 * 根据机构编号删除特行旅馆业
	 * @param jgbh
	 */
	public void deleteThlg(String jgbh) throws SQLException{
		executor.deleteWithDBName(CommonConstant.DBNAME_SQJW, "deleteThlg", jgbh);
	}
	
	/**
	 * 根据机构编号删除特行开锁业
	 * @param jgbh
	 */
	public void deleteThKs(String jgbh) throws SQLException{
		executor.deleteWithDBName(CommonConstant.DBNAME_SQJW, "deleteThKs", jgbh);
	}
	
	/**
	 * 根据机构编号删除其他特种行业
	 * @param jgbh
	 */
	public void deleteQtth(String jgbh) throws SQLException{
		executor.deleteWithDBName(CommonConstant.DBNAME_SQJW, "deleteQtth", jgbh);
	}
	
	/**
	 * 查询特种行业
	 * @param pageInfo
	 * @param bean
	 * @return
	 * @throws SqlException
	 */
	public PageResultInfo<DwjbxxBean> queryTzhy(PageInfo pageInfo,QueryBean bean) throws SQLException{
		ListInfo listInfo = executor.queryListInfoBeanWithDBName(DwjbxxBean.class, CommonConstant.DBNAME_SQJW,
								"queryTzhy", pageInfo.getOffset(), pageInfo.getPageSize(), bean);
		return PaginationHelper.wrapPageResultInfo(pageInfo, listInfo);
	}
	
	/**
	 * 查询公共场所
	 * @param pageInfo
	 * @param bean
	 * @return
	 * @throws SqlException
	 */
	public PageResultInfo<DwjbxxBean> queryGgcs(PageInfo pageInfo,QueryBean bean) throws SQLException{
		ListInfo listInfo = executor.queryListInfoBeanWithDBName(DwjbxxBean.class, CommonConstant.DBNAME_SQJW,
									"queryGgcs", pageInfo.getOffset(), pageInfo.getPageSize(), bean);
		return PaginationHelper.wrapPageResultInfo(pageInfo, listInfo);
	}
	
	/**
	 * 查询企事业单位
	 * @param pageInfo
	 * @param bean
	 * @return
	 * @throws SqlException
	 */
	public PageResultInfo<DwjbxxBean> queryNbdw(PageInfo pageInfo,QueryBean bean) throws SQLException{
		ListInfo listInfo = executor.queryListInfoBeanWithDBName(DwjbxxBean.class, CommonConstant.DBNAME_SQJW,
						"queryNbdw", pageInfo.getOffset(), pageInfo.getPageSize(), bean);
		return PaginationHelper.wrapPageResultInfo(pageInfo, listInfo);
	}
	
	/**
	 * 查询危险物品单位
	 * @param pageInfo
	 * @param bean
	 * @return
	 * @throws SqlException
	 */
	public PageResultInfo<DwjbxxBean> queryWxwpdw(PageInfo pageInfo,QueryBean bean) throws SQLException{
		ListInfo listInfo = executor.queryListInfoBeanWithDBName(DwjbxxBean.class, CommonConstant.DBNAME_SQJW,
						"queryWxwpdw", pageInfo.getOffset(), pageInfo.getPageSize(), bean);
		return PaginationHelper.wrapPageResultInfo(pageInfo, listInfo);
	}
	
	/**
	 * 查询上网服务场所
	 * @param pageInfo
	 * @param bean
	 * @return
	 * @throws SqlException
	 */
	public PageResultInfo<DwjbxxBean> queryWb(PageInfo pageInfo,QueryBean bean) throws SQLException{
		ListInfo listInfo = executor.queryListInfoBeanWithDBName(DwjbxxBean.class, CommonConstant.DBNAME_SQJW,
						"queryWb", pageInfo.getOffset(), pageInfo.getPageSize(), bean);
		return PaginationHelper.wrapPageResultInfo(pageInfo, listInfo);
	}
	
	/**
	 * 查询涉外单位
	 * @param pageInfo
	 * @param bean
	 * @return
	 * @throws SqlException
	 */
	public PageResultInfo<DwjbxxBean> querySwdw(PageInfo pageInfo,QueryBean bean) throws SQLException{
		ListInfo listInfo = executor.queryListInfoBeanWithDBName(DwjbxxBean.class, CommonConstant.DBNAME_SQJW,
						"querySwdw", pageInfo.getOffset(), pageInfo.getPageSize(), bean);
		return PaginationHelper.wrapPageResultInfo(pageInfo, listInfo);
	}

	public void delJfwdw(String jgbh) throws SQLException {
		executor.deleteWithDBName(CommonConstant.DBNAME_SQJW,"delJfwdw",jgbh);
	}

	public JfdwBean insertJfdw(JfdwBean bean) throws SQLException {
		executor.insertBean(CommonConstant.DBNAME_SQJW, "insertJfdw", bean);
		return bean;
	}

	public JfdwBean queryJfdwByJgbh(String jgbh) throws SQLException {
		return executor.queryObjectWithDBName(JfdwBean.class, CommonConstant.DBNAME_SQJW, "queryJfdwByJgbh", jgbh);
		
	}

	public JfdwBean updateJfdw(JfdwBean bean) throws SQLException {
		executor.updateBean(CommonConstant.DBNAME_SQJW, "updateJfdw", bean);
		return bean;
	}

	public void delKsyByJgbh(String jgbh) throws SQLException {
		executor.deleteWithDBName(CommonConstant.DBNAME_SQJW, "delKsyByJgbh", jgbh);
		
	}

	public void delLgByJgbh(String jgbh) throws SQLException {
		executor.deleteWithDBName(CommonConstant.DBNAME_SQJW, "delLgByJgbh", jgbh);
	}

	@Override
	public void saveCyryfkxx(DwcyryBean cyryBean) throws Exception 
	{
		executor.updateBean(CommonConstant.DBNAME_SQJW, "updateCyryfkxx", cyryBean);
		
	}

	@Override
	public int queryCyryByJgbhAndSfzh(String jgbh, String sfzh)
			throws Exception
	{
		String count = executor.queryFieldWithDBName(CommonConstant.DBNAME_SQJW, "queryCyryByJgbhAndSfzh", jgbh, sfzh);
		return Integer.parseInt(count);
	}

	@Override
	public void zxDwCyryxx(String sfzh) throws Exception
	{
		executor.updateWithDBName(CommonConstant.DBNAME_SQJW, "zxDwCyryxx", sfzh);
	}

	@Override
	public void insertZdyhbwZpBean(List<ZdyhbwZpBean> zpbeans)
	{
		try
		{
			if (ValidateHelper.isNotEmptyCollection(zpbeans))
			{
				String sql = executor.getSql("insertYhbwzpxxBean");
				for (ZdyhbwZpBean zpBean : zpbeans)
				{
					PreparedDBUtil util = new PreparedDBUtil();
					util.preparedInsert(CommonConstant.DBNAME_SQJW, sql);
					util.setString(1, zpBean.getBh());
					util.setString(2, zpBean.getYhbwbh());
					util.setString(3, zpBean.getZpmc());
					util.setString(4, zpBean.getZpms());
					util.setBlob(5, zpBean.getZp());
					util.setString(6, zpBean.getDjdwdm());
					util.setString(7, zpBean.getDjdwmc());
					util.setString(8, zpBean.getDjrxm());
					util.executePrepared();
				}
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}

	@Override
	public Blob queryYhbwzpxx(String bh)
	{
		String sql ="select zp from t_za_yhbw_zpxx where bh='" + bh + "'";
		DBUtil util = new DBUtil();
		Blob blob = null;
		try
		{
			util.executeSelect(CommonConstant.DBNAME_SQJW, sql);
			if(util.size() > 0)
			{
				blob = util.getBlob(0, "zp");
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return blob;
	}

	@Override
	public void deleteZdyhbwzpBean(String bh) throws Exception
	{
		executor.deleteWithDBName(CommonConstant.DBNAME_SQJW, "deleteZdyhbwzpBean", bh);
	}

	@Override
	public List<ZdyhbwZpBean> queryZdyhbwZpBeans(DwQueryBean queryBean)
	{
		List<ZdyhbwZpBean> list = null;
		try
		{
			list = executor.queryListBeanWithDBName(ZdyhbwZpBean.class, CommonConstant.DBNAME_SQJW, "queryZdyhbwZpBeans", queryBean);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public void deleteCyryByCyrybh(DwcyryBean bean) throws SQLException {
		executor.updateBean(CommonConstant.DBNAME_SQJW, "deleteCyryByCyrybh", bean);
		
	}

	@Override
	public List<DwcyryBean> queryDwCyryListByCyrybhs(String cyrybhs) {
		cyrybhs = "'" + cyrybhs.replace(",", "','") + "'";
		try {
			String sql = executor.getSql("queryDwCyryListByCyrybhs").replace("#[cyrybhs]", cyrybhs);
			return SQLExecutor.queryListWithDBName(DwcyryBean.class, CommonConstant.DBNAME_SQJW, sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public List<DwcyryBean> queryDwCyryListByQueryBean(CyryQueryBean queryBean) {
		try {
			return executor.queryListBeanWithDBName(DwcyryBean.class, CommonConstant.DBNAME_SQJW, "queryDwCyryListByQueryBean", queryBean);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public List<DwjbxxBean> queryDwListByDwQueryBean(DwQueryBean queryBean) {
		try {
			return executor.queryListBeanWithDBName(DwjbxxBean.class, CommonConstant.DBNAME_SQJW, "queryDwListByDwQueryBean", queryBean);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public List<DwjbxxBean> queryDwListByJgbhs(String jgbhs) {
		jgbhs = "'" + jgbhs.replace(",", "','") + "'";
		try {
			String sql = executor.getSql("queryDwListByJgbhs").replace("#[jgbhs]", jgbhs);
			return SQLExecutor.queryListWithDBName(DwjbxxBean.class, CommonConstant.DBNAME_SQJW, sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public void insertCyryPfxx(CyryPfBean bean) throws SQLException {
		executor.insertBean(CommonConstant.DBNAME_SQJW, "insertCyryPfxx", bean);
	}

	@Override
	public void updateCyryJzdsq(CyryPfBean bean)
			throws SQLException {
		executor.updateBean(CommonConstant.DBNAME_SQJW, "updateCyryJzdsq", bean);
	}

	@Override
	public void insertJfdwNsxx(JfdwNsxxBean bean) throws SQLException {
		executor.insertBean(CommonConstant.DBNAME_SQJW, "insertJfdwNsxx", bean);
	}

	@Override
	public PageResultInfo<JfdwNsxxBean> queryJfdwNsxxList(String jgbh, PageInfo page) throws SQLException {
		ListInfo list = executor.queryListInfo(JfdwNsxxBean.class, "queryJfdwNsxxList", page.getOffset(), page.getPageSize(), jgbh);
		return PaginationHelper.wrapPageResultInfo(page, list);
	}

	@Override
	public void updateJfdwNsxx(JfdwNsxxBean bean) throws SQLException {
		executor.updateBean(CommonConstant.DBNAME_SQJW, "updateJfdwNsxx", bean);
	}

	@Override
	public List<JfdwNsxxBean> queryJfdwNsxx(DwQueryBean query)
			throws SQLException {
		return executor.queryListBeanWithDBName(JfdwNsxxBean.class, CommonConstant.DBNAME_SQJW, "queryJfdwNsxx", query);
	}

	@Override
	public PageResultInfo<NbDwTjBean> queryNbdwlbtjPageResultInfo(
			PageInfo page, DwQueryBean dwcx,String dwtjjb) {
		ListInfo list = null;
		String querdwdm =null;
		
		// 1：省级用户 2：市级用户 3：县级用户 4：派出所用户  5：社区民警
		int jb=0;
		String dms=""; //代码
		
		if (!dwcx.getOrgcode().substring(0,2).equals("43")){
			jb=1;
			// 只考虑长沙
		}
		if(dwcx.getOrgcode().substring(0,2).equals("43")&&Integer.parseInt(dwcx.getOrgcode().substring(6,8)) <40 && dwcx.getOrgcode().substring(4,6).equals("00") && dwcx.getOrgcode().substring(8,12).equals("0000")){
			jb=2;
			dms="430100000000";
		}
		if(dwcx.getOrgcode().substring(0,2).equals("43")&&Integer.parseInt(dwcx.getOrgcode().substring(6,8)) <40 && !dwcx.getOrgcode().substring(4,6).equals("00") && dwcx.getOrgcode().substring(8,12).equals("0000")){
			jb=3;
			dms=dwcx.getOrgcode().substring(0,6).concat("000000");
			
		}
		if(dwcx.getOrgcode().substring(0,2).equals("43")&&Integer.parseInt(dwcx.getOrgcode().substring(6,8)) >=40 && !dwcx.getOrgcode().substring(4,6).equals("00") && dwcx.getOrgcode().substring(8,12).equals("0000")){
			jb=4;
			dms=dwcx.getOrgcode().substring(0,8).concat("0000");
			
		}
		if(dwcx.getOrgcode().substring(0,2).equals("43")&&Integer.parseInt(dwcx.getOrgcode().substring(6,8)) >=40 && !dwcx.getOrgcode().substring(4,6).equals("00") && !dwcx.getOrgcode().substring(8,12).equals("0000")){
			jb=5;
			dms=dwcx.getOrgcode();
			
		}
		
		querdwdm=dms;
		//选择单位是市局，统计类别是按分县局统计
		if(jb==2 && dwtjjb.equals("1")){
			 try {
			 		dwcx.setDwdm(querdwdm);
				    dwcx.setXzjb("2");
					list = executor.queryListInfoBeanWithDBName(NbDwTjBean.class, CommonConstant.DBNAME_SQJW,"queryNbdwlbtjPageResultInfoA", page.getOffset(), page.getPageSize(),dwcx);
				} catch (SQLException e) {
					e.printStackTrace();
				}	
		}
		
		// 选择单位是分县局，统计类别是按分县局统计
		if (jb==3 && dwtjjb.equals("1")){
			 try {
			 		dwcx.setDwdm(querdwdm);
				    dwcx.setXzjb("3");
					list = executor.queryListInfoBeanWithDBName(NbDwTjBean.class, CommonConstant.DBNAME_SQJW,"queryNbdwlbtjPageResultInfoA", page.getOffset(), page.getPageSize(),dwcx);
				} catch (SQLException e) {
					e.printStackTrace();
				}	
		}
		
		// 选择单位是派出所，统计类别是按分县局统计
		if (jb==4 && dwtjjb.equals("1")){
			 try {
			 		dwcx.setDwdm(querdwdm);
				    dwcx.setXzjb("4");
					list = executor.queryListInfoBeanWithDBName(NbDwTjBean.class,CommonConstant.DBNAME_SQJW, "queryNbdwlbtjPageResultInfoA", page.getOffset(), page.getPageSize(),dwcx);
				} catch (SQLException e) {
					e.printStackTrace();
				}
		}
		
		// 选择单位是警务区，统计类别是按分县局统计
		if (jb==5 && dwtjjb.equals("1")){
			 try {
			 		dwcx.setDwdm(querdwdm);
				    dwcx.setXzjb("5");
					list = executor.queryListInfoBeanWithDBName(NbDwTjBean.class,CommonConstant.DBNAME_SQJW, "queryNbdwlbtjPageResultInfoA", page.getOffset(), page.getPageSize(),dwcx);
				} catch (SQLException e) {
					e.printStackTrace();
				}
		}
		

		// 选择单位是市局，统计类别是按派出所统计
		if(jb==2 && dwtjjb.equals("2")){
			try {
		 		dwcx.setDwdm(querdwdm);
			    dwcx.setXzjb("2");
				list = executor.queryListInfoBeanWithDBName(NbDwTjBean.class,CommonConstant.DBNAME_SQJW, "queryNbdwlbtjPageResultInfoB", page.getOffset(), page.getPageSize(),dwcx);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		
		// 选择单位是分县局，统计类别是按派出所统计
		if (jb==3 && dwtjjb.equals("2")){
			 try {
			 		dwcx.setDwdm(querdwdm);
				    dwcx.setXzjb("3");
					list = executor.queryListInfoBeanWithDBName(NbDwTjBean.class,CommonConstant.DBNAME_SQJW, "queryNbdwlbtjPageResultInfoB", page.getOffset(), page.getPageSize(),dwcx);
				} catch (SQLException e) {
					e.printStackTrace();
				}
		}
		
		// 选择单位是派出所，统计类别是按派出所统计
		if (jb==4 && dwtjjb.equals("2")){
			 try {
			 		dwcx.setDwdm(querdwdm);
				    dwcx.setXzjb("4");
					list = executor.queryListInfoBeanWithDBName(NbDwTjBean.class,CommonConstant.DBNAME_SQJW, "queryNbdwlbtjPageResultInfoB", page.getOffset(), page.getPageSize(),dwcx);
				} catch (SQLException e) {
					e.printStackTrace();
				}
		}
		
		// 选择单位是警务区，统计类别是按派出所统计
		if (jb==5 && dwtjjb.equals("2")){
			 try {
				    dwcx.setDwdm(querdwdm);
				    dwcx.setXzjb("5");
					list = executor.queryListInfoBeanWithDBName(NbDwTjBean.class,CommonConstant.DBNAME_SQJW, "queryNbdwlbtjPageResultInfoB", page.getOffset(), page.getPageSize(),dwcx);
				} catch (SQLException e) {
					e.printStackTrace();
				}
		}
		
		// 选择单位是市局，统计类别是按警务区统计
		if (jb==2 && dwtjjb.equals("3")){
			 try {
				    dwcx.setDwdm(querdwdm);
				    dwcx.setXzjb("2");
					list = executor.queryListInfoBeanWithDBName(NbDwTjBean.class,CommonConstant.DBNAME_SQJW, "queryNbdwlbtjPageResultInfoC", page.getOffset(), page.getPageSize(),dwcx);
				} catch (SQLException e) {
					e.printStackTrace();
				}
		}
		
		// 选择单位是分县局级别，统计类别是按警务区统计
		if (jb==3 && dwtjjb.equals("3")){
			 try {
				    dwcx.setDwdm(querdwdm);
				    dwcx.setXzjb("3");
					list = executor.queryListInfoBeanWithDBName(NbDwTjBean.class,CommonConstant.DBNAME_SQJW, "queryNbdwlbtjPageResultInfoC", page.getOffset(), page.getPageSize(),dwcx);
				} catch (SQLException e) {
					e.printStackTrace();
				}
		}
		
		// 选择单位是派出所级别，统计类别是按警务区统计
		if (jb==4 && dwtjjb.equals("3")){
			 try {
				    dwcx.setDwdm(querdwdm);
				    dwcx.setXzjb("4");
					list = executor.queryListInfoBeanWithDBName(NbDwTjBean.class, CommonConstant.DBNAME_SQJW,"queryNbdwlbtjPageResultInfoC", page.getOffset(), page.getPageSize(),dwcx);
				} catch (SQLException e) {
					e.printStackTrace();
				}
		}
		//选择单位是警务区级别，统计类别也是按警务区统计
		if (jb==5 && dwtjjb.equals("3")){
			 try {
				   dwcx.setDwdm(querdwdm);
				   dwcx.setXzjb("5");
					list = executor.queryListInfoBeanWithDBName(NbDwTjBean.class, CommonConstant.DBNAME_SQJW,"queryNbdwlbtjPageResultInfoC", page.getOffset(), page.getPageSize(),dwcx);
				} catch (SQLException e) {
					e.printStackTrace();
				}
		}
		
		return PaginationHelper.wrapPageResultInfo(page, list);
	}

	@Override
	public PageResultInfo<CyryPfListBean> queryCyryPfList(PageInfo page,
			CyryQueryBean queryBean) throws SQLException 
	{
		ListInfo list = executor.queryListInfoBeanWithDBName(CyryPfListBean.class, CommonConstant.DBNAME_SQJW, "queryCyryPfList", page.getOffset(), page.getPageSize(), queryBean);
		return PaginationHelper.wrapPageResultInfo(page, list);
	}

	@Override
	public void updateDwjbxxCzsj(String jgbh) throws SQLException {
		executor.updateWithDBName(CommonConstant.DBNAME_SQJW, "updateDwjbxxCzsj", jgbh);
	}

	@Override
	public PageResultInfo<DwaqjcBean> queryAqjcList(QueryBean query,
			PageInfo pageinfo) throws SQLException {
		ListInfo list = executor.queryListInfoBeanWithDBName(DwaqjcBean.class, CommonConstant.DBNAME_SQJW, "queryAqjcList", pageinfo.getOffset(), pageinfo.getPageSize(), query);
		return PaginationHelper.wrapPageResultInfo(pageinfo, list);
	}

	@Override
	public List<DwaqjcBean> queryAqjcList(QueryBean query) throws SQLException {
		return executor.queryListBeanWithDBName(DwaqjcBean.class, CommonConstant.DBNAME_SQJW, "queryAqjcList", query);
	}
	
	@Override
	public List<DwjbxxBean> queryDwjbxxBYJgbhs(String jgbh) throws SQLException{
		return executor.queryListWithDBName(DwjbxxBean.class, CommonConstant.DBNAME_SQJW, "queryDwjbxxByJgbhs", jgbh);
	}
	
	public PageResultInfo<DwjbxxBean> queryNbdwPageResultInfo(QueryBean query,PageInfo pageinfo) throws SQLException {
		ListInfo list = executor.queryListInfoBeanWithDBName(DwjbxxBean.class, CommonConstant.DBNAME_SQJW, "queryNbdwPageResultInfo", pageinfo.getOffset(), pageinfo.getPageSize(), query);
		return PaginationHelper.wrapPageResultInfo(pageinfo, list);
	}

	public List<CyrytjBean> queryCyryTjList(CyryQueryBean cyrycx)
			throws Exception {
		String sql = "" ;
		if(ValidateHelper.isNotEmptyString(cyrycx.getJwsqdm())){
			sql = "queryCyryTjListD" ; // 警务区一级，按警务区统计 
		}else if(ValidateHelper.isEmptyString(cyrycx.getJwsqdm()) && ValidateHelper.isNotEmptyString(cyrycx.getPcsdm())){
			sql = "queryCyryTjListD" ; // 派出所一级，按警务区统计 
		}else if(ValidateHelper.isEmptyString(cyrycx.getPcsdm()) && ValidateHelper.isNotEmptyString(cyrycx.getCountrygajgjgdm())){
			sql = "queryCyryTjListC" ; // 分县局一级，按派出所统计 
		}else if(ValidateHelper.isEmptyString(cyrycx.getCountrygajgjgdm()) && ValidateHelper.isNotEmptyString(cyrycx.getCitygajgjgdm())){
			sql = "queryCyryTjListB" ; // 市局一级，按分县局统计
		}else if(ValidateHelper.isEmptyString(cyrycx.getCitygajgjgdm())){
			sql = "queryCyryTjListA" ; // 省厅一级，按市局统计
		}
		//System.out.println(sql);
		List<CyrytjBean> list = new ArrayList<CyrytjBean>();
		list = executorb.queryListBeanWithDBName(CyrytjBean.class, CommonConstant.DBNAME_SQJW, sql, cyrycx);
		
		return list ;
	}
}
