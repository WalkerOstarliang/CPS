package com.chinacreator.ckyj.services;

import java.io.Serializable;

import com.chinacreator.ckyj.bean.CkyjQsFkBean;
import com.chinacreator.ckyj.bean.CkyjxxBean;
import com.chinacreator.ckyj.bean.YjfkBean;
import com.chinacreator.ckyj.bean.YjqsBean;
import com.chinacreator.ckyj.query.CkyjQueryBean;
import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;

public interface CkyjService extends Serializable {
	
	/**
	 * 签收预警
	 * @param bean 
	 */
	public CkyjQsFkBean qsYj(CkyjQsFkBean bean);
	
	/**
	 * 保存预警反馈
	 * @param bean
	 * @return
	 */
	public CkyjQsFkBean saveYjfk(CkyjQsFkBean bean);
	
	/**
	 * 分页查询常控预警
	 * @param bean
	 * @param pageInfo
	 * @return
	 */
	public PageResultInfo<CkyjxxBean> queryCkyjPageResultInfo(CkyjQueryBean bean,PageInfo pageInfo);

	/**
	 * 分页查询预警签收信息
	 * @param bean
	 * @param pageInfo
	 * @return
	 */
	public PageResultInfo<YjqsBean> queryCkyjqsPageResultInfo(CkyjQueryBean bean,PageInfo pageInfo);

	/**
	 * 查询预警信息详情（包含签收、反馈信息）
	 * @param yjxxbh
	 * @return
	 */
	public CkyjQsFkBean queryCkyjDetail(String yjxxbh);
	
	/**
	 * 根据ID查询预警反馈信息
	 * @param id
	 * @return
	 */
	public YjfkBean queryYjfkById(String id);
}
