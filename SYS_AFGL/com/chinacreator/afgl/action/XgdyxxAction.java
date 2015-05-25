package com.chinacreator.afgl.action;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.chinacreator.afgl.bean.XgdxxBean;
import com.chinacreator.afgl.bean.XgdyxxBean;
import com.chinacreator.afgl.query.XgdyxxQuery;
import com.chinacreator.afgl.services.XgdyxxService;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.cps.action.CPSBaseAction;

/**
 * 协管队员信息
 */
public class XgdyxxAction extends CPSBaseAction{

	private static final long serialVersionUID = 7309901752134378580L;

	private XgdyxxService xgdyxxService;
	private XgdyxxBean xgdyxxBean;
	private XgdyxxQuery xgdyxxQuery;
	private List<XgdyxxBean> xgdyxxList;
	
	private String sfzh;
	
	public XgdyxxAction(){
		xgdyxxService = new XgdyxxService();
		xgdyxxBean = new XgdyxxBean();
		xgdyxxQuery = new XgdyxxQuery();
		xgdyxxList = new ArrayList<XgdyxxBean>();
	}
	
	/**
	 * 跳转到协管队员信息列表
	 */
	public String toXgdyxxList(){
		initQueryBean(xgdyxxQuery);
		return "toXgdyxxList";
	}
	
	/**
	 * 查询协管队员信息列表并写到页面
	 */
	public void xgdyxxList() throws Exception{
		PageResultInfo<XgdyxxBean> xgdyxxResultInfo= xgdyxxService.xgdyxxList(getPageInfo(), xgdyxxQuery);
		responseWrite(xgdyxxResultInfo);
	}
	
	/**
	 * 查询协管队信息列表并写到页面
	 */
	public void xgdxxList() throws Exception{
		PageResultInfo<XgdxxBean> xgdxxResultInfo= xgdyxxService.xgdxxList(getPageInfo(), xgdyxxQuery);
		responseWrite(xgdxxResultInfo);
	}
	
	/**
	 * 得到协管队信息并写到页面
	 */
	public void getXgdyxxByDybh() throws Exception{
		xgdyxxBean = xgdyxxService.getXgdyxxByDybh(xgdyxxQuery);
		responseWrite(xgdyxxBean);
	}
	
	/**
	 * 跳转到新增协管队员信息页面
	 * @return
	 * @throws Exception 
	 */
	public String toAddXgdyxx() throws Exception{
		//人员登记时需要 先验证身份证
		xgdyxxBean = xgdyxxService.queryXgdyxxBySfzh(sfzh);
		if(xgdyxxBean!=null){
			xgdyxxBean.setCzbs("2");
		}
		if(xgdyxxBean==null){
			xgdyxxBean = new XgdyxxBean();
			xgdyxxBean.setCzbs(xgdyxxQuery.getCzbs());
			xgdyxxBean.setDysfzh(sfzh);
		}
		xgdyxxBean.setDjsj(new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(new Date()));
		return "toAddXgdyxx";
	}
	
	/**
	 * 提交协管队员表单
	 * @return
	 */
	public void addXgdyxx() throws Exception{
		xgdyxxService.addXgdyxx(xgdyxxBean);
		responseWrite(true);
	}
	
	/**
	 * 跳转到选择协管队信息页面
	 * @return
	 */
	public String toSelectXgdxx() throws Exception{
		return "toSelectXgdxx";
	}
	
	/**
	 * 跳转到修改协管队员信息页面
	 * @return
	 */
	public String toUpdateXgdyxxByDybh() throws Exception{
		xgdyxxBean = xgdyxxService.getXgdyxxByDybh(xgdyxxQuery);
		return "toUpdateXgdyxxByDybh";
	}
	
	/**
	 * 批量删除协管队员信息
	 * @return
	 */
	public void batchDeleteXgdyxxByDybhs() throws Exception{
		xgdyxxService.batchDeleteXgdyxxByDybhs(xgdyxxQuery);
		responseWrite(true);
	}
	
	/**
	 * 删除协管队员信息
	 * @return
	 */
	public void deleteXgdyxxByDybh() throws Exception{
		xgdyxxService.addXgdyxx(xgdyxxBean);
		responseWrite(true);
	}
	
	/**
	 * 查看协管队员信息
	 * @return
	 */
	public String viewXgdyxxByDybh() throws Exception{
		xgdyxxBean = xgdyxxService.getXgdyxxByDybh(xgdyxxQuery);
		return "viewXgdyxxByDybh";
	}
	
	public void isExistSfzhInOrg(){
		boolean flag =false;
		try {
			flag=xgdyxxService.queryXgdyxxBySfzhAndOrgcode(xgdyxxBean.getDysfzh(), xgdyxxBean.getDjrdwdm());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			flag=false;
			e.printStackTrace();
		}
		responseWrite(flag);
	}
	public XgdyxxBean getXgdyxxBean() {
		return xgdyxxBean;
	}

	public void setXgdyxxBean(XgdyxxBean xgdyxxBean) {
		this.xgdyxxBean = xgdyxxBean;
	}

	public XgdyxxQuery getXgdyxxQuery() {
		return xgdyxxQuery;
	}

	public void setXgdyxxQuery(XgdyxxQuery xgdyxxQuery) {
		this.xgdyxxQuery = xgdyxxQuery;
	}

	public List<XgdyxxBean> getXgdyxxList() {
		return xgdyxxList;
	}

	public void setXgdyxxList(List<XgdyxxBean> xgdyxxList) {
		this.xgdyxxList = xgdyxxList;
	}

	public String getSfzh() {
		return sfzh;
	}

	public void setSfzh(String sfzh) {
		this.sfzh = sfzh;
	}
	
	
}
