package com.chinacreator.xtgl.service;

import java.io.Serializable;

import com.chinacreator.afgl.bean.AflmpcBean;
import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.dzgl.bean.StxxBean;
import com.chinacreator.lsgl.bean.FwJbxxBean;
import com.chinacreator.lsgl.bean.LdrkxxBean;
import com.chinacreator.lsgl.bean.ZdryGzdxBean;
import com.chinacreator.xtgl.query.SjhcQueryBean;
import com.chinacreator.zagl.bean.DwcyryBean;

public interface SjhcService extends Serializable {

	/**
	 * 查询流动人口
	 */
	public PageResultInfo<LdrkxxBean> queryLdrk(SjhcQueryBean bean,PageInfo pageInfo);
	
	/**
	 * 查询从业人员
	 */
	public PageResultInfo<DwcyryBean> queryCyry(SjhcQueryBean bean,PageInfo pageInfo);
	
	/**
	 * 查询出租房屋
	 */
	public PageResultInfo<FwJbxxBean> queryCzfw(SjhcQueryBean bean,PageInfo pageInfo);

	/**
	 * 查询登记出租房屋
	 */
	public PageResultInfo<FwJbxxBean>queryFw(SjhcQueryBean bean,PageInfo pageInfo);
	
	
	/**
	 * 查询实体
	 */
	public PageResultInfo<StxxBean> querySt(SjhcQueryBean bean,PageInfo pageInfo);
	
	/**
	 * 查询重点人员
	 */
	public PageResultInfo<ZdryGzdxBean> queryZdry(SjhcQueryBean bean,PageInfo pageInfo);
	
	/**
	 * 查询路面盘查
	 * @param bean
	 * @param pageInfo
	 * @return
	 */
	public PageResultInfo<AflmpcBean> queryLmpc(SjhcQueryBean bean,PageInfo pageInfo);
}
