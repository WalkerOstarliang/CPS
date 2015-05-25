package com.chinacreator.common.cps.action;

import java.io.FileInputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.SocketException;
import java.sql.Blob;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.codec.binary.Base64;
import org.apache.xml.security.exceptions.Base64DecodingException;

import com.chinacreator.common.bean.LoginInfo;
import com.chinacreator.common.bean.OrganizationBean;
import com.chinacreator.common.bean.QueryBean;
import com.chinacreator.common.bean.SystemDictionaryBean;
import com.chinacreator.common.bean.UserBean;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.cps.bean.RkJbxxBean;
import com.chinacreator.common.cps.bean.XqxxBean;
import com.chinacreator.common.cps.bean.XzqhMappingBean;
import com.chinacreator.common.cps.business.DictionaryBusiness;
import com.chinacreator.common.cps.business.OrgUserbusiness;
import com.chinacreator.common.helper.ActionContextHelper;
import com.chinacreator.common.helper.DictionaryCacheHellper;
import com.chinacreator.common.helper.ImageMarkHelper;
import com.chinacreator.common.helper.ValidateHelper;
import com.chinacreator.remote.business.RemoteRequestService;

/**
 * 公共加载action
 * @author mingchun.xiong
 *
 */
public class CommonLoadDataAction extends CPSBaseAction
{

	/**
	 * 
	 */
	private static final long	serialVersionUID	= 5719654982133518496L;
	private OrgUserbusiness business;
	private RemoteRequestService remoteService;
	private QueryBean queryBean;
	private String mutilSelect = "true";
	
	private String sqbh;
	
	private String rybh;
	
	private String sfzh;
	
	private String xzqhmc;
	
	private String xzqhdm;
	
	private String orgcode;
	
	private String zdlb;
	
	private String gj;
	
	private String zjzl;
	
	private String zjhm;
	
	private String parent_dm = null;
	
	public CommonLoadDataAction()
	{
		super();
		business = new OrgUserbusiness();
		remoteService = new RemoteRequestService();
	}
	
	public String toHnxzqhSelectPage()
	{
		return "toHnxzqhSelectPage";
	}
	
	/**
	 * 加载还在行政区划
	 */
	public void loadChildXzqh()
	{
		List<SystemDictionaryBean> list = null;
		LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
		if (loginInfo.getIsGxdz())
		{
			DictionaryBusiness business = new DictionaryBusiness();
			List<XzqhMappingBean> mapBenas = business.getXzqhByPz(loginInfo.getCountrydm());
			if (ValidateHelper.isNotEmptyCollection(mapBenas))
			{
				list = new ArrayList<SystemDictionaryBean>();
				for (XzqhMappingBean bean : mapBenas)
				{
					SystemDictionaryBean dicBean = DictionaryCacheHellper.getSystemDictionaryBeanByZdlbAndDm("GB_XZQH", bean.getYxzqh());
					list.add(dicBean);
				}
			}
		}
		else
		{
			list = business.queryLeafXzqhListByParentDm(xzqhdm);
		}
		responseWrite(list);
	}

	/**
	 * 加载派出所
	 */
	public void loadCountryPcs()
	{
		String countrydm = xzqhdm + "000000";
		List<OrganizationBean> list = business.queryPcsOrgListByParentDm(countrydm);
		responseWrite(list);
	}
	
	/**
	 * 加载社区警务室
	 */
	public void loadJwcByPcs()
	{
		List<OrganizationBean> list = business.queryJwsqOrgListByParentDm(orgcode);
		responseWrite(list);
	}
	
	/**
	 * 加载乡镇街道
	 */
	public void loadJdxzByXzqhParentDm()
	{
		DictionaryBusiness business = new DictionaryBusiness();
		List<SystemDictionaryBean> list = new ArrayList<SystemDictionaryBean>();
		LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
		if (ValidateHelper.isNotEmptyString(xzqhdm))
		{
			int leve = loginInfo.getLeve();
			if(leve==4 || leve==5)
			{
				//list = business.queryXzjdDicBeanByPcsdm(loginInfo.getPcsdm());
				list = business.queryXzjdDicBeanByPcsdmAndXzqhdm(loginInfo.getPcsdm(), xzqhdm);
			}
			if (ValidateHelper.isEmptyCollection(list))
			{
				if(ValidateHelper.isNotEmptyString(loginInfo.getCountrygajgdm()))
				{
					list = DictionaryCacheHellper.getSystemDictionaryBeanListByParentDm(CommonConstant.HN_XZQH, loginInfo.getCountrygajgdm());
					if (ValidateHelper.isEmptyCollection(list))
					{
						if (loginInfo.getIsGxdz())
						{
							for (String gxyxzqh : loginInfo.getGxYxzqhList())
							{
								String yxzqh = gxyxzqh + "000000";
								list.addAll(DictionaryCacheHellper.getSystemDictionaryBeanListByParentDm(CommonConstant.HN_XZQH, yxzqh));
							}
						}
					}
				}
				else
				{
					list = DictionaryCacheHellper.getSystemDictionaryBeanListByParentDm(CommonConstant.HN_XZQH, xzqhdm);
				}
			}
		}
		responseWrite(list);
	}
	
