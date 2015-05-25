package com.chinacreator.lsgl.services.impl;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.transaction.RollbackException;

import com.chinacreator.common.bean.LoginInfo;
import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.cps.bean.RkJbxxBean;
import com.chinacreator.common.helper.ActionContextHelper;
import com.chinacreator.common.helper.CommonDBBaseHelper;
import com.chinacreator.common.helper.DateTimeHelper;
import com.chinacreator.common.helper.DictionaryCacheHellper;
import com.chinacreator.common.helper.ValidateHelper;
import com.chinacreator.lsgl.bean.FatjBean;
import com.chinacreator.lsgl.bean.JzzTjBean;
import com.chinacreator.lsgl.bean.LdrkJzzxxBean;
import com.chinacreator.lsgl.bean.LdrkTjBean;
import com.chinacreator.lsgl.bean.LdrkxxBean;
import com.chinacreator.lsgl.bean.RkzpxxBean;
import com.chinacreator.lsgl.bean.RsdfxBean;
import com.chinacreator.lsgl.dao.LsglLdrkJzzxxDao;
import com.chinacreator.lsgl.dao.LsglRkJbxxDao;
import com.chinacreator.lsgl.dao.impl.LsglLdrkJzzxxDaoImpl;
import com.chinacreator.lsgl.dao.impl.LsglRkJbxxDaoImpl;
import com.chinacreator.lsgl.query.JzzQueryBean;
import com.chinacreator.lsgl.query.TjQueryBean;
import com.chinacreator.lsgl.services.LsglLdrkJzzxxService;
import com.frameworkset.orm.transaction.TransactionManager;

public class LsglLdrkJzzxxServiceImpl implements LsglLdrkJzzxxService
{
	private LsglLdrkJzzxxDao dao;
	private LsglRkJbxxDao rkDao;
	public LsglLdrkJzzxxServiceImpl(){
		dao = new LsglLdrkJzzxxDaoImpl();
		rkDao =  new LsglRkJbxxDaoImpl();
	}
	public LdrkJzzxxBean insertJzzxxBean(LdrkJzzxxBean jzzxxBean) throws Exception 
	{
		TransactionManager tm =null;
		tm = new TransactionManager();
		try 
		{
			tm.begin();
			String xzdm = DictionaryCacheHellper.getSystemParamenterValueByKey("current.xzdm");
			String jzzxxbh = xzdm+CommonDBBaseHelper.getSequence(CommonConstant.DBNAME_SQJW, "SEQ_LSGL_LDRKJZZXX_BH");
			jzzxxBean.setJzzxxbh(jzzxxbh);
			LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
			jzzxxBean.setDjr(loginInfo.getUsername());
			jzzxxBean.setDjrxm(loginInfo.getRealname());
			jzzxxBean.setDjdw(loginInfo.getOrgcode());
			jzzxxBean.setDjdwmc(loginInfo.getOrgname());
			jzzxxBean.setDjsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss"));
			jzzxxBean.setDjrsfzh(loginInfo.getSfzh());
			//注销标识
			if(ValidateHelper.isNotEmptyString(jzzxxBean.getJzzzxsj())){
				jzzxxBean.setJzzzxbs("1");
				jzzxxBean.setJzzdyzt("30");
			}else{
				jzzxxBean.setJzzzxbs("0");
				jzzxxBean.setJzzdyzt("10");
			}
			dao.insertJzzxxBean(jzzxxBean);
			
			//跟新流动人口的签发日期  拟居日期
			LdrkxxBean ldrkBean = new LdrkxxBean();
			//签发日期
			//ldrkBean.setZzzqfrq(jzzxxBean.getFzrq());
			ldrkBean.setZzbh(jzzxxBean.getZzbh());
			
			String  fzrq=jzzxxBean.getFzrq();
			String  yxqx=jzzxxBean.getYxqx();
			String njzrq = getNjzrq(fzrq,yxqx);
			//ldrkBean.setNjzrq(njzrq);
			ldrkBean.setZzzbh(jzzxxBean.getJzzxxbh());
			ldrkBean.setZzzyxqjzrq(njzrq);
			rkDao.updateLdrkxxJzzxxBean(ldrkBean);
			tm.commit();
		} 
		catch (Exception e) 
		{
			try
			{
				tm.rollback();
			}
			catch(RollbackException e1)
			{
			}
			e.printStackTrace();
			throw new Exception("插入居住证信息失败.");
		}
		return jzzxxBean;
	}

	public LdrkJzzxxBean queryJzzxxBeanByRybh(String rybh) throws Exception {
		return dao.queryJzzxxBeanByRybh(rybh);
	}
	public PageResultInfo<LdrkJzzxxBean> queryJzzxxPageByRybh(String rybh,
			PageInfo pageInfo) throws Exception {
		return dao.queryJzzxxPageByRybh(rybh, pageInfo);
	}
	
