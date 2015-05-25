package com.chinacreator.gzgl.action;

import java.sql.SQLException;

import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.cps.action.CPSBaseAction;
import com.chinacreator.common.cps.bean.UserLxfsBean;
import com.chinacreator.gzgl.query.UserLxfsQuery;
import com.chinacreator.gzgl.service.UserLxfsService;

public class UserLxfsAction extends CPSBaseAction{

	/**
	 * 
	 */
	private static final long serialVersionUID = 7868060946222813215L;
	
	private UserLxfsBean userLxfsBean;
	private UserLxfsQuery queryBean;
	private UserLxfsService lxfsService;
	private String id;
	private String userid;
	private String operType;
	public UserLxfsAction(){
		userLxfsBean = new UserLxfsBean();
		queryBean = new UserLxfsQuery();
		lxfsService = new UserLxfsService();
	}
	
	/**
	 * 跳转至用户联系方式页面
	 * @return
	 */
	public String toUserLxfsList()
	{
		initQueryBean(queryBean);
		return "tolxfsList";
	}
	/**
	 * 查询用户联系方式列表
	 * @return
	 * @throws SQLException 
	 */
	public void queryLxfsList() throws SQLException
	{
		PageResultInfo<UserLxfsBean> resultInfo = lxfsService.queryLxfsList(getPageInfo(),queryBean);
		responseWrite(resultInfo);
	}
	
	/**
	 * 跳转至用户联系方式页面
	 * @return
	 * @throws SQLException 
	 */
	public String toLxfsPage() throws SQLException
	{
		userLxfsBean = lxfsService.queryuserLxfsBeanById(userid);
		
		//查询是否农村警务室
		String sfncjws = lxfsService.getSfncjws(userLxfsBean.getOrgdwdm());
		if ("1".equals(sfncjws))
		{
			userLxfsBean.setSfzcmj("1");
		}
		else
		{
			userLxfsBean.setSfzcmj("0");
		}
		return "tolxfsPage";
		
	}
	
	public void saveJylxfs()
	{
		try
		{
			lxfsService.saveUserLxfs(userLxfsBean);
			responseWrite(true);
		}
		catch(Exception e)
		{
			e.printStackTrace();
			responseWrite(false);
		}
	}
	
	/**
	 * 保存用户修改信息
	 * @return
	 * @throws SQLException 
	 */
	public void updateLxfs() throws SQLException
	{
		lxfsService.updateUserLxfs(userLxfsBean);
		responseWrite(true);
	}
	public UserLxfsBean getUserLxfsBean() {
		return userLxfsBean;
	}
	public void setUserLxfsBean(UserLxfsBean userLxfsBean) {
		this.userLxfsBean = userLxfsBean;
	}
	public UserLxfsQuery getQueryBean() {
		return queryBean;
	}
	public void setQueryBean(UserLxfsQuery queryBean) {
		this.queryBean = queryBean;
	}
	public UserLxfsService getLxfsService() {
		return lxfsService;
	}
	public void setLxfsService(UserLxfsService lxfsService) {
		this.lxfsService = lxfsService;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getOperType() {
		return operType;
	}

	public void setOperType(String operType) {
		this.operType = operType;
	}

	public String getUserid()
	{
		return userid;
	}

	public void setUserid(String userid)
	{
		this.userid = userid;
	}

}
