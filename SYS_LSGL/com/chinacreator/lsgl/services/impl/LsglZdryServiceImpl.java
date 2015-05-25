package com.chinacreator.lsgl.services.impl;

import java.sql.SQLException;
import java.util.List;

import javax.transaction.RollbackException;

import com.chinacreator.common.bean.LoginInfo;
import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.cps.helper.CommonSequenceHelper;
import com.chinacreator.common.helper.ActionContextHelper;
import com.chinacreator.common.helper.CommonDBBaseHelper;
import com.chinacreator.common.helper.DateTimeHelper;
import com.chinacreator.common.helper.DictionaryCacheHellper;
import com.chinacreator.common.helper.ValidateHelper;
import com.chinacreator.lsgl.bean.QGQLZdryInfoBean;
import com.chinacreator.lsgl.bean.ZdryGzdxBean;
import com.chinacreator.lsgl.bean.ZdryGzryxxBean;
import com.chinacreator.lsgl.bean.ZdryJsbrzsxxBean;
import com.chinacreator.lsgl.bean.ZdryJsbxBean;
import com.chinacreator.lsgl.bean.ZdryJzdxxxBean;
import com.chinacreator.lsgl.bean.ZdryPfxxBean;
import com.chinacreator.lsgl.bean.ZdrySwryBean;
import com.chinacreator.lsgl.bean.ZdrySwrysfjlBean;
import com.chinacreator.lsgl.bean.ZdryTgxxBean;
import com.chinacreator.lsgl.bean.ZdryThBean;
import com.chinacreator.lsgl.bean.ZdryWffzjlBean;
import com.chinacreator.lsgl.bean.ZdryXdchNjxxBean;
import com.chinacreator.lsgl.bean.ZdryXdryxxBean;
import com.chinacreator.lsgl.bean.ZdryXsbxBean;
import com.chinacreator.lsgl.dao.LsglZdryJbxxDao;
import com.chinacreator.lsgl.dao.ZdryGzdxDao;
import com.chinacreator.lsgl.dao.impl.LsglZdryJbxxDaoImpl;
import com.chinacreator.lsgl.dao.impl.ZdryGzdxDaoImpl;
import com.chinacreator.lsgl.query.RkQueryBean;
import com.chinacreator.lsgl.services.LsglZdryService;
import com.frameworkset.orm.transaction.TransactionManager;
/**
 * 重点对象 服务实现层
 * @author zhun.liu
 *
 */
public class  LsglZdryServiceImpl implements LsglZdryService {
	private LsglZdryJbxxDao dao;
	private ZdryGzdxDao gzdxDao;
	
	public LsglZdryServiceImpl(){
		dao=new LsglZdryJbxxDaoImpl();
		gzdxDao=new ZdryGzdxDaoImpl();
	}
	
	/**
	 * 分页查询重点
	 * 人员关注对象
	 */
	public PageResultInfo<ZdryGzdxBean> queryZdryGzdxPageResult(
			RkQueryBean queryBean, PageInfo pageInfo)
	{
		try 
		{
			return dao.queryZdryGzdxPageResult(queryBean, pageInfo);
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
			return null;
		}
	}
	
	public PageResultInfo<ZdryGzdxBean> queryWrlZdryGzdxPageResult(
			RkQueryBean queryBean, PageInfo pageInfo) throws Exception {
		LoginInfo login = ActionContextHelper.getLoginInfo();
		if("5".equals(login.getLeve())){
			queryBean.setJwsqdm(login.getOrgcode());
		}
		return dao.queryWrlZdryGzdxPageResult(queryBean, pageInfo);
	}
	
	
	/**
	 * 判断身份证号码是否存在
	 */
	public boolean isExistSfzhm(String sfzhm) throws Exception {
		return dao.isExistSfzh(sfzhm);
	}
	
	/**
	 * 插入重点人员信息
	 */
	public ZdryGzdxBean insertZdryGzdxInfo(ZdryGzdxBean zdryBean) throws Exception {
		if(ValidateHelper.isNotEmptyString(zdryBean.getGzdxbh()))
		{
			zdryBean.setBjsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss"));
			 return dao.updateZdryGzdxInfo(zdryBean);
		}
		else
		{
			LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
			String gzdxbh=CommonSequenceHelper.getZdrybh(loginInfo.getOrgcode());
			zdryBean.setGzdxbh(gzdxbh);
			return dao.insertZdryGzdxInfo(zdryBean);
		}
		
	}
	
