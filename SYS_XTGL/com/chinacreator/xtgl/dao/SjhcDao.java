package com.chinacreator.xtgl.dao;

import java.io.Serializable;
import java.sql.SQLException;

import com.chinacreator.afgl.bean.AflmpcBean;
import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.dzgl.bean.StxxBean;
import com.chinacreator.lsgl.bean.FwJbxxBean;
import com.chinacreator.lsgl.bean.LdrkxxBean;
import com.chinacreator.lsgl.bean.ZdryGzdxBean;
import com.chinacreator.xtgl.query.SjhcQueryBean;
import com.chinacreator.zagl.bean.DwcyryBean;

public interface SjhcDao extends Serializable {

	/**
	 * 查询流动人口延期或注销
	 * @param bean
	 * @param pageInfo
	 * @return
	 * @throws SQLException
	 */
	public PageResultInfo<LdrkxxBean> queryLdrk(SjhcQueryBean bean , PageInfo pageInfo) throws SQLException;
	
	/**
	 * 查询从业人员登记或反馈
	 * @param bean
	 * @param pageInfo
	 * @return
	 * @throws SQLException
	 */
	public PageResultInfo<DwcyryBean> queryCyry(SjhcQueryBean bean, PageInfo pageInfo) throws SQLException;

	/**
	 * 查询出租房屋巡查登记
	 * @param bean
	 * @param pageInfo
	 * @return
	 * @throws SQLException
	 */
	public PageResultInfo<FwJbxxBean> queryCzfwxcdj(SjhcQueryBean bean, PageInfo pageInfo) throws SQLException;

	/**
	 * 查询未在PIGS地图标注的实体
	 * @param bean
	 * @param pageInfo
	 * @return
	 * @throws SQLException
	 */
	public PageResultInfo<StxxBean> querySt(SjhcQueryBean bean,PageInfo pageInfo) throws SQLException;
	
	/**
	 * 查询重点人员下发数据维护
	 * @param bean
	 * @param pageInfo
	 * @return
	 * @throws SQLException
	 */
	public PageResultInfo<ZdryGzdxBean> queryXfsjwh(SjhcQueryBean bean, PageInfo pageInfo) throws SQLException;
	
	/**
	 * 查询重点人员委托信息
	 * @param bean
	 * @param pageInfo
	 * @return
	 * @throws SQLException
	 */
	public PageResultInfo<ZdryGzdxBean> queryZdryTgxx(SjhcQueryBean bean,PageInfo pageInfo) throws SQLException;
	
	/**
	 * 查询关系人缺失的重点人员
	 * @param bean
	 * @param pageInfo
	 * @return
	 * @throws SQLException
	 */
	public PageResultInfo<ZdryGzdxBean> queryZdryGxrqs(SjhcQueryBean bean ,PageInfo pageInfo) throws SQLException;

	/**
	 * 查询需要登记未出租房屋的房屋
	 * @param bean
	 * @param pageInfo
	 * @return
	 * @throws SQLException
	 */
	public PageResultInfo<FwJbxxBean> queryFw(SjhcQueryBean bean,PageInfo pageInfo) throws SQLException;

	/**
	 * 查询路面盘查信息质量数据
	 * @param bean
	 * @param pageInfo
	 * @return
	 * @throws SQLException
	 */
	public PageResultInfo<AflmpcBean> queryLmpc(SjhcQueryBean bean,PageInfo pageInfo) throws SQLException;
}
