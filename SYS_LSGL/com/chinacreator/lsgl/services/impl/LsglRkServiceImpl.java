package com.chinacreator.lsgl.services.impl;

import java.io.File;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.transaction.RollbackException;

import org.apache.commons.codec.binary.Base64;

import com.chinacreator.common.bean.LoginInfo;
import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.cps.bean.RkJbxxBean;
import com.chinacreator.common.cps.business.OrgUserbusiness;
import com.chinacreator.common.cps.constants.CommonFinalParams;
import com.chinacreator.common.cps.helper.ChineseSpellingHelper;
import com.chinacreator.common.cps.helper.CommonSequenceHelper;
import com.chinacreator.common.helper.ActionContextHelper;
import com.chinacreator.common.helper.CommonDBBaseHelper;
import com.chinacreator.common.helper.DateTimeHelper;
import com.chinacreator.common.helper.DictionaryCacheHellper;
import com.chinacreator.common.helper.ValidateHelper;
import com.chinacreator.lsgl.bean.CzrkxxBean;
import com.chinacreator.lsgl.bean.CzrxxBean;
import com.chinacreator.lsgl.bean.FwJbxxBean;
import com.chinacreator.lsgl.bean.JwrkxxBean;
import com.chinacreator.lsgl.bean.JzrkxxBean;
import com.chinacreator.lsgl.bean.LdrkYqzxBean;
import com.chinacreator.lsgl.bean.LdrkxxBean;
import com.chinacreator.lsgl.bean.RkDzxxBean;
import com.chinacreator.lsgl.bean.RkJhsyBean;
import com.chinacreator.lsgl.bean.RkfwglBean;
import com.chinacreator.lsgl.bean.RkgxrxxBean;
import com.chinacreator.lsgl.bean.RklxfsxxBean;
import com.chinacreator.lsgl.bean.RktmtzxxBean;
import com.chinacreator.lsgl.bean.RkwlczhkBean;
import com.chinacreator.lsgl.bean.RkxxBean;
import com.chinacreator.lsgl.bean.RkzpxxBean;
import com.chinacreator.lsgl.dao.LsglFwJbxxDao;
import com.chinacreator.lsgl.dao.LsglRkJbxxDao;
import com.chinacreator.lsgl.dao.impl.LsglFwJbxxDaoImpl;
import com.chinacreator.lsgl.dao.impl.LsglRkJbxxDaoImpl;
import com.chinacreator.lsgl.query.RkQueryBean;
import com.chinacreator.lsgl.services.LsglCzfwCzxxService;
import com.chinacreator.lsgl.services.LsglRkService;
import com.chinacreator.remote.business.RemoteRequestService;
import com.frameworkset.orm.transaction.TransactionException;
import com.frameworkset.orm.transaction.TransactionManager;

/**
 * 实有人口操作服务实现类
 * 
 * @filename LsglRkJbxxService.java
 * @author mingchun.xiong
 * @date 2013-8-19
 *
 */
public class LsglRkServiceImpl implements LsglRkService
{
	private LsglFwJbxxDao fwJbxxDao;
	private LsglRkJbxxDao rkDao;
	private RemoteRequestService remoteService;
	
	public LsglRkServiceImpl()
	{
		rkDao = new LsglRkJbxxDaoImpl();
		fwJbxxDao = new LsglFwJbxxDaoImpl();
		remoteService = new RemoteRequestService();
	}
	
	public PageResultInfo<? extends RkJbxxBean> queryRkPageResultInfo(PageInfo pageInfo, RkQueryBean queryBean) throws Exception
	{
		PageResultInfo<? extends RkJbxxBean> pageResult = null;
		// 常驻人口查询
		if ("1".equals(queryBean.getRylb()))
		{
			pageResult = rkDao.queryCzrkxxPageResult(pageInfo, queryBean);
		}
		// 查询流动人口
		else if ("2".equals(queryBean.getRylb()))
		{
			pageResult = rkDao.queryLdrkxxPageResult(pageInfo, queryBean);
		}
		// 未落常住户口
		else if ("3".equals(queryBean.getRylb()))
		{
			pageResult = rkDao.queryWlczhkPageResult(pageInfo, queryBean);
		}
		// 境外人员
		else if ("4".equals(queryBean.getRylb()))
		{
			pageResult = rkDao.queryJwrkPageResult(pageInfo, queryBean);
		}
		// 寄住人口
		else if ("5".equals(queryBean.getRylb()))
		{
			pageResult = rkDao.queryJzrkPageResult(pageInfo, queryBean);
		}
		//执行人员查询
		else if ("select".equals(queryBean.getRylb()))
		{
			pageResult = rkDao.querySyrkListBeanByCondition(queryBean, pageInfo);
		}
		//查询全部
		else
		{
			pageResult = rkDao.querySyrkBeanByConditionForPageResultInfo(queryBean, pageInfo);
		}
		return pageResult;
	}
	
	/**
	 * 查询人口信息对象通过人员编号
	 * @param rylb 人员类别
	 * @param sfzh 人员编号
	 * @param msgtype 消息类型 查询的是数据 0：全部  ,1:基本信息  2:历史信息 ，3：照片信息  4:社会信息 5:体貌特种信息 6：联系方式
	 * @return
	 * @throws Exception
	 * @date 2013-8-19 上午11:07:28
	 */
	public RkxxBean queryRkxxBeanBySfzh(String rylb, String sfzh, String msgtype) throws Exception
	{
		RkxxBean rkBean = new RkxxBean();
		rkBean.setRylb(rylb);
		// 查询人口基本信息
		RkJbxxBean jbxxBean = rkDao.queryRkJbxxBeanBySfzh(sfzh);
		if (jbxxBean != null)
		{
			rkBean.setJbxxBean(jbxxBean);
			
			// 查询当前人员的居住房屋
			RkfwglBean rkfwglBean = rkDao.getRkfwBean(jbxxBean.getRybh());
			if (rkfwglBean != null)
			{
				rkBean.setRkfwglBean(rkfwglBean);
			}
			
			// 查询的是人口的基本信息1
			if (CommonFinalParams.MSGTYPE_ALL.equals(msgtype) || CommonFinalParams.MSGTYPE_JBXX.equals(msgtype))
			{
				queryRkJbxxData(rkBean, jbxxBean.getRybh());
			}
			
			// 历史记录2
			if (CommonFinalParams.MSGTYPE_ALL.equals(msgtype) || CommonFinalParams.MSGTYPE_HIS.equals(msgtype))
			{
				queryRklsjlBeans(rkBean, jbxxBean.getRybh());
			}
			//查询照片3
			if (CommonFinalParams.MSGTYPE_ALL.equals(msgtype) || CommonFinalParams.MSGTYPE_ZPXX.equals(msgtype))
			{
				// 人口照片信息
				List<RkzpxxBean> zpxxBeans = rkDao.queryRkzpxxBeansByRybh(jbxxBean.getRybh());
				rkBean.setZpxxBeans(zpxxBeans);
			}
			
			// 社会信息
			if(CommonFinalParams.MSGTYPE_ALL.equals(msgtype) || CommonFinalParams.MSGTYPE_SHXX.equals(msgtype))
			{
				List<RkgxrxxBean> gxrBeans = rkDao.queryRkgxrBeansByRybh(jbxxBean.getRybh());
				rkBean.setGxrBeans(gxrBeans);
			}
			
			// 体貌特征信息
			if(CommonFinalParams.MSGTYPE_ALL.equals(msgtype) || CommonFinalParams.MSGTYPE_TMTZ.equals(msgtype))
			{
				RktmtzxxBean tmtzBean = rkDao.queryRktmtzBeanByRybh(jbxxBean.getRybh());
				rkBean.setTmtzBean(tmtzBean);
			}
			
			// 联系方式信息
			if(CommonFinalParams.MSGTYPE_ALL.equals(msgtype) || CommonFinalParams.MSGTYPE_LXFS.equals(msgtype))
			{
				rkBean.setLxfsBean(rkDao.queryRklxfsBeansByRybh(jbxxBean.getRybh()));
			}
			
		}
		else
		{
			rkBean.getJbxxBean().setSfzh(sfzh);
		}
		return rkBean;
	}
	
	/**
	 * 查询当前人口信息对象通过人员编号
	 * @param rylb 人员类别
	 * @param rybh 人员编号
	 * @param rkid 人口ID 常住人口ID， 流动人口ID等
	* @param msgtype 消息类型 查询的是数据 0：全部  ,1:基本信息  2:历史信息 ，3：照片信息  4:社会信息 5:体貌特种信息 6：联系方式
	 * @return
	 * @throws Exception
	 * @date 2013-8-19 上午11:07:28
	 */
	public RkxxBean queryRkxxBeanByRybh(String rylb, String rybh, String msgtype, String operType) throws Exception
	{
		RkxxBean rkBean = new RkxxBean();
		rkBean.setRylb(rylb);
		// 查询人口基本信息
		RkJbxxBean jbxxBean = rkDao.queryRkJbxxBeanByRybh(rybh);
		if (jbxxBean != null)
		{
			rkBean.setJbxxBean(jbxxBean);
			
			// 查询当前人员的居住房屋
			RkfwglBean rkfwglBean = rkDao.getRkfwBean(rybh);
			if (rkfwglBean != null)
			{
				rkBean.setRkfwglBean(rkfwglBean);
			}
			
			// 查询的是人口的基本信息1
			if (CommonFinalParams.MSGTYPE_ALL.equals(msgtype) || CommonFinalParams.MSGTYPE_JBXX.equals(msgtype))
			{
				//修改，明细则查询
				if (CommonConstant.OPERTYPE_UPDATE.equals(operType) || CommonConstant.OPERTYPE_DETAIL.equals(operType)||CommonConstant.OPERTYPE_RYDAXX.equals(operType))
				{
					queryRkJbxxData(rkBean, rybh);
				}
			}
			// 历史记录2
			if (CommonFinalParams.MSGTYPE_ALL.equals(msgtype) || CommonFinalParams.MSGTYPE_HIS.equals(msgtype))
			{
				queryRklsjlBeans(rkBean, rybh);
			}
			//查询照片3
			if (CommonFinalParams.MSGTYPE_ALL.equals(msgtype) || CommonFinalParams.MSGTYPE_ZPXX.equals(msgtype))
			{
				// 人口照片信息
				List<RkzpxxBean> zpxxBeans = rkDao.queryRkzpxxBeansByRybh(rybh);
				rkBean.setZpxxBeans(zpxxBeans);
			}
			
			// 社会信息
			if(CommonFinalParams.MSGTYPE_ALL.equals(msgtype) || CommonFinalParams.MSGTYPE_SHXX.equals(msgtype))
			{
				List<RkgxrxxBean> gxrBeans = rkDao.queryRkgxrBeansByRybh(rybh);
				rkBean.setGxrBeans(gxrBeans);
			}
			
			// 体貌特征信息
			if(CommonFinalParams.MSGTYPE_ALL.equals(msgtype) || CommonFinalParams.MSGTYPE_TMTZ.equals(msgtype))
			{
				RktmtzxxBean tmtzBean = rkDao.queryRktmtzBeanByRybh(rybh);
				rkBean.setTmtzBean(tmtzBean);
			}
			
			// 联系方式信息
			if(CommonFinalParams.MSGTYPE_ALL.equals(msgtype) || CommonFinalParams.MSGTYPE_LXFS.equals(msgtype))
			{
				rkBean.setLxfsBean(rkDao.queryRklxfsBeansByRybh(rybh));
			}
			
		}
		return rkBean;
	}
	
	/**
	 * 查询人口信息历史记录
	 * @param rkBean
	 * @param rybh
	 * @return
	 * @date 2013-9-2 下午04:21:57
	 */
	public RkxxBean queryRklsjlBeans(RkxxBean rkBean, String rybh) throws Exception
	{
		String rylb = rkBean.getRylb();
		// 常驻人口查询
		if (CommonFinalParams.RYLB_CZRK.equals(rylb))
		{
			List<CzrkxxBean> czrkBeans = rkDao.queryCzrkBeansByRybh(rybh);
			rkBean.setCzrkBeans(czrkBeans);
		}
		// 查询流动人口
		else if (CommonFinalParams.RYLB_LDRK.equals(rylb))
		{
			List<LdrkxxBean> ldrkBeans = rkDao.queryLdrkZzxxByRybh(rybh);
			rkBean.setLdrkzzxxBeans(ldrkBeans);
		}
		// 未落户常住人口
		else if (CommonFinalParams.RYLB_WLHRK.equals(rylb))
		{
			List<RkwlczhkBean> wlczBeans = rkDao.queryWlhczrkByRybh(rybh);
			rkBean.setWlhrkBeans(wlczBeans);
		}
		// 境外人员
		else if (CommonFinalParams.RYLB_JWRK.equals(rylb))
		{
			List<JwrkxxBean>  jwrkBeans = rkDao.queryJwrkJzxxByRybh(rybh);
			rkBean.setJwrkjzxxBeans(jwrkBeans);
		}
		// 寄住人口
		else if (CommonFinalParams.RYLB_JZRK.equals(rylb))
		{
			List<JzrkxxBean> jzrkBeans = rkDao.queryJzrkJzxxByRybh(rybh);
			rkBean.setJzrkjzxxBeans(jzrkBeans);
		}
		return rkBean;
	}
	