	/**
	 * 通过警务室代码找派出所
	 */
	public void findPcsOrgBeanByJwsdm()
	{
		String pcsdm = orgcode.substring(0,8) + "0000";
		OrganizationBean bean = DictionaryCacheHellper.getOrganizationBeanByOrgCode(pcsdm);
		responseWrite(bean);
	}
	
	/**
	 * 通过派出所代码获取社区
	 */
	public void findSqBeanByPcsdm()
	{
		String pcsdm = orgcode;
		responseWrite(business.findSqBeanByPcsdm(pcsdm));
	}
	
	/**
	 * 加载社区通过街道乡镇
	 * 
	 * @date 2013-8-7 下午06:56:09
	 */
	public void loadSqxxByJdxzdm()
	{
		LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
		List<SystemDictionaryBean> list = null;
		int leve = loginInfo.getLeve();
		if(leve==5)
		{
			list = business.queryXzsqDicBeanByJdxzdmAndJwqdm(xzqhdm, loginInfo.getOrgcode());
		}
		else
		{
			list = business.querySqxxByJdxzdmAndPcsdm(xzqhdm, loginInfo.getOrgcode());
			if (ValidateHelper.isEmptyCollection(list))
			{
				list = DictionaryCacheHellper.getSystemDictionaryBeanListByParentDm(CommonConstant.HN_XZQH, xzqhdm);
			}
		}
		responseWrite(list);
	}
	
	/**
	 * 异步加载县区公安机构
	 * 
	 * @date 2013-10-24 上午09:46:44
	 */
	public void queryCountryGajgjg()
	{
		List<SystemDictionaryBean> list = DictionaryCacheHellper.queryCountryGajgjgdws(parent_dm);
		//List<SystemDictionaryBean> otherlist = DictionaryCacheHellper.queryOtherOrgSelect("2");
		//list.addAll(otherlist);
		responseWrite(list);
	}
	
	/**
	 * 异步查询派生词公安机构
	 * 
	 * @date 2013-10-24 上午09:47:44
	 */
	public void queryPcsGajgjg()
	{
		List<SystemDictionaryBean> list = DictionaryCacheHellper.queryPcsGajgjgdws(parent_dm);
		//List<SystemDictionaryBean> otherlist = DictionaryCacheHellper.queryOtherOrgSelect("3");
		//list.addAll(otherlist);
		responseWrite(list);
	}
	
	/**
	 * 根据区县查询可访问派出所
	 */
	public void queryKfwPcsByQxDm(){
		
		List<SystemDictionaryBean> list = DictionaryCacheHellper.queryKfwPcsGajgjgdws(parent_dm);
		responseWrite(list);
	}
	
	/**
	 * 异步查询派生词公安机构
	 * 流口协管员专用
	 * @date 2013-10-24 上午09:47:44
	 */
	public void queryPcsGajgjgForLkXgy()
	{
		List<SystemDictionaryBean> list = DictionaryCacheHellper.queryPcsGajgjgdwsForLkXgy(parent_dm);
		responseWrite(list);
	}
	
	/**
	 * 通过父类代码找对应的数据字典
	 */
	public void findDicBeanByParentDm()
	{
		List<SystemDictionaryBean> list = DictionaryCacheHellper.getSystemDictionaryBeanListByParentDm(zdlb, parent_dm);
		responseWrite(list);
	}
	
	/**
	 * 通过警务室代码找社区民警
	 */
	public void findSqmjBeanListByJwsdm()
	{
		List<UserBean> list = business.queryUserListByOrgCode(orgcode, 1);
		responseWrite(list);
	}
	
	/**
	 * 通过社区找小区
	 */
	public void findXqxxListBySqbh()
	{
		List<XqxxBean> list = business.findXqxxBeanListBySqbh(sqbh);
		responseWrite(list);
	}
	
	/**
	 * 加载境外人口信息
	 * 
	 * @date 2013-9-4 下午04:07:23
	 */
	public void loadJwrkJbxxBean()
	{
		RkJbxxBean rkJbxxBean = business.findJwrkxxByQueryCondition(gj, zjzl, zjhm);
		responseWrite(rkJbxxBean);
	}
	
	public String toJwqSelectPage()
	{
		LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
		queryBean = new QueryBean();
		queryBean.setCitygajgjgdm(loginInfo.getCitygajgdm());
		queryBean.setCountrygajgjgdm(loginInfo.getCountrygajgdm());
		queryBean.setCitydm(loginInfo.getCitydm());
		queryBean.setCountrydm(loginInfo.getCountrydm());
		return "toJwqSelectPage";
	}
	
