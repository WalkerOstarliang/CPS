package com.chinacreator.xtgl.service;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.RollbackException;

import com.chinacreator.common.bean.LoginInfo;
import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.helper.ActionContextHelper;
import com.chinacreator.common.helper.CommonDBBaseHelper;
import com.chinacreator.common.helper.DictionaryCacheHellper;
import com.chinacreator.common.helper.PropertiesUtil;
import com.chinacreator.menu.bean.XttxpzBean;
import com.chinacreator.xtgl.bean.FwjcpzBean;
import com.chinacreator.xtgl.dao.FwjcpzDao;
import com.chinacreator.xtgl.query.FwjcpzQueryBean;
import com.frameworkset.orm.transaction.TransactionManager;

public class FwjcpzService {
	/**
	 * 分页查询房屋检查配置信息
	 * @param queryBean
	 * @param pageInfo
	 * @return
	 * @throws Exception
	 */
	public  PageResultInfo<FwjcpzBean> queryFwjcpzBeanPageInfo(FwjcpzQueryBean queryBean,PageInfo pageInfo) throws Exception{
		return FwjcpzDao.queryFwjcpzBeanPageInfo(queryBean, pageInfo);
	}
	
	/**
	 * 根据ID查询房屋检查Bean
	 * @param id
	 * @return
	 * @throws Exception
	 */
	public  FwjcpzBean queryFwjcpzBeanById(String id) throws Exception{
		return FwjcpzDao.queryFwjcpzBeanById(id);
	}
	
	/**
	 * 插入房屋检查Bean
	 * @param fwjcpzBean
	 * @throws Exception
	 */
	public  void insertFwjcpzBean(FwjcpzBean fwjcpzBean) throws RollbackException{
		String id=CommonDBBaseHelper.getSequence(CommonConstant.DBNAME_SQJW, "T_COMMON_FWJCPZ_ID");
		fwjcpzBean.setId(id);
		TransactionManager tm = null;
		try {
			tm=new TransactionManager();
			tm.begin();
			FwjcpzDao.insertFwjcpzBean(fwjcpzBean);
			insertXtpzBeanCzfwjc(getXxtxpzBean(fwjcpzBean));
			tm.commit();
		} catch (Exception e) {
			tm.rollback();
			e.printStackTrace();
		}
		
	}
	
	/**
	 * 更新房屋检查Bean  将操作标识 修改成2
	 * @param fwjcpzBean
	 * @throws Exception
	 */
	public  void updateFwjcpzBean(FwjcpzBean fwjcpzBean) throws Exception{
		TransactionManager tm=null;
		try {
			tm= new TransactionManager();
			tm.begin();
			FwjcpzDao.updateFwjcpzBean(fwjcpzBean);
			updateXtpzBeanCzfwjc(getXxtxpzBean(fwjcpzBean));
			tm.commit();
		} catch (Exception e) {
			tm.rollback();
			e.printStackTrace();
		}
		
	}
	
	/**
	 * 批量删除房屋检查Bean  将操作修改成3 
	 * @param beans
	 * @throws Exception
	 */
	public  void batchDelFwjcpzBean(String beans) throws Exception{
		List<FwjcpzBean> fwjcpzList = new ArrayList<FwjcpzBean>();
		LoginInfo loginfo = ActionContextHelper.getLoginInfo();
		for(String id : beans.split(",")){
			FwjcpzBean bean = new FwjcpzBean();
			bean.setId(id);
			bean.setCzrxm(loginfo.getRealname());
			bean.setCzdwmc(loginfo.getOrgname());
			bean.setCzdwdm(loginfo.getOrgcode());
			fwjcpzList.add(bean);
		}
		TransactionManager tm =null;
		try {
			tm = new TransactionManager();
			tm.begin();
			FwjcpzDao.batchDelFwjcpzBean(fwjcpzList);
			
			for (FwjcpzBean fwjcpzBean : fwjcpzList) {
				XttxpzBean xtpzBean =  new XttxpzBean();
				fwjcpzBean =queryFwjcpzBeanById(fwjcpzBean.getId());
				xtpzBean.setPzdm(fwjcpzBean.getFwzdlb());
				deleteXtpzBeanCzfwjc(xtpzBean);
			}
			tm.commit();
		} catch (Exception e) {
			tm.rollback();
		}
		
	}
	
	
	//插入系统配置
	public  void insertXtpzBeanCzfwjc(XttxpzBean xtpzBean) throws Exception{
		FwjcpzDao.insertXtpzBeanCzfwjc(xtpzBean);
	}
	
