package com.chinacreator.afgl.services;

import java.sql.SQLException;
import java.util.List;

import com.chinacreator.afgl.bean.AfSqwfsszpxxBean;
import com.chinacreator.afgl.bean.XqjfwfssxxBean;
import com.chinacreator.afgl.dao.XqjfwfssxxDao;
import com.chinacreator.afgl.query.XqjfwfssxxQuery;
import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.helper.ValidateHelper;

/**
 * 小区技防物防设施信息
 *
 */
public class XqjfwfssxxService {
	
	/**
	 * 小区技防物防设施信息列表
	 */
	public PageResultInfo<XqjfwfssxxBean> xqjfwfssxxList(PageInfo pageInfo, XqjfwfssxxQuery xqjfwfssxxQuery) throws Exception
	{
		return XqjfwfssxxDao.xqjfwfssxxList(pageInfo, xqjfwfssxxQuery);
	}
	
	/**
	 * 新增、修改、删除小区技防物防设施信息
	 */
	public void saveXqjfwfssxx(XqjfwfssxxBean xqjfwfssxxBean,List<AfSqwfsszpxxBean> sqwffjBeanList, String operType) throws Exception
	{
		//新增
		if(CommonConstant.OPERTYPE_ADD.equals(operType))
		{
			XqjfwfssxxDao.insertXqjfwfssxx(xqjfwfssxxBean);
		}
		//修改
		else if(CommonConstant.OPERTYPE_UPDATE.equals(operType))
		{
			XqjfwfssxxDao.updateXqjfwfssxxBySsbh(xqjfwfssxxBean);
		}
		// 插入附件
		if (ValidateHelper.isNotEmptyCollection(sqwffjBeanList))
		{
			XqjfwfssxxDao.insertAfSqwfsszpxxList(sqwffjBeanList);
		}
	}
	
	/**
	 * 得到小区技防物防设施信息
	 */
	public XqjfwfssxxBean queryXqjfwfssxxBySsbh(String sbbh) throws Exception
	{
		return XqjfwfssxxDao.queryXqjfwfssxxBySsbh(sbbh);
	}
 
	/**
	 * 插入设备信息
	 * @param sqbh
	 * @return
	 * @throws Exception
	 */
	public List<AfSqwfsszpxxBean> queryAfSqwfsszpxxList(String sbbh) throws Exception
	{
		return XqjfwfssxxDao.queryAfSqwfsszpxxList(sbbh);
	}
	
	/**
	 * 下载物防照片信息
	 * @param fjid
	 * @return
	 * @throws SQLException
	 */
	public java.sql.Blob getWfzpFile(String fjid) throws SQLException 
	{
		return XqjfwfssxxDao.getWfzpFile(fjid);
	}
	
	/**
	 * 删除小区设备附件信息
	 * @param fjid
	 * @throws SQLException
	 */
	public void deleteWfzpByFjId(String fjid) throws SQLException
	{
		XqjfwfssxxDao.deleteWfzpByFjId(fjid);
	}
	
	/**
	 * 删除小区设备ID
	 * @param wfid
	 * @throws SQLException
	 */
	public void deleteWfxxbyId(String wfid) throws SQLException
	{
		XqjfwfssxxDao.deleteWfxxbyId(wfid);
	}

	public AfSqwfsszpxxBean getWfzpFileByid(String fjid) throws SQLException {
		return XqjfwfssxxDao.getWfzpFileByid(fjid);
	}
}