	/**
	 * 查询重点人员工作对象根据身份证号
	 */
	public ZdryGzdxBean queryGzdxBeanBySfzh(String sfzh) throws Exception {
		return dao.queryZdryGzdxBysfzh(sfzh); 
	}

	/**
	 * 插入或更新违法犯罪信息
	 */
	public ZdryWffzjlBean insertZdryWffzjlInfo(ZdryWffzjlBean wffzjlBean)
			throws Exception {
		LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
		wffzjlBean.setCzrxm(loginInfo.getRealname());
		wffzjlBean.setCzrsfzh(loginInfo.getSfzh());
		wffzjlBean.setCzdwdm(loginInfo.getOrgcode());
		wffzjlBean.setCzdwmc(loginInfo.getOrgname());
		if(ValidateHelper.isEmptyString(wffzjlBean.getId())){
			String id = CommonDBBaseHelper.getSequence(CommonConstant.DBNAME_SQJW, "SEQ_ZDRY_WFFZJL");
			wffzjlBean.setId(id);
			wffzjlBean.setCzbs(CommonConstant.CZBZ_ADD);
			return dao.insertZdryWffzjlBean(wffzjlBean);
		}else{
			//修改时间
			dao.updateZdryGzdxBgsj(wffzjlBean.getSfzh());
			wffzjlBean.setCzbs(CommonConstant.CZBZ_UPDATE);
			return updateZdryWffzjlInfo(wffzjlBean);
		}
	}
	
	public ZdryGzdxBean queryZdryGzdxDetailInfoBySfzh(String sfzh)
			throws Exception {
		return dao.queryZdryGzdxBysfzh(sfzh);
	}

	public PageResultInfo<ZdryWffzjlBean> queryZdryWffzjlPageResult(
			String rybh, PageInfo pageInfo) throws Exception {
		return dao.queryZdryWffzjbPageInfo(rybh, pageInfo);
	}

	public ZdryGzdxBean updateZdryGzdxInfo(ZdryGzdxBean zdryBean)
			throws Exception {
		return dao.updateZdryGzdxInfo(zdryBean);
	}

	public ZdryWffzjlBean updateZdryWffzjlInfo(ZdryWffzjlBean wffzjlBean)
			throws Exception {
		return dao.updateZdryWffzjlBean(wffzjlBean);
	}
	
	/**
	 * 判断身份证是否存在重点人员工作对象表
	 */
	public ZdryGzdxBean getExistSfzhInZdryGzdx(String sfzh) throws Exception 
	{
		ZdryGzdxBean bean = dao.getZdryGzdxBySfzh(sfzh);
		return bean;
	}

	
	