	/**
	 * 查询基本数据信息
	 * @param rkBean
	 * @param rkid
	 * @return
	 * @throws Exception
	 * @date 2013-8-30 下午12:43:33
	 */
	protected RkxxBean queryRkJbxxData(RkxxBean rkBean, String rybh) throws Exception
	{
		String rylb = rkBean.getRylb();
		// 常驻人口查询
		if (CommonFinalParams.RYLB_CZRK.equals(rylb))
		{
			CzrkxxBean czrkBean = rkDao.queryDqCzrkxxBeanByRybh(rybh);
			if (czrkBean != null)
			{
				rkBean.setCzrkBean(czrkBean);
				rkBean.getFwxxBean().setFwid(czrkBean.getFwid());
				rkBean.getFwxxBean().setDzid(czrkBean.getDzid());
				rkBean.getFwxxBean().setFwmc(czrkBean.getFwmc());
			}
		}
		// 查询流动人口
		else if (CommonFinalParams.RYLB_LDRK.equals(rylb))
		{
			LdrkxxBean ldrkBean = rkDao.queryLdrkBeanByRybhAndYxzt(rybh);
			if (ldrkBean != null)
			{
				rkBean.setLdrkBean(ldrkBean);
				rkBean.getFwxxBean().setFwid(ldrkBean.getFwid());
				rkBean.getFwxxBean().setDzid(ldrkBean.getDzid());
				rkBean.getFwxxBean().setFwmc(ldrkBean.getFwmc());
			}
		}
		// 未落户常住人口
		else if (CommonFinalParams.RYLB_WLHRK.equals(rylb))
		{
			RkwlczhkBean wlhBean =  rkDao.queryWlhczrkBeanByRybh(rybh);
			if (wlhBean != null)
			{
				rkBean.setWlhrkBean(wlhBean);
				rkBean.getFwxxBean().setFwid(wlhBean.getFwid());
				rkBean.getFwxxBean().setDzid(wlhBean.getDzid());
				rkBean.getFwxxBean().setFwmc(wlhBean.getFwmc());
			}
		}
		// 境外人员
		else if (CommonFinalParams.RYLB_JWRK.equals(rylb))
		{
			JwrkxxBean jwrkBean = rkDao.queryJwrkBeanByRybh(rybh);
			if (jwrkBean != null)
			{
				rkBean.setJwrkBean(jwrkBean);
				rkBean.getFwxxBean().setFwid(jwrkBean.getFwid());
				rkBean.getFwxxBean().setDzid(jwrkBean.getDzid());
				rkBean.getFwxxBean().setFwmc(jwrkBean.getFwmc());
			}
		}
		// 寄住人口
		else if (CommonFinalParams.RYLB_JZRK.equals(rylb))
		{
			JzrkxxBean jzrkBean = rkDao.queryJzrkBeanByRybh(rybh);
			if (jzrkBean != null)
			{
				rkBean.setJzrkBean(jzrkBean);
				rkBean.getFwxxBean().setFwid(jzrkBean.getFwid());
				rkBean.getFwxxBean().setDzid(jzrkBean.getDzid());
				rkBean.getFwxxBean().setFwmc(jzrkBean.getFwmc());
			}
		}
		return rkBean;
	}
	
	protected void setDzxxToFwBean(RkxxBean rkBean) throws Exception
	{
		if (rkBean.getRkfwglBean() != null)
		{
			FwJbxxBean fwJbxxBean = fwJbxxDao.queryFwJbxxBeanByFwid(rkBean.getRkfwglBean().getFwid(), "fwinfo");
			rkBean.setFwxxBean(fwJbxxBean);
		}
		
	}
	/**
	 * 查询基本数据信息
	 * @param rkBean
	 * @param rkid
	 * @return
	 * @throws Exception
	 * @date 2013-8-30 下午12:43:33
	 */
	protected RkxxBean queryRkJbxxDataByRkid(RkxxBean rkBean, String rybh, String rkid) throws Exception
	{
		String rylb = rkBean.getRylb();
		// 常驻人口查询
		if (CommonFinalParams.RYLB_CZRK.equals(rylb))
		{
			CzrkxxBean czrkBean = rkDao.queryCzrkBeanByCzrkid(rkid);
			if (czrkBean != null)
			{
				rkBean.setCzrkBean(czrkBean);
				rkBean.setRkfwglBean(rkDao.queryFwRkGlBeanByFwrkglid(czrkBean.getRkfwglid()));
			}
		}
		// 查询流动人口
		else if (CommonFinalParams.RYLB_LDRK.equals(rylb))
		{
			LdrkxxBean ldrkBean = rkDao.queryLdrkBeanByLdrkid(rkid);
			if (ldrkBean != null)
			{
				rkBean.setLdrkBean(ldrkBean);
				rkBean.setRkfwglBean(rkDao.queryFwRkGlBeanByFwrkglid(ldrkBean.getRkfwglid()));
			}
		}
		// 未落户常住人口
		else if (CommonFinalParams.RYLB_WLHRK.equals(rylb))
		{
			RkwlczhkBean wlhBean =  rkDao.queryWlhczrkBeanByWlhrkid(rkid);
			if (wlhBean != null)
			{
				rkBean.setWlhrkBean(wlhBean);
				rkBean.setRkfwglBean(rkDao.queryFwRkGlBeanByFwrkglid(wlhBean.getRkfwglid()));
			}
		}
		// 境外人员
		else if (CommonFinalParams.RYLB_JWRK.equals(rylb))
		{
			JwrkxxBean jwrkBean = rkDao.queryJwrkBeanByJwrkid(rkid);
			if (jwrkBean != null)
			{
				rkBean.setJwrkBean(jwrkBean);
				rkBean.setRkfwglBean(rkDao.queryFwRkGlBeanByFwrkglid(jwrkBean.getRkfwglid()));
			}
		}
		// 寄住人口
		else if (CommonFinalParams.RYLB_JZRK.equals(rylb))
		{
			JzrkxxBean jzrkBean = rkDao.queryJzrkBeanByJzrkid(rkid);
			if (jzrkBean != null)
			{
				rkBean.setJzrkBean(jzrkBean);
				rkBean.setRkfwglBean(rkDao.queryFwRkGlBeanByFwrkglid(jzrkBean.getRkfwglid()));
			}
		}
		setDzxxToFwBean(rkBean);
		return rkBean;
	}
	
	/**
	 * 保存人口信息对象
	 * 不做图片保存
	 * @param rkBean
	 * @param msgtype 消息类型 查询的是数据 0：全部  ,1:基本信息  2:历史信息   4:社会信息 5:体貌特种信息 6：联系方式
	 * @return
	 * @throws Exception
	 * @date 2013-8-19 上午11:08:28
	 */
	public RkxxBean saveRkxxBean(RkxxBean rkBean, String msgtype)
			throws Exception
	{
		TransactionManager tm = null;
		try
		{
			tm = new TransactionManager();
			tm.begin();
			//保存人口的基本信息数据，并且保存个性化数据
			if (CommonFinalParams.MSGTYPE_ALL.equals(msgtype) || CommonFinalParams.MSGTYPE_JBXX.equals(msgtype))
			{
				// 保存人口的基本信息
				saveRkJbxxBean(rkBean);
				// 保存人口的基本数据，及个性化数据 如常驻人口的户口信息，流动人口的暂住信息
				saveRkJbxxData(rkBean);
			}
			// 只保存个性化数据
			if (CommonFinalParams.MSGTYPE_HIS.equals(msgtype))
			{
				saveRkJbxxData(rkBean);
			}
			// 社会信息保存
			if (CommonFinalParams.MSGTYPE_ALL.equals(msgtype) || CommonFinalParams.MSGTYPE_SHXX.equals(msgtype))
			{
				saveGxrShxx(rkBean);
			}
			// 体貌特种信息
			if (CommonFinalParams.MSGTYPE_ALL.equals(msgtype) || CommonFinalParams.MSGTYPE_TMTZ.equals(msgtype))
			{
				saveTmtzxx(rkBean);
			}
			// 联系方式
			if (CommonFinalParams.MSGTYPE_ALL.equals(msgtype) || CommonFinalParams.MSGTYPE_LXFS.equals(msgtype))
			{
				saveLxfsxx(rkBean);
			}
			tm.commit();
		}
		catch(Exception e)
		{
			rkBean = null;
			e.printStackTrace();
			tm.rollback();
		}
		return rkBean;
	}

	/**
	 * 保存联系方式信息
	 * @param rkBean
	 * @throws Exception
	 * @date 2013-8-31 下午04:58:01
	 */
	public void saveLxfsxx(RkxxBean rkBean) throws Exception
	{
		LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
		List<RklxfsxxBean> list = rkBean.getLxfsBean();
		String rybh = rkBean.getJbxxBean().getRybh();
		String sfzh = rkBean.getJbxxBean().getSfzh();
		
		for(RklxfsxxBean lxfsBean:list)
		{
			if (ValidateHelper.isNotEmptyString(lxfsBean.getId()))
			{
				lxfsBean.setRybh(rybh);
				lxfsBean.setSfzh(sfzh);
				lxfsBean.setCzbs("2");
				lxfsBean.setCzdwdm(loginInfo.getOrgcode());
				lxfsBean.setCzdwmc(loginInfo.getOrgname());
				lxfsBean.setCzrxm(loginInfo.getRealname());
				lxfsBean.setCzsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss"));
				lxfsBean.setCzrsfzh(loginInfo.getSfzh());
				rkDao.updateLxfsxxBean(lxfsBean);
			}
			else
			{
				String xzdm = DictionaryCacheHellper.getSystemParamenterValueByKey("current.xzdm");
				lxfsBean.setId(xzdm+CommonDBBaseHelper.getSequence(CommonConstant.DBNAME_SQJW, "SEQ_LSGL_LXFSID"));
				lxfsBean.setDjsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss"));
				lxfsBean.setDjdwdm(loginInfo.getOrgcode());
				lxfsBean.setDjdwmc(loginInfo.getOrgname());
				lxfsBean.setDjrxm(loginInfo.getRealname());
				lxfsBean.setDjrsfzh(loginInfo.getSfzh());
				lxfsBean.setCzbs("1");
				lxfsBean.setRybh(rybh);
				lxfsBean.setSfzh(sfzh);
				lxfsBean.setCzdwdm(loginInfo.getOrgcode());
				lxfsBean.setCzdwmc(loginInfo.getOrgname());
				lxfsBean.setCzrxm(loginInfo.getRealname());
				lxfsBean.setCzsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss"));
				lxfsBean.setCzrsfzh(loginInfo.getSfzh());
				rkDao.insertLxfsxxBean(lxfsBean);
			}
		}
	}
	
	/**
	 * 保存体貌特种
	 * @param rkBean
	 * @throws Exception
	 * @date 2013-8-31 下午03:19:43
	 */
	public void saveTmtzxx(RkxxBean rkBean) throws Exception
	{
		LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
		RktmtzxxBean tmtzBean = rkBean.getTmtzBean();
		tmtzBean.setRybh(rkBean.getJbxxBean().getRybh());
		tmtzBean.setSfzh(rkBean.getJbxxBean().getSfzh());
		tmtzBean.setCzdwdm(loginInfo.getOrgcode());
		tmtzBean.setCzdwmc(loginInfo.getOrgname());
		tmtzBean.setCzrxm(loginInfo.getRealname());
		tmtzBean.setCzsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss"));
		tmtzBean.setCzrsfzh(loginInfo.getSfzh());
		if (ValidateHelper.isNotEmptyString(rkBean.getTmtzBean().getId()))
		{
			tmtzBean.setCzbs("2");
			rkDao.updateTmtzxxBean(tmtzBean);
		}
		else
		{
			String xzdm = DictionaryCacheHellper.getSystemParamenterValueByKey("current.xzdm");
			tmtzBean.setId(xzdm+CommonDBBaseHelper.getSequence(CommonConstant.DBNAME_SQJW, "SEQ_LSGL_TMTZID"));
			tmtzBean.setDjsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss"));
			tmtzBean.setDjdwdm(loginInfo.getOrgcode());
			tmtzBean.setDjdwmc(loginInfo.getOrgname());
			tmtzBean.setDjrxm(loginInfo.getRealname());
			tmtzBean.setDjrsfzh(loginInfo.getSfzh());
			tmtzBean.setCzbs("1");
			rkDao.insertTmtzxxBean(tmtzBean);
		}
	}
	
	/**
	 * 保存人口个性化数据
	 * @param rkBean
	 * @throws Exception
	 * @date 2013-8-30 下午12:12:40
	 */
	private void saveRkJbxxData(RkxxBean rkBean) throws Exception
	{
		// 常驻人口保存
		if ("1".equals(rkBean.getRylb()))
		{
			saveCzrkxx(rkBean);
		}
		//流动保存
		else if ("2".equals(rkBean.getRylb()))
		{
			saveLdrkxx(rkBean);
			//保存计划生育信息
			if(ValidateHelper.isEmptyString(rkBean.getJhsyBean().getId())){
				insertRkJhsyBean(rkBean.getJhsyBean());
			}else{
				updateRkJhsyBean(rkBean.getJhsyBean());
			}
		}
		//未落户口
		else if ("3".equals(rkBean.getRylb()))
		{
			saveWlhrkxx(rkBean);
		}
		// 境外人员保存
		else if ("4".equals(rkBean.getRylb()))
		{
			saveJwrkxxBean(rkBean);
		}
		// 寄住人口保存
		else if ("5".equals(rkBean.getRylb()))
		{
			saveJzrkxx(rkBean);
		}
		//zxRkjlByRylbAndRybh(rkBean.getRylb(),rkBean.getJbxxBean().getRybh());
	}
	
	/**
	 * 保存社会关系人信息
	 * @param rkBean
	 * @date 2013-8-30 下午04:47:50
	 */
	public void saveGxrShxx(RkxxBean rkBean) throws Exception
	{
		LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
		rkBean.getGxrBean().setRybh(rkBean.getJbxxBean().getRybh());
		rkBean.getGxrBean().setSfzh(rkBean.getJbxxBean().getSfzh());
		rkBean.getGxrBean().setCzdwdm(loginInfo.getOrgcode());
		rkBean.getGxrBean().setCzdwmc(loginInfo.getOrgname());
		rkBean.getGxrBean().setCzrxm(loginInfo.getRealname());
		rkBean.getGxrBean().setCzsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss"));
		rkBean.getGxrBean().setCzrsfzh(loginInfo.getSfzh());
		// 更新
		if (ValidateHelper.isNotEmptyString(rkBean.getGxrBean().getId()))
		{
			rkBean.getGxrBean().setCzbs("2");	//新增
			rkDao.updateRkgxrxxBean(rkBean.getGxrBean());
		}
		//插入
		else
		{
			String xzdm = DictionaryCacheHellper.getSystemParamenterValueByKey("current.xzdm");
			String id = xzdm + CommonDBBaseHelper.getSequence(CommonConstant.DBNAME_SQJW, "SEQ_LSGL_GXRID");
			rkBean.getGxrBean().setId(id);
			rkBean.getGxrBean().setDjsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss"));
			rkBean.getGxrBean().setDjdwdm(loginInfo.getOrgcode());
			rkBean.getGxrBean().setDjdwmc(loginInfo.getOrgname());
			rkBean.getGxrBean().setDjrxm(loginInfo.getRealname());
			rkBean.getGxrBean().setDjrsfzh(loginInfo.getSfzh());
			rkBean.getGxrBean().setCzbs("1");	//新增
			rkDao.insertRkgxrxxBean(rkBean.getGxrBean());
		}
	}
	
