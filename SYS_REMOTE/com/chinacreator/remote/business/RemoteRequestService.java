package com.chinacreator.remote.business;

import java.util.List;

import com.chinacreator.common.exception.CPSException;
import com.chinacreator.common.helper.ValidateHelper;
import com.chinacreator.remote.bean.CzrkInfoBean;

public class RemoteRequestService implements java.io.Serializable{

	/**
	 * 
	 */
	private static final long	serialVersionUID	= 3351604405400372996L;

	private static final String resultFields = "XM,CYM,XB,MZ,CSRQ,ZZSSXQ,ZZXZ,QTZZSSXQ,QTZZXZ,CSD,SFZH,WHCD,HYZK,SG,ZY,FWCS,BDRQ,BDYY,HSQR,HDQR,SSPCSJGDM,SSPCSMC,SSGAJGJGDM,SSGAJGMC,HLX,HH,YHZGX";
	public RemoteServiceRequest request = null;
	
	public RemoteRequestService()
	{
		request = new RemoteServiceRequest();
	}
	
	public CzrkInfoBean getRemoteCzrkInfoBySfzh(String sfzh) throws Exception
	{
		if (ValidateHelper.isEmptyString(sfzh))
		{
			throw new CPSException("调用请求服务身份证号码不能为空");
		}
		String condition = "SFZH='" + sfzh.trim() + "'";
		List<CzrkInfoBean> czrkList = request.queryQGCzrkInfo(condition, resultFields);
		if (czrkList != null && czrkList.size() > 0)
		{
			return czrkList.get(0);
		}
		else if (czrkList != null && czrkList.size() == 0)
		{
			return null;
		}
		else
		{
			throw new CPSException("无法在公安部库中获取到人员信息");
		}
	}
	
	public List<CzrkInfoBean> queryCzrkInfoBySfzh(String sfzh)
	{
		List<CzrkInfoBean> czrkList = null;
		try
		{
			if (ValidateHelper.isEmptyString(sfzh))
			{
				throw new CPSException("调用请求服务身份证号码不能为空");
			}
			String condition = "SFZH='"+sfzh.trim()+"'";
			czrkList = queryCzrkInfo(condition, resultFields);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return czrkList;
	}
	
	/**
	 * 查询相片服务获取相片
	 * @param sfzh
	 * @return
	 */
	public String queryXpBySfzh(String sfzh)
	{
		String xpStr = null;
		try 
		{
			if (ValidateHelper.isEmptyString(sfzh))
			{
				throw new CPSException("调用请求服务身份证号码不能为空");
			}
			
			String condition = "SFZH='"+sfzh.trim()+"'";
			List<CzrkInfoBean> czrkInfoBeanList =  queryCzrkInfo(condition, "XP");
			if (ValidateHelper.isNotEmptyCollection(czrkInfoBeanList))
			{
				xpStr = czrkInfoBeanList.get(0).getXp();
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return xpStr;
	}
	
	/**
	 * 查询相片服务获取相片
	 * @param sfzh
	 * @return
	 */
	public String queryXpBySfzhAndUserInfo(String sfzh,String usersfzh, String realname, String orgcode)
	{
		
		String xpStr = null;
		try 
		{
			if (ValidateHelper.isEmptyString(sfzh))
			{
				throw new CPSException("调用请求服务身份证号码不能为空");
			}
			
			CzrkInfoBean czrkInfoBean =  queryCzrkInfoBySfzhAndUserInfo(sfzh.trim(), "XP",usersfzh, realname, orgcode);
			if (czrkInfoBean != null)
			{
				xpStr = czrkInfoBean.getXp();
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return xpStr;
	}
	
	/**
	 * 查询身份证相关信息
	 * @param sfzh 身份证号码
	 * @param resultFields 要查询的信息
	 * @return CzrkInfoBean
	 */
	public CzrkInfoBean queryCzrkInfoBySfzh(String sfzh,String resultFields) throws Exception
	{
		if (ValidateHelper.isNotEmptyString(sfzh))
		{
			String condition = "SFZH='"+sfzh+"'";
			List<CzrkInfoBean> list = queryCzrkInfo(condition, resultFields);
			if (list != null && list.size() > 0)
			{
				return list.get(0);
			}
		}
		else
		{
			throw new CPSException("调用请求服务身份证号码不能为空");
		}
		return null;
	}
	
	/**
	 *  查询常住人口信息
	 * @param condition 查询条件
	 * @param resultFields 要查询的信息
	 * @return CzrkInfoBean
	 */
	public List<CzrkInfoBean> queryCzrkInfo(String condition,String resultFields) throws Exception
	{
		return request.queryQGCzrkInfo(condition, resultFields);
	}
	
	/**
	 * 获取常住人口信息
	 * @param sfzh
	 * @param resultFields
	 * @param usersfzh
	 * @param realname
	 * @param orgcode
	 * @return
	 * @throws Exception
	 * @date Jan 10, 2015 12:24:45 PM
	 */
	public CzrkInfoBean queryCzrkInfoBySfzhAndUserInfo(String sfzh,String usersfzh, String realname, String orgcode) throws Exception
	{
		if (ValidateHelper.isNotEmptyString(sfzh))
		{
			String condition = "SFZH='"+sfzh.trim()+"'";
			List<CzrkInfoBean> czrkList =request.queryQGCzrkInfoByUserInfo(condition, resultFields, usersfzh, realname, orgcode);
			if (czrkList != null && czrkList.size() > 0)
			{
				return czrkList.get(0);
			}
			else if (czrkList != null && czrkList.size() == 0)
			{
				return null;
			}
			else
			{
				throw new CPSException("无法在公安部库中获取到人员信息");
			}
		}
		else
		{
			throw new CPSException("调用请求服务身份证号码不能为空");
		}
	}
	
	/**
	 * 获取常住人口信息
	 * @param sfzh
	 * @param resultFields
	 * @param usersfzh
	 * @param realname
	 * @param orgcode
	 * @return
	 * @throws Exception
	 * @date Jan 10, 2015 12:24:45 PM
	 */
	public CzrkInfoBean queryCzrkInfoBySfzhAndUserInfo(String sfzh,String resultFields,String usersfzh, String realname, String orgcode) throws Exception
	{
		if (ValidateHelper.isNotEmptyString(sfzh))
		{
			String condition = "SFZH='"+sfzh.trim()+"'";
			List<CzrkInfoBean> czrkList =request.queryQGCzrkInfoByUserInfo(condition, resultFields, usersfzh, realname, orgcode);
			if (czrkList != null && czrkList.size() > 0)
			{
				return czrkList.get(0);
			}
			else if (czrkList != null && czrkList.size() == 0)
			{
				return null;
			}
			else
			{
				throw new CPSException("无法在公安部库中获取到人员信息");
			}
		}
		else
		{
			throw new CPSException("调用请求服务身份证号码不能为空");
		}
	}
}