	public void showJwrkPoto()
	{
		try
		{
			Blob blob = business.getJwrkzpBlob(rybh);
			if (blob != null)
			{
				InputStream is = blob.getBinaryStream();
				if (is == null) return ;
				byte[] b = new byte[1024];
				while(is.read(b) > 0)
				{
					response.getOutputStream().write(b);
					response.getOutputStream().flush();
				}
				is.close();
			}
			else
			{
				ImageMarkHelper.createMarkImageOut(request.getSession().getServletContext().getRealPath("/systemico/default_zp.png"), "" ,response.getOutputStream());
			}
			response.getOutputStream().close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	
	/**
	 * 查询常住人口照片
	 * @throws Base64DecodingException 
	 */
	public void showPoto()
	{
		OutputStream out = null;
		InputStream in = null;
		try
		{
			out = response.getOutputStream();
			if (ValidateHelper.isNotEmptyString(sfzh))
			{
				
				//查询本地照片库 ，本地没有再加载远程库
				Blob blob = business.getRkzpBlob(sfzh);
				if (blob == null)
				{
					String xpStr = remoteService.queryXpBySfzh(sfzh.toUpperCase());
					if (ValidateHelper.isNotEmptyString(xpStr) && xpStr.length() > 100)
					{
						// 服务器中心异常
						byte[] bytes = Base64.decodeBase64(xpStr.getBytes());
						out.write(bytes);
					}
					else
					{
						in = new FileInputStream(request.getSession().getServletContext().getRealPath("/systemico/default_zp.png"));
						if (in == null) return ;
						byte[] b = new byte[1024];
						while(in.read(b) > 0)
						{
							out.write(b);
						}
					}
				}
				else
				{
					in = blob.getBinaryStream();
					if (in == null) return ;
					byte[] b = new byte[1024];
					while(in.read(b) > 0)
					{
						out.write(b);
					}
				}
			}
			else
			{
				in = new FileInputStream(request.getSession().getServletContext().getRealPath("/systemico/default_zp.png"));
				if (in == null) return ;
				byte[] b = new byte[1024];
				while(in.read(b) > 0)
				{
					out.write(b);
				}
			}
		}
		catch(Exception e)
		{
			if(!(e instanceof SocketException))
			{
				e.printStackTrace();
			}
		}
		finally
		{
			try
			{
				in.close();
				out.close();
			}
			catch(Exception e)
			{
			}
		}
	}
	
	public void getXzqhmcByXzqhdm(){
		xzqhmc =DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("GB_XZQH", xzqhdm);
		responseWrite(xzqhmc);
	}
	
	public String getXzqhdm() {
		return xzqhdm;
	}

	public void setXzqhdm(String xzqhdm) {
		this.xzqhdm = xzqhdm;
	}

	public String getOrgcode() {
		return orgcode;
	}

	public void setOrgcode(String orgcode) {
		this.orgcode = orgcode;
	}

	public String getSfzh() {
		return sfzh;
	}

	public void setSfzh(String sfzh) {
		this.sfzh = sfzh;
	}

	public String getZdlb() {
		return zdlb;
	}

	public void setZdlb(String zdlb) {
		this.zdlb = zdlb;
	}

	public String getParent_dm() {
		return parent_dm;
	}

	public void setParent_dm(String parentDm) {
		parent_dm = parentDm;
	}

	public String getSqbh()
	{
		return sqbh;
	}

	public void setSqbh(String sqbh)
	{
		this.sqbh = sqbh;
	}

	public String getGj()
	{
		return gj;
	}

	public void setGj(String gj)
	{
		this.gj = gj;
	}

	public String getZjzl()
	{
		return zjzl;
	}

	public void setZjzl(String zjzl)
	{
		this.zjzl = zjzl;
	}

	public String getZjhm()
	{
		return zjhm;
	}

	public void setZjhm(String zjhm)
	{
		this.zjhm = zjhm;
	}

	public String getMutilSelect()
	{
		return mutilSelect;
	}

	public void setMutilSelect(String mutilSelect)
	{
		this.mutilSelect = mutilSelect;
	}

	public QueryBean getQueryBean()
	{
		return queryBean;
	}

	public void setQueryBean(QueryBean queryBean)
	{
		this.queryBean = queryBean;
	}

	public String getRybh()
	{
		return rybh;
	}

	public void setRybh(String rybh)
	{
		this.rybh = rybh;
	}

	public String getXzqhmc() {
		return xzqhmc;
	}

	public void setXzqhmc(String xzqhmc) {
		this.xzqhmc = xzqhmc;
	}
	
	
}
