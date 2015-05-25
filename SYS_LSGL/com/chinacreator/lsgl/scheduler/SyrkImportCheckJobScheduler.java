package com.chinacreator.lsgl.scheduler;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.transaction.RollbackException;

import com.chinacreator.common.bean.SystemDictionaryBean;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.cps.bean.RkJbxxBean;
import com.chinacreator.common.cps.constants.CommonFinalParams;
import com.chinacreator.common.cps.helper.CommonSequenceHelper;
import com.chinacreator.common.exception.CPSException;
import com.chinacreator.common.helper.DateTimeHelper;
import com.chinacreator.common.helper.DictionaryCacheHellper;
import com.chinacreator.common.helper.IDCardSfzhHelper;
import com.chinacreator.common.helper.StringArrayListHelper;
import com.chinacreator.common.helper.ValidateHelper;
import com.chinacreator.lsgl.bean.CzrkxxBean;
import com.chinacreator.lsgl.bean.FwJbxxBean;
import com.chinacreator.lsgl.bean.JzrkxxBean;
import com.chinacreator.lsgl.bean.LdrkxxBean;
import com.chinacreator.lsgl.bean.RkwlczhkBean;
import com.chinacreator.lsgl.bean.RkxxBean;
import com.chinacreator.lsgl.bean.SyrkImportBean;
import com.chinacreator.lsgl.services.LsglFwService;
import com.chinacreator.lsgl.services.LsglRkService;
import com.chinacreator.lsgl.services.impl.LsglFwServiceImpl;
import com.chinacreator.lsgl.services.impl.LsglRkServiceImpl;
import com.frameworkset.common.poolman.ConfigSQLExecutor;
import com.frameworkset.common.poolman.SQLParams;
import com.frameworkset.orm.transaction.TransactionManager;


public class SyrkImportCheckJobScheduler
{
	private ConfigSQLExecutor executor = new ConfigSQLExecutor("com/chinacreator/lsgl/dao/syrkimport-sql.xml");
	
	private LsglRkService rkService;
	private LsglFwService fwService;
	
	public SyrkImportCheckJobScheduler()
	{
		rkService = new LsglRkServiceImpl();
		fwService = new LsglFwServiceImpl();
	}
	
