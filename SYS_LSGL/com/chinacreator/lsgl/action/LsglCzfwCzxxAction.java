package com.chinacreator.lsgl.action;

import com.chinacreator.common.bean.LoginInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.cps.action.CPSBaseAction;
import com.chinacreator.common.helper.ActionContextHelper;
import com.chinacreator.common.helper.DateTimeHelper;
import com.chinacreator.common.helper.ValidateHelper;
import com.chinacreator.lsgl.bean.CzfwCzxxBean;
import com.chinacreator.lsgl.bean.CzrxxBean;
import com.chinacreator.lsgl.bean.FwJbxxBean;
import com.chinacreator.lsgl.query.CzxxQueryBean;
import com.chinacreator.lsgl.services.LsglCzfwCzxxService;
import com.chinacreator.lsgl.services.impl.LsglCzfwCzxxServiceImpl;

public class LsglCzfwCzxxAction extends CPSBaseAction {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private CzfwCzxxBean czxxBean;
	private CzxxQueryBean queryBean;
	private LsglCzfwCzxxService czxxService;
	private FwJbxxBean fwBean;
	private CzrxxBean czrxxBean;
	
	
	
	private String operType;
	public LsglCzfwCzxxAction(){
		super();
		czrxxBean  = new CzrxxBean();
		fwBean = new FwJbxxBean();
		queryBean = new CzxxQueryBean();
		czxxBean = new CzfwCzxxBean();
		czxxService= new LsglCzfwCzxxServiceImpl();
	}
	
	
	public void queryCzxxPageInfo() throws Exception{
		PageResultInfo<CzfwCzxxBean> list=czxxService.queryCzxxPageInfo(fwBean.getCzfwBean().getCzfwbh(), getPageInfo());
		responseWrite(list);
	}
	
	public void saveCzxxBean(){
		try {
			if(ValidateHelper.isNotEmptyString(czxxBean.getCzxxbh())){
				czxxService.updateCzxxBean(czxxBean,fwBean);
			}else{
				czxxService.insertCzxxBean(czxxBean,fwBean);
			}
			responseWrite(true);
		} catch (Exception e) {
			responseWrite(false);
			e.printStackTrace();
		}
	}
	/**
	 * 验证身份证号码
	 */
	public void isExistSfzh(){
		try {
			boolean flag=czxxService.isExistSfzh(czxxBean.getHzrsfzh(),czxxBean.getCzfwbh());
			responseWrite(flag);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 跳转到新增承租人信息
	 * @return
	 * @throws Exception 
	 */
	public String toAddCzrPage() throws Exception{
		if(CommonConstant.OPERTYPE_ADD.equals(operType)){
			
		}else{
			czxxBean=czxxService.queryCzxxPageInfobyCzxxbh(czxxBean.getCzxxbh());
		}
		return "toAddCzrPage";
	}
	
	/**  承租人 --------------------------------------------------------------------------  new*/
	
	/**
	 * 跳转到新增承租人的界面
	 * 二〇一四年五月十六日 11:07:05
	 * @return
	 */
	public String toAddCzrInfoPage(){
		if(CommonConstant.OPERTYPE_ADD.equals(operType)){
			//初始化登记信息
			LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
			czrxxBean.setDjrxm(loginInfo.getRealname());
			czrxxBean.setDjdwdm(loginInfo.getOrgcode());
			czrxxBean.setDjdwmc(loginInfo.getOrgname());
			czrxxBean.setDjsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss"));
		}else{
			//根据ID查询czrxx
			try {
				czrxxBean = czxxService.queryCzrxxBeanById(czrxxBean.getId());
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return "toAddCzrInfoPage";
	}
	
	/**
	 * 根据czfwbh 查询承租人List
	 * @return
	 * @throws Exception 
	 */
	public void queryCzrPageByCzfwbh() throws Exception{
		PageResultInfo<CzrxxBean> list = czxxService.queryCzrPageInfoByCzfwbh(czrxxBean.getFwid(), getPageInfo());
		responseWrite(list);
	}
	
	/**
	 * 保存承租人信息
	 * @return
	 */
	public void saveCzrInfo(){
		if(ValidateHelper.isNotEmptyString(czrxxBean.getId())){
			//修改
			try {
				czxxService.updateCzrxxBean(czrxxBean);
				responseWrite(true);
			} catch (Exception e) {
				responseWrite(false);
				e.printStackTrace();
			}
		}else{
			//新增
			try {
				if(!czxxService.queryCzrxxBeanBySfzh(czrxxBean.getCzrzjhm(), czrxxBean.getFwid())){
					czxxService.insertCzrBean(czrxxBean);
					responseWrite(true);
				}else{
					responseWrite("Exist");
				}
			} catch (Exception e) {
				responseWrite(false);
				e.printStackTrace();
			}
		}
	}
	
	
	/**
	 * 注销
	 */
	public void logouCzrxx(){
		try {
			czxxService.logoutCzrxxBean(czrxxBean);
			responseWrite(true);
		} catch (Exception e) {
			responseWrite(false);
			e.printStackTrace();
		}
	}
	public String toCzfwCzxxPage(){
		return "toCzfwCzxxPage";
	}
	public CzfwCzxxBean getCzxxBean() {
		return czxxBean;
	}
	public void setCzxxBean(CzfwCzxxBean czxxBean) {
		this.czxxBean = czxxBean;
	}
	public CzxxQueryBean getQueryBean() {
		return queryBean;
	}
	public void setQueryBean(CzxxQueryBean queryBean) {
		this.queryBean = queryBean;
	}
	public FwJbxxBean getFwBean() {
		return fwBean;
	}
	public void setFwBean(FwJbxxBean fwBean) {
		this.fwBean = fwBean;
	}


	public String getOperType() {
		return operType;
	}


	public void setOperType(String operType) {
		this.operType = operType;
	}


	public CzrxxBean getCzrxxBean() {
		return czrxxBean;
	}

	public void setCzrxxBean(CzrxxBean czrxxBean) {
		this.czrxxBean = czrxxBean;
	}
	
}
