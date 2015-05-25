package com.chinacreator.afgl.services;

import com.chinacreator.afgl.bean.SqjwsxxBean;
import com.chinacreator.afgl.dao.SqjwsxxDao;
import com.chinacreator.afgl.query.SqjwsxxQuery;
import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.constant.CommonConstant;

/**
 * 社区警务室信息
 *
 */
public class SqjwsxxService {
	
	/**
	 * 社区警务室信息列表
	 */
	public  PageResultInfo<SqjwsxxBean> sqjwsxxList(PageInfo pageInfo,  SqjwsxxQuery sqjwsxxQuery) throws Exception{
		return SqjwsxxDao.sqjwsxxList(pageInfo, sqjwsxxQuery);
	}
	
	/**
	 * 修改社区警务室信息
	 */
	public void addSqjwsxx(SqjwsxxBean sqjwsxxBean) throws Exception{
		SqjwsxxDao.updateSqjwsxxByJwsdm(sqjwsxxBean);
	}
	
	/**
	 * 得到社区警务室信息
	 */
	public SqjwsxxBean getSqjwsxxByJwsdm(SqjwsxxQuery sqjwsxxQuery) throws Exception{
		SqjwsxxBean sqjwsxxBean = SqjwsxxDao.getSqjwsxxByJwsdm(sqjwsxxQuery);
		return sqjwsxxBean;
	}
	
	public void seveSqjwsxxBean(SqjwsxxBean sqjwsxxBean, String operType) throws Exception {
		if (CommonConstant.OPERTYPE_ADD.equals(operType))
		{
			
			SqjwsxxDao.insertSqjwsxxByJwsdm(sqjwsxxBean);
		}
		else if (CommonConstant.OPERTYPE_UPDATE.equals(operType))
		{
			SqjwsxxDao.updateSqjwsxxByJwsdm(sqjwsxxBean);
		}
	}
}
