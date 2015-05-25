package com.chinacreator.zagl.services;

import java.io.Serializable;
import java.sql.SQLException;

import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.bean.QueryBean;
import com.chinacreator.zagl.bean.WlsqBean;

public interface WlsqService extends Serializable {
	/**
	 * 保存网络社区
	 * @return
	 */
	public WlsqBean saveWlsq(WlsqBean bean) throws Exception;
	
	/**
	 * 根据网络社区编号查询网络社区
	 * @param wlsqbh 网络社区编号
	 * @return
	 */
	public WlsqBean queryWlsqByWlsqbh(String wlsqbh) throws SQLException;
	
	/**
	 * 分页查询网络社区
	 * @param pageInfo 分页信息
	 * @param queryBean 查询条件
	 * @return
	 */
	public PageResultInfo<WlsqBean> queryWlsqByPageResultInfo(PageInfo pageInfo,QueryBean queryBean) throws Exception;
	
	/**
	 * 根据网络社区编号删除网络社区
	 * @param wlsqbh 网络社区编号 （一次删除多个网络社区时网络社区编号之间用","隔开）
	 * @return 操作是否成功
	 */
	public boolean deleteWlsqByWlsqbh(String wlsqbh) throws Exception;
}
