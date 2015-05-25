package com.chinacreator.dwdj.service;

import java.io.Serializable;
import java.sql.SQLException;
import java.util.List;

import javax.transaction.RollbackException;

import com.chinacreator.common.bean.LoginInfo;
import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.bean.QueryBean;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.cps.helper.CommonSequenceHelper;
import com.chinacreator.common.helper.ActionContextHelper;
import com.chinacreator.common.helper.CommonDBBaseHelper;
import com.chinacreator.common.helper.DictionaryCacheHellper;
import com.chinacreator.common.helper.ValidateHelper;
import com.chinacreator.dwdj.bean.DwBaseBean;
import com.chinacreator.dwdj.bean.DwOpLogBean;
import com.chinacreator.dwdj.bean.DwQsBean;
import com.chinacreator.dwdj.bean.DwtbBean;
import com.chinacreator.dwdj.bean.SssqdmBean;
import com.chinacreator.dwdj.dao.DwOpDao;
import com.chinacreator.zagl.bean.DwfwglBean;
import com.frameworkset.orm.transaction.TransactionManager;

/**
 * 单位操作管理（派发 、签收、退回）
 */
public class DwOpManagerService implements Serializable {

	private static final long serialVersionUID = 7359713135708871772L;
	DwOpDao dao = new DwOpDao();
	LoginInfo login = ActionContextHelper.getLoginInfo();
	
	/**
	 * 单位派发
	 * @return
	 */
	public boolean dwpf(DwOpLogBean bean){
		boolean flag = false;
		TransactionManager tr = null;
		try{
			tr = new TransactionManager();
			tr.begin();
			//更新单位签收状态
			dao.updateDwQsztByIdAndLx(CommonConstant.DW_OP_CZZT_PF, bean.getYwxtzj(),bean.getYwxtlx());
			//更新单位派发后的单位代码
			dao.updateDwPfhDwdmByIdAndLx(bean.getMbdwdm(), bean.getYwxtzj(),bean.getYwxtlx());
			
			//新增派发记录
			String id = DictionaryCacheHellper.getSystemParamenterValueByKey("current.xzdm") + 
					CommonDBBaseHelper.getSequence(CommonConstant.DBNAME_SQJW, "SEQ_DWOPLOG_ID");
			bean.setId(id);
			bean.setCzrsfzh(login.getSfzh());
			bean.setCzrxm(login.getRealname());
			bean.setCzdwdm(login.getOrgcode());
			bean.setCzdwmc(login.getOrgname());
			
			String orgcode = getUserOrgCodeByLeve(login.getLeve(), login.getOrgcode());
			bean.setPfdwdm(orgcode);
			bean.setPfdwmc(DictionaryCacheHellper.getOrganizationOrgNameByCode(orgcode));
			
			bean.setCzzt(CommonConstant.DW_OP_CZZT_PF);
			dao.isnertDwOpLog(bean);
			tr.commit();
			flag = true;
		}catch (Exception e) {
			e.printStackTrace();
			try {
				tr.rollback();
			} catch (RollbackException e1) {
				e1.printStackTrace();
			}
			flag = false;
		}
		return flag;
	}
	
