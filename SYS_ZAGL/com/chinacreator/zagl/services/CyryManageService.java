package com.chinacreator.zagl.services;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.transaction.RollbackException;

import org.apache.commons.codec.binary.Base64;

import com.chinacreator.common.bean.LoginInfo;
import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.cps.constants.CommonFinalParams;
import com.chinacreator.common.cps.helper.ChineseSpellingHelper;
import com.chinacreator.common.cps.helper.CommonSequenceHelper;
import com.chinacreator.common.helper.ActionContextHelper;
import com.chinacreator.common.helper.CommonDBBaseHelper;
import com.chinacreator.common.helper.DateTimeHelper;
import com.chinacreator.common.helper.DictionaryCacheHellper;
import com.chinacreator.common.helper.ValidateHelper;
import com.chinacreator.lsgl.bean.JwrkxxBean;
import com.chinacreator.lsgl.bean.QGQLZdryInfoBean;
import com.chinacreator.lsgl.bean.RkzpxxBean;
import com.chinacreator.lsgl.dao.JwrkManageDao;
import com.chinacreator.lsgl.dao.LsglRkJbxxDao;
import com.chinacreator.lsgl.dao.impl.LsglRkJbxxDaoImpl;
import com.chinacreator.remote.business.RemoteRequestService;
import com.chinacreator.sydw.bean.CyryImportBean;
import com.chinacreator.zagl.bean.DwcyryBean;
import com.chinacreator.zagl.dao.CyryManageDao;
import com.chinacreator.zagl.query.CyryQueryBean;
import com.frameworkset.orm.transaction.TransactionManager;

public class CyryManageService
{
	private CyryManageDao cyryDao;
	private JwrkManageDao jwrkDao;
	private LsglRkJbxxDao rkDao;
	private RemoteRequestService remoteService;
	
	public CyryManageService()
	{
		cyryDao = new CyryManageDao();
		jwrkDao = new JwrkManageDao();
		rkDao = new LsglRkJbxxDaoImpl();
		remoteService = new RemoteRequestService();
	}
	
