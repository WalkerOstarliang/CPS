package com.chinacreator.afgl.services;

import com.chinacreator.afgl.bean.XqxxBean;
import com.chinacreator.afgl.dao.XqxxDao;
import com.chinacreator.afgl.query.XqxxQuery;
import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.cps.helper.CommonSequenceHelper;

/**
 * 小区信息
 *
 */
public class XqxxService {
	
	/**
	 * 小区信息列表
	 */
	public PageResultInfo<XqxxBean> queryXqxxBeanPageList(PageInfo pageInfo, XqxxQuery xqxxQuery) throws Exception
	{
		return XqxxDao.queryXqxxBeanPageList(pageInfo, xqxxQuery);
	}
	
	/**
	 * 新增、修改、删除小区信息
	 */
	public void saveXqxxBean(XqxxBean xqxxBean, String operType) throws Exception{
		if (CommonConstant.OPERTYPE_ADD.equals(operType))
		{
			String xqbh = CommonSequenceHelper.getXqbh(xqxxBean.getSssqbh());
			xqxxBean.setXqbh(xqbh);
			XqxxDao.insertXqxxBean(xqxxBean);
		}
		else if (CommonConstant.OPERTYPE_UPDATE.equalsIgnoreCase(operType))
		{
			XqxxDao.updateXqxxBean(xqxxBean);
		}
	}
	
	/**
	 * 改变当前小区对象注销状态
	 * @param sqbh
	 * @param zxbs
	 * @throws Exception
	 */
	public void changeXqxxBeanByXqbh(String xqbh, String cxbs) throws Exception
	{
		XqxxDao.changeXqxxBeanSatusByXqbh(xqbh, cxbs);
	}
	
	/**
	 * 得到小区信息
	 */
	public XqxxBean queryXqxxBeanByXqbh(String xqbh) throws Exception
	{
		return XqxxDao.queryXqxxBeanByXqbh(xqbh);
	}
}