	/**.
	 * 保存 重点人员工作对象  矫正 精神 吸毒 涉稳  关注。。
	 */
	public ZdryGzdxBean saveZdryGzdx(ZdryGzdxBean zdryBean, String dxlb) throws Exception {
		LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
		//矫正对象
		if("2".equals(dxlb)){
			ZdryJzdxxxBean jzdxBean = zdryBean.getJzdxBean();
			if(ValidateHelper.isEmptyString(jzdxBean.getJzdxbh())){
				String jzdxbh = CommonSequenceHelper.getZdryGzdxbh(loginInfo.getOrgcode().substring(0, 6), "SEQ_ZDRY_GZDX_JZDX");
				jzdxBean.setJzdxbh(jzdxbh);
				gzdxDao.insertZdryJzdxInfo(jzdxBean);
			}else{
				
				gzdxDao.updateZdryJzdxInfo(jzdxBean);
				//修改时间
				dao.updateZdryGzdxBgsj(jzdxBean.getSfzh());
			}
		}else if("3".equals(dxlb)){
			ZdryGzryxxBean gzryxxBean = zdryBean.getGzryBean();
			if(ValidateHelper.isEmptyString(gzryxxBean.getGzrybh())){
				String gzrybh = CommonSequenceHelper.getZdryGzdxbh(loginInfo.getOrgcode().substring(0, 6), "SEQ_ZDRY_GZDX_GZRY");
				gzryxxBean.setGzrybh(gzrybh);
				gzdxDao.insertZdryGzryInfo(gzryxxBean);
			}else{
				
				gzdxDao.updateZdryGzryInfo(gzryxxBean);
				//修改时间
				dao.updateZdryGzdxBgsj(gzryxxBean.getSfzh());
			}
		}else if(CommonConstant.ZDRY_SDRY.equals(dxlb)){
			ZdryXdryxxBean xdryxxBean = zdryBean.getXdryBean();
			if(ValidateHelper.isEmptyString(xdryxxBean.getXdrybh())){
				String xdrybh =CommonSequenceHelper.getZdryGzdxbh(loginInfo.getOrgcode().substring(0, 6), "SEQ_ZDRY_GZDX_XDRY");
				xdryxxBean.setXdrybh(xdrybh);
				gzdxDao.insertZdryXdryInfo(xdryxxBean);
			}else{
				
				gzdxDao.updateZdryXdryInfo(xdryxxBean);
				//修改时间
				dao.updateZdryGzdxBgsj(xdryxxBean.getSfzh());

			}
			
		}

		//精神病人
		if(CommonConstant.ZDRY_JSBR.equals(dxlb)){
			ZdryJsbxBean  jsbrBean=zdryBean.getJsbrBean();
			if(ValidateHelper.isEmptyString(jsbrBean.getJsbrbh())){
				//新增
				String jsbrbh=CommonSequenceHelper.getZdryGzdxbh(loginInfo.getOrgcode().substring(0, 6), "SEQ_ZDRY_GZDX_JSBR");
				jsbrBean.setJsbrbh(jsbrbh);
				gzdxDao.insertZdryJsbrBean(jsbrBean);
			}else{
				//修改
				//修改时间
				gzdxDao.updateZdryJsbrBean(jsbrBean);
				dao.updateZdryGzdxBgsj(jsbrBean.getSfzh());

			}
		}
		//涉稳人员
		if(CommonConstant.ZDRY_SWRY.equals(dxlb)){
			ZdrySwryBean swryBean=zdryBean.getSwryBean();
			if(ValidateHelper.isEmptyString((swryBean.getSwrybh()))){
				//新增
				String swrybh=CommonSequenceHelper.getZdryGzdxbh(loginInfo.getOrgcode().substring(0, 6), "SEQ_ZDRY_GZDX_SWRY");
				swryBean.setSwrybh(swrybh);
				gzdxDao.insertZdrySwryBean(swryBean);
			}else{
				//修改
				gzdxDao.updateZdrySwryBean(swryBean);
				//修改时间
				dao.updateZdryGzdxBgsj(swryBean.getSfzh());
			}
		}
		return zdryBean;
	}
	
	/**
	 * 根据工作对象编号查询精神病人详情
	 */
	public ZdryJsbxBean queryJsbrBeanByGzdxbh(String gzdxbh) throws Exception {
		return gzdxDao.queryZdryJsbrByGzdxbh(gzdxbh);
	}
	
	/**
	 * 根据身份证号查询涉稳人员
	 */
	public ZdrySwryBean querySwryBeanBySfzh(String sfzh) throws Exception {
		return gzdxDao.queryZdrySwryBeanBySfzh(sfzh);
	}
	