	/**
	 * 保存人口基本信息
	 */
	public void saveRkJbxxBean(final RkxxBean rkBean) throws Exception
	{
		LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
		TransactionManager tm = null;
		try
		{
			tm = new TransactionManager();
			tm.begin();
			RkJbxxBean jbxxBean = rkBean.getJbxxBean();
			ChineseSpellingHelper finder = ChineseSpellingHelper.getInstance();
			finder.setResource(jbxxBean.getXm());
			jbxxBean.setXmpy(finder.getSpelling());
			jbxxBean.setRylb(rkBean.getRylb());
			jbxxBean.setRysx(CommonSequenceHelper.getRysx(jbxxBean.getSfzh(), getRysx(rkBean.getRylb()), "I"));
			jbxxBean.setXzzqh(rkBean.getFwxxBean().getSsxzqh());
			jbxxBean.setXzzxz(rkBean.getFwxxBean().getDzmc());
			jbxxBean.setXzzzrq(rkBean.getFwxxBean().getSszrdwdm());
			jbxxBean.setXzzqhmc(rkBean.getFwxxBean().getSsxzqhmc());
			
			if (loginInfo != null)
			{
				jbxxBean.setCzdwdm(loginInfo.getOrgcode());
				jbxxBean.setCzdwmc(loginInfo.getOrgname());
				jbxxBean.setCzrjh(loginInfo.getUsername());
				jbxxBean.setCzrxm(loginInfo.getRealname());
			}
			
			// 如果人员编号不为空，表示数据库存在人员基本信息 则更新
			if (ValidateHelper.isNotEmptyString(rkBean.getJbxxBean().getRybh()))
			{
				rkDao.updateRkJbxxBean(jbxxBean);
			}
			// 为空则 插入
			else
			{
				String rybh = rkDao.getRybhBySfzh(jbxxBean.getSfzh());
				if (ValidateHelper.isNotEmptyString(rybh))
				{
					jbxxBean.setRybh(rybh);
					rkDao.updateRkJbxxBean(jbxxBean);
				}
				else
				{
					if (loginInfo != null)
					{
						jbxxBean.setRybh(CommonSequenceHelper.getRybh(loginInfo.getOrgcode()));
					}
					else
					{
						jbxxBean.setRybh(CommonSequenceHelper.getRybh(jbxxBean.getCzdwdm()));
					}
					rkDao.insertRkJbxxBean(jbxxBean);
				}
			}
			if (!CommonFinalParams.RYLB_WLHRK.equals(rkBean.getRylb()) && !CommonFinalParams.RYLB_JWRK.equals(rkBean.getRylb()))
			{
				//启动线程保存人口照片信息
				if (loginInfo == null)
				{
					loginInfo = new LoginInfo();
					loginInfo.setSfzh(jbxxBean.getCzrsfzh());
					loginInfo.setUsername(jbxxBean.getCzrjh());
					loginInfo.setRealname(jbxxBean.getCzrxm());
					loginInfo.setOrgcode(jbxxBean.getDjdwdm());
					loginInfo.setOrgname(jbxxBean.getCzdwmc());
				}
				SaveRkZpThead sk = new SaveRkZpThead(rkBean, loginInfo);
				Thread th = new Thread(sk);
				th.start();
			}
			tm.commit();
		}
		catch(Exception e)
		{
			e.printStackTrace();
			try
			{
				tm.rollback();
			}
			catch (RollbackException e1)
			{
			}
			throw new Exception("保存人口基本信息失败.");
		}
	}
	
	public void saveRemoteZpxxTread(RkxxBean rkBean, LoginInfo loginInfo)
	{
		saveRemoteZpxxByLoginInfo(rkBean, loginInfo);
	}
	
	
	/**
	 * 保存远程服务照片
	 */
	public void saveRemoteZpxx(RkxxBean rkBean)
	{
		LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
		saveRemoteZpxxByLoginInfo(rkBean, loginInfo);
	}
	