	public LsglLdrkJzzxxDao getDao() {
		return dao;
	}
	public void setDao(LsglLdrkJzzxxDao dao) {
		this.dao = dao;
	}
	public LdrkJzzxxBean updateJzzxxBean(LdrkJzzxxBean jzzxxBean)
			throws Exception {
		TransactionManager tm =null;
		try {
			tm =  new TransactionManager();
			tm.begin();
			LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
			jzzxxBean.setXgr(loginInfo.getUsername());
			jzzxxBean.setXgrxm(loginInfo.getRealname());
			jzzxxBean.setXgdw(loginInfo.getOrgcode());
			jzzxxBean.setXgdwmc(loginInfo.getOrgname());
			jzzxxBean.setXgsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss"));
			jzzxxBean.setXgrsfzh(loginInfo.getSfzh());
			if(ValidateHelper.isNotEmptyString(jzzxxBean.getJzzzxsj())){
				jzzxxBean.setJzzzxbs("1");
				jzzxxBean.setJzzdyzt("30");
			}else{
				jzzxxBean.setJzzzxbs("0");
				jzzxxBean.setJzzdyzt("10");
			}
			dao.updateJzzxxBean(jzzxxBean);
			
			//跟新流动人口的签发日期  拟居日期
			LdrkxxBean ldrkBean = new LdrkxxBean();
			//签发日期
	//		ldrkBean.setZzzqfrq(jzzxxBean.getFzrq());
			ldrkBean.setZzbh(jzzxxBean.getZzbh());
			String  fzrq=jzzxxBean.getFzrq();
			String  yxqx=jzzxxBean.getYxqx();
			String njzrq = getNjzrq(fzrq,yxqx);
	//		ldrkBean.setNjzrq(njzrq);
			ldrkBean.setZzzbh(jzzxxBean.getJzzxxbh());
			ldrkBean.setZzzyxqjzrq(njzrq);
			rkDao.updateLdrkxxJzzxxBean(ldrkBean);
			tm.commit();
		} catch (Exception e) {
			e.printStackTrace();
			try
			{
				tm.rollback();
			}
			catch(RollbackException e1)
			{
			}
			throw new Exception("更新居住证信息失败.");
		}
		
		
		return jzzxxBean;
	}
	public String getNjzrq(String fzrq,String yxqx){
		String njzrq =null;
		Date fzrqDate = DateTimeHelper.convertToDate(fzrq,"yyyy-MM-dd");
		if(fzrqDate != null){
			if("1".equals(yxqx)){
				njzrq = DateTimeHelper.conver(DateTimeHelper.addMonths(fzrqDate,6),"yyyy-MM-dd");
			}else if("2".equals(yxqx)){
				njzrq = DateTimeHelper.conver(DateTimeHelper.addYears(fzrqDate, 1),"yyyy-MM-dd");
			}else if("3".equals(yxqx)){
				njzrq = DateTimeHelper.conver(DateTimeHelper.addYears(fzrqDate,2),"yyyy-MM-dd");
			}else if("4".equals(yxqx)){
				njzrq = DateTimeHelper.conver(DateTimeHelper.addYears(fzrqDate,3),"yyyy-MM-dd");
			}else if("5".equals(yxqx)){
				njzrq = DateTimeHelper.conver(DateTimeHelper.addYears(fzrqDate,4),"yyyy-MM-dd");
			}else if("6".equals(yxqx)){
				njzrq = DateTimeHelper.conver(DateTimeHelper.addYears(fzrqDate,5),"yyyy-MM-dd");
			}
		}
		return njzrq;
	}
	/**
	 * 插入照片信息
	 */
	public void saveRkZpxx(RkzpxxBean zpxxBean) throws Exception {
		List<RkzpxxBean> rkzpxxBeans = new ArrayList<RkzpxxBean>();
		rkzpxxBeans.add(zpxxBean);
		rkDao.insertRkzpxx(rkzpxxBeans);
	}
	public PageResultInfo<LdrkJzzxxBean> queryJzzxxBeanPageInfo(JzzQueryBean queryBean, PageInfo pageInfo) throws Exception 
	{
		return dao.queryJzzxxBeanPageInfo(queryBean, pageInfo);
	}
	