	/**
	 * 保存重点人员工作对象的活动信息  如：精神病人的精神病人肇事信息
	 * 								  涉稳人员的上访记录
	 * 								  吸毒人员的尿检信息
	 * 									.....
	 * @param zdryBean
	 * @param dxlb
	 * @throws Exception
	 */
	public void saveZdryGzdxActivityInfo(ZdryGzdxBean zdryBean, String dxlb) throws Exception {
		//精神病人
		if(CommonConstant.ZDRY_JSBR.equals(dxlb)){
			ZdryJsbrzsxxBean jsbrzsBean=zdryBean.getJsbrzsBean();
			if(ValidateHelper.isEmptyString((jsbrzsBean.getId()))){
				String id=CommonDBBaseHelper.getSequence(CommonConstant.DBNAME_SQJW, "SEQ_ZDRY_GZDX_JSBRZSXX_ID");
				jsbrzsBean.setId(id);
				gzdxDao.insertZdryJsbrzsxxBean(jsbrzsBean);
			}else{
				gzdxDao.updateZdryJsbrzsxxBean(jsbrzsBean);
				
			}
			//修改变更时间
			if(ValidateHelper.isNotEmptyString(jsbrzsBean.getJsbrbh())){
				ZdryJsbxBean jsbrBean=gzdxDao.queryZdryJsbrBeanByJsbrbh(jsbrzsBean.getJsbrbh());
				dao.updateZdryGzdxBgsj(jsbrBean.getSfzh());
			}
		}
		//涉稳人员
		if(CommonConstant.ZDRY_SWRY.equals(dxlb)){
			ZdrySwrysfjlBean swrysfjlBean=zdryBean.getSwrysfjlBean();
			if(ValidateHelper.isEmptyString(swrysfjlBean.getId())){
				String id=CommonDBBaseHelper.getSequence(CommonConstant.DBNAME_SQJW, "SEQ_ZDRY_GZDX_SWRYSFJL_ID");
				swrysfjlBean.setId(id);
				gzdxDao.insertZdrySwrySfjlBean(swrysfjlBean);
			}else{
				gzdxDao.updateZdrySwrySfjlBean(swrysfjlBean);
			}
			//修改变更时间
			if(ValidateHelper.isNotEmptyString(swrysfjlBean.getSwrybh())){
				ZdrySwryBean swryBean=gzdxDao.queryZdrySwryBeanBySwrybh(swrysfjlBean.getSwrybh());
				dao.updateZdryGzdxBgsj(swryBean.getSfzh());
			}
		}
		//吸毒人员
		if(CommonConstant.ZDRY_SDRY.equals(dxlb)){
			ZdryXdchNjxxBean xdNjxxBean = zdryBean.getXdchNjxxBean();
			if(ValidateHelper.isEmptyString(xdNjxxBean.getId())){
				String id=CommonDBBaseHelper.getSequence(CommonConstant.DBNAME_SQJW, "SEQ_ZDRY_GZDX_SWRYSFJL_ID");
				xdNjxxBean.setId(id);
				gzdxDao.insertZdryXdnjxxBean(xdNjxxBean);
			}else{
				gzdxDao.updateZdryXdnjxxBean(xdNjxxBean);
			}
			//修改变更时间
			if(ValidateHelper.isNotEmptyString(xdNjxxBean.getXdrybh())){
				ZdryXdryxxBean xdryBean=gzdxDao.queryZdryXdryxxBeanByXdrybh(xdNjxxBean.getXdrybh());
				dao.updateZdryGzdxBgsj(xdryBean.getSfzh());
			}
		}
		
	}


	public ZdryJzdxxxBean queryJzdxBeanByGzdxbh(String gzdxbh) throws SQLException {
		return dao.queryJzdxBeanByGzdxbh(gzdxbh);
	}
	
	public ZdryGzryxxBean queryGzryBeanByGzdxbh(String gzdxbh)
			throws SQLException {
		return dao.queryGzryBeanByGzdxbh(gzdxbh);
	}

	public ZdryXdryxxBean queryXdryBeanByGzdxbh(String gzdxbh) throws SQLException {
		// TODO Auto-generated method stub
		return dao.queryXdryBeanByGzdxbh(gzdxbh);
	}

	/**
	 * 根据精神病人编号分页查询肇事信息
	 */
	public PageResultInfo<ZdryJsbrzsxxBean> queryZdryJsbrzsxxPageResult(
			String jsbrbh, PageInfo pageInfo) throws Exception {
		return gzdxDao.queryZdryJsbrzsPageResult(jsbrbh, pageInfo);
	}
	
	/**
	 * 根据涉稳人员编号分页查询上访记录
	 * 
	 */
	public PageResultInfo<ZdrySwrysfjlBean> queryZdrySwrysfjlPageResult(
			String swrybh, PageInfo pageInfo) throws Exception {
		return gzdxDao.queryZdrySwrysfjlPageResult(swrybh, pageInfo);
	}


	public PageResultInfo<ZdryXdchNjxxBean> queryZdryXdryhdPageResult(
			String rybh, PageInfo pageInfo) throws SQLException {
		return gzdxDao.queryZdryXdryhdPageResult(rybh,pageInfo);
	}


	public ZdryGzdxBean queryZdryGzdxBeanByGzdx(ZdryGzdxBean zdryBean) throws Exception {
		//矫正对象
		if("2".equals(zdryBean.getDxlb())){
			ZdryJzdxxxBean jzdxxxBean = dao.queryJzdxBeanByGzdxbh(zdryBean.getGzdxbh());
			zdryBean.setJzdxBean(jzdxxxBean);
		}
		//关注对象
		else if("3".equals(zdryBean.getDxlb())){
			ZdryGzryxxBean gzryxxBean = dao.queryGzryBeanByGzdxbh(zdryBean.getGzdxbh());
			zdryBean.setGzryBean(gzryxxBean);
		}
		//吸毒人员
		else if(CommonConstant.ZDRY_SDRY.equals(zdryBean.getDxlb())){
			ZdryXdryxxBean xdryxxBean = dao.queryXdryBeanByGzdxbh(zdryBean.getGzdxbh());
			zdryBean.setXdryBean(xdryxxBean);	
		}
		//精神病人
		else if(CommonConstant.ZDRY_JSBR.equals(zdryBean.getDxlb())){
			ZdryJsbxBean jsbrBean=gzdxDao.queryZdryJsbrByGzdxbh((zdryBean.getGzdxbh()));
			zdryBean.setJsbrBean(jsbrBean);
		}
		//涉稳人员
		else if(CommonConstant.ZDRY_SWRY.equals(zdryBean.getDxlb())){
			ZdrySwryBean swryBean=gzdxDao.queryZdrySwryBeanBySfzh((zdryBean.getSfzh()));
			zdryBean.setSwryBean(swryBean);
		}
		
		return zdryBean;
	}