	/**
	 * 保存人口照片信息
	 * @param rkBean
	 * @param loginInfo
	 * @date Nov 26, 2014 9:17:13 AM
	 */
	public void saveRemoteZpxxByLoginInfo(RkxxBean rkBean, LoginInfo loginInfo)
	{
		try
		{
			int size = rkDao.getRemoteZpCount(rkBean.getJbxxBean().getSfzh());
			if (size == 0)
			{	
				String jpegStr = remoteService.queryXpBySfzhAndUserInfo(rkBean.getJbxxBean().getSfzh(),loginInfo.getSfzh(),loginInfo.getRealname(),loginInfo.getOrgcode());
				if (ValidateHelper.isNotEmptyString(jpegStr))
				{
					RkzpxxBean rkzpBean = new RkzpxxBean();
					String xzdm = DictionaryCacheHellper.getSystemParamenterValueByKey("current.xzdm");
					String zpid = CommonDBBaseHelper.getSequence(CommonConstant.DBNAME_SQJW,"seq_lsg_zpid");
					rkzpBean.setId(xzdm+zpid);
					rkzpBean.setRxfw("01"); //正面照
					rkzpBean.setDjdwdm(loginInfo.getOrgcode());
					rkzpBean.setDjdwmc(loginInfo.getOrgname());
					rkzpBean.setDjrxm(loginInfo.getRealname());
					rkzpBean.setDjrsfzh(loginInfo.getSfzh());
					rkzpBean.setMs("远程服务照片");
					rkzpBean.setRybh(rkBean.getJbxxBean().getRybh());
					rkzpBean.setSfzh(rkBean.getJbxxBean().getSfzh());
					rkzpBean.setYcfwzp("1");
					rkzpBean.setZp(null);
					rkzpBean.setZpbytes(Base64.decodeBase64(jpegStr.getBytes()));
					saveRkzpxxBean(rkzpBean);
				}
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	
	private String getRysx(String rylb)
	{
		String rysx = "";
		//寄住人口
		if("5".equals(rylb))
		{
			rysx = "01";
		}
		return rysx;
	}
	
	/**
	 * 保存寄住人口信息
	 * @param rkBean
	 * @date 2013-9-3 下午02:06:08
	 */
	public void saveJzrkxx(RkxxBean rkBean) throws Exception
	{
		TransactionManager tm = null;
		try
		{
			tm = new TransactionManager();
			tm.begin();
			LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
			JzrkxxBean jzrkBean = rkBean.getJzrkBean();
			String rkfwglid = jzrkBean.getRkfwglid();
			rkBean.getRkfwglBean().setRkfwglid(rkfwglid);
			//保存房屋
			saveFwrkglBean(rkBean,jzrkBean.getZxbs());
			
			jzrkBean.setRybh(rkBean.getJbxxBean().getRybh());
			jzrkBean.setSfzh(rkBean.getJbxxBean().getSfzh());
			jzrkBean.setCzsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss"));
			if (loginInfo != null)
			{
				jzrkBean.setCzrxm(loginInfo.getRealname());
				jzrkBean.setCzrsfzh(loginInfo.getSfzh());
				jzrkBean.setCzdwdm(loginInfo.getOrgcode());
				jzrkBean.setCzdwmc(loginInfo.getOrgname());
			}
			jzrkBean.setRkfwglid(rkBean.getRkfwglBean().getRkfwglid());
			jzrkBean.setSssqbh(rkBean.getFwxxBean().getSssq());
			jzrkBean.setXzzxz(rkBean.getFwxxBean().getDzmc());
			
			// 新增
			if (ValidateHelper.isEmptyString(jzrkBean.getJzbh()))
			{
				//注销原来的暂住信息
				jzrkBean.setZxbs("1");
				jzrkBean.setZxsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss"));
				String zxyy = "该人员已经被单位[" + jzrkBean.getCzdwdm() + "]登记寄住人口,地址[" + jzrkBean.getXzzxz() + "].";
				rkDao.zxJzrkxxBySfzh(jzrkBean.getSfzh(), zxyy);
				
				jzrkBean.setCzbs("1");	//操作标示新增
				jzrkBean.setDjsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss"));
				if (loginInfo != null)
				{
					jzrkBean.setDjdwdm(loginInfo.getOrgcode());
					jzrkBean.setDjdwmc(loginInfo.getOrgname());
					jzrkBean.setDjrxm(loginInfo.getRealname());
					jzrkBean.setDjrsfzh(loginInfo.getSfzh());
				}
				jzrkBean.setZxbs("0");
				jzrkBean.setZxsj(null);
				String jzbh = "";
				if (loginInfo != null)
				{
					jzbh = CommonSequenceHelper.getJzbh(loginInfo.getOrgcode());
				}
				else
				{
					jzbh = CommonSequenceHelper.getJzbh(jzrkBean.getDjdwdm());
				}
				jzrkBean.setJzbh(jzbh);
				rkDao.insertJzrkBean(jzrkBean);
			}
			//修改
			else
			{
				jzrkBean.setZxbs("0");
				jzrkBean.setZxsj(null);
				//如果地址发生改变注销原来的居住信息，新增新的居住信息
				if(rkfwglid.equals(rkBean.getRkfwglBean().getRkfwglid()))
				{
					jzrkBean.setCzbs("2");	//修改
					jzrkBean.setRkfwglid(rkfwglid);
					rkDao.updateJzrkBean(jzrkBean);
				}
				else
				{
					//注销原来的暂住信息
					jzrkBean.setZxbs("1");
					jzrkBean.setZxsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss"));
					String zxyy = "该人员地址发生变更.";
					rkDao.zxJzrkxxBySfzh(jzrkBean.getSfzh(), zxyy);
					
					//新增新的暂住信息
					jzrkBean.setCzbs("1");	//操作标示新增
					jzrkBean.setZxbs("0");
					jzrkBean.setZxsj(null);
					jzrkBean.setDjsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss"));
					if (loginInfo != null)
					{
						jzrkBean.setDjdwdm(loginInfo.getOrgcode());
						jzrkBean.setDjdwmc(loginInfo.getOrgname());
						jzrkBean.setDjrxm(loginInfo.getRealname());
						jzrkBean.setDjrsfzh(loginInfo.getSfzh());
					}
					if(rkBean.getRkfwglBean() != null)
					{
						jzrkBean.setRkfwglid(rkBean.getRkfwglBean().getRkfwglid());
					}
					String jzbh = "";
					if (loginInfo != null)
					{
						jzbh = CommonSequenceHelper.getJzbh(loginInfo.getOrgcode());
					}
					else
					{
						jzbh = CommonSequenceHelper.getJzbh(jzrkBean.getDjdwdm());
					}
					jzrkBean.setJzbh(jzbh);
					rkDao.insertJzrkBean(jzrkBean);
				}
			}
			tm.commit();
		}
		catch(Exception e)
		{
			e.printStackTrace();
			try
			{
				tm.rollback();
			}
			catch (RollbackException e1)
			{
			}
			throw new Exception("保存寄住人口信息失败.");
		}
	}
	
	/**
	 * 保存境外人口信息
	 * @param rkBean
	 * @throws Exception
	 * @date 2013-9-4 下午06:17:25
	 */
	public void saveJwrkxxBean(RkxxBean rkBean) throws Exception
	{
		TransactionManager tm = null;
		try
		{
			tm = new TransactionManager();
			tm.begin();
			LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
			JwrkxxBean bean = rkBean.getJwrkBean();
			String rkfwglid = bean.getRkfwglid();
			//保存房屋
			saveFwrkglBean(rkBean,bean.getZxbs());
			
			bean.setRkfwglid(rkBean.getRkfwglBean().getRkfwglid());
			bean.setRybh(rkBean.getJbxxBean().getRybh());
			bean.setRjzjzl(rkBean.getJbxxBean().getZjzl());
			bean.setRjzjhm(rkBean.getJbxxBean().getZjhm());
			
			bean.setCzsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss"));
			bean.setCzrxm(loginInfo.getRealname());
			bean.setCzrsfzh(loginInfo.getSfzh());
			bean.setCzdwdm(loginInfo.getOrgcode());
			bean.setCzdwmc(loginInfo.getOrgname());
			bean.setSssqbh(rkBean.getFwxxBean().getSssq());
			bean.setXzzxz(rkBean.getFwxxBean().getDzmc());
			
			// 新增
			if (ValidateHelper.isEmptyString(bean.getJwbh()))
			{
				//注销原来的暂住信息
				bean.setZxbs("1");
				bean.setZxsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss"));
				String zxyy = "该人员已经被单位[" + loginInfo.getOrgname() + "]登记境外人口,地址[" + bean.getXzzxz() + "].";
				rkDao.zxJwrkxxBySfzh(bean.getRybh(), zxyy);
				
				bean.setCzbs("1");	//操作标示新增
				bean.setDjdwdm(loginInfo.getOrgcode());
				bean.setDjdwmc(loginInfo.getOrgname());
				bean.setDjrxm(loginInfo.getRealname());
				bean.setDjsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss"));
				bean.setDjrsfzh(loginInfo.getSfzh());
				bean.setZxbs("0");
				bean.setZxsj(null);
				String jwbh = CommonSequenceHelper.getJwbh(loginInfo.getOrgcode());
				bean.setJwbh(jwbh);
				rkDao.insertJwrkxxBean(bean);
			}
			//修改
			else
			{
				
				bean.setZxbs("0");
				bean.setZxsj(null);
				//如果地址发生改变注销原来的居住信息，新增新的居住信息
				if(rkfwglid.equals(rkBean.getRkfwglBean().getRkfwglid()))
				{
					bean.setCzbs("2");	//修改
					bean.setRkfwglid(rkfwglid);
					rkDao.updateJwrkxxBean(bean);		
				}
				else
				{
					//注销原来的暂住信息
					bean.setZxbs("1");
					bean.setZxsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss"));
					String zxyy = "该人员地址发生变更.";
					rkDao.zxJwrkxxBySfzh(bean.getRybh(), zxyy);
					
					//新增新的暂住信息
					bean.setCzbs("1");	//操作标示新增
					bean.setZxbs("0");
					bean.setZxsj(null);
					bean.setDjdwdm(loginInfo.getOrgcode());
					bean.setDjdwmc(loginInfo.getOrgname());
					bean.setDjrxm(loginInfo.getRealname());
					bean.setDjsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss"));
					bean.setDjrsfzh(loginInfo.getSfzh());
					if(rkBean.getRkfwglBean() != null)
					{
						bean.setRkfwglid(rkBean.getRkfwglBean().getRkfwglid());
					}
					String jwbh = CommonSequenceHelper.getJwbh(loginInfo.getOrgcode());
					bean.setJwbh(jwbh);
					rkDao.insertJwrkxxBean(bean);
				}
			}
			tm.commit();
		}
		catch(Exception e)
		{
			e.printStackTrace();
			try
			{
				tm.rollback();
			}
			catch (RollbackException e1)
			{
			}
			throw new Exception("保存境外人口信息失败");
		}
	}
	
	/**
	 * 保存未落户口信息
	 * @param rkBean
	 * @throws Exception
	 * @date 2013-9-4 上午09:27:36
	 */
	public void saveWlhrkxx(RkxxBean rkBean) throws Exception
	{
		TransactionManager tm = null;
		try
		{
			tm = new TransactionManager();
			tm.begin();
			LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
			RkwlczhkBean bean = rkBean.getWlhrkBean();
			String rkfwglid = bean.getRkfwglid();
			rkBean.getRkfwglBean().setRkfwglid(rkfwglid);
			//保存房屋
			saveFwrkglBean(rkBean, bean.getZxbs());
			
			bean.setRkfwglid(rkBean.getRkfwglBean().getRkfwglid());
			bean.setRybh(rkBean.getJbxxBean().getRybh());
			bean.setSfzh(rkBean.getJbxxBean().getSfzh());
			bean.setCzsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss"));
			if (loginInfo != null)
			{
				bean.setCzrxm(loginInfo.getRealname());
				bean.setCzrsfzh(loginInfo.getSfzh());
				bean.setCzdwdm(loginInfo.getOrgcode());
				bean.setCzdwmc(loginInfo.getOrgname());
				bean.setSsgajgjgdm(loginInfo.getSsgajgjgdm());
				bean.setSsgajgjgmc(loginInfo.getSsgajgjgmc());
				bean.setSspcsdm(loginInfo.getPcsdm());
				bean.setSspcsmc(loginInfo.getPcsmc());
			}
			bean.setSssqbh(rkBean.getFwxxBean().getSssq());
			
			// 新增
			if (ValidateHelper.isEmptyString(bean.getWlhrkbh()))
			{
				//注销原来的暂住信息
				bean.setZxbs("1");
				bean.setZxsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss"));
				String zxyy = "该人员已经被单位[" + bean.getCzdwdm() + "]登记为未落户人口,地址[" + bean.getXzzxz() + "].";
				rkDao.zxWlhrkxxBySfzh(bean.getSfzh(), zxyy);
				bean.setCzbs("1");	//操作标示新增
				bean.setDjsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss"));
				
				if (loginInfo != null)
				{
					bean.setDjdwdm(loginInfo.getOrgcode());
					bean.setDjdwmc(loginInfo.getOrgname());
					bean.setDjrxm(loginInfo.getRealname());
					bean.setDjrsfzh(loginInfo.getSfzh());
				}
				bean.setZxbs("0");
				bean.setZxsj(null);
				String wlrkbh = "";
				if (loginInfo != null)
				{
					wlrkbh = CommonSequenceHelper.getWlhrkBh(loginInfo.getOrgcode());
				}
				else
				{
					wlrkbh = CommonSequenceHelper.getWlhrkBh(bean.getDjdwdm());
				}
				bean.setWlhrkbh(wlrkbh);
				rkDao.insertWlhrkBean(bean);
			}
			//修改
			else
			{
				bean.setZxbs("0");
				bean.setZxsj(null);
				//如果地址发生改变注销原来的居住信息，新增新的居住信息
				if(rkfwglid.equals(rkBean.getRkfwglBean().getRkfwglid()))
				{
					
					bean.setCzbs("2");	//修改
					bean.setRkfwglid(rkfwglid);
					rkDao.updateWlhrkBean(bean);
				}
				else
				{
					//注销原来的暂住信息
					bean.setZxbs("1");
					bean.setZxsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss"));
					String zxyy = "该人员地址发生变更.";
					rkDao.zxWlhrkxxBySfzh(bean.getSfzh(), zxyy);
					
					//新增新的暂住信息
					bean.setCzbs("1");	//操作标示新增
					bean.setZxbs("0");
					bean.setZxsj(null);
					bean.setDjsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss"));
					if (loginInfo != null)
					{
						bean.setDjdwdm(loginInfo.getOrgcode());
						bean.setDjdwmc(loginInfo.getOrgname());
						bean.setDjrxm(loginInfo.getRealname());
						bean.setDjrsfzh(loginInfo.getSfzh());
					}
					if(rkBean.getRkfwglBean() != null)
					{
						bean.setRkfwglid(rkBean.getRkfwglBean().getRkfwglid());
					}
					String wlrkbh = "";
					if (loginInfo != null)
					{
						wlrkbh = CommonSequenceHelper.getWlhrkBh(loginInfo.getOrgcode());
					}
					else
					{
						wlrkbh = CommonSequenceHelper.getWlhrkBh(bean.getCzdwdm());
					}
					bean.setWlhrkbh(wlrkbh);
					rkDao.insertWlhrkBean(bean);
				}
			}
			tm.commit();
		}
		catch(Exception e)
		{
			e.printStackTrace();
			try
			{
				tm.rollback();
			}
			catch (RollbackException e1)
			{
			}
			throw new Exception("保存未落户人口信息失败");
		}
	}
	
	/**
	 * 保存常住人口
	 * @param rkBean
	 * @throws Exception
	 * @date 2013-8-30 上午11:35:43
	 */
	protected void saveCzrkxx(RkxxBean rkBean) throws Exception
	{
		TransactionManager tm = null;
		try
		{
			tm = new TransactionManager();
			tm.begin();
			LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
			CzrkxxBean czrkBean = rkBean.getCzrkBean();
			String rkfwglid = czrkBean.getRkfwglid();
			rkBean.getRkfwglBean().setRkfwglid(rkfwglid);
			//保存房屋
			saveFwrkglBean(rkBean,czrkBean.getZxbs());
			
			czrkBean.setRkfwglid(rkBean.getRkfwglBean().getRkfwglid());
			czrkBean.setRybh(rkBean.getJbxxBean().getRybh());
			czrkBean.setSfzh(rkBean.getJbxxBean().getSfzh());
			czrkBean.setCzsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss"));
			czrkBean.setCzrxm(loginInfo.getRealname());
			czrkBean.setCzdwdm(loginInfo.getOrgcode());
			czrkBean.setCzdwmc(loginInfo.getOrgname());
			czrkBean.setCzrsfzh(loginInfo.getSfzh());
			czrkBean.setHjdsssqbh(rkBean.getFwxxBean().getSssq());
			czrkBean.setXzzxz(rkBean.getFwxxBean().getDzmc());
			// 新增
			if (ValidateHelper.isEmptyString(czrkBean.getCzrkbh()))
			{
				//注销原来的暂住信息
				czrkBean.setZxbs("1");
				czrkBean.setZxsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss"));
				String zxyy = "该人员已经被单位[" + loginInfo.getOrgname() + "]登记为常住人口,地址[" + czrkBean.getXzzxz() + "].";
				rkDao.zxCzrkxxBySfzh(czrkBean.getSfzh(), zxyy);
				
				czrkBean.setZxbs("0");
				czrkBean.setZxsj(null);
				czrkBean.setCzbs("1");	//操作标示新增
				czrkBean.setDjdwdm(loginInfo.getOrgcode());
				czrkBean.setDjdwmc(loginInfo.getOrgname());
				czrkBean.setDjrxm(loginInfo.getRealname());
				czrkBean.setDjsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss"));
				czrkBean.setDjrsfzh(loginInfo.getSfzh());
				String czrkbh = CommonSequenceHelper.getCzrkbh(loginInfo.getOrgcode());
				czrkBean.setCzrkbh(czrkbh);
				rkDao.insertCzrkxxBean(czrkBean);
			}
			//修改
			else
			{
				czrkBean.setZxbs("0");
				czrkBean.setZxsj(null);
				//如果地址发生改变注销原来的居住信息，新增新的居住信息
				if(rkfwglid.equals(rkBean.getRkfwglBean().getRkfwglid()))
				{
					
					czrkBean.setCzbs("2");	//修改
					czrkBean.setRkfwglid(rkfwglid);
					rkDao.updateCzrkxxBean(czrkBean);			
				}
				else
				{
					//注销原来的暂住信息
					czrkBean.setZxbs("1");
					czrkBean.setZxsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss"));
					String zxyy = "该人员地址发生变更.";
					rkDao.zxCzrkxxBySfzh(czrkBean.getSfzh(), zxyy);
					
					//新增新的暂住信息
					czrkBean.setCzbs("1");	//操作标示新增
					czrkBean.setZxbs("0");
					czrkBean.setZxsj(null);
					czrkBean.setDjdwdm(loginInfo.getOrgcode());
					czrkBean.setDjdwmc(loginInfo.getOrgname());
					czrkBean.setDjrxm(loginInfo.getRealname());
					czrkBean.setDjsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss"));
					czrkBean.setDjrsfzh(loginInfo.getSfzh());
					if(rkBean.getRkfwglBean() != null)
					{
						czrkBean.setRkfwglid(rkBean.getRkfwglBean().getRkfwglid());
					}
					String czrkbh = CommonSequenceHelper.getCzrkbh(loginInfo.getOrgcode());
					czrkBean.setCzrkbh(czrkbh);
					rkDao.insertCzrkxxBean(czrkBean);
				}
			}
			tm.commit();
		}
		catch(Exception e)
		{
			e.printStackTrace();
			try
			{
				tm.rollback();
			}
			catch (RollbackException e1)
			{
			}
			throw new Exception("保存常住人口信息失败");
		}
	}
	
	/**
	 * 保存流动人口信息
	 * @param rkBean
	 * @date 2013-9-2 上午09:50:22
	 */
	public void saveLdrkxx(RkxxBean rkBean) throws Exception
	{
		TransactionManager tm = null;
		try
		{
			tm = new TransactionManager();
			tm.begin();
			LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
			LdrkxxBean ldrkBean = rkBean.getLdrkBean();
			String rkfwglid = ldrkBean.getRkfwglid();
			rkBean.getRkfwglBean().setRkfwglid(rkfwglid);
			//保存房屋
			saveFwrkglBean(rkBean, ldrkBean.getZxbs());
			ldrkBean.setRybh(rkBean.getJbxxBean().getRybh());
			ldrkBean.setSfzh(rkBean.getJbxxBean().getSfzh());
			ldrkBean.setCzsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss"));
			if (loginInfo != null)
			{
				ldrkBean.setCzrxm(loginInfo.getRealname());
				ldrkBean.setCzrsfzh(loginInfo.getSfzh());
				ldrkBean.setCzdwdm(loginInfo.getOrgcode());
				ldrkBean.setCzdwmc(loginInfo.getOrgname());
			}
			ldrkBean.setSssqbh(rkBean.getFwxxBean().getSssq());
			ldrkBean.setNjzrq(getNjzrq(ldrkBean.getNjzqx()));
			String zrdwdm = ldrkBean.getZrdwdm();
			if (ValidateHelper.isNotEmptyString(zrdwdm) && zrdwdm.length() > 6)
			{
				ldrkBean.setSsgajgjgdm(ldrkBean.getZrdwdm().substring(0, 6) + "000000");
				ldrkBean.setSsgajgjgmc(DictionaryCacheHellper.getOrganizationOrgNameByCode(ldrkBean.getZrdwdm().substring(0, 6) + "000000"));
				ldrkBean.setSspcsdm(ldrkBean.getZrdwdm().substring(0, 8) + "0000");
				ldrkBean.setSspcsmc(DictionaryCacheHellper.getOrganizationOrgNameByCode(ldrkBean.getZrdwdm().substring(0, 8) + "0000"));
				ldrkBean.setZzdqh(ldrkBean.getZrdwdm().substring(0, 6));
			}
			ldrkBean.setZzdxz(rkBean.getFwxxBean().getDzmc());
			
			// 新增
			if (ValidateHelper.isEmptyString(ldrkBean.getZzbh()))
			{
				//注销原来的暂住信息
				ldrkBean.setZxbs("1");
				ldrkBean.setZxsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss"));
				String zxyy = "该人员已经被单位[" + ldrkBean.getCzdwmc() + "]登记为流动人口,地址[" + ldrkBean.getZzdxz() + "].";
				rkDao.zxLdrkxxBySfzh(ldrkBean.getSfzh(), zxyy);
				
				ldrkBean.setCzbs("1");	//操作标示新增
				ldrkBean.setDjsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss"));
				if (loginInfo != null)
				{
					ldrkBean.setDjdwdm(loginInfo.getOrgcode());
					ldrkBean.setDjdwmc(loginInfo.getOrgname());
					ldrkBean.setDjrxm(loginInfo.getRealname());
					ldrkBean.setDjrsfzh(loginInfo.getSfzh());
				}
				ldrkBean.setRkfwglid(rkBean.getRkfwglBean().getRkfwglid());
				
				ldrkBean.setZxbs("0");
				ldrkBean.setZxsj(null);
				
				String zzbh = "";
				if (loginInfo != null)
				{
					zzbh = CommonSequenceHelper.getZzbh(loginInfo.getOrgcode());
					
				}
				else
				{
					zzbh = CommonSequenceHelper.getZzbh(ldrkBean.getCzdwdm());
				}
				ldrkBean.setZzbh(zzbh);
				rkDao.insertLdrkxxBean(ldrkBean);
			}
			//修改
			else
			{
				ldrkBean.setZxbs("0");
				ldrkBean.setZxsj(null);
				//如果地址发生改变注销原来的暂住信息，新增新的暂住信息
				if(rkfwglid.equals(rkBean.getRkfwglBean().getRkfwglid()))
				{
					
					ldrkBean.setCzbs("2");	//修改
					ldrkBean.setRkfwglid(rkfwglid);
					ldrkBean.setZxsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss"));
					ldrkBean.setZxbs("0");
					rkDao.updateLdrkxxBean(ldrkBean);
				}
				else
				{
					//注销原来的暂住信息
					ldrkBean.setZxbs("1");
					ldrkBean.setZxsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss"));
					String zxyy = "该人员地址发生变更.新地址[" + ldrkBean.getZzdxz() + "].";
					rkDao.zxLdrkxxBySfzh(ldrkBean.getSfzh(), zxyy);
					
					//新增新的暂住信息
					ldrkBean.setCzbs("1");	//操作标示新增
					ldrkBean.setZxbs("0");
					ldrkBean.setZxsj(null);
					ldrkBean.setDjsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss"));
					if (loginInfo != null)
					{
						ldrkBean.setDjdwdm(loginInfo.getOrgcode());
						ldrkBean.setDjdwmc(loginInfo.getOrgname());
						ldrkBean.setDjrxm(loginInfo.getRealname());
						ldrkBean.setDjrsfzh(loginInfo.getSfzh());
					}
					if(rkBean.getRkfwglBean() != null)
					{
						ldrkBean.setRkfwglid(rkBean.getRkfwglBean().getRkfwglid());
					}
					String zzbh = "";
					if (loginInfo != null)
					{
						zzbh = CommonSequenceHelper.getZzbh(loginInfo.getOrgcode());
					}
					else
					{
						zzbh = CommonSequenceHelper.getZzbh(ldrkBean.getCzdwdm());
					}
					ldrkBean.setZzbh(zzbh);
					rkDao.insertLdrkxxBean(ldrkBean);
				}
				
				//与户主关系如果是承租人，则系统会自动在承租人表中插入一条承租人信息
				String yhzgx = ldrkBean.getYhzgx();
				//与户主关系是承租人
				if ("02".equals(yhzgx))
				{
					LsglCzfwCzxxService czrService = new LsglCzfwCzxxServiceImpl();
					CzrxxBean czrBean = new CzrxxBean();
					czrBean.setFwid(rkBean.getFwxxBean().getFwid());
					czrBean.setCzrzjzl("111");//身份证号
					czrBean.setCzrzjhm(ldrkBean.getSfzh());
					czrBean.setXm(rkBean.getJbxxBean().getXm());
					czrBean.setXb(rkBean.getJbxxBean().getXb());
					czrBean.setCsrq(rkBean.getJbxxBean().getCsrq());
					czrBean.setLxfs(rkBean.getJbxxBean().getLxdh());
					czrBean.setCzrzt("1");
					czrBean.setSsxq(rkBean.getFwxxBean().getSsxzqh());
					czrBean.setSssqdm(rkBean.getFwxxBean().getSssq());
					czrBean.setDjdwdm(loginInfo.getOrgcode());
					czrBean.setDjdwmc(loginInfo.getOrgname());
					czrBean.setDjrxm(loginInfo.getRealname());
					czrBean.setDjrsfzh(loginInfo.getSfzh());
					czrBean.setDjsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss"));
					czrBean.setCzdwdm(loginInfo.getOrgcode());
					czrBean.setCzdwmc(loginInfo.getOrgname());
					czrBean.setCzrxm(loginInfo.getRealname());
					czrBean.setCzrsfzh(loginInfo.getSfzh());
					czrBean.setCzsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss"));
					czrBean.setZxbs("0");
					czrBean.setCzyt("01");//默认居住
					czrBean.setCzrq(DateTimeHelper.getNowDateStr("yyyy-MM-dd"));
					boolean isexists = czrService.queryCzrxxBeanBySfzh(ldrkBean.getSfzh(), rkBean.getFwxxBean().getFwid());
					if (!isexists)
					{
						czrService.insertCzrBean(czrBean);
					}
				}
			}
			tm.commit();
		}
		catch(Exception e)
		{
			e.printStackTrace();
			try
			{
				tm.rollback();
			}
			catch (RollbackException e1)
			{
			}
			throw new Exception("保存流动人口信息失败");
		}
	}
	
	private String getNjzrq(String njzqx)
	{
		if ("1".equals(njzqx))
		{
			return DateTimeHelper.addDateTimeToStr(System.currentTimeMillis(), 30, "yyyy-MM-dd");
		}
		else if ("2".equals(njzqx))
		{
			return DateTimeHelper.addDateTimeToStr(System.currentTimeMillis(), 3 * 30, "yyyy-MM-dd");
		}
		else if ("3".equals(njzqx))
		{
			return DateTimeHelper.addDateTimeToStr(System.currentTimeMillis(), 6 * 30, "yyyy-MM-dd");
		}
		else if ("4".equals(njzqx))
		{
			return DateTimeHelper.addDateTimeToStr(System.currentTimeMillis(), 12 * 30, "yyyy-MM-dd");
		}
		else if ("5".equals(njzqx))
		{
			return DateTimeHelper.addDateTimeToStr(System.currentTimeMillis(), 12 * 2 * 30, "yyyy-MM-dd");
		}
		else if ("6".equals(njzqx))
		{
			return DateTimeHelper.addDateTimeToStr(System.currentTimeMillis(), 12 * 3 * 30, "yyyy-MM-dd");
		}
		return null;	
	}
	
	/**
	 * 保存房屋信息
	 * @param rkBean
	 * @param fwid
	 * @param dzid
	 * @param rkfwglid
	 * @throws Exception
	 * @date 2013-9-4 下午08:38:40
	 */
	protected void saveFwrkglBean(RkxxBean rkBean, String zxbs) throws Exception
	{
		LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
		
		RkfwglBean rkfwglBean = rkBean.getRkfwglBean();
		
		//保存房屋信息
		rkfwglBean.setRybh(rkBean.getJbxxBean().getRybh());
		rkfwglBean.setFwid(rkBean.getFwxxBean().getFwid());
		rkfwglBean.setDzid(rkBean.getFwxxBean().getDzid());
		rkfwglBean.setSfzh(rkBean.getJbxxBean().getSfzh());
	
		//查询以前的
		//RkfwglBean fwgl_old = rkDao.queryRkFwGlByRybh(rkBean.getJbxxBean().getRybh());
		String oldfwid = rkDao.queryFwidByRkfwglid(rkfwglBean.getRkfwglid());
		if(ValidateHelper.isNotEmptyString(oldfwid))
		{
			//如果房屋ID不同(地址发生改变)，注销原来的，新增新的
			if(!oldfwid.equals(rkfwglBean.getFwid()))
			{
				// 注销旧的人口房屋居住记录
				rkfwglBean.setBlsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd"));
				rkfwglBean.setZxsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss"));
				rkfwglBean.setZxdwdm(loginInfo.getOrgcode());
				rkfwglBean.setZxdwmc(loginInfo.getOrgname());
				rkfwglBean.setZxmjxm(loginInfo.getRealname());
				rkfwglBean.setRkfwglid(rkfwglBean.getRkfwglid());
				rkfwglBean.setZxbs("1");
				rkfwglBean.setZxyy("人员地址发生变更");
				rkDao.zxRkfwBean(rkfwglBean.getRkfwglid());
				
				
				//新增新的人口房屋居住记录
				String currentXzqh = DictionaryCacheHellper.getSystemParamenterValueByKey("current.xzdm");
				String rkfwglid = currentXzqh + CommonDBBaseHelper.getSequence(CommonConstant.DBNAME_SQJW, "seq_lsgl_fwrkid");
				rkfwglBean.setRzsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd"));
				rkfwglBean.setZxbs(zxbs);
				rkfwglBean.setZxsj(null);
				rkfwglBean.setZxdwdm(null);
				rkfwglBean.setZxdwmc(null);
				rkfwglBean.setZxmjxm(null);
				rkfwglBean.setRkfwglid(rkfwglid);
				rkDao.insertFwRkGlBean(rkfwglBean);
				rkBean.setRkfwglBean(rkfwglBean);
			}
			else
			{
				rkfwglBean.setRkfwglid(rkfwglBean.getRkfwglid());
			}
		}
		else
		{
			//新增新的人口房屋居住记录
			String currentXzqh = DictionaryCacheHellper.getSystemParamenterValueByKey("current.xzdm");
			String rkfwglid = currentXzqh + CommonDBBaseHelper.getSequence(CommonConstant.DBNAME_SQJW, "seq_lsgl_fwrkid");
			rkfwglBean.setRzsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd"));
			rkfwglBean.setZxbs(zxbs);
			rkfwglBean.setRkfwglid(rkfwglid);
			rkfwglBean.setDjsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss"));
			rkDao.insertFwRkGlBean(rkfwglBean);
			rkBean.setRkfwglBean(rkfwglBean);
		}
	}
	
	/**
	 * 保存人口信息对象 带照片保存
	 * @param rkBean
	  * @param msgtype 消息类型 查询的是数据 0：全部  ,1:基本信息  2:历史信息 ，  3:照片信息  4:社会信息 5:体貌特种信息 6：联系方式
	 * @param zpUploads
	 * @param zpUploadsFileName
	 * @return
	 * @date 2013-8-23 上午09:13:24
	 */
	public RkxxBean saveRkxxBean(RkxxBean rkBean, String msgtype, File[] zpUploads, String[] zpUploadsFileName) throws Exception
	{
		TransactionManager tm = null;
		try
		{
			tm = new TransactionManager();
			tm.begin();
			// 人口信息
			if (CommonFinalParams.MSGTYPE_ALL.equals(msgtype) || !CommonFinalParams.MSGTYPE_ZPXX.equals(msgtype))
			{
				rkBean = saveRkxxBean(rkBean, msgtype);
			}
			// 照片信息
			if (CommonFinalParams.MSGTYPE_ALL.equals(msgtype) || CommonFinalParams.MSGTYPE_ZPXX.equals(msgtype))
			{
				saveRkzpxx(rkBean, zpUploads, zpUploadsFileName);
			}
			tm.commit();
		}
		catch(SQLException e)
		{
			rkBean = null;
			tm.rollback();
		}
		return rkBean;
	}
	
	/**
	 * 保存人口照相信息
	 * @param rkBean
	 * @param zpUploads
	 * @param zpUploadsFileName
	 * @throws Exception
	 * @date 2013-8-29 下午08:25:11
	 */
	public RkxxBean saveRkzpxx(RkxxBean rkBean, File[] zpUploads,
			String[] zpUploadsFileName) throws Exception
	{
		LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
		if (ValidateHelper.isNotEmptyArray(zpUploads))
		{
			List<RkzpxxBean> rkzpxxBeans = new ArrayList<RkzpxxBean>();
			RkzpxxBean bean = null;
			for (int i=0;i<zpUploads.length;i++)
			{
				bean = new RkzpxxBean();
				bean.setRybh(rkBean.getJbxxBean().getRybh());
				bean.setSfzh(rkBean.getJbxxBean().getSfzh());
				bean.setZp(zpUploads[i]);
				bean.setMs(zpUploadsFileName[i]);
				bean.setDjrxm(loginInfo.getRealname());
				bean.setDjdwdm(loginInfo.getOrgcode());
				bean.setDjdwmc(loginInfo.getOrgname());
				rkzpxxBeans.add(bean);
			}
			rkBean.setZpxxBeans(rkzpxxBeans);
			rkDao.insertRkzpxx(rkzpxxBeans);
		}
		return rkBean;
	}
	
	/**
	 * 通过身份证号查询历史常驻人口信息
	 * @param sfzh
	 * @return
	 * @throws Exception
	 * @date 2013-8-24 下午12:58:46
	 */
	public List<CzrkxxBean> queryCzrkxxBeansByRybh(String rybh) throws Exception
	{
		return rkDao.queryCzrkBeansByRybh(rybh);
	}

	/**
	 * 获取人口照片信息
	 * @param zpid
	 * @return
	 * @throws Exception
	 * @date 2013-8-24 下午04:44:29
	 */
	public Blob getRkzpBlob(String zpid) throws Exception
	{
		return rkDao.getRkzpBlob(zpid);
	}

	/**
	 * 删除人口照片
	 * @param zpid 照片ID
	 * @throws Exception
	 * @date 2013-8-30 下午03:13:29
	 */
	public void deleteRkzpImage(String zpid) throws Exception
	{
		rkDao.deleteRkzpImage(zpid);
	}

	/**
	 * 查询人口基本信息通过身份证号
	 * @param sfzh
	 * @return
	 * @throws Exception
	 * @date 2013-9-17 下午03:43:48
	 */
	public RkJbxxBean queryRkJbxxBeanBySfzh(String sfzh) throws Exception
	{
		RkJbxxBean rkjbxx = rkDao.queryRkJbxxBeanBySfzh(sfzh);
		return rkjbxx;
	}

	/**
	 * 通过国籍证件号码，证件种类查询境外人口
	 * @param queryBean
	 * @return
	 * @throws Exception
	 * @date 2013-9-17 下午07:24:59
	 */
	public RkJbxxBean queryRkJbxxBeanByGjAndZjzlAndZjhm(RkQueryBean queryBean)
			throws Exception
	{
		return rkDao.queryRkJbxxBeanByGjAndZjzlAndZjhm(queryBean);
	}

	/**
	 * 查询当前常驻人口信息
	 * @param rybh
	 * @return
	 * @throws Exception
	 * @date 2013-9-23 下午07:52:41
	 */
	public CzrkxxBean queryDqCzrkxxBeanByRybh(String rybh) throws Exception
	{
		return rkDao.queryDqCzrkxxBeanByRybh(rybh);
	}

	public RkxxBean queryRkxxBeanByRkid(String rylb, String rkid,String rybh, String msgtype, String operType) throws Exception
	{
		RkxxBean rkBean = new RkxxBean();
		rkBean.setRylb(rylb);
		// 查询人口基本信息
		RkJbxxBean jbxxBean = rkDao.queryRkJbxxBeanByRybh(rybh);
		rkBean.setJbxxBean(jbxxBean);
		if (jbxxBean != null && ValidateHelper.isNotEmptyString(msgtype))
		{
			// 查询的是人口的基本信息1
			if (CommonFinalParams.MSGTYPE_ALL.equals(msgtype) || CommonFinalParams.MSGTYPE_JBXX.equals(msgtype))
			{
				//修改，明细则查询
				if (CommonConstant.OPERTYPE_UPDATE.equals(operType) || CommonConstant.OPERTYPE_DETAIL.equals(operType))
				{
					queryRkJbxxDataByRkid(rkBean, rybh, rkid);
				}
			}
			
			// 历史记录2
			if (CommonFinalParams.MSGTYPE_ALL.equals(msgtype) || CommonFinalParams.MSGTYPE_HIS.equals(msgtype))
			{
				queryRklsjlBeans(rkBean, rybh);
			}
			//查询照片3
			if (CommonFinalParams.MSGTYPE_ALL.equals(msgtype) || CommonFinalParams.MSGTYPE_ZPXX.equals(msgtype))
			{
				// 人口照片信息
				List<RkzpxxBean> zpxxBeans = rkDao.queryRkzpxxBeansByRybh(rybh);
				rkBean.setZpxxBeans(zpxxBeans);
			}
			
			// 社会信息
			if(CommonFinalParams.MSGTYPE_ALL.equals(msgtype) || CommonFinalParams.MSGTYPE_SHXX.equals(msgtype))
			{
				List<RkgxrxxBean> gxrBeans = rkDao.queryRkgxrBeansByRybh(rybh);
				rkBean.setGxrBeans(gxrBeans);
			}
			
			// 体貌特征信息
			if(CommonFinalParams.MSGTYPE_ALL.equals(msgtype) || CommonFinalParams.MSGTYPE_TMTZ.equals(msgtype))
			{
				RktmtzxxBean tmtzBean = rkDao.queryRktmtzBeanByRybh(rybh);
				rkBean.setTmtzBean(tmtzBean);
			}
			
			// 联系方式信息
			if(CommonFinalParams.MSGTYPE_ALL.equals(msgtype) || CommonFinalParams.MSGTYPE_LXFS.equals(msgtype))
			{
				rkBean.setLxfsBean(rkDao.queryRklxfsBeansByRybh(rybh));
			}
		}
		return rkBean;
	}
	
	/**
	 * 社会关系
	 */
	public List<RkgxrxxBean> queryRkgxrBeansByRybh(String rybh) throws Exception
	{
		return rkDao.queryRkgxrBeansByRybh(rybh);
	}
	
	public RktmtzxxBean queryRktmtzBeanByRybh(String rybh) throws Exception
	{
		return rkDao.queryRktmtzBeanByRybh(rybh);
	}
	
	public List<RklxfsxxBean> queryRklxfsBeansByRybh(String rybh) throws Exception
	{
		return rkDao.queryRklxfsBeansByRybh(rybh);
	}
	
	/**
	 * 检查人员是否存在
	 * @param sfzh
	 * @param rylb
	 * @param fwid
	 * @return
	 * @throws Exception
	 * @date 2013-11-28 上午10:19:53
	 */
	public RkJbxxBean getExsitRkxxObject(String sfzh, String rylb, String fwid)
			throws Exception
	{
		RkJbxxBean jbxxBean = null;
		if (ValidateHelper.isNotEmptyString(sfzh) && ValidateHelper.isNotEmptyString(rylb) && ValidateHelper.isNotEmptyString(fwid))
		{
			if (CommonFinalParams.RYLB_CZRK.equals(rylb))
			{
				jbxxBean = rkDao.queryCzrkxxBeanBySfzhAndFwid(sfzh, fwid);
			}
			else if (CommonFinalParams.RYLB_LDRK.equals(rylb))
			{
				jbxxBean = rkDao.queryLdrkxxBeanBySfzhAndFwid(sfzh, fwid);
			}
			else if (CommonFinalParams.RYLB_JZRK.equals(rylb))
			{
				jbxxBean = rkDao.queryJzrkxxBeanBySfzhAndFwid(sfzh, fwid);
			}
		}
		return jbxxBean;
	}

	public RkDzxxBean queryDzxxByRybh(String rybh) throws Exception {
		RkDzxxBean rkdz = new RkDzxxBean();
		RkJbxxBean rkxx = rkDao.queryRkJbxxBeanByRybh(rybh);
		rkdz.setRk(rkxx);
		
		RkfwglBean rkfw = rkDao.queryRkFwGlByRybh(rybh);
		rkdz.setRkfw(rkfw);
		
		FwJbxxBean fw = new FwJbxxBean();
		if(rkfw != null){
			LsglFwJbxxDao fwDao = new LsglFwJbxxDaoImpl();
			fw = fwDao.queryFwJbxxBeanByFwid(rkfw.getFwid(),"fwinfo");
			rkdz.setFw(fw);
		}
		return rkdz;
	}

	public RkDzxxBean queryDzxxBySfzh(String sfzh) throws Exception {
		RkDzxxBean rkdz = new RkDzxxBean();
		RkJbxxBean rkxx = rkDao.queryRkJbxxBeanBySfzh(sfzh);
		rkdz.setRk(rkxx);
		
		RkfwglBean rkfw = rkDao.queryRkFwGlBySfzh(sfzh);
		rkdz.setRkfw(rkfw);
		FwJbxxBean fw = new FwJbxxBean();
		if(rkfw != null){
			LsglFwJbxxDao fwDao = new LsglFwJbxxDaoImpl();
			fw = fwDao.queryFwJbxxBeanByFwid(rkfw.getFwid(),"fwinfo");
			rkdz.setFw(fw);
		}
		return rkdz;
	}
	
	//根据身份证判断该人口是否已登记
	public boolean isExistsSfzh(String sfzh) throws Exception{
		RkJbxxBean rkBean=rkDao.queryRkJbxxBeanBySfzh(sfzh);
		if(rkBean!=null){
			return true;
		}else{
			return false;
		}
	}

	public void updateLdrkInfoBean(LdrkxxBean ldrkBean)
	{
		LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
		TransactionManager tm = null;
		String ynjzrq = "";
		try 
		{
			tm  = new TransactionManager();
			tm.begin();
			//注销
			if ("1".equals(ldrkBean.getZxbs()))
			{
				ldrkBean.setZxyy("流动人口延期注销.  注销代码:"+ldrkBean.getZxyy());
			}
			LdrkxxBean lkbean = rkDao.queryLdrkBeanByLdrkid(ldrkBean.getZzbh());
			if (lkbean != null)
			{
				ynjzrq = lkbean.getNjzrq();
				lkbean.setZxbs(ldrkBean.getZxbs());
				lkbean.setZxsj(ldrkBean.getZxsj());
				lkbean.setZxyy(ldrkBean.getZxyy());
				//是注销
				if ("1".equals(ldrkBean.getZxbs()))
				{
					lkbean.setZzzyxqjzrq(lkbean.getNjzrq());
				}
				//是延期
				else
				{
					lkbean.setNjzqx(ldrkBean.getNjzqx());
					lkbean.setZzzyxqjzrq(ldrkBean.getZzzyxqjzrq());
					lkbean.setNjzrq(ldrkBean.getZzzyxqjzrq());
				}
				rkDao.updateLdrkInfoBean(lkbean);
			}
			if(ldrkBean != null)
			{
				if ("1".equals(ldrkBean.getZxbs()))
				{
					RkfwglBean rkfwBean =  new RkfwglBean();
					rkfwBean.setZxbs("1");
					rkfwBean.setZxmjxm(loginInfo.getRealname());
					rkfwBean.setZxdwdm(loginInfo.getOrgcode());
					rkfwBean.setZxdwmc(loginInfo.getOrgname());
					rkfwBean.setRkfwglid(ldrkBean.getRkfwglid());
					rkfwBean.setZxyy(ldrkBean.getZxyy());
					rkDao.updateRkfwInfo(rkfwBean);
				}
			}
			LdrkYqzxBean yqzxBean = new  LdrkYqzxBean();
			String id =CommonDBBaseHelper.getSequence(CommonConstant.DBNAME_SQJW, "SEQ_LSGL_LDRK_YQZX_ID");
			yqzxBean.setId(id);
			if("1".equals(ldrkBean.getZxbs()))
			{
				yqzxBean.setCllx("1");
			}
			else
			{
				yqzxBean.setCllx("2");
			}
			if(ValidateHelper.isNotEmptyString(ynjzrq)){
				yqzxBean.setYnjzrq(ynjzrq);
			}
			yqzxBean.setLdrkzzbh(ldrkBean.getZzbh());
			ldrkBean = rkDao.queryLdrkBeanByLdrkid(ldrkBean.getZzbh());
			yqzxBean.setLdrksfzh(ldrkBean.getSfzh());
			yqzxBean.setLdrkrybh(ldrkBean.getRybh());
			yqzxBean.setCzrjh(loginInfo.getUsername());
			yqzxBean.setCzrxm(loginInfo.getRealname());
			yqzxBean.setCzrsfzh(loginInfo.getSfzh());
			yqzxBean.setCzdwdm(loginInfo.getOrgcode());
			yqzxBean.setCzdwmc(loginInfo.getOrgname());
			rkDao.insertLdryYqzxBean(yqzxBean);
			tm.commit();
		} 
		catch (Exception e) 
		{
			try
			{
				tm.rollback();
			}
			catch (RollbackException e1)
			{
			}
			e.printStackTrace();
		} 
		
	}

	public LdrkxxBean queryLdrkBeanByZzbh(String zzbh) throws Exception {
		return rkDao.queryLdrkBeanByZzbh(zzbh);
	}

	public void updateLdrkInfoBeanForZX(LdrkxxBean ldrkBean) throws Exception {
		rkDao.updateLdrkInfoBeanForZX(ldrkBean);
	}

	@Override
	public void deleteJwrkInfo(String bhs) throws Exception {
		String []strBhs = bhs.split(",");
		for (String str : strBhs) {
			rkDao.deleteJwrkInfo(str);
		}
	}

	@Override
	public void deleteJzrkInfo(String bhs) throws Exception {
		String [] strBhs = bhs.split(",");
		for (String str : strBhs) {
			rkDao.deleteJzrkInfo(str);
		}
	}

	@Override
	public void deleteLdrkInfo(String bhs) throws Exception {
		String [] strBhs = bhs.split(",");
		for (String str : strBhs) {
			rkDao.deleteLdrkInfo(str);
		}
	}

	@Override
	public void logoutCzrkInfo(CzrkxxBean czrkBean) throws Exception {
		rkDao.logoutCzrkInfo(czrkBean);
	}

	@Override
	public void logoutJwrkInfo(JwrkxxBean jwrkBean) throws Exception {
		rkDao.logoutJwrkInfo(jwrkBean);
	}

	@Override
	public void logoutJzrkInfo(JzrkxxBean jzrkBean) throws Exception {
		rkDao.logoutJzrkInfo(jzrkBean);
	}

	@Override
	public void logoutLdrkInfo(LdrkxxBean ldrkBean) throws Exception {
		rkDao.logoutLdrkInfo(ldrkBean);
	}

	@Override
	public void recoveryRkInfo(RkxxBean rkBean, String rylb,String bh) throws Exception {
		TransactionManager tm = null;
		RkfwglBean rkfwBean = new RkfwglBean();
		//常口
		try {
			tm = new TransactionManager();
			tm.begin();
			if(CommonFinalParams.RYLB_CZRK.equals(rylb)){
				rkBean.getCzrkBean().setCzrkbh(bh);
				rkDao.recoveryCzrkInfo(rkBean.getCzrkBean());
			
				CzrkxxBean czrkxxBean = queryCzrkInfoByCzrkbh(bh);
				if(ValidateHelper.isNotEmptyString(czrkxxBean.getRkfwglid())){
					rkfwBean.setRkfwglid(czrkxxBean.getRkfwglid());
				}
			}
			//流口
			else if(CommonFinalParams.RYLB_LDRK.equals(rylb)){
				rkBean.getLdrkBean().setZzbh(bh);
				rkDao.recoveryLdrkInfo(rkBean.getLdrkBean());
				
				LdrkxxBean ldrkxxBean = queryLdrkBeanByZzbh(bh);
				if(ValidateHelper.isNotEmptyString(ldrkxxBean.getRkfwglid())){
					rkfwBean.setRkfwglid(ldrkxxBean.getRkfwglid());
				}
			}
			//境外人口
			else if(CommonFinalParams.RYLB_JWRK.equals(rylb)){
				rkBean.getJwrkBean().setJwbh(bh);
				rkDao.recoveryJwrkInfo(rkBean.getJwrkBean());
				
				JwrkxxBean jwrkBean = queryJwrkInfoByJwbh(bh);
				if(ValidateHelper.isNotEmptyString(jwrkBean.getRkfwglid())){
					rkfwBean.setRkfwglid(jwrkBean.getRkfwglid());
				}
			}
			//寄口
			else if(CommonFinalParams.RYLB_JZRK.equals(rylb)){
				rkBean.getJzrkBean().setJzbh(bh);
				rkDao.recoveryJzrkInfo(rkBean.getJzrkBean());
				
				JzrkxxBean jzrkBean = queryJzrkInfoByJzbh(bh);
				if(ValidateHelper.isNotEmptyString(jzrkBean.getRkfwglid())){
					rkfwBean.setRkfwglid(jzrkBean.getRkfwglid());
				}
			}
			//未落户
			else if(CommonFinalParams.RYLB_WLHRK.equals(rylb)){
				rkBean.getWlhrkBean().setWlhrkbh(bh);
				rkDao.recoveryWlhrkInfo(rkBean.getWlhrkBean());
				
				RkwlczhkBean wlhrkBean = queryWlhrkInfoByWlhbh(bh);
				if(ValidateHelper.isNotEmptyString(wlhrkBean.getRkfwglid())){
					rkfwBean.setRkfwglid(wlhrkBean.getRkfwglid());
				}
			}
			recoveryRkfwInfo(rkfwBean);
			tm.commit();
		} catch (RuntimeException e) {
			tm.rollback();
			e.printStackTrace();
		}

	}
	/**
	 * 批量注销人口
	 */
	@Override
	public void batchLogoutLdrkInfo(List<LdrkxxBean> ldrkList) throws Exception {
		TransactionManager tm = null;
		LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
		try {
			
			for (LdrkxxBean ldrkxxBean : ldrkList) 
			{
				tm = new TransactionManager();
				tm.begin();
				rkDao.logoutLdrkInfo(ldrkxxBean);
				RkfwglBean rkfwglBean = new RkfwglBean();
				if(ValidateHelper.isNotEmptyString(ldrkxxBean.getZzbh()))
				{
					LdrkxxBean ldrkBean=queryLdrkBeanByZzbh(ldrkxxBean.getZzbh());
					rkfwglBean.setRkfwglid(ldrkBean.getRkfwglid());
					rkfwglBean.setZxdwdm(loginInfo.getOrgcode());
					rkfwglBean.setZxdwmc(loginInfo.getOrgname());
					rkfwglBean.setZxmjxm(loginInfo.getRealname());
					rkfwglBean.setZxyy(ldrkxxBean.getZxyy());
					updateRkfwInfo(rkfwglBean);
				}
				tm.commit();
			}
		} catch (RuntimeException e) {
			tm.rollback();
			e.printStackTrace();
		}
	}

	@Override
	public void deleteWlhrkInfo(String wlhrkbh) throws Exception {
		rkDao.deleteWlhrkInfo(wlhrkbh);
	}

	@Override
	public void logoutWlhrkInfo(RkwlczhkBean wlczhkBean) throws Exception {
		rkDao.logoutWlhrkInfo(wlczhkBean);
	}

	@Override
	public void deleteRkJhsyBean(String id) throws Exception {
		rkDao.deleteRkJhsyBean(id);
	}

	@Override
	public void insertRkJhsyBean(RkJhsyBean jhsyBean) throws Exception 
	{
		String id = CommonDBBaseHelper.getSequence(CommonConstant.DBNAME_SQJW, "SEQ_LSGL_RK_JHSY_ID"); 
		String xzdm = DictionaryCacheHellper.getSystemParamenterValueByKey("current.xzdm");
		LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
		jhsyBean.setDjrjh(loginInfo.getUsername());
		jhsyBean.setDjrxm(loginInfo.getRealname());
		jhsyBean.setDjdwdm(loginInfo.getOrgcode());
		jhsyBean.setDjdwmc(loginInfo.getOrgname());
		jhsyBean.setDjsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss"));
		jhsyBean.setDjrsfzh(loginInfo.getSfzh());
		jhsyBean.setId(xzdm+id);
		rkDao.insertRkJhsyBean(jhsyBean);
	}

	@Override
	public RkJhsyBean queryJhsyBeanByjlbh(String id) throws Exception {
		return rkDao.queryJhsyBeanByjlbh(id);
	}

	@Override
	public PageResultInfo<RkJhsyBean> queryJhsyBeanPage(RkQueryBean queryBean,
			PageInfo pageInfo) throws Exception {
		return rkDao.queryJhsyBeanPage(queryBean, pageInfo);
	}

	@Override
	public void updateRkJhsyBean(RkJhsyBean jhsyBean) throws Exception {
		rkDao.updateRkJhsyBean(jhsyBean);
	}
	
	public void delGxr(String id){
		try {
			rkDao.delGxr(id);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	

	@Override
	public JwrkxxBean queryJwrkJbxxByRybh(String rybh) throws Exception {
		return 	rkDao.queryJwrkBeanByRybh(rybh);
	}
	
	public void delLxfs(String lxfsId){
		RklxfsxxBean bean = new RklxfsxxBean();
		LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
		bean.setId(lxfsId);
		bean.setCzbs("3");
		bean.setCzdwdm(loginInfo.getOrgcode());
		bean.setCzdwmc(loginInfo.getOrgname());
		bean.setCzrxm(loginInfo.getRealname());
		bean.setCzsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss"));
		try {
			rkDao.delLxfs(bean);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void deleteRkfwInfo(String fwrkid) throws Exception {
		rkDao.deleteRkfwInfo(fwrkid);
	}

	@Override
	public void updateRkfwInfo(RkfwglBean rkfwBean) throws Exception {
		rkDao.updateRkfwInfo(rkfwBean);
	}

	@Override
	public LdrkxxBean queryLdrkBeanByRybhAndYxzt(String rybh) throws Exception {
		return rkDao.queryLdrkBeanByRybhAndYxzt(rybh);
	}

	@Override
	public CzrkxxBean queryCzrkInfoByCzrkbh(String czrkbh) throws Exception {
		return rkDao.queryCzrkInfoByCzrkbh(czrkbh);
	}

	@Override
	public JwrkxxBean queryJwrkInfoByJwbh(String jwbh) throws Exception {
		return rkDao.queryJwrkInfoByJwbh(jwbh);
	}

	@Override
	public JzrkxxBean queryJzrkInfoByJzbh(String jzbh) throws Exception {
		return rkDao.queryJzrkInfoByJzbh(jzbh);
	}

	@Override
	public RkwlczhkBean queryWlhrkInfoByWlhbh(String wlhbh) throws Exception {
		return rkDao.queryWlhrkInfoByWlhbh(wlhbh);
	}

	@Override
	public void recoveryRkfwInfo(RkfwglBean rkfwBean) throws Exception {
		rkDao.recoveryRkfwInfo(rkfwBean);
	}

	@Override
	public PageResultInfo<RkJbxxBean> queryRkZpPageResultInfo(
			PageInfo pageInfo, RkQueryBean queryBean) throws Exception
	{
		return rkDao.queryRkZpPageResultInfo(pageInfo, queryBean);
	}

	@Override
	public void saveRkzpxxBean(RkzpxxBean zpxxBean) throws Exception
	{
		List<RkzpxxBean> list = new ArrayList<RkzpxxBean>();
		list.add(zpxxBean);
		rkDao.insertRkzpxx(list);
	}

	@Override
	public List<RkzpxxBean> queryRkzpxxBeansByRybh(String rybh)
			throws Exception
	{
		return rkDao.queryRkzpxxBeansByRybh(rybh);
	}
	/**
	 * 根据人员编号查询计划生育信息
	 */
	@Override
	public RkJhsyBean queryJhsyBeanByRybh(String rybh) throws Exception {
		return rkDao.queryJhsyBeanByRybh(rybh);
	}

	@Override
	public List<LdrkxxBean> queryLdrkAllListByRkQueryBean(RkQueryBean queryBean)
	{
		return rkDao.queryLdrkAllListByRkQueryBean(queryBean);
	}

	@Override
	public List<LdrkxxBean> queryLdrkBeanListByLdrkids(String ldrkids)
	{
		return rkDao.queryLdrkBeanListByLdrkids(ldrkids);
	}

	@Override
	public RkJbxxBean queryRkxxBeanBysfzh(String sfzh) throws Exception {
		
		return rkDao.queryRkJbxxBeanBySfzh(sfzh);
	}

	@Override
	public RkJbxxBean queryHzRkJbxxByHH(String hh) throws Exception
	{
		return rkDao.queryHzRkJbxxByHH(hh);
	}

	@Override
	public List<CzrkxxBean> queryCzrkBeansByQueryBean(RkQueryBean queryBean) throws Exception
	{
		return rkDao.queryCzrkBeansByQueryBean(queryBean);
	}

	@Override
	public List<CzrkxxBean> queryCzrkBeansByczrkbhs(String czrkbhs) throws Exception
	{
		return rkDao.queryCzrkBeansByczrkbhs(czrkbhs);
	}

	@Override
	public List<JzrkxxBean> queryJzrkBeansByQueryBean(RkQueryBean queryBean) throws Exception
	{
		return rkDao.queryJzrkBeansByQueryBean(queryBean);
	}

	@Override
	public List<JzrkxxBean> queryJzrkBeansByczrkbhs(String czrkbhs) throws Exception
	{
		return rkDao.queryJzrkBeansByczrkbhs(czrkbhs);
	}
	
	
	@Override
	public PageResultInfo<RkfwglBean> queryRkfwglByRybh(String rybh,
			PageInfo pageInfo) throws Exception {
		return rkDao.queryRkfwglByRybh(rybh, pageInfo);
	}

	@Override
	public CzrkxxBean queryCzrkFwglInfoByCzrkbh(String bhs) {
		return rkDao.queryCzrkFwglInfoByCzrkbh(bhs);
	}

	@Override
	public JwrkxxBean queryJwrkFwglInfoByJwbh(String bhs) {
		return rkDao.queryJwrkFwglInfoByJwbh(bhs);
	}

	@Override
	public JzrkxxBean queryJzrkFwglInfoByJzbh(String bhs) {
		return rkDao.queryJzrkFwglInfoByJzbh(bhs);
	}

	@Override
	public LdrkxxBean queryLdrkFwglBeanByZzbh(String bhs) {
		return rkDao.queryLdrkFwglBeanByZzbh(bhs);
	}

	@Override
	public RkwlczhkBean queryWlhrkFwglInfoByWlhbh(String bhs) {
		return rkDao.queryWlhrkFwglInfoByWlhbh(bhs);
	}

	@Override
	public PageResultInfo<RkfwglBean> queryRkfwglBySfzh(String sfzh,
			PageInfo pageInfo) {
		return rkDao.queryRkFwGlBySfzh(sfzh,pageInfo);
	}

	/**
	 * 注销人口记录  （人员类别发生编号）
	 * @throws Exception 
	 */
	public void zxRkjlByRylbAndRybh(String rylb, String rybh) throws Exception {
		List<RkfwglBean>  list =  rkDao.queryJzxxListByRybh(rybh);
		if(list.size()>0){
			TransactionManager tm = null;
			try {
				tm = new TransactionManager();
				tm.begin();
				for (RkfwglBean rkfwglBean : list) {
					if(!rylb.equals(rkfwglBean.getRylb()))
					{
//						if(CommonFinalParams.RYLB_CZRK.equals(rkfwglBean.getRylb())){
//							CzrkxxBean czrkBean = new CzrkxxBean();
//							czrkBean.setCzrkbh(rkfwglBean.getRkid());
//							czrkBean.setZxsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss"));
//							czrkBean.setZxyy("人员类别发生变化,被动注销");
//							rkDao.logoutCzrkInfo(czrkBean);
//							rkDao.zxRkfwBean(rkfwglBean.getRkfwglid());
//						}else 
						if(CommonFinalParams.RYLB_LDRK.equals(rkfwglBean.getRylb())){
							LdrkxxBean ldrkBean = new LdrkxxBean();
							ldrkBean.setZzbh(rkfwglBean.getRkid());
							ldrkBean.setZxsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss"));
							ldrkBean.setZxyy("人员类别发生变化,被动注销");
							rkDao.logoutLdrkInfo(ldrkBean);
							rkDao.zxRkfwBean(rkfwglBean.getRkfwglid());
						}else if(CommonFinalParams.RYLB_JZRK.equals(rkfwglBean.getRylb())){
							JzrkxxBean jzrkBean = new JzrkxxBean();
							jzrkBean.setJzbh(rkfwglBean.getRkid());
							jzrkBean.setZxsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss"));
							jzrkBean.setZxyy("人员类别发生变化,被动注销");
							rkDao.logoutJzrkInfo(jzrkBean);
							rkDao.zxRkfwBean(rkfwglBean.getRkfwglid());
						}else if(CommonFinalParams.RYLB_JWRK.equals(rkfwglBean.getRylb())){
							JwrkxxBean jwrkBean = new JwrkxxBean();
							jwrkBean.setJwbh(rkfwglBean.getRkid());
							jwrkBean.setZxsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss"));
							jwrkBean.setZxyy("人员类别发生变化,被动注销");
							rkDao.logoutJwrkInfo(jwrkBean);
							rkDao.zxRkfwBean(rkfwglBean.getRkfwglid());
						}else if(CommonFinalParams.RYLB_WLHRK.equals(rkfwglBean.getRylb())){
							RkwlczhkBean wlhrkBean = new RkwlczhkBean();
							wlhrkBean.setWlhrkbh(rkfwglBean.getRkid());
							wlhrkBean.setZxsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss"));
							wlhrkBean.setZxyy("人员类别发生变化,被动注销");
							rkDao.logoutWlhrkInfo(wlhrkBean);
							rkDao.zxRkfwBean(rkfwglBean.getRkfwglid());
						}
					}
				}
				tm.commit();
			} 
			catch (TransactionException e) {
				tm.rollback();
				e.printStackTrace();
			}
		}
	}

	@Override
	public List<RkJbxxBean> querySyrkBeansByQueryBean(RkQueryBean queryBean)
			throws Exception {
		return rkDao.querySyrkBeansByQueryBean(queryBean);
	}

	@Override
	public List<RkJbxxBean> querySyrkBeanByrkids(String rkids) throws Exception {
		return rkDao.querySyrkBeanByrkids(rkids);
	}

	public List<RkJbxxBean> queryRkjbxxByRybhs(String rybhs)throws Exception {
		return rkDao.queryRkjbxxByRybhs(rybhs);
	}
	@Override
	public PageResultInfo<RkJbxxBean> queryCzrkInfoBeanBySfzh(
			PageInfo pageInfo, RkQueryBean queryBean)
	{
		PageResultInfo<RkJbxxBean> pageResult = null;
		try
		{
			pageResult = rkDao.querySyrkBeanByConditionForPageResultInfo(queryBean, pageInfo);
		}
		catch(Exception e)
		{
			e.printStackTrace();
			pageResult = new PageResultInfo<RkJbxxBean>();
		}
		return pageResult;
	}
	
	/**
	 * 先查本地再查远程
	 */
	@Override
	public CzrkxxBean queryCzrkInfoStBeanBySfzh(String sfzh) throws Exception
	{
		CzrkxxBean czrkInfo = rkDao.queryCzrkInfoBeanBySfzhFormSt(sfzh);
		if (czrkInfo == null)
		{
			OrgUserbusiness orgbusiness = new OrgUserbusiness();
			czrkInfo = orgbusiness.queryRyxxBean(sfzh);
		}
		return czrkInfo;
	}

	/**
	 * 先查本地再查远程
	 * @param sfzh
	 * @param usersfzh 调用人身份证号码
	 * @param realname 调用人真实姓名
	 * @param orgcode 机构代码
	 * @return
	 * @throws Exception
	 * @date Jan 10, 2015 12:35:02 PM
	 */
	public CzrkxxBean queryCzrkInfoStBeanBySfzhAndUserInfo(String sfzh,String usersfzh, String realname, String orgcode) throws Exception
	{
		CzrkxxBean czrkInfo = rkDao.queryCzrkInfoBeanBySfzhFormSt(sfzh);
		if (czrkInfo == null)
		{
			OrgUserbusiness orgbusiness = new OrgUserbusiness();
			czrkInfo = orgbusiness.queryRyxxBeanByUserInfo(sfzh, usersfzh, realname, orgcode);
		}
		return czrkInfo;
	}
	
	@Override
	public CzrkxxBean queryCzrkxxBeanByFwidAndSfzh(String sfzh, String fwid)
			throws Exception
	{
		return rkDao.queryCzrkxxBeanByFwidAndSfzh(sfzh, fwid);
	}
	
	public void saveCzrkxxInfo(RkxxBean rkBean) throws Exception
	{
		TransactionManager tm = null;
		try
		{
			tm = new TransactionManager();
			tm.begin();
			LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
			CzrkxxBean czrkBean = rkBean.getCzrkBean();
			String rkfwglid = czrkBean.getRkfwglid();
			rkBean.getRkfwglBean().setRkfwglid(rkfwglid);
			//保存人口房屋
			saveRkfwglBean(rkBean);
			
			czrkBean.setRkfwglid(rkBean.getRkfwglBean().getRkfwglid());
			czrkBean.setRybh(rkBean.getJbxxBean().getRybh());
			czrkBean.setSfzh(rkBean.getJbxxBean().getSfzh());
			czrkBean.setCzsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss"));
			if (loginInfo != null)
			{
				czrkBean.setCzrxm(loginInfo.getRealname());
				czrkBean.setCzdwdm(loginInfo.getOrgcode());
				czrkBean.setCzdwmc(loginInfo.getOrgname());
				czrkBean.setCzrsfzh(loginInfo.getSfzh());
				czrkBean.setSsgajgjgdm(loginInfo.getOrgcode().substring(0, 6)+ "000000");
				czrkBean.setSsgajgjgmc(DictionaryCacheHellper.getOrganizationOrgNameByCode(loginInfo.getOrgcode().substring(0, 6)+ "000000"));
				czrkBean.setSspcsdm(loginInfo.getOrgcode().substring(0, 8) + "0000");
				czrkBean.setSspcsmc(DictionaryCacheHellper.getOrganizationOrgNameByCode(loginInfo.getOrgcode().substring(0, 8)+ "0000"));
			}
			czrkBean.setHjdqh(rkBean.getJbxxBean().getHjdqh());
			czrkBean.setHjdxz(rkBean.getJbxxBean().getHjdxz());
			czrkBean.setRyzt("1");
			czrkBean.setHjdsssqbh(rkBean.getFwxxBean().getSssq());
			czrkBean.setXzzxz(rkBean.getFwxxBean().getDzmc());
			// 新增
			if (ValidateHelper.isEmptyString(czrkBean.getCzrkbh()))
			{
				czrkBean.setZxbs("1");
				czrkBean.setZxsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss"));
				String zxyy = "该人员已经被单位[" + czrkBean.getCzdwmc() + "]登记为常住人口,地址[" + czrkBean.getXzzxz() + "].";
				rkDao.zxCzrkxxBySfzh(czrkBean.getSfzh(), zxyy);
				
				czrkBean.setZxbs("0");
				czrkBean.setZxsj(null);
				czrkBean.setCzbs("1");	//操作标示新增
				czrkBean.setDjsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss"));
				if (loginInfo != null)
				{
					czrkBean.setDjdwdm(loginInfo.getOrgcode());
					czrkBean.setDjdwmc(loginInfo.getOrgname());
					czrkBean.setDjrxm(loginInfo.getRealname());
					czrkBean.setDjrsfzh(loginInfo.getSfzh());
				}
				String czrkbh = "";
				if (loginInfo != null)
				{
					czrkbh = CommonSequenceHelper.getCzrkbh(loginInfo.getOrgcode());
				}
				else
				{
					czrkbh = CommonSequenceHelper.getCzrkbh(czrkBean.getCzdwdm());
				}
				czrkBean.setCzrkbh(czrkbh);
				rkDao.insertCzrkxxBean(czrkBean);
			}
			//修改
			else
			{
				czrkBean.setCzbs("2");	//修改
				rkDao.updateCzrkxxBean(czrkBean);
			}
			tm.commit();
		}
		catch(Exception e)
		{
			e.printStackTrace();
			try
			{
				tm.rollback();
			}
			catch (RollbackException e1)
			{
			}
			throw new Exception("保存常住人口信息失败.");
		}
	}
	
	
	public void saveRkfwglBean(RkxxBean rkBean) throws Exception
	{
		LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
		RkfwglBean rkfwglBean = rkBean.getRkfwglBean();
		
		//保存房屋信息
		rkfwglBean.setRybh(rkBean.getJbxxBean().getRybh());
		rkfwglBean.setFwid(rkBean.getFwxxBean().getFwid());
		rkfwglBean.setDzid(rkBean.getFwxxBean().getDzid());
		rkfwglBean.setSfzh(rkBean.getJbxxBean().getSfzh());
	
		//查询以前的
		RkfwglBean fwgl_old = rkDao.queryRkFwGlByRybh(rkBean.getJbxxBean().getRybh());
		if(fwgl_old != null)
		{
			//如果房屋ID不同(地址发生改变)，注销原来的，新增新的
			if(!fwgl_old.getFwid().equals(rkfwglBean.getFwid()))
			{
				// 注销旧的人口房屋居住记录
				rkfwglBean.setBlsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd"));
				rkfwglBean.setZxsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss"));
				if (loginInfo != null)
				{
					rkfwglBean.setZxdwdm(loginInfo.getOrgcode());
					rkfwglBean.setZxdwmc(loginInfo.getOrgname());
					rkfwglBean.setZxmjxm(loginInfo.getRealname());
				}
				else
				{
					rkfwglBean.setZxdwdm(rkBean.getJbxxBean().getCzdwdm());
					rkfwglBean.setZxdwmc(rkBean.getJbxxBean().getCzdwmc());
					rkfwglBean.setZxmjxm(rkBean.getJbxxBean().getCzrxm());
				}
				rkfwglBean.setRkfwglid(fwgl_old.getRkfwglid());
				rkfwglBean.setZxbs("1");
				rkfwglBean.setZxyy("人员地址发生变更");
				rkDao.zxRkfwBean(rkfwglBean.getRkfwglid());
				
				//新增新的人口房屋居住记录
				String xzdm = DictionaryCacheHellper.getSystemParamenterValueByKey("current.xzdm");
				String rkfwglid = xzdm + CommonDBBaseHelper.getSequence(CommonConstant.DBNAME_SQJW, "seq_lsgl_fwrkid");
				rkfwglBean.setRzsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd"));
				rkfwglBean.setZxbs("0");
				rkfwglBean.setZxsj(null);
				rkfwglBean.setZxdwdm(null);
				rkfwglBean.setZxdwmc(null);
				rkfwglBean.setZxmjxm(null);
				rkfwglBean.setRkfwglid(rkfwglid);
				rkDao.insertFwRkGlBean(rkfwglBean);
				rkBean.setRkfwglBean(rkfwglBean);
			}
			else
			{
				rkBean.setRkfwglBean(fwgl_old);
			}
		}
		else
		{
			//新增新的人口房屋居住记录
			String rkfwglid = CommonDBBaseHelper.getSequence(CommonConstant.DBNAME_SQJW, "seq_lsgl_fwrkid");
			rkfwglBean.setRzsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd"));
			rkfwglBean.setZxbs("0");
			rkfwglBean.setRkfwglid(rkfwglid);
			rkfwglBean.setDjsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss"));
			rkDao.insertFwRkGlBean(rkfwglBean);
			rkBean.setRkfwglBean(rkfwglBean);
		}
	}

	@Override
	public LdrkxxBean queryLdrkxxBeanBySfzhAndFwid(String sfzh, String fwid) throws Exception
	{
		LdrkxxBean ldrkxxBean = rkDao.queryLdrkxxBeanBySfzhAndFwid(sfzh, fwid);
		if (ldrkxxBean == null)
		{
			ldrkxxBean = new LdrkxxBean();
		}
		return ldrkxxBean;
	}

	@Override
	public JzrkxxBean queryJzrkxxBeanBySfzhAndFwid(String sfzh, String fwid)
			throws Exception
	{
		
		return rkDao.queryJzrkxxBeanBySfzhAndFwid(sfzh, fwid);
	}

	@Override
	public RkwlczhkBean queryWlhrkxxBeanBySfzhAndFwid(String sfzh, String fwid)
			throws Exception
	{
		return rkDao.queryWlhrkxxBeanBySfzhAndFwid(sfzh, fwid);
	}
	
	public RkJbxxBean queryRkJbxxBeanByRybh(String rybh) throws Exception
	{
		return rkDao.queryRkJbxxBeanByRybh(rybh);
	}
	
	public String queryFwidByRkfwglid(String rkfwglid) throws Exception
	{
		return rkDao.queryFwidByRkfwglid(rkfwglid);
	}

	@Override
	public String getExistsRkBeanDzmc(String sfzh)
	{
		return rkDao.getExistsRkBeanDzmc(sfzh);
	}

	@Override
	public void converCzrkInfoToRkJbxx(CzrkxxBean czrkxxBean,
			RkJbxxBean jbxxBean)
	{
		if (jbxxBean != null && czrkxxBean != null)
		{
			if (ValidateHelper.isNotEmptyString(czrkxxBean.getXm()) && !czrkxxBean.getXm().equals(jbxxBean.getXm()))
			{
				jbxxBean.setXm(czrkxxBean.getXm());
			}
			if (ValidateHelper.isNotEmptyString(czrkxxBean.getXb()) && !czrkxxBean.getXb().equals(jbxxBean.getXb()))
			{
				jbxxBean.setXb(czrkxxBean.getXb());
			}
			if (ValidateHelper.isNotEmptyString(czrkxxBean.getMz()) && !czrkxxBean.getMz().equals(jbxxBean.getMz()))
			{
				jbxxBean.setMz(czrkxxBean.getMz());
			}
			if (ValidateHelper.isNotEmptyString(czrkxxBean.getHyzk()) && !czrkxxBean.getHyzk().equals(jbxxBean.getHyzk()))
			{
				jbxxBean.setHyzk(czrkxxBean.getHyzk());
			}
			if (ValidateHelper.isNotEmptyString(czrkxxBean.getBmch()) && !czrkxxBean.getBmch().equals(jbxxBean.getBmch()))
			{
				jbxxBean.setBmch(czrkxxBean.getBmch());
			}
			if (ValidateHelper.isNotEmptyString(czrkxxBean.getByzk()) && !czrkxxBean.getByzk().equals(jbxxBean.getByzk()))
			{
				jbxxBean.setByzk(czrkxxBean.getByzk());
			}
			if (ValidateHelper.isNotEmptyString(czrkxxBean.getWhcd()) && !czrkxxBean.getWhcd().equals(jbxxBean.getWhcd()))
			{
				jbxxBean.setWhcd(czrkxxBean.getWhcd());
			}
			if (ValidateHelper.isNotEmptyString(czrkxxBean.getZzmm()) && !czrkxxBean.getZzmm().equals(jbxxBean.getZzmm()))
			{
				jbxxBean.setZzmm(czrkxxBean.getZzmm());
			}
			if (ValidateHelper.isNotEmptyString(czrkxxBean.getHjdqh()) && !czrkxxBean.getHjdqh().equals(jbxxBean.getHjdqh()))
			{
				jbxxBean.setHjdqh(czrkxxBean.getHjdqh());
			}
			if (ValidateHelper.isNotEmptyString(czrkxxBean.getHjdxz()) && !czrkxxBean.getHjdqh().equals(jbxxBean.getHjdxz()))
			{
				jbxxBean.setHjdxz(czrkxxBean.getHjdxz());
			}
			if (ValidateHelper.isNotEmptyString(czrkxxBean.getSspcsmc()) && !czrkxxBean.getSspcsmc().equals(jbxxBean.getSspcsmc()))
			{
				jbxxBean.setSspcsmc(czrkxxBean.getSspcsmc());
			}
		}
	}

	@Override
	public PageResultInfo<RkgxrxxBean> queryGlgxrPageResultBySfzh(String sfzh, PageInfo pageInfo)
	{
		return rkDao.queryGlgxrPageResultBySfzh(sfzh, pageInfo);
	}
	
	
	/**
	 * 保存远程服务照片
	 * @filename LsglRkServiceImpl.java
	 * @author mingchun.xiong
	 * @date Nov 26, 2014
	 *
	 */
	class SaveRkZpThead implements Runnable
	{
		private RkxxBean rkBean;
		private LoginInfo loginInfo;
		
		
		public SaveRkZpThead(RkxxBean rkBean,LoginInfo loginInfo)
		{
			this.rkBean = rkBean;
			this.loginInfo = loginInfo;
		}
		@Override
		public void run()
		{
			saveRemoteZpxxTread(rkBean, loginInfo);
		}
	}
	
}