	public void doSchedulerHander()
	{
		System.out.println(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss") + "-启动实有人口扫描.");
		List<SyrkImportBean> syrklist = querySyrkImportBeans();
		if (ValidateHelper.isNotEmptyCollection(syrklist))
		{
			System.out.println(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss") + "-系统扫描实有人口导入数据，发现" + syrklist.size() + "条");
			RkxxBean rkBean = null;
			for (SyrkImportBean syrkImportBean : syrklist)
			{
				rkBean = new RkxxBean();
				try
				{
					List<String> errorlist = validateSyrkImportBean(syrkImportBean);
					if (ValidateHelper.isNotEmptyCollection(errorlist))
					{
						String errorInfo = StringArrayListHelper.converListToString(errorlist, ",");
						throw new CPSException("errorbs",errorInfo);
					}
					String rkid = "";
					String rylb = CommonSequenceHelper.getRylb(syrkImportBean.getSfzh().trim(), syrkImportBean.getFwid(), syrkImportBean.getDjrsfzh(), syrkImportBean.getDjrxm(), syrkImportBean.getDjdwdm());
					syrkImportBean.setRylb(rylb);
					rkBean.setRylb(rylb);
					FwJbxxBean fwJbxxBean = fwService.queryFwJbxxBeanByFwid(syrkImportBean.getFwid());
					rkBean.setFwxxBean(fwJbxxBean);
					if (CommonFinalParams.RYLB_CZRK.equals(rylb))
					{
						queryLoadCzrkInfo(rkBean, syrkImportBean);
						converSyrkImportBeanToRkBean(syrkImportBean, rkBean);
						rkService.saveRkJbxxBean(rkBean);
						rkService.saveCzrkxxInfo(rkBean);
						rkid = rkBean.getCzrkBean().getCzrkbh();
					}
					else if (CommonFinalParams.RYLB_LDRK.equals(rylb))
					{
						queryLoadLdrkInfo(rkBean, syrkImportBean);
						converSyrkImportBeanToRkBean(syrkImportBean, rkBean);
						rkService.saveRkJbxxBean(rkBean);
						rkService.saveLdrkxx(rkBean);
						rkid = rkBean.getLdrkBean().getZzbh();
					}
					else if (CommonFinalParams.RYLB_JZRK.equals(rylb))
					{
						queryLoadJzrkInfo(rkBean, syrkImportBean);
						converSyrkImportBeanToRkBean(syrkImportBean, rkBean);
						rkService.saveRkJbxxBean(rkBean);
						rkService.saveJzrkxx(rkBean);
						rkid = rkBean.getJzrkBean().getJzbh();
					}
					else if (CommonFinalParams.RYLB_WLHRK.equals(rylb))
					{
						queryLoadWlhrkInfo(rkBean, syrkImportBean);
						converSyrkImportBeanToRkBean(syrkImportBean, rkBean);
						rkService.saveRkJbxxBean(rkBean);
						rkService.saveWlhrkxx(rkBean);
						rkid = rkBean.getWlhrkBean().getWlhrkbh();
					}
					//处理成功，更新成功状态
					updateSyrkImportBean(syrkImportBean.getBh(), "execbs", "1", "处理成功",rylb, rkid);
					
					//更新实有人口表外网用户信息，如果不是外网导入则不更新，是外网导入则更新
					if (ValidateHelper.isNotEmptyString(syrkImportBean.getWwusername()) 
							&& ValidateHelper.isNotEmptyString(syrkImportBean.getWwusersfzh()))
					{
						updateSyrkbWwUserInfo(syrkImportBean.getWwusername(), syrkImportBean.getWwusersfzh(), rkid, rylb);
					}	
				}
				catch(Exception e)
				{
					e.printStackTrace();
					if (e instanceof CPSException)
					{
						//验证错误
						CPSException cpse = (CPSException)e;
						updateSyrkImportBean(syrkImportBean.getBh(), cpse.getErrorCode(), "1", e.getMessage(),"","");
					}
					else
					{
						//执行发生错误
						updateSyrkImportBean(syrkImportBean.getBh(), "execbs", "2", e.getMessage(),"","");
					}
				}
			}
		}
	}
	
	private void converSyrkImportBeanToRkBean(SyrkImportBean syrkImportBean, RkxxBean rkBean)
	{
		rkBean.getJbxxBean().setLxdh(syrkImportBean.getLxdh());
		rkBean.getJbxxBean().setDjdwdm(syrkImportBean.getDjdwdm());
		rkBean.getJbxxBean().setCzdwdm(syrkImportBean.getDjdwdm());
		rkBean.getJbxxBean().setCzdwmc(syrkImportBean.getDjdwmc());
		rkBean.getJbxxBean().setCzrjh(syrkImportBean.getDjrjh());
		rkBean.getJbxxBean().setCzrxm(syrkImportBean.getDjrxm());
		rkBean.getJbxxBean().setCzrsfzh(syrkImportBean.getDjrsfzh());
		if (ValidateHelper.isEmptyString(rkBean.getJbxxBean().getByzk()))
		{
			rkBean.getJbxxBean().setByzk("9");
		}
		rkBean.getJbxxBean().setXx("9");
		if (ValidateHelper.isEmptyString(rkBean.getJbxxBean().getZydm()))
		{
			rkBean.getJbxxBean().setZydm("y00");
		}
		rkBean.getJbxxBean().setCzbs("2");
		rkBean.getJbxxBean().setCzsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss"));
		
		if (CommonFinalParams.RYLB_CZRK.equals(rkBean.getRylb()))
		{
			SystemDictionaryBean dicBean = DictionaryCacheHellper.getSystemDictionaryBeanByZdlbAndDm("YHZGL", syrkImportBean.getYhzgxdm());
			if (dicBean != null)
			{
				rkBean.getCzrkBean().setYhzgx(syrkImportBean.getYhzgxdm());
			}
			else
			{
				//默认其他非亲属关系
				rkBean.getCzrkBean().setYhzgx("290");
			}
			rkBean.getCzrkBean().setBz(syrkImportBean.getBz());
			
			rkBean.getCzrkBean().setDjdwdm(syrkImportBean.getDjdwdm());
			rkBean.getCzrkBean().setDjdwmc(syrkImportBean.getDjdwmc());
			rkBean.getCzrkBean().setDjrsfzh(syrkImportBean.getDjrsfzh());
			rkBean.getCzrkBean().setDjrxm(syrkImportBean.getDjrxm());
			
			rkBean.getCzrkBean().setCzdwdm(syrkImportBean.getDjdwdm());
			rkBean.getCzrkBean().setCzdwmc(syrkImportBean.getDjdwmc());
			rkBean.getCzrkBean().setCzrjh(syrkImportBean.getDjrjh());
			rkBean.getCzrkBean().setCzrsfzh(syrkImportBean.getDjrsfzh());
			rkBean.getCzrkBean().setCzrxm(syrkImportBean.getDjrxm());
			rkBean.getCzrkBean().setCzbs("2");
			
			rkBean.getCzrkBean().setSsgajgjgdm(syrkImportBean.getDjdwdm().substring(0, 6)+ "000000");
			rkBean.getCzrkBean().setSsgajgjgmc(DictionaryCacheHellper.getOrganizationOrgNameByCode(syrkImportBean.getDjdwdm().substring(0, 6)+ "000000"));
			rkBean.getCzrkBean().setSspcsdm(syrkImportBean.getDjdwdm().substring(0, 8) + "0000");
			rkBean.getCzrkBean().setSspcsmc(DictionaryCacheHellper.getOrganizationOrgNameByCode(syrkImportBean.getDjdwdm().substring(0, 8)+ "0000"));
			
			rkBean.getCzrkBean().setZrdwdm(syrkImportBean.getDjdwdm());
			rkBean.getCzrkBean().setZrdwmc(syrkImportBean.getDjdwmc());
			rkBean.getCzrkBean().setZrmjjh(syrkImportBean.getDjrjh());
			rkBean.getCzrkBean().setZrmjxm(syrkImportBean.getDjrxm());
			rkBean.getCzrkBean().setBz(syrkImportBean.getBz());
		}
		else if (CommonFinalParams.RYLB_LDRK.equals(rkBean.getRylb()))
		{
			SystemDictionaryBean dicBean = DictionaryCacheHellper.getSystemDictionaryBeanByZdlbAndDm("ZDY_LDRK_YHZGX", syrkImportBean.getYhzgxdm());
			if (dicBean != null)
			{
				rkBean.getLdrkBean().setYhzgx(syrkImportBean.getYhzgxdm());
			}
			else
			{
				//默认其他
				rkBean.getLdrkBean().setYhzgx("99");
			}
			
			
			rkBean.getLdrkBean().setZzcs(syrkImportBean.getJzcsdm());
			if (syrkImportBean.getJzsydm().length() == 2)
			{
				rkBean.getLdrkBean().setZzsy(syrkImportBean.getJzsydm());
			}
			else
			{
				rkBean.getLdrkBean().setZzsy("00");
			}
			rkBean.getLdrkBean().setLbdrq(syrkImportBean.getJzsj());
			rkBean.getLdrkBean().setNjzqx(syrkImportBean.getNjzqxdm());
			rkBean.getLdrkBean().setHdqk("1");
			rkBean.getLdrkBean().setBz(syrkImportBean.getBz());
			
			rkBean.getLdrkBean().setDjdwdm(syrkImportBean.getDjdwdm());
			rkBean.getLdrkBean().setDjdwmc(syrkImportBean.getDjdwmc());
			rkBean.getLdrkBean().setDjrsfzh(syrkImportBean.getDjrsfzh());
			rkBean.getLdrkBean().setDjrxm(syrkImportBean.getDjrxm());
			
			rkBean.getLdrkBean().setCzdwdm(syrkImportBean.getDjdwdm());
			rkBean.getLdrkBean().setCzdwmc(syrkImportBean.getDjdwmc());
			rkBean.getLdrkBean().setCzrjh(syrkImportBean.getDjrjh());
			rkBean.getLdrkBean().setCzrsfzh(syrkImportBean.getDjrsfzh());
			rkBean.getLdrkBean().setCzrxm(syrkImportBean.getDjrxm());
			rkBean.getLdrkBean().setCzbs("2");
			
			rkBean.getLdrkBean().setZrdwdm(syrkImportBean.getDjdwdm());
			rkBean.getLdrkBean().setZrdwmc(syrkImportBean.getDjdwmc());
			rkBean.getLdrkBean().setZrmjjh(syrkImportBean.getDjrjh());
			rkBean.getLdrkBean().setZrmjxm(syrkImportBean.getDjrxm());
		}
		else if (CommonFinalParams.RYLB_JZRK.equals(rkBean.getRylb()))
		{
			SystemDictionaryBean dicBean = DictionaryCacheHellper.getSystemDictionaryBeanByZdlbAndDm("YHZGL", syrkImportBean.getYhzgxdm());
			if (dicBean != null)
			{
				rkBean.getJzrkBean().setYhzgy(syrkImportBean.getYhzgxdm());
			}
			else
			{
				//默认其他非亲属关系
				rkBean.getJzrkBean().setYhzgy("290");
			}
			rkBean.getJzrkBean().setJzsj(syrkImportBean.getJzsj());
			
			dicBean = DictionaryCacheHellper.getSystemDictionaryBeanByZdlbAndDm("ZDY_JZYY", syrkImportBean.getYhzgxdm());
			if (dicBean != null)
			{
				rkBean.getJzrkBean().setJzyy(syrkImportBean.getJzsydm());
			}
			else
			{
				rkBean.getJzrkBean().setJzyy("900");
			}
			
			rkBean.getJzrkBean().setBz(syrkImportBean.getBz());
			
			rkBean.getJzrkBean().setDjdwdm(syrkImportBean.getDjdwdm());
			rkBean.getJzrkBean().setDjdwmc(syrkImportBean.getDjdwmc());
			rkBean.getJzrkBean().setDjrsfzh(syrkImportBean.getDjrsfzh());
			rkBean.getJzrkBean().setDjrxm(syrkImportBean.getDjrxm());
			
			rkBean.getJzrkBean().setCzdwdm(syrkImportBean.getDjdwdm());
			rkBean.getJzrkBean().setCzdwmc(syrkImportBean.getDjdwmc());
			rkBean.getJzrkBean().setCzrjh(syrkImportBean.getDjrjh());
			rkBean.getJzrkBean().setCzrsfzh(syrkImportBean.getDjrsfzh());
			rkBean.getJzrkBean().setCzrxm(syrkImportBean.getDjrxm());
			rkBean.getJzrkBean().setCzbs("2");
			
			rkBean.getJzrkBean().setZrdwdm(syrkImportBean.getDjdwdm());
			rkBean.getJzrkBean().setZrdwmc(syrkImportBean.getDjdwmc());
			rkBean.getJzrkBean().setZrmjjh(syrkImportBean.getDjrjh());
			rkBean.getJzrkBean().setZrmjxm(syrkImportBean.getDjrxm());
		}
		else if (CommonFinalParams.RYLB_WLHRK.equals(rkBean.getRylb()))
		{
			rkBean.getWlhrkBean().setCzjzl("10");
			rkBean.getWlhrkBean().setCzjhm(syrkImportBean.getSfzh());
			rkBean.getWlhrkBean().setWlhqssj(syrkImportBean.getJzsj());
			rkBean.getWlhrkBean().setBz(syrkImportBean.getBz()); 
			
			rkBean.getWlhrkBean().setDjdwdm(syrkImportBean.getDjdwdm());
			rkBean.getWlhrkBean().setDjdwmc(syrkImportBean.getDjdwmc());
			rkBean.getWlhrkBean().setDjrsfzh(syrkImportBean.getDjrsfzh());
			rkBean.getWlhrkBean().setDjrxm(syrkImportBean.getDjrxm());
			
			rkBean.getWlhrkBean().setCzdwdm(syrkImportBean.getDjdwdm());
			rkBean.getWlhrkBean().setCzdwmc(syrkImportBean.getDjdwmc());
			rkBean.getWlhrkBean().setCzrjh(syrkImportBean.getDjrjh());
			rkBean.getWlhrkBean().setCzrsfzh(syrkImportBean.getDjrsfzh());
			rkBean.getWlhrkBean().setCzrxm(syrkImportBean.getDjrxm());
			rkBean.getWlhrkBean().setCzbs("2");
			
			rkBean.getWlhrkBean().setSsgajgjgdm(syrkImportBean.getDjdwdm().substring(0, 6)+ "000000");
			rkBean.getWlhrkBean().setSsgajgjgmc(DictionaryCacheHellper.getOrganizationOrgNameByCode(syrkImportBean.getDjdwdm().substring(0, 6)+ "000000"));
			rkBean.getWlhrkBean().setSspcsdm(syrkImportBean.getDjdwdm().substring(0, 8) + "0000");
			rkBean.getWlhrkBean().setSspcsmc(DictionaryCacheHellper.getOrganizationOrgNameByCode(syrkImportBean.getDjdwdm().substring(0, 8)+ "0000"));
			
			rkBean.getWlhrkBean().setZrdwdm(syrkImportBean.getDjdwdm());
			rkBean.getWlhrkBean().setZrdwmc(syrkImportBean.getDjdwmc());
			rkBean.getWlhrkBean().setZrmjjh(syrkImportBean.getDjrjh());
			rkBean.getWlhrkBean().setZrmjxm(syrkImportBean.getDjrxm());
		}
	}
	
	private List<String> validateSyrkImportBean(SyrkImportBean syrkImportBean)
	{
		List<String> errorlist = new ArrayList<String>();
		if (ValidateHelper.isEmptyString(syrkImportBean.getSfzh()))
		{
			errorlist.add("身份证号码不能为空");
		}
		else if (!IDCardSfzhHelper.isIdcard(syrkImportBean.getSfzh())) 
		{
			errorlist.add("身份证号码格式不正确");
		}
		
		if (ValidateHelper.isEmptyString(syrkImportBean.getXm()))
		{
			errorlist.add("姓名不能为空");
		}
		if (ValidateHelper.isEmptyString(syrkImportBean.getLxdh()))
		{
			errorlist.add("联系电话不能为空");
		}
		if (ValidateHelper.isEmptyString(syrkImportBean.getJzsj()))
		{
			errorlist.add("居住时间不能为空");
		}
		if (ValidateHelper.isEmptyString(syrkImportBean.getJzsy()))
		{
			errorlist.add("居住事由不能为空");
		}
		else
		{
			String[] jzsys = syrkImportBean.getJzsy().split("-");
			if (jzsys.length != 2)
			{
				errorlist.add("居住事由格式不正确");
			}
			else
			{
				syrkImportBean.setJzsydm(jzsys[0]);
			}
		}
		if (ValidateHelper.isEmptyString(syrkImportBean.getJzcs()))
		{
			errorlist.add("居住处所不能为空");
		}
		else
		{
			String[] jzcss = syrkImportBean.getJzcs().split("-");
			if (jzcss.length != 2)
			{
				errorlist.add("居住处所格式不正确");
			}
			else
			{
				syrkImportBean.setJzcsdm(jzcss[0]);
			}
		}
		
		if (ValidateHelper.isEmptyString(syrkImportBean.getYhzgx()))
		{
			errorlist.add("与户主关系不能为空");
		}
		else
		{
			String[] yhzgxs = syrkImportBean.getYhzgx().split("-");
			if (yhzgxs.length != 2)
			{
				errorlist.add("与户主关系格式不正确");
			}
			else
			{
				syrkImportBean.setYhzgxdm(yhzgxs[0]);
			}
		}
		
		if (ValidateHelper.isEmptyString(syrkImportBean.getNjzqx()))
		{
			errorlist.add("拟居住期限不能为空");
		}
		else
		{
			String[] njzqxs = syrkImportBean.getNjzqx().split("-");
			if (njzqxs.length != 2)
			{
				errorlist.add("拟居住期限格式不正确");
			}
			else
			{
				syrkImportBean.setNjzqxdm(njzqxs[0]);
			}
		}
		
		return errorlist;
	}
	
	private void queryLoadCzrkInfo(RkxxBean rkBean, SyrkImportBean syrkImportBean) throws Exception
	{
		//查询人口基本信息 先查本地再查远程
		RkJbxxBean jbxxBean = rkService.queryRkJbxxBeanBySfzh(syrkImportBean.getSfzh());
		//RkJbxxBean jbxxBean = null;
		if (jbxxBean == null)
		{
			CzrkxxBean czrkInfo = rkService.queryCzrkInfoStBeanBySfzhAndUserInfo(syrkImportBean.getSfzh(),syrkImportBean.getDjrsfzh(), syrkImportBean.getDjrxm(), syrkImportBean.getDjdwdm());
			if (czrkInfo != null)
			{
				rkBean.setJbxxBean(czrkInfo);
				rkBean.setCzrkBean(czrkInfo);
			}
			else
			{
				rkBean.getJbxxBean().setSfzh(syrkImportBean.getSfzh());
			}
		}
		else
		{
			//st 远程 库 获取最新的基本信息
			CzrkxxBean stczrkInfo = rkService.queryCzrkInfoStBeanBySfzhAndUserInfo(syrkImportBean.getSfzh(),syrkImportBean.getDjrsfzh(), syrkImportBean.getDjrxm(), syrkImportBean.getDjdwdm());
			//转化可变属性
			rkService.converCzrkInfoToRkJbxx(stczrkInfo, jbxxBean);
			rkBean.setJbxxBean(jbxxBean);
			//获取本地存在的常住人口信息
			CzrkxxBean bdczrkInfo = rkService.queryCzrkxxBeanByFwidAndSfzh(syrkImportBean.getSfzh(), syrkImportBean.getFwid());
			if (bdczrkInfo != null && stczrkInfo != null)
			{
				stczrkInfo.setCzrkbh(bdczrkInfo.getCzrkbh());
				stczrkInfo.setXzzqh(bdczrkInfo.getXzzqh());
				stczrkInfo.setZzxz(bdczrkInfo.getZzxz());
				
				stczrkInfo.setQtzzssxq(bdczrkInfo.getQtzzssxq());
				stczrkInfo.setQtzzxz(bdczrkInfo.getQtzzxz());
				stczrkInfo.setBz(bdczrkInfo.getBz());
			}
			rkBean.setCzrkBean(stczrkInfo);
		}
	}
	
	private void queryLoadLdrkInfo(RkxxBean rkBean, SyrkImportBean syrkImportBean) throws Exception
	{
		//查询人口基本信息 先查本地再查远程
		RkJbxxBean jbxxBean = rkService.queryRkJbxxBeanBySfzh(syrkImportBean.getSfzh());
		if (jbxxBean == null)
		{
			CzrkxxBean czrkInfo = rkService.queryCzrkInfoStBeanBySfzhAndUserInfo(syrkImportBean.getSfzh(),syrkImportBean.getDjrsfzh(), syrkImportBean.getDjrxm(), syrkImportBean.getDjdwdm());
			if (czrkInfo != null)
			{
				rkBean.setJbxxBean(czrkInfo);
			}
			else
			{
				rkBean.getJbxxBean().setSfzh(syrkImportBean.getSfzh());
			}
		}
		else
		{
			CzrkxxBean czrkInfo = rkService.queryCzrkInfoStBeanBySfzhAndUserInfo(syrkImportBean.getSfzh(),syrkImportBean.getDjrsfzh(), syrkImportBean.getDjrxm(), syrkImportBean.getDjdwdm());
			//转化可变属性
			rkService.converCzrkInfoToRkJbxx(czrkInfo, jbxxBean);
			rkBean.setJbxxBean(jbxxBean);
		}
		
		LdrkxxBean ldrkBean = rkService.queryLdrkxxBeanBySfzhAndFwid(syrkImportBean.getSfzh(), syrkImportBean.getFwid());
		if (ldrkBean != null)
		{
			rkBean.setLdrkBean(ldrkBean);
		}
		 
	}
	
	public void queryLoadJzrkInfo(RkxxBean rkBean, SyrkImportBean syrkImportBean) throws Exception
	{
		//查询人口基本信息 先查本地再查远程
		RkJbxxBean jbxxBean = rkService.queryRkJbxxBeanBySfzh(syrkImportBean.getSfzh());
		if (jbxxBean == null)
		{
			CzrkxxBean czrkInfo = rkService.queryCzrkInfoStBeanBySfzhAndUserInfo(syrkImportBean.getSfzh(),syrkImportBean.getDjrsfzh(), syrkImportBean.getDjrxm(), syrkImportBean.getDjdwdm());
			if (czrkInfo != null)
			{
				rkBean.setJbxxBean(czrkInfo);
			}
			else
			{
				rkBean.getJbxxBean().setSfzh(syrkImportBean.getSfzh());
			}
		}
		else
		{
			CzrkxxBean czrkInfo = rkService.queryCzrkInfoStBeanBySfzhAndUserInfo(syrkImportBean.getSfzh(),syrkImportBean.getDjrsfzh(), syrkImportBean.getDjrxm(), syrkImportBean.getDjdwdm());
			//转化可变属性
			rkService.converCzrkInfoToRkJbxx(czrkInfo, jbxxBean);
			rkBean.setJbxxBean(jbxxBean);
		}
		JzrkxxBean jzrkBean = rkService.queryJzrkxxBeanBySfzhAndFwid(syrkImportBean.getSfzh(), syrkImportBean.getFwid());
		if (jzrkBean != null)
		{
			rkBean.setJzrkBean(jzrkBean);
		}
	}
	
	public void queryLoadWlhrkInfo(RkxxBean rkBean, SyrkImportBean syrkImportBean) throws Exception
	{
		//查询人口基本信息 先查本地再查远程
		RkJbxxBean jbxxBean = rkService.queryRkJbxxBeanBySfzh(syrkImportBean.getSfzh());
		if (jbxxBean == null)
		{
			CzrkxxBean czrkInfo = rkService.queryCzrkInfoStBeanBySfzhAndUserInfo(syrkImportBean.getSfzh(),syrkImportBean.getDjrsfzh(), syrkImportBean.getDjrxm(), syrkImportBean.getDjdwdm());
			if (czrkInfo != null)
			{
				rkBean.setJbxxBean(czrkInfo);
			}
			else
			{
				rkBean.getJbxxBean().setSfzh(syrkImportBean.getSfzh());
			}
		}
		else
		{
			rkBean.setJbxxBean(jbxxBean);
		}
		RkwlczhkBean wlhrkBean = rkService.queryWlhrkxxBeanBySfzhAndFwid(syrkImportBean.getSfzh(), syrkImportBean.getFwid());
		if (wlhrkBean != null)
		{
			rkBean.setWlhrkBean(wlhrkBean);
		}
		
	}
	
	
	/**
	 * 查询需要导入处理的实有人口
	 * @return
	 * @date Jan 10, 2015 2:29:09 PM
	 */
	private List<SyrkImportBean> querySyrkImportBeans()
	{
		TransactionManager tm = null;
		try
		{
			tm = new TransactionManager();
			tm.begin();
			//查询并锁定要执行的数据防止重复执行
			List<SyrkImportBean> resultlist = executor.queryListWithDBName(SyrkImportBean.class, CommonConstant.DBNAME_SQJW, "querySyrkImportBeans");
			if (ValidateHelper.isNotEmptyCollection(resultlist))
			{
				executor.updateBeans(CommonConstant.DBNAME_SQJW, "updateLockBs", resultlist);
			}
			tm.commit();
			return resultlist;
		}
		catch(Exception e)
		{
			try
			{
				tm.rollback();
			}
			catch (RollbackException e1)
			{
			}
		}
		return null;
	}
	
	/**
	 * 更新实有人口需要处理对象的错误及执行状态信息
	 * @param bh
	 * @param field
	 * @param value
	 * @param errorInfo
	 * @date Jan 10, 2015 2:29:06 PM
	 */
	private void updateSyrkImportBean(String bh, String field, String value, String errorInfo,String rylb, String rkid)
	{
		try
		{
			SQLParams params = new SQLParams();
			params.addSQLParam("bh", bh, SQLParams.STRING);
			params.addSQLParam("field", field, SQLParams.STRING);
			params.addSQLParam("value", value, SQLParams.STRING);
			params.addSQLParam("errorInfo", errorInfo, SQLParams.STRING);
			params.addSQLParam("rylb", rylb, SQLParams.STRING);
			params.addSQLParam("rkid", rkid, SQLParams.STRING);
			executor.updateBean(CommonConstant.DBNAME_SQJW, "updateSyrkImportBean", params);
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
	}
	
	private void updateSyrkbWwUserInfo(String wwusername, String wwusersfzh, String rkid, String rylb)
	{
		try
		{
			SQLParams params = new SQLParams();
			params.addSQLParam("rkid", rkid, SQLParams.STRING);
			params.addSQLParam("rylb", rylb, SQLParams.STRING);
			params.addSQLParam("wwusername", wwusername, SQLParams.STRING);
			params.addSQLParam("wwusersfzh", wwusersfzh, SQLParams.STRING);
			executor.updateBean(CommonConstant.DBNAME_SQJW, "updateSyrkbWwUserInfo", params);
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
	}
}
