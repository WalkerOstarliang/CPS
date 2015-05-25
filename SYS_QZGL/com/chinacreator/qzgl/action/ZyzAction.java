package com.chinacreator.qzgl.action;

import java.sql.SQLException;
import java.util.List;
import javax.transaction.RollbackException;
import com.chinacreator.common.bean.LoginInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.cps.action.CPSBaseAction;
import com.chinacreator.common.helper.ActionContextHelper;
import com.chinacreator.common.helper.DateTimeHelper;
import com.chinacreator.qzgl.bean.ZyzdjxxBean;
import com.chinacreator.qzgl.bean.ZyzzcxxBean;
import com.chinacreator.qzgl.query.ZyzQueryBean;
import com.chinacreator.qzgl.services.ZyzService;


public class ZyzAction extends CPSBaseAction{

	/**
	 * 
	 */
	private static final long serialVersionUID = 3120101935368675902L;
	private ZyzdjxxBean zyzdjxxBean;
	private ZyzzcxxBean zyzzcxxBean;
	private ZyzQueryBean queryBean;
	private ZyzService service;
	private String bh;
	private String zyzbh;
	private String operType1;
	private String bhs;
	private String sfzh;
	
	public ZyzAction(){
		super();
		service = new ZyzService();
		queryBean = new ZyzQueryBean();
		zyzdjxxBean = new ZyzdjxxBean();
		zyzzcxxBean = new ZyzzcxxBean();
		
	}
	public ZyzdjxxBean getZyzdjxxBean() {
		return zyzdjxxBean;
	}
	
	/**
	 * 跳转到志愿者信息页面
	 * @param zyzdjxxBean
	 */
	public String toZyzList(){
		initQueryBean(queryBean);
		return "toZyzList";	
	}
	
	public void queryList() throws SQLException{
		PageResultInfo<ZyzdjxxBean> list = service.getZyzxx(queryBean,getPageInfo());
		responseWrite(list);
	}
	
	public String toAddZyz() throws Exception{
		LoginInfo log = ActionContextHelper.getLoginInfo();
		if(CommonConstant.OPERTYPE_ADD.equals(operType)){
			zyzdjxxBean = service.getZyzxxBysfzh(sfzh);
			if(zyzdjxxBean==null){
				zyzdjxxBean = new ZyzdjxxBean();
				zyzdjxxBean.setSfzh(sfzh);
				zyzdjxxBean.setDjrjh(log.getUsername());
				zyzdjxxBean.setDjrxm(log.getRealname());
				zyzdjxxBean.setDjdwdm(log.getOrgcode());
				zyzdjxxBean.setDjdwmc(log.getOrgname());
				zyzdjxxBean.setDjsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd"));
				zyzdjxxBean.setSsjwqsdm(log.getJwsqdm());
				zyzdjxxBean.setSspcsdm(log.getPcsdm());
			}
		}else{
			zyzdjxxBean = service.getZyzByBh(bh);
		}
		return "toAddZyz";
	}
	/**
	 * 保存志愿者信息
	 * @throws Exception
	 */
	public void saveZyz() {
		try {
			zyzdjxxBean=service.saveZyz(zyzdjxxBean,operType);
			responseWrite(zyzdjxxBean);
		} catch (Exception e) {
			responseWrite(null);
			e.printStackTrace();
		}
	}
	public String toUpateZyz() throws SQLException{
		zyzdjxxBean = service.getZyzByBh(bh);
		List<ZyzzcxxBean> list = service.queryZcxx(bh);
		request.setAttribute("size", list.size());
		zyzdjxxBean.setZyzzList(list);
		return "toUpdateZyz";
	}
	public void deleteZyz() throws SQLException, RollbackException{
		service.deleteZyz(bh);
		responseWrite(true);
	}
	/**
	 * 跳转至添加专长信息界面
	 * @param zyzdjxxBean
	 * @throws SQLException 
	 */
	public  String toAddZcxx() throws SQLException{
		if(CommonConstant.OPERTYPE_UPDATE.equals(operType)){
			zyzzcxxBean = service.getZyzzcByBh(zyzzcxxBean.getBh());
		}else if(CommonConstant.OPERTYPE_ADD.equals(operType)){
			zyzzcxxBean.setZyzbh(zyzbh);	
		}
		return "toAddZcxx";
	}

	/**
	 * 查询专长信息
	 * @param zyzdjxxBean
	 * @throws SQLException 
	 */
	public void queryzcList() throws SQLException{
		/*if (zyzdjxxBean == null) {
			zyzdjxxBean = new ZyzdjxxBean();
		}
		System.out.println(bh);
		zyzdjxxBean.setBh(bh);
		PageResultInfo<ZyzzcxxBean> list = service.getZyzzcxx(zyzdjxxBean,getPageInfo());*/
		PageResultInfo<ZyzzcxxBean> zclist = service.getZyzzcxx(zyzdjxxBean.getBh(), getPageInfo());
		responseWrite(zclist);
	}
	
	/**
	 * 保存专长信息
	 * @param zyzdjxxBean
	 * @throws SQLException 
	 */
	public void saveZyzzc(){
		try {
			service.insertOrupdateZcxx(zyzzcxxBean,operType);
			responseWrite(true);
		} catch (SQLException e) {
			responseWrite(null);
			e.printStackTrace();
		}
		
	}
	
	/**
	 * 删除专长信息
	 *
	 * @param zyzdjxxBean
	 * @throws SQLException 
	 */
	public  void deleteZc() throws SQLException{
		service.deleteZc(bh);
		responseWrite(true);
	}
	
	/**
	 * 批量删除
	 * @param zyzdjxxBean
	 * @throws RollbackException 
	 * @throws SQLException 
	 */
	public void deleteZyzxx() throws SQLException, RollbackException{
		service.deleteZyzxx(bhs);
		responseWrite(true);
	}
	
	
	public void  isExistSfzhInOrg(){
		try {
			boolean flag=service.queryZyzdjxxBeanBySfzhAndOrgcode(zyzdjxxBean.getSfzh(), zyzdjxxBean.getDjdwdm());
			responseWrite(flag);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public void setZyzdjxxBean(ZyzdjxxBean zyzdjxxBean) {
		this.zyzdjxxBean = zyzdjxxBean;
	}
	public ZyzzcxxBean getZyzzcxxBean() {
		return zyzzcxxBean;
	}
	public void setZyzzcxxBean(ZyzzcxxBean zyzzcxxBean) {
		this.zyzzcxxBean = zyzzcxxBean;
	}

	public ZyzQueryBean getQueryBean() {
		return queryBean;
	}

	public void setQueryBean(ZyzQueryBean queryBean) {
		this.queryBean = queryBean;
	}
	public String getBh() {
		return bh;
	}
	public void setBh(String bh) {
		this.bh = bh;
	}
	public String getZyzbh() {
		return zyzbh;
	}
	public void setZyzbh(String zyzbh) {
		this.zyzbh = zyzbh;
	}
	public String getOperType1() {
		return operType1;
	}
	public void setOperType1(String operType1) {
		this.operType1 = operType1;
	}
	public String getBhs() {
		return bhs;
	}
	public void setBhs(String bhs) {
		this.bhs = bhs;
	}
	public String getSfzh() {
		return sfzh;
	}
	public void setSfzh(String sfzh) {
		this.sfzh = sfzh;
	}
	
}
