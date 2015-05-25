package com.chinacreator.sydw.scheduler;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.chinacreator.common.bean.OrganizationBean;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.cps.bean.RkJbxxBean;
import com.chinacreator.common.cps.helper.CommonSequenceHelper;
import com.chinacreator.common.exception.CPSException;
import com.chinacreator.common.helper.DateTimeHelper;
import com.chinacreator.common.helper.DictionaryCacheHellper;
import com.chinacreator.common.helper.IDCardSfzhHelper;
import com.chinacreator.common.helper.StringArrayListHelper;
import com.chinacreator.common.helper.ValidateHelper;
import com.chinacreator.lsgl.services.LsglRkService;
import com.chinacreator.lsgl.services.impl.LsglRkServiceImpl;
import com.chinacreator.sydw.bean.CyryImportBean;
import com.chinacreator.zagl.bean.DwcyryBean;
import com.chinacreator.zagl.query.CyryQueryBean;
import com.chinacreator.zagl.services.CyryManageService;
import com.frameworkset.common.poolman.ConfigSQLExecutor;
import com.frameworkset.common.poolman.SQLParams;
import com.frameworkset.orm.transaction.TransactionManager;

/**
 * 从业人员导入数据任务处理
 * 
 * @filename CyryImportCheckJobScheduler.java
 * @author mingchun.xiong
 * @date Jan 9, 2015
 */
public class CyryImportCheckJobScheduler
{
	private ConfigSQLExecutor executor = new ConfigSQLExecutor("com/chinacreator/sydw/dao/cyryimport-sql.xml");
	private CyryManageService cyryService;
	private LsglRkService rkService;
	
	public CyryImportCheckJobScheduler()
	{
		rkService = new LsglRkServiceImpl();
		cyryService = new CyryManageService();
	}
	
