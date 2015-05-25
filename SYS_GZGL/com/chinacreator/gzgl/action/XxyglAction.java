package com.chinacreator.gzgl.action;

import java.sql.SQLException;

import com.chinacreator.common.bean.LoginInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.helper.ActionContextHelper;
import com.chinacreator.common.helper.DateTimeHelper;
import com.chinacreator.gzgl.bean.EmfyqkxxBean;
import com.chinacreator.gzgl.bean.ErmxxBean;
import com.chinacreator.gzgl.query.XxyQuery;
import com.chinacreator.gzgl.service.XxyService;

public class XxyglAction extends GzglBaseAction {

	/**
	 * 信息员管理
	 */
	private static final long serialVersionUID = -4968354752094181556L;
	private XxyQuery queryBean;
	private ErmxxBean emxxBean;
	private EmfyqkxxBean emfyqkxxBean;
	private XxyService xxyService;
	private String op;
	private String zaembh;
	
	private String sfzh;

	
	public XxyglAction() {
		queryBean = new XxyQuery();
		emxxBean = new ErmxxBean();
		emfyqkxxBean = new EmfyqkxxBean();
		xxyService = new XxyService();
	}



	// 跳转到信息员管理界面
	public String toXxyglList() {
		initQueryBean(queryBean);
		return "toXxyglList";
	}

	// 查询信息员相关信息
	public void queryXxyList() throws SQLException 
	{
		PageResultInfo<ErmxxBean> resultInfo = xxyService.getXxyListPage(queryBean, getPageInfo());
	    responseWrite(resultInfo);
	}

	/**
	 * 跳转至新增页面
	 * 
	 * @return
	 * @throws SQLException 
	 */
	public String toAddXxyPage() throws SQLException {
		if(CommonConstant.OPERTYPE_ADD.equals(operType))
		{
			LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
			emxxBean = new ErmxxBean();
			emxxBean.setSfzh(sfzh);
			emxxBean.setDjrxm(loginInfo.getRealname());
			emxxBean.setDjdwdm(loginInfo.getOrgcode());
			emxxBean.setDjdwmc(loginInfo.getOrgname());
			emxxBean.setDjsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss"));
			
			emxxBean.setSsdwdm(loginInfo.getOrgcode());
			emxxBean.setSsdwmc(loginInfo.getOrgname());
		}
		else
		{
			emxxBean = xxyService.getEmxxBeanByzaembh(zaembh);
		}
		return "toAddXxyPage";
	}
	
	/**
	 * 根据治安耳目编号查询EmfyqkxxBean
	 * @throws SQLException 
	 */
	public void queryXxyfyqkList() throws SQLException{
		PageResultInfo<EmfyqkxxBean> pageResultInfo = xxyService.getEmFyqkxxBeanByzaembh(zaembh,getPageInfo());
		responseWrite(pageResultInfo);
	}
	
	/**
	 * 保存信息员（耳目）信息
	 * @return
	 * @throws SQLException 
	 */
	public void saveXxyBean() throws SQLException{
		responseWrite(xxyService.saveXxyBean(emxxBean));
	}
	
	//信息反馈
	public String toxxyFyPage() throws SQLException
	{
		if(CommonConstant.OPERTYPE_ADD.equals(operType)){
			LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
			emfyqkxxBean.setDjrxm(loginInfo.getRealname());
			emfyqkxxBean.setDjdwdm(loginInfo.getOrgcode());
			emfyqkxxBean.setDjdwmc(loginInfo.getOrgname());
			emfyqkxxBean.setDjsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss"));
			emfyqkxxBean.setDjrsfzh(loginInfo.getSfzh());
			emfyqkxxBean.setDjmjjh(loginInfo.getUsername());
		}else{
			emfyqkxxBean = xxyService.queryEmfyqkxxBeanById(emfyqkxxBean.getId());
		}
		return "toxxyFyPage";
	}
	
	public void zxZaemxx()
	{
		try
		{
			xxyService.zxZaemxxBean(zaembh);
			responseWrite(true);
		}
		catch(Exception e)
		{
			e.printStackTrace();
			responseWrite(false);
		}
	}
	
	//保存信息员反馈内容
    public void saveXxyFyqkBean() throws SQLException{
    	responseWrite(xxyService.saveXxyFyBean(emfyqkxxBean));
    }
    
    //根据身份证号检查信息员是否在本单位存在
    public void checkXxy() throws SQLException{
    	responseWrite(xxyService.queryEmxxBeanBySfzhAndOrgCode(sfzh,ActionContextHelper.getLoginInfo().getOrgcode()));
    	
    }
    
    public void isExistSfzhInOrg() throws SQLException{
		boolean flag=xxyService.queryEmxxBeanBySfzhAndOrg(emxxBean.getSfzh(),emxxBean.getDjdwdm());
    	responseWrite(flag);
    }
	public XxyQuery getQueryBean() {
		return queryBean;
	}

	public void setQueryBean(XxyQuery queryBean) {
		this.queryBean = queryBean;
	}

	public ErmxxBean getEmxxBean() {
		return emxxBean;
	}

	public void setEmxxBean(ErmxxBean emxxBean) {
		this.emxxBean = emxxBean;
	}

	public EmfyqkxxBean getEmfyqkxxBean() {
		return emfyqkxxBean;
	}
	public void setEmfyqkxxBean(EmfyqkxxBean emfyqkxxBean) {
		this.emfyqkxxBean = emfyqkxxBean;
	}
	public String getOp() {
		return op;
	}

	public void setOp(String op) {
		this.op = op;
	}

	public String getZaembh() {
		return zaembh;
	}

	public void setZaembh(String zaembh) {
		this.zaembh = zaembh;
	}
	public String getSfzh() {
		return sfzh;
	}
	public void setSfzh(String sfzh) {
		this.sfzh = sfzh;
	}
	
}