	public List<LdrkJzzxxBean> queryJzzxxList(JzzQueryBean queryBean){
		try{
			return dao.queryJzzxxList(queryBean);
		}catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	/**
	 * 首次打印
	 */
	public void updateJzzxxBeanDyZt(LdrkJzzxxBean jzzxxBean)
	{
		TransactionManager tm = null;
		try
		{
			//居住状态更新
			tm = new TransactionManager();
			tm.begin();
			LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
			jzzxxBean.setXgr(loginInfo.getUsername());
			jzzxxBean.setXgrxm(loginInfo.getRealname());
			jzzxxBean.setXgdw(loginInfo.getSfzh());
			jzzxxBean.setXgdw(loginInfo.getOrgcode());
			jzzxxBean.setXgdwmc(loginInfo.getOrgname());
			jzzxxBean.setZzdwdm(loginInfo.getOrgcode());
			jzzxxBean.setZzdwmc(loginInfo.getOrgname());
			
			//注销当前人员原来的居住证
			//dao.zxLdrkJzzxx(jzzxxBean.getJzzrybh());
			
			//更新居住证状态为制证状态
			dao.updateJzzxxBeanDyZt(jzzxxBean);
			tm.commit();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	@Override
	public List<LdrkTjBean> queryLdrkTjBean(JzzQueryBean queryBean)
			throws Exception {
		return dao.queryLdrkTjBean(queryBean);
	}
	
	public PageResultInfo<LdrkxxBean> queryLdrkZhQueryPageResult(JzzQueryBean queryBean, PageInfo pageInfo) throws Exception
	{
		return dao.queryLdrkZhQueryPageResult(queryBean, pageInfo);
	}
	@Override
	public List<FatjBean> queryFatjBean(TjQueryBean tjqueryBean)
			throws Exception {
		return dao.queryFatjBean(tjqueryBean);
	}
	@Override
	public PageResultInfo<RsdfxBean> queryRsdfxBeansPageResult(
			JzzQueryBean queryBean, PageInfo pageInfo) throws Exception
	{
		if(ValidateHelper.isEmptyString(queryBean.getOrgLeve())){
			queryBean.setOrgLeve("2");
		}
		if(ValidateHelper.isEmptyString(queryBean.getParentCode())){
			queryBean.setParentCode("430000000000");
		}
		return dao.queryRsdfxBeansPageResult(queryBean, pageInfo);
	}
	
	@Override
	public List<JzzTjBean> queryJzztjBeanList(JzzQueryBean queryBean){
		try{
			return dao.queryJzztjBeanList(queryBean);
		}catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}
	@Override
	public LdrkJzzxxBean saveJzzxxBean(LdrkJzzxxBean jzzxxBean)
	{
		try 
		{
			if(ValidateHelper.isEmptyString(jzzxxBean.getJzzxxbh()))
			{
				return insertJzzxxBean(jzzxxBean);
			}
			else
			{
				return updateJzzxxBean(jzzxxBean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}


	@Override
	public LdrkJzzxxBean queryJzzxxBeanByZzbh(String zzbh)
	{
		try
		{
			return dao.queryJzzxxBeanByZzbh(zzbh);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return null;
	}
	
	
	@Override
	public PageResultInfo<LdrkJzzxxBean> queryJzzxxPageByZzbh(String zzbh, PageInfo pageInfo)
	{
		try
		{
			return dao.queryJzzxxPageByZzbh(zzbh, pageInfo);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return null;
	}
	@Override
	public void zxJzzxxBean(String jzzxxbh)
	{
		try
		{
			dao.zxJzzxxBean(jzzxxbh);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	@Override
	public LdrkJzzxxBean queryJzzxxBeanByJzzbh(String jzzbh)
	{
		try
		{
			return dao.queryJzzxxBeanByJzzbh(jzzbh);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return null;
	}
	@Override
	public void czcdysbdInsertJzzxxBean(LdrkJzzxxBean jzzxxBean)
	{
		TransactionManager tm = null;
		try
		{
			tm = new TransactionManager();
			tm.begin();
			LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
			String xzdm = DictionaryCacheHellper.getSystemParamenterValueByKey("current.xzdm");
			String jzzxxbh = xzdm+CommonDBBaseHelper.getSequence(CommonConstant.DBNAME_SQJW, "SEQ_LSGL_LDRKJZZXX_BH");
			jzzxxBean.setJzzxxbh(jzzxxbh);
			jzzxxBean.setJzzdyzt("20");
			jzzxxBean.setJzzzxbs("0");
			jzzxxBean.setJzzzxsj(null);
			jzzxxBean.setZzdwdm(loginInfo.getOrgcode());
			jzzxxBean.setZzdwmc(loginInfo.getOrgname());
			jzzxxBean.setZzsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss"));
			
			//注销原来的居住信息
			dao.zxLdrkJzzxx(jzzxxBean.getJzzrybh());
			
			//插入新的居住证
			dao.insertJzzxxBean(jzzxxBean);
			
			//跟新流动人口的签发日期  拟居日期
			LdrkxxBean ldrkBean = new LdrkxxBean();
			//签发日期
			ldrkBean.setZzbh(jzzxxBean.getZzbh());
			String  fzrq=jzzxxBean.getFzrq();
			String  yxqx=jzzxxBean.getYxqx();
			String njzrq = getNjzrq(fzrq,yxqx);
			ldrkBean.setZzzbh(jzzxxBean.getJzzxxbh());
			ldrkBean.setZzzyxqjzrq(njzrq);
			rkDao.updateLdrkxxJzzxxBean(ldrkBean);
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
		}
	}
	
	@Override
	public RkJbxxBean queryRkJbxxBeanByRybh(String rybh)
	{
		try
		{
			return dao.queryRkJbxxBeanByRybh(rybh);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return null;
	}
	@Override
	public LdrkxxBean getLdrkShorBeanInfo(String zzbh)
	{
		try
		{
			return dao.getLdrkShorBeanInfo(zzbh);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return null;
	}
}