	public void updateZdryGzdxBgsj(String sfzh) throws SQLException {
		dao.updateZdryGzdxBgsj(sfzh);
	}
	
	public void zdryRl(String bh) throws Exception{
		LoginInfo login = ActionContextHelper.getLoginInfo();
		ZdryGzdxBean zdry = new ZdryGzdxBean();
		zdry.setGzdxbh(bh);
		zdry.setSszrdwdm(login.getOrgcode());
		zdry.setSszrdwmc(login.getOrgname());
		zdry.setSszrmjjh(login.getUsername());
		zdry.setSszrmjxm(login.getRealname());
		zdry.setSszrmjlxdh(login.getTelephone());
		zdry.setSfrl("1");
		
		zdry.setDjrxm(login.getRealname());
		zdry.setDjdwmc(login.getOrgname());
		zdry.setDjdwdm(login.getOrgcode());
		zdry.setDjsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss"));
		
		dao.zdryRlUpdate(zdry);
	}

	@Override
	public void zdryPf(ZdryGzdxBean bean){

		ZdryPfxxBean zdrypfxx = bean.getZdryPfxxBean();
		String id = CommonDBBaseHelper.getSequence(CommonConstant.DBNAME_SQJW, "SEQ_ZDRYPF_ID");
		
		LoginInfo user = ActionContextHelper.getLoginInfo();
		
		zdrypfxx.setId(id);
		zdrypfxx.setPfdwdj(user.getLeve() + "");
		zdrypfxx.setPfdwdm(user.getOrgcode());
		zdrypfxx.setPfdwmc(user.getOrgname());
		zdrypfxx.setPfrjh(user.getUsername());
		zdrypfxx.setPfrxm(user.getRealname());
		zdrypfxx.setMbdwdm(bean.getSszrdwdm());
		zdrypfxx.setMbdwmc(bean.getSszrdwmc());
		zdrypfxx.setSfzh(bean.getSfzh());
		zdrypfxx.setZdrybh(bean.getZdrybh());
		zdrypfxx.setXzsqmc(bean.getSsxzsqmc());
		zdrypfxx.setXzsqdm(bean.getSsxzsq());		
		TransactionManager tr = new TransactionManager();
		try {
			tr.begin();
			dao.insertZdryPfxx(zdrypfxx);
			dao.zdryPf(bean);
			tr.commit();
		} catch (Exception e) {
			e.printStackTrace();
			try {
				tr.rollback();
			} catch (RollbackException e1) {
				e1.printStackTrace();
			}
		}
	}