	/**
	 * 从业人员任务导入处理方法
	 * 
	 * @date Jan 9, 2015 8:57:24 AM
	 */
	public void doSchedulerHander()
	{
		System.out.println(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss") + "-启动从业人员扫描.");
		List<CyryImportBean> cyryList = queryCyryImportBeans();
		if (ValidateHelper.isNotEmptyCollection(cyryList))
		{
			System.out.println(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss") + "-系统扫描从业人员导入数据，发现" + cyryList.size() + "条");
			RkJbxxBean jbxxBean = null;
			DwcyryBean cyryBean = null;
			for (CyryImportBean importBean : cyryList)
			{
				try
				{
					//验证上传数据格式是否正确
					List<String> errorlist = validateCyryImportBean(importBean);
					if (ValidateHelper.isNotEmptyCollection(errorlist))
					{
						String errorInfo = StringArrayListHelper.converListToString(errorlist, ",");
						throw new CPSException("errorbs",errorInfo);
					}
					//先从本地获取人员基本信息，如果获取不不到将从远处服务获取
					jbxxBean = rkService.queryRkJbxxBeanBySfzh(importBean.getSfzh());
					if (jbxxBean == null)
					{
						jbxxBean = rkService.queryCzrkInfoStBeanBySfzhAndUserInfo(importBean.getSfzh(), importBean.getDjrsfzh(), importBean.getDjrxm(), importBean.getDjdwdm());
					}
					//人员没找到
					if (jbxxBean == null)
					{
						throw new CPSException("无法获取人员基本信息,请检查身份证号码是否正确.");
					}
					else
					{
						//查询条件,查询单位从业人员
						CyryQueryBean queryBean = new CyryQueryBean();
						queryBean.setSfzh(importBean.getSfzh());
						queryBean.setJgbh(importBean.getJgbh());
						cyryBean = cyryService.queryDwCyryBeanByQueryBean(queryBean);
						if (cyryBean == null)
						{
							cyryBean = new DwcyryBean();
						}
						//转化人员基本信息为从业人员基本信息
						converRkJbxxToDwcyryBean(cyryBean, jbxxBean);
						
						//转化导入从业人员对象到从业人员对象中
						converCyryImportBeanToCyryBean(cyryBean, importBean);
						boolean temp = cyryService.saveCyryInfoBean(cyryBean);
						//成功执行
						if (temp)
						{
							updateCyryImportBean(importBean.getBh(), "execbs", "1", "处理成功");
						}
						else
						{
							updateCyryImportBean(importBean.getBh(), "execbs", "2", "处理发生错误");
						}
						
						//更新外网用户信息
						if (ValidateHelper.isNotEmptyString(importBean.getWwusername()) 
								&& ValidateHelper.isNotEmptyString(importBean.getWwusersfzh()))
						{
							updateCyrybUserInfo(importBean.getWwusername(), importBean.getWwusersfzh(), cyryBean.getCyrybh());
						}
						
					}
				}
				catch(Exception e)
				{
					e.printStackTrace();
					if (e instanceof CPSException)
					{
						//验证错误
						CPSException cpse = (CPSException)e;
						updateCyryImportBean(importBean.getBh(), cpse.getErrorCode(), "1", e.getMessage());
					}
					else
					{
						//执行发生错误
						updateCyryImportBean(importBean.getBh(), "execbs", "2", e.getMessage());
					}
				}
			}
		}
	}
	
	/**
	 * 转化人员基本信息为从业人员基本信息
	 * @param cyryBean
	 * @param jbxxBean
	 * @date Jan 9, 2015 9:44:54 AM
	 */
	public void converRkJbxxToDwcyryBean(DwcyryBean cyryBean,RkJbxxBean jbxxBean)
	{
		cyryBean.setSfzh(jbxxBean.getSfzh());
		cyryBean.setRybh(jbxxBean.getRybh());
		cyryBean.setCsrq(jbxxBean.getCsrq());
		cyryBean.setXb(jbxxBean.getXb());
		cyryBean.setXm(jbxxBean.getXm());
		cyryBean.setMz(jbxxBean.getMz());
		cyryBean.setBmch(jbxxBean.getBmch());
		cyryBean.setSfjwry("0");//非境外人员
		cyryBean.setGj("CHN");//中国
		cyryBean.setZjzl("111");//身份证号
		cyryBean.setZjhm(jbxxBean.getSfzh());
		cyryBean.setByzk(jbxxBean.getByzk());
		cyryBean.setYwm(jbxxBean.getYwm());
		cyryBean.setWhcd(jbxxBean.getWhcd());
		cyryBean.setZzmm(jbxxBean.getZzmm());
		cyryBean.setHyzk(jbxxBean.getHyzk());
		cyryBean.setSg(jbxxBean.getSg());
		cyryBean.setXx(jbxxBean.getXx());
		cyryBean.setZzxy(jbxxBean.getZzxy());
		cyryBean.setLxdh(jbxxBean.getLxdh() != null ? jbxxBean.getLxdh():cyryBean.getSjhm());
		cyryBean.setFwcs(jbxxBean.getFwcs());
		cyryBean.setZydm(jbxxBean.getZydm());
		cyryBean.setSf(jbxxBean.getSf());
		cyryBean.setJg(jbxxBean.getCsd());
		cyryBean.setRysx(CommonSequenceHelper.getRysx(jbxxBean.getSfzh(), "18", "I"));
		cyryBean.setHjdqh(jbxxBean.getHjdqh());
		cyryBean.setHjdxz(jbxxBean.getHjdxz());
		cyryBean.setCsd(jbxxBean.getCsd());
		cyryBean.setXzzqh(jbxxBean.getXzzqh());
		cyryBean.setXzzxz(jbxxBean.getXzzxz());
		cyryBean.setXzzqhmc(jbxxBean.getXzzqhmc());
		cyryBean.setXzzzrq(jbxxBean.getXzzzrq());
		cyryBean.setLxdhbz(jbxxBean.getLxdhbz());
		cyryBean.setSsgajgjgdm(jbxxBean.getSsgajgjgdm());
		cyryBean.setSsgajgjgmc(jbxxBean.getSsgajgjgmc());
		cyryBean.setSspcsdm(jbxxBean.getSspcsdm());
		cyryBean.setSspcsmc(jbxxBean.getSspcsmc());
		cyryBean.setSfjwry("0");
	}
	
	/**
	 * 赋值从业人员导入对象给从业人员对象
	 * @param cyryBean
	 * @param cyryImportBean
	 * @date Jan 10, 2015 2:08:49 PM
	 */
	private void converCyryImportBeanToCyryBean(DwcyryBean cyryBean,CyryImportBean cyryImportBean)
	{
		cyryBean.setJgbh(cyryImportBean.getJgbh());
		if (ValidateHelper.isEmptyString(cyryBean.getXm()))
		{
			cyryBean.setXm(cyryImportBean.getXm());	
		}
		cyryBean.setLxdh(cyryImportBean.getLxdh());
		cyryBean.setSjhm(cyryImportBean.getLxdh());
		cyryBean.setZw(cyryImportBean.getZwdm());
		cyryBean.setRzsj(cyryImportBean.getRzsj());
		cyryBean.setLzsj(cyryImportBean.getLzsj());
		
		cyryBean.setJzdpcsdm(cyryImportBean.getJzdpcsdm());
		cyryBean.setJzdpcsmc(cyryImportBean.getJzdpcsmc());
		
		cyryBean.setXzdz(cyryImportBean.getJzdz());
		cyryBean.setBz(cyryImportBean.getBz());
		
		cyryBean.setDjdwdm(cyryImportBean.getDjdwdm());
		cyryBean.setDjdwmc(cyryImportBean.getDjdwmc());
		cyryBean.setDjrjh(cyryImportBean.getDjrjh());
		cyryBean.setDjrsfzh(cyryImportBean.getDjrsfzh());
		cyryBean.setDjrxm(cyryImportBean.getDjrxm());
		
		cyryBean.setCzdwdm(cyryImportBean.getDjdwdm());
		cyryBean.setCzdwmc(cyryImportBean.getDjdwmc());
		cyryBean.setCzrjh(cyryImportBean.getDjrjh());
		cyryBean.setCzrsfzh(cyryImportBean.getDjrsfzh());
		cyryBean.setCzrxm(cyryImportBean.getDjrxm());
	}
	
	/**
	 * 验证从业人员导入数据的合法性
	 * @param cyryImportBean
	 * @return
	 * @date Jan 10, 2015 2:08:26 PM
	 */
	private List<String> validateCyryImportBean(CyryImportBean cyryImportBean)
	{
		List<String> errorlist = new ArrayList<String>();
		if (!IDCardSfzhHelper.isIdcard(cyryImportBean.getSfzh()))
		{
			errorlist.add("身份证号码格式不正确");
		}
		
		if (ValidateHelper.isNotEmptyString(cyryImportBean.getZw()))
		{
			String[] zws = cyryImportBean.getZw().split("-");
			if (zws.length > 2 || zws.length<=1)
			{
				errorlist.add("职务格式不正确，必须选择下拉选项");
			}
			else
			{
				if (zws[0].length()==2)
				{
					cyryImportBean.setZwdm(zws[0]);
				}
				else
				{
					errorlist.add("职务选项格式错误");
				}
			}
		}
		if (ValidateHelper.isNotEmptyString(cyryImportBean.getJzdpcs()))
		{
			String[] jzdpcss = cyryImportBean.getJzdpcs().split("-");
			if (jzdpcss.length > 2 || jzdpcss.length<=1)
			{
				errorlist.add("居住地派出所格式不正确");
			}
			else
			{
				if (jzdpcss[0].length()==12)
				{
					OrganizationBean orgBean = DictionaryCacheHellper.getOrganizationBeanByOrgCode(jzdpcss[0]);
					if (orgBean != null)
					{
						cyryImportBean.setJzdpcsdm(orgBean.getOrgcode());
						cyryImportBean.setJzdpcsmc(orgBean.getOrgname());
					}
					else
					{
						errorlist.add("居住地派出所不存在");
					}
				}
				else
				{
					errorlist.add("居住地派出所格式不正确");
				}
			}
		}
		return errorlist;
	}
	
	/**
	 * 查询从业人员导入数据 不包括验证错误与执行错误的数据
	 * @return
	 * @date Jan 10, 2015 2:07:59 PM
	 */
	private List<CyryImportBean> queryCyryImportBeans()
	{
		TransactionManager tm = null;
		try
		{
			tm = new TransactionManager();
			tm.begin();
			List<CyryImportBean> cyrylist = executor.queryListWithDBName(CyryImportBean.class, CommonConstant.DBNAME_SQJW, "queryCyryImportBeans");
			if (ValidateHelper.isNotEmptyCollection(cyrylist))
			{
				executor.updateBeans(CommonConstant.DBNAME_SQJW,"updateCyryLockbs", cyrylist);
			}
			tm.commit();
			return cyrylist;
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 更新从业人员导入数据错误与执行状态
	 * @param bh
	 * @param field
	 * @param value
	 * @param errorInfo
	 * @date Jan 10, 2015 2:07:39 PM
	 */
	private void updateCyryImportBean(String bh, String field, String value, String errorInfo)
	{
		try
		{
			SQLParams params = new SQLParams();
			params.addSQLParam("bh", bh, SQLParams.STRING);
			params.addSQLParam("field", field, SQLParams.STRING);
			params.addSQLParam("value", value, SQLParams.STRING);
			params.addSQLParam("errorInfo", errorInfo, SQLParams.STRING);
			executor.updateBean(CommonConstant.DBNAME_SQJW, "updateCyryImportBean", params);
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
	}
	
	private void updateCyrybUserInfo(String wwusername, String wwusersfzh, String cyrybh)
	{
		try
		{
			SQLParams params = new SQLParams();
			params.addSQLParam("wwusername", wwusername, SQLParams.STRING);
			params.addSQLParam("wwusersfzh", wwusersfzh, SQLParams.STRING);
			params.addSQLParam("cyrybh", cyrybh, SQLParams.STRING);
			executor.updateBean(CommonConstant.DBNAME_SQJW, "updateCyrybUserInfo", params);
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
	}
}