	public boolean saveCyryInfoBean(DwcyryBean cyryBean)
	{
		LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
		TransactionManager tm = new TransactionManager();
		try
		{
			tm.begin();
			if (loginInfo != null)
			{
				cyryBean.setDjdwdm(loginInfo.getOrgcode());
				cyryBean.setDjdwmc(loginInfo.getOrgname());
				cyryBean.setDjrjh(loginInfo.getUsername());
				cyryBean.setDjrsfzh(loginInfo.getSfzh());
				cyryBean.setDjrxm(loginInfo.getRealname());
				
				cyryBean.setCzdwdm(loginInfo.getOrgcode());
				cyryBean.setCzdwmc(loginInfo.getOrgname());
				cyryBean.setCzrjh(loginInfo.getUsername());
				cyryBean.setCzrsfzh(loginInfo.getSfzh());
				cyryBean.setCzrxm(loginInfo.getRealname());
				cyryBean.setSfdjsyrk("0");
				
				cyryBean.setSfabry(CommonConstant.FOU);
				
				//职务类别的父代码为"abry" 标识此从业人员为安保人员
				if(ValidateHelper.isNotEmptyString(cyryBean.getZw())){
					//SystemDictionaryBean dic = DictionaryCacheHellper.getSystemDictionaryBeanByZdlbAndDm("ZAGL_RY_ZW", cyryBean.getZw());
					if("02".equals(cyryBean.getZw())){
						cyryBean.setSfabry(CommonConstant.SHI);
					}
				}
				
				if("".equals(cyryBean.getSfjwry()) || null == cyryBean.getSfjwry()){
					cyryBean.setSfjwry(CommonConstant.FOU);
				}
			}
			
			if (ValidateHelper.isNotEmptyString(cyryBean.getLzsj()))
			{
				cyryBean.setZxbs("1");
				cyryBean.setZxrq(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss"));
				cyryBean.setZxyy("离职");
			}
			else
			{
				cyryBean.setZxbs("0");
				cyryBean.setZxrq(null);
				cyryBean.setZxyy(null);
			}
			//判断是否登记实有人口,如果人员已经登记实有人口，则进行自动反馈
			if (ValidateHelper.isNotEmptyString(cyryBean.getXzdjwq()))
			{
				//境外人员
				if ("1".equals(cyryBean.getSfjwry()) && ValidateHelper.isNotEmptyString(cyryBean.getRybh()))
				{
					JwrkxxBean jwrkBean = jwrkDao.queryJwrkInfoByRybhAndDjdwdm(cyryBean.getRybh(), cyryBean.getXzdjwq());
					if (jwrkBean != null)
					{
						cyryBean.setRybh(jwrkBean.getRybh());
						cyryBean.setFkrxm("系统自动反馈");
						cyryBean.setFkrjh("admin");
						cyryBean.setFkdwdm(cyryBean.getXzdjwq());
						cyryBean.setFkdwmc(cyryBean.getXzdjwqmc());
						cyryBean.setFksj(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss"));
						cyryBean.setFksj(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss"));
						cyryBean.setFknr("从业人员登记时系统自动反馈");
						cyryBean.setSfdjsyrk("1");//已经登记实有人口
						cyryBean.setSyrkdjsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss"));
					}
				}
				//非境外人员
				else if ("0".equals(cyryBean.getSfjwry()))
				{
					String rybh = rkDao.getExistsRkBeanOfRybh(cyryBean.getSfzh(), cyryBean.getXzdjwq());
					if (ValidateHelper.isNotEmptyString(rybh))
					{
						cyryBean.setRybh(rybh);
						cyryBean.setFkrxm("系统自动反馈");
						cyryBean.setFkrjh("admin");
						cyryBean.setFkdwdm(cyryBean.getXzdjwq());
						cyryBean.setFkdwmc(cyryBean.getXzdjwqmc());
						cyryBean.setFksj(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss"));
						cyryBean.setFknr("从业人员登记时系统自动反馈");
						cyryBean.setSfdjsyrk("1");//已经登记实有人口
						cyryBean.setSyrkdjsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss"));
					}
				}
			}
			//非境外人员保存人口基本信息
			if ("0".equals(cyryBean.getSfjwry()))
			{
				saveCyryJbxxBean(cyryBean);
			}
			
			//从业人员更新
			if (ValidateHelper.isNotEmptyString(cyryBean.getCyrybh()))
			{
				cyryDao.updateCyryBean(cyryBean);
			}
			//从业人员新增
			else
			{
				String cyrybh = null;
				if (loginInfo != null)
				{
					cyrybh = CommonSequenceHelper.getDWCYRYBH(loginInfo.getOrgcode());
				}
				else
				{
					cyrybh = CommonSequenceHelper.getDWCYRYBH(cyryBean.getDjdwdm());
				}
				cyryBean.setCyrybh(cyrybh);
				cyryDao.insertCyryBean(cyryBean);
			}
			tm.commit();
			return true;
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
			return false;
		}
	}
	
	/**
	 * 保存人口基本信息
	 */
	public void saveCyryJbxxBean(DwcyryBean jbxxBean) throws Exception
	{
		LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
		ChineseSpellingHelper finder = ChineseSpellingHelper.getInstance();
		finder.setResource(jbxxBean.getXm());
		jbxxBean.setXmpy(finder.getSpelling());
		jbxxBean.setRylb("1");
		jbxxBean.setRysx(CommonSequenceHelper.getRysx(jbxxBean.getSfzh(), "18", "I"));
		
		if (loginInfo != null)
		{
			jbxxBean.setCzdwdm(loginInfo.getOrgcode());
			jbxxBean.setCzdwmc(loginInfo.getOrgname());
			jbxxBean.setCzrjh(loginInfo.getUsername());
			jbxxBean.setCzrxm(loginInfo.getRealname());
			jbxxBean.setCzrsfzh(loginInfo.getSfzh());
			jbxxBean.setCzrxm(loginInfo.getRealname());
		}
		
		// 如果人员编号不为空，表示数据库存在人员基本信息 则更新
		if (ValidateHelper.isNotEmptyString(jbxxBean.getRybh()))
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
					rybh = CommonSequenceHelper.getRybh(loginInfo.getOrgcode());
				}
				else
				{
					rybh = CommonSequenceHelper.getRybh(jbxxBean.getCzdwdm());
				}
				jbxxBean.setRybh(rybh);
				rkDao.insertRkJbxxBean(jbxxBean);
			}
		}
		if (!CommonFinalParams.RYLB_WLHRK.equals(jbxxBean.getRylb()) && !CommonFinalParams.RYLB_JWRK.equals(jbxxBean.getRylb()))
		{
			//保存远程服务照片信息
			saveRemoteZpxx(jbxxBean);
		}
	}
	
	
	/**
	 * 保存远程服务照片
	 */
	public void saveRemoteZpxx(DwcyryBean jbxxBean)
	{
		LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
		try
		{
			int size = rkDao.getRemoteZpCount(jbxxBean.getSfzh());
			if (size == 0)
			{	
				String jpegStr = "";
				if (loginInfo != null)
				{
					jpegStr = remoteService.queryXpBySfzh(jbxxBean.getSfzh());
				}
				else
				{
					jpegStr = remoteService.queryXpBySfzhAndUserInfo(jbxxBean.getSfzh(), jbxxBean.getCzrsfzh(), jbxxBean.getCzrxm(), jbxxBean.getCzdwdm());
				}
				if (ValidateHelper.isNotEmptyString(jpegStr))
				{
					RkzpxxBean rkzpBean = new RkzpxxBean();
					String xzdm = DictionaryCacheHellper.getSystemParamenterValueByKey("current.xzdm");
					String zpid = CommonDBBaseHelper.getSequence(CommonConstant.DBNAME_SQJW,"seq_lsg_zpid");
					rkzpBean.setId(xzdm+zpid);
					rkzpBean.setRxfw("01"); //正面照
					if (loginInfo != null)
					{
						rkzpBean.setDjdwdm(loginInfo.getOrgcode());
						rkzpBean.setDjdwmc(loginInfo.getOrgname());
						rkzpBean.setDjrxm(loginInfo.getRealname());
						rkzpBean.setDjrsfzh(loginInfo.getSfzh());
					}
					else
					{
						rkzpBean.setDjdwdm(jbxxBean.getDjdwdm());
						rkzpBean.setDjdwmc(jbxxBean.getDjdwmc());
						rkzpBean.setDjrxm(jbxxBean.getDjrxm());
						rkzpBean.setDjrsfzh(jbxxBean.getDjrsfzh());
					}
					rkzpBean.setMs("远程服务照片");
					rkzpBean.setRybh(jbxxBean.getRybh());
					rkzpBean.setSfzh(jbxxBean.getSfzh());
					rkzpBean.setYcfwzp("1");
					rkzpBean.setZpbytes(Base64.decodeBase64(jpegStr.getBytes()));
					
					saveRkzpxxBean(rkzpBean);
					//删除临时文件
					//zpfile.delete();
				}
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	
	public void saveRkzpxxBean(RkzpxxBean zpxxBean) throws Exception
	{
		List<RkzpxxBean> list = new ArrayList<RkzpxxBean>();
		list.add(zpxxBean);
		rkDao.insertRkzpxx(list);
	}
	
	/**
	 * 查询单位从业人员
	 * @param queryBean
	 * @return
	 * @date Aug 19, 2014 3:55:42 PM
	 */
	public DwcyryBean queryDwCyryBeanByQueryBean(CyryQueryBean queryBean)
	{
		DwcyryBean cyryBean = null;
		try
		{
			cyryBean = cyryDao.queryDwCyryBeanByQueryBean(queryBean);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return cyryBean;
	}
	
	/**
	 * 更新从业人员反馈信息
	 * @param cyrybh
	 * @param rybh
	 * @date Aug 23, 2014 4:35:52 PM
	 */
	public void updateCyryDjFkxx(DwcyryBean cyryBean)
	{
		try
		{
			cyryDao.updateCyryDjFkxx(cyryBean);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	
	/**
	 * 插入导入从业人员
	 * @param cyryImportBeans
	 * @date Jan 4, 2015 6:08:07 PM
	 */
	public void saveImportCyryxx(List<CyryImportBean> cyryImportBeans) throws SQLException
	{
		if (ValidateHelper.isNotEmptyCollection(cyryImportBeans))
		{
			CyryImportBean existsCyryBean = null;
			for (CyryImportBean cyryBean : cyryImportBeans)
			{
				existsCyryBean = cyryDao.getImportCyryxx(cyryBean.getSfzh(), cyryBean.getJgbh());
				if (existsCyryBean != null)
				{
					cyryDao.updateImportCyryxx(cyryBean);
				}
				else
				{
					cyryDao.insertImportCyryxx(cyryBean);
				}
			}
		}
	}
	
	
	/**
	 * 查询重点人员从业人员
	 * @param importBean
	 * @param pageInfo
	 * @return
	 * @date Jan 6, 2015 10:48:01 AM
	 */
	public PageResultInfo<CyryImportBean> queryImportCyryZdryPageResult(CyryImportBean importBean, PageInfo pageInfo) throws Exception
	{
		return cyryDao.queryImportCyryZdryPageResult(importBean, pageInfo);
	}
	
	/**
	 * 查询导入从业人员
	 * @param importBean
	 * @param pageInfo
	 * @return
	 * @date Jan 6, 2015 10:48:01 AM
	 */
	public PageResultInfo<CyryImportBean> queryImportCyryPageResult(CyryImportBean importBean, PageInfo pageInfo) throws Exception
	{
		return cyryDao.queryImportCyryPageResult(importBean, pageInfo);
	}
	
	
	/**
	 * 查询核查导入人员
	 * @param importBean
	 * @param pageInfo
	 * @return
	 * @throws Exception
	 * @date Jan 7, 2015 2:26:23 PM
	 */
	public PageResultInfo<CyryImportBean> queryHcImportCyryPageResult(CyryImportBean importBean, PageInfo pageInfo) throws Exception
	{
		return cyryDao.queryHcImportCyryPageResult(importBean, pageInfo);
	}
	
	/**
	 * 检查重点人员
	 * @return
	 */
	public QGQLZdryInfoBean queryQgqlzdryBysfzh(String sfzh){
		try {
			return cyryDao.queryQGQLZdryBySfzh(sfzh);
				
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}
}