	/**
	 * 单位签收
	 * @return
	 */
	public boolean dwqs(DwQsBean bean){
		boolean flag = false;
		TransactionManager tr = null;
		try{
			tr = new TransactionManager();
			tr.begin();
			
			DwOpLogBean log = bean.getLog();
			//更新单位签收标识
			dao.updateDwQsztByIdAndLx(CommonConstant.DW_OP_CZZT_QS, log.getYwxtzj(),log.getYwxtlx());
			
			//新增操作记录
			String id = DictionaryCacheHellper.getSystemParamenterValueByKey("current.xzdm") + 
			CommonDBBaseHelper.getSequence(CommonConstant.DBNAME_SQJW, "SEQ_DWOPLOG_ID");
			log.setId(id);
			log.setCzrsfzh(login.getSfzh());
			log.setCzrxm(login.getRealname());
			log.setCzdwdm(login.getOrgcode());
			log.setCzdwmc(login.getOrgname());
			
			log.setCzzt(CommonConstant.DW_OP_CZZT_QS);
			dao.isnertDwOpLog(log);
			
			//取消单位锁定
			dao.updateDwtbGlZt(CommonConstant.DW_OP_GLZT_ZC, log.getYwxtzj(),log.getYwxtlx());
			
			DwBaseBean dwxx = bean.getDwxx();
			if(bean.getDwxx() != null && ValidateHelper.isNotEmptyString(bean.getDwxx().getJgbh())){
				//签收时选择现有单位 更新原有单位信息
				
				dwxx.setCzrjh(login.getUsername());
				dwxx.setCzrxm(login.getRealname());
				dwxx.setCzrsfzh(login.getSfzh());
				dwxx.setCzdwdm(login.getOrgcode());
				dwxx.setCzdwmc(login.getOrgname());
				dwxx.setCzbs(CommonConstant.CZBZ_UPDATE);
				
				dwxx.setZrmjjh(login.getUsername());
				dwxx.setZrmjxm(login.getRealname());
				dao.updateDwxx(bean.getDwxx());
				
				//签收下发的危爆单位时  更新危爆单位表的机构编号
				if("04".equals(dwxx.getHylb())){
					dao.updateJgbhWithWbdwByYwxtZj(bean.getDwxx().getJgbh(), dwxx.getYwzjid());
				}
				
			}else{//签收时选择单位地址
				
				//保存单位基本信息
				DwfwglBean dwfwgl = bean.getDwfwgl();
				dwxx.setDzid(dwfwgl.getDzid());
				String jgbh = saveDw(dwxx);
				
				//新增单位房屋关联
				String dwfwglId = CommonDBBaseHelper.getSequence(CommonConstant.DBNAME_SQJW, "seq_lsgl_fwrkid");
				dwfwgl.setDwfwglid(dwfwglId);
				dwfwgl.setJgbh(jgbh);
				dao.inserDwFwGl(dwfwgl);
				
				//签收下发的危爆单位时  更新危爆单位表的机构编号
				if("04".equals(dwxx.getHylb())){
					dao.updateJgbhWithWbdwByYwxtZj(jgbh, dwxx.getYwzjid());
				}
			}
			
			//更新单位管理状态
			if(ValidateHelper.isNotEmptyString(dwxx.getGlbm())){
				dao.updateDwGlZt(dwxx);
			}
			tr.commit();
			flag = true;
		}catch (Exception e) {
			flag = false;
			try {
				tr.rollback();
			} catch (RollbackException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		}
		return flag;
	}
	
	/**
	 * 单位退回
	 * @return
	 */
	public boolean dwth(DwOpLogBean bean){
		boolean flag = false;

		TransactionManager tr = null;
		try{
			tr = new TransactionManager();
			tr.begin();
			//更新单位签收状态
			dao.updateDwQsztByIdAndLx(CommonConstant.DW_OP_CZZT_TH, bean.getYwxtzj(),bean.getYwxtlx());
			
			//更新单位派发后的单位代码
			if(ValidateHelper.isNotEmptyString(bean.getPfdwdm()) &&
					!bean.getPfdwdm().equals(getUserOrgCodeByLeve(login.getLeve(),login.getOrgcode()))){   //已派发单位退回
				dao.updateDwPfhDwdmByIdAndLx(bean.getPfdwdm(), bean.getYwxtzj(),bean.getYwxtlx());
			}else{     //未派发单位,或者派发单位为自己时退回上级
				String pfdwdm = getUserOrgCodeByLeve(login.getLeve() - 1,login.getOrgcode());
				dao.updateDwPfhDwdmByIdAndLx(pfdwdm, bean.getYwxtzj(),bean.getYwxtlx());
			}
			
			//新增派发记录
			bean.setPfdwdm("");   //清空派发单位
			String id = DictionaryCacheHellper.getSystemParamenterValueByKey("current.xzdm") + 
					CommonDBBaseHelper.getSequence(CommonConstant.DBNAME_SQJW, "SEQ_DWOPLOG_ID");
			bean.setId(id);
			bean.setCzrsfzh(login.getSfzh());
			bean.setCzrxm(login.getRealname());
			bean.setCzdwdm(login.getOrgcode());
			bean.setCzdwmc(login.getOrgname());
			
			bean.setCzzt(CommonConstant.DW_OP_CZZT_TH);
			dao.isnertDwOpLog(bean);
			tr.commit();
			flag = true;
		}catch (Exception e) {
			try {
				tr.rollback();
			} catch (RollbackException e1) {
				e1.printStackTrace();
			}
			flag = false;
		}
		return flag;
	}
	
	/**
	 * 查询单位操作列表
	 * @return
	 */
	public PageResultInfo<DwBaseBean> queryDwOpList(QueryBean query,PageInfo pageinfo){
		try {
			query.setOrgcode(getUserOrgCodeByLeve(login.getLeve(), login.getOrgcode()));
			return dao.queryDwOpList(query, pageinfo);
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	/**
	 * 根据Id和lx查询单位信息
	 * @param id
	 * @return
	 */
	public DwBaseBean queryDwxxByIdAndLx(String id,String lx){
		try {
			return dao.queryDwxxByIdAndLx(id,lx);
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	/**
	 * 查询单位最新的操作信息
	 * @param id 单位ID
	 * @param lx 单位lx
	 * @return
	 */
	public DwOpLogBean queryNewDwOpLog(QueryBean query){
		try {
			return dao.queryNewDwOp(query);
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	/**
	 * 根据用户级别获取单位代码
	 * @param userLeve
	 * @param userCode
	 * @return
	 */
	private String getUserOrgCodeByLeve(int userLeve, String userCode){
		String orgcode = "";
		if(userLeve == 1){
			orgcode = userCode.substring(0,2) + "0000000000";
		}else if(userLeve == 2){
			orgcode = userCode.substring(0,4) + "00000000";
		}else if(userLeve == 3){
			orgcode = userCode.substring(0,6) + "000000";
		}else if(userLeve == 4){
			orgcode = userCode.substring(0,8) + "0000";
		}else if(userLeve == 5){
			orgcode = userCode;
		}else{
			orgcode = userCode;
		}
		return orgcode;
	}
	
	/**
	 * 单位锁定管理
	 * @param glzt 管理状态
	 * @param dwid 单位ID
	 * @param dwlx 单位类型
	 */
	public boolean dwSdGl(String glzt,String dwid,String dwlx){
		boolean flag = false;
		TransactionManager tr = null;
		try{
			tr = new TransactionManager();
			tr.begin();
			//更新单位同步管理状态
			dao.updateDwtbGlZt(glzt, dwid, dwlx);
			//新增操作日志
			DwOpLogBean log = new DwOpLogBean();
			String id = DictionaryCacheHellper.getSystemParamenterValueByKey("current.xzdm") + 
					CommonDBBaseHelper.getSequence(CommonConstant.DBNAME_SQJW, "SEQ_DWOPLOG_ID");
			log.setId(id);
			log.setYwxtzj(dwid);
			log.setYwxtlx(dwlx);
			log.setCzrsfzh(login.getSfzh());
			log.setCzrxm(login.getRealname());
			log.setCzdwdm(login.getOrgcode());
			log.setCzdwmc(login.getOrgname());
			
			dao.isnertDwOpLog(log);
			tr.commit();
			flag = true;
		}catch (Exception e) {
			flag = false;
			try {
				tr.rollback();
			} catch (RollbackException e1) {
				return false;
			}
			e.printStackTrace();
		}
		return flag;
	}
	
	/**
	 * 保存单位
	 * @param bean
	 * @throws Exception
	 */
	private String saveDw(DwBaseBean bean) throws Exception{
		//新增单位基本信息
		String jgbh = CommonSequenceHelper.getJGBH(ActionContextHelper.getLoginInfo().getOrgcode(), "JG");
		bean.setJgbh(jgbh);
		bean.setDjrjh(login.getUsername());
		bean.setDjrxm(login.getRealname());
		bean.setDjrsfzh(login.getSfzh());
		bean.setDjdwdm(login.getOrgcode());
		bean.setDjdwmc(login.getOrgname());
		
		bean.setCzrjh(login.getUsername());
		bean.setCzrxm(login.getRealname());
		bean.setCzrsfzh(login.getSfzh());
		bean.setCzdwdm(login.getOrgcode());
		bean.setCzdwmc(login.getOrgname());
		bean.setCzbs(CommonConstant.CZBZ_ADD);
		
		bean.setZrmjjh(login.getUsername());
		bean.setZrmjxm(login.getRealname());
		bean.setZrdwpcsdm(login.getOrgcode());
		bean.setZrdwpcsmc(login.getOrgname());
		
		dao.insertDwToJg(bean);
		
		if("02".equals(bean.getHylb())){
			//娱乐场所
			String jlbh = CommonSequenceHelper.getJGBH(ActionContextHelper.getLoginInfo().getOrgcode(), "GC");
			dao.insertYlcs(jlbh,jlbh,jgbh);
			
		}else if("05".equals(bean.getHylb())){
			//网吧
			String wbbh = CommonSequenceHelper.getJGBH(ActionContextHelper.getLoginInfo().getOrgcode(), "WB");
			dao.insertWb(wbbh, jgbh);
			
		}else if("07".equals(bean.getHylb())){
			//旅馆
			String lgbh = CommonSequenceHelper.getTZHYJGBH();
			String thbh = CommonSequenceHelper.getJGBH(ActionContextHelper.getLoginInfo().getOrgcode(), "TZ");
			dao.insertTzhy(thbh, jgbh);
			dao.insertLg(lgbh, thbh, jgbh);
		}
		
		return jgbh;
	}
	/**
	 * 根据派出所代码查询所属社区
	 * @param query
	 * @return
	 */
	public List<SssqdmBean> querySssqByPcsdm(QueryBean query){
		try {
			return	dao.querySssqdmByPcsdm(query);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	/**
	 * 保存危爆单位信息
	 * @param <T>
	 * @param bean
	 * @param sqlName
	 * @param type
	 * @return
	 * @throws Exception
	 */
	public <T> boolean saveBean(T bean,String sqlName,String type) throws Exception{
		if ("add".equals(type)){
			// 新增
			TransactionManager tm = new TransactionManager();
			try{
				tm.begin();
				dao.insertBean(bean, sqlName);
				//判断是否是危爆单位新增
				if(bean.getClass().getName().equals(DwtbBean.class.getName())){
					dao.insertBean(bean, "insertWXWPDWsql");
				}
				tm.commit();
				return true;
			}catch (Exception e) {
				tm.rollback();
				e.printStackTrace();
				return false;
			}
		}else if("update".equals(type)){
			//更新
			dao.updateBean(bean, sqlName);
			if(bean.getClass().getName().equals(DwtbBean.class.getName())){
				dao.updateBean(bean, "updateWXWPDWsql");
			}
			return true;
		}else {
			return false;
		}
	}
}