	public void updateXtpzBeanCzfwjc(XttxpzBean xtpzBean) throws Exception{
		FwjcpzDao.updateXtpzBeanCzfwjc(xtpzBean);
	}
	
	public void deleteXtpzBeanCzfwjc(XttxpzBean xtpzBean) throws Exception{
		FwjcpzDao.deletextpzBeanCzfwjc(xtpzBean);
	}
	
	public boolean  isExistPzdm(String pzdm) throws Exception{
		boolean flag=false;
		XttxpzBean xtpzBean = new XttxpzBean();
		xtpzBean=FwjcpzDao.queryXtpzBeanByPzdm(pzdm);
		if(xtpzBean!=null){
			flag=true;
		}
		return flag;
		
	}
	
	public XttxpzBean getXxtxpzBean(FwjcpzBean fwjcpzBean){
		StringBuffer description = new  StringBuffer();
		StringBuffer sql = new  StringBuffer();
		XttxpzBean xtpzBean= new XttxpzBean();
		String href = PropertiesUtil.getValue("czfwjcpz.href");
		String fwgllbmc = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("ZDY_FWZDGLLB", fwjcpzBean.getFwzdlb());
		//黄色一般户  //红色放心户  //绿色放心户
		description.append("出租房屋管理，【");
		description.append(fwgllbmc);
		description.append("】，房屋ID：【#[fwid]】, 房屋地址【#[dzmc]】，到期检查提醒，你上次检查时间为：【#[zhjcsj]】,");
		description.append("你还有【#[dqts]】天将到期,请按要求及时对对应房屋进行核实检查,检查周期为【#[jczq]】天。");
		sql.append(PropertiesUtil.getValue("czfwjcpz.sql"));
		sql.append(" and fwpz.fwzdlb = '"+fwjcpzBean.getFwzdlb()+"' and (f_get_fwmaxjcsj(fw.fwid) is null or (f_get_fwmaxjcsj(fw.fwid) + fwpz.jczq - trunc(sysdate, 'dd') <=fwpz.tqtxts))");
																    
		xtpzBean.setId(CommonDBBaseHelper.getSequence(CommonConstant.DBNAME_SQJW, "seq_common"));
		xtpzBean.setPzdm(fwjcpzBean.getFwzdlb());
		xtpzBean.setTitle("出租房屋("+fwgllbmc.substring(2, 5)+")");
		xtpzBean.setSql(sql.toString());
		xtpzBean.setHref(href);
		xtpzBean.setIsvalid("1");
		xtpzBean.setSetfield("orgcode");
		xtpzBean.setExecutesn("70");
		xtpzBean.setResultfield("fwid,fwbm,dzmc,jczq,zhjcsj,dqts");
		xtpzBean.setDescription(description.toString());
		xtpzBean.setIconpath("/systemico/default.png");
		return xtpzBean;
	}
	/**
	 * 插入系统配置参数(黄色)
	 * @param xtpzBean
	 * @throws Exception
	 */
	public  void insertXtpzBeanYellow(XttxpzBean xtpzBean) throws Exception{
		FwjcpzDao.insertXtpzBeanYellow(xtpzBean);
	}
	/**
	 * 插入系统配置参数(绿色)
	 * @param xtpzBean
	 * @throws Exception
	 */
	public  void insertXtpzBeanGreen(XttxpzBean xtpzBean) throws Exception{
		FwjcpzDao.insertXtpzBeanGreen(xtpzBean);
	}
	/**
	 * 插入系统配置参数(红色)
	 * @param xtpzBean
	 * @throws Exception
	 */
	public  void insertXtpzBeanRed(XttxpzBean xtpzBean) throws Exception{
		FwjcpzDao.insertXtpzBeanRed(xtpzBean);
	}
}