	@Override
	public void zdryth(ZdryGzdxBean bean) {
		LoginInfo user = ActionContextHelper.getLoginInfo();
		TransactionManager tr = new TransactionManager();
		try {
			if(5 == user.getLeve()){
				//跳过责任区退回派出所
				String sszrdwdm = user.getOrgcode().substring(0,8) + "0000";
				String sszrdwmc = DictionaryCacheHellper.getOrganizationBeanByOrgCode(sszrdwdm).getOrgname();
				bean.setSszrdwdm(sszrdwdm);
				bean.setSszrdwmc(sszrdwmc);
			}else{
				if(user.getLeve() > 1){
					String mbdwdm = user.getOrgcode().substring(0,(user.getLeve()-1) * 2);
					for(int i = mbdwdm.length() ; i<12 ; i++){
						mbdwdm += "0";
					}
					bean.setSszrdwdm(mbdwdm);
					bean.setSszrdwmc(DictionaryCacheHellper.getOrganizationBeanByOrgCode(mbdwdm).getOrgname());
				}
			}
			
			ZdryThBean ryth = bean.getThxx();
			String id = "";
			if(2 == user.getLeve()){
				id = CommonDBBaseHelper.getSequence(CommonConstant.DBNAME_SQJW, "SEQ_ZDRY_SJTH_ID");
			}else{
				id = CommonDBBaseHelper.getSequence(CommonConstant.DBNAME_SQJW, "seq_zdry_ryth_id");
			}
			ryth.setId(id);
			ryth.setMbdwdm(bean.getSszrdwdm());
			ryth.setMbdwmc(bean.getSszrdwmc());
			ryth.setSfzh(bean.getSfzh());
			
			tr.begin();
			if(2 == user.getLeve()){
				dao.sjth(ryth);
			}else{
				dao.insertZdryThxx(ryth);
				dao.zdryPf(bean);
			}
			tr.commit();
		} catch (Exception e) {
			try {
				tr.rollback();
			} catch (RollbackException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		}
	}

	@Override
	public ZdryTgxxBean zdryJg(ZdryGzdxBean bean) {
		TransactionManager tr = new TransactionManager();
		ZdryTgxxBean tgxx = bean.getTgxx();
		try {
			tr.begin();
			dao.updateZdryWtxx(tgxx);
//			tgxx = bean.getTgxx();
//			//接管重点人员
//			if(CommonConstant.ZDRY_JGZT_YJG.equals(bean.getTgxx().getJgzt())){
//				bean.setSszrdwdm(bean.getTgxx().getJgdwdm());
//				bean.setSszrdwmc(bean.getTgxx().getJgdwmc());
//			}
//			dao.zdryPf(bean);	
			tr.commit();
		} catch (Exception e) {
			tgxx = null;
			e.printStackTrace();
		}
		return tgxx;
		
	}

	@Override
	public ZdryTgxxBean zdryTg(ZdryGzdxBean bean) {
		String id = CommonDBBaseHelper.getSequence(CommonConstant.DBNAME_SQJW, "SEQ_ZDRY_WTXX_ID");
		ZdryTgxxBean tgxx = bean.getTgxx();
		tgxx.setId(id);
		try {
			dao.insertZdryWtxx(tgxx);
		} catch (SQLException e) {
			e.printStackTrace();
			tgxx = null;
		}
		return tgxx;
	}

	@Override
	public PageResultInfo<ZdryTgxxBean> queryTgxxList(RkQueryBean bean,PageInfo pageInfo) {
		try {
			return dao.queryWtxxList(bean, pageInfo);
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public ZdryTgxxBean queryTgxxById(String id) {
		try {
			return dao.queryZdryWtxxById(id);
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	@Override
	public ZdryTgxxBean queryTgxxBySfzh(String sfzh){
		try {
			return dao.queryTgxxBySfzh(sfzh);
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public ZdryThBean queryThxx(String sfzh, String mbdwdm) {
		LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
		if(1 == loginInfo.getLeve()){
			mbdwdm = mbdwdm.substring(0,2) + "0000000000";
		}else if(2 == loginInfo.getLeve()){
			mbdwdm = mbdwdm.substring(0,4) + "00000000";
		}else if(3 == loginInfo.getLeve()){
			mbdwdm = mbdwdm.substring(0,6) + "000000";
		}else if(4 == loginInfo.getLeve()){
			mbdwdm = mbdwdm.substring(0,8) + "0000";
		}
		try {
			return dao.queryThxx(sfzh, mbdwdm);
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public ZdryTgxxBean queryTgxx(String sfzh, String tgdwdm) {
		try {
			return dao.queryTgxx(sfzh, tgdwdm);
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public ZdryPfxxBean queryPfxx(String sfzh) {
		try {
			return dao.queryPfxx(sfzh);
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public PageResultInfo<ZdryXsbxBean> queryXsbxPageResultInfo(String sfzh, PageInfo pageInfo) {
		try 
		{
			return dao.queryXsbxPageResultInfo(sfzh, pageInfo);
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public QGQLZdryInfoBean queryQGQLZdryInfoBeanByZdrybh(String zdrybh)
	{
		try
		{
			return dao.queryQGQLZdryInfoBeanByZdrybh(zdrybh);
		}
		catch(Exception e)
		{
			e.printStackTrace();
			return null;
		}
		
	}
	
	@Override
	public ZdryXsbxBean queryXsbxById(String id){
		try {
			return dao.queryXsbxById(id);
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
		
	}

	@Override
	public List<ZdryGzdxBean> queryZdryList(RkQueryBean bean) {
		try {
			return dao.queryZdryList(bean);
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}
}
