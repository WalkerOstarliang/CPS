package com.chinacreator.common.cps.action;

import java.util.ArrayList;
import java.util.List;

import com.chinacreator.common.bean.LoginInfo;
import com.chinacreator.common.bean.OrganizationBean;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.bean.UserBean;
import com.chinacreator.common.cps.bean.TreeNode;
import com.chinacreator.common.cps.bean.UserLxfsBean;
import com.chinacreator.common.cps.business.OrgUserbusiness;
import com.chinacreator.common.helper.ActionContextHelper;
import com.chinacreator.common.helper.ValidateHelper;

public class OrgUserSelectedTreeAction extends CPSBaseAction
{

	/**
	 * 
	 */
	private static final long	serialVersionUID	= 425774854968480138L;
	
	private OrgUserbusiness business;
	
	private String mutilSelect = "false";
	
	private String rootOrgCode = "0";
	
	private String isAsyn = "false";
	
	private String nodeSelectedType = "ps";
	
	private String nodeNotSelectedType = "ps";
	
	private int pageNum = 0;
	
	private String searchname;
	
	private boolean isRoot;
	
	private int leve;
	
	private String ispcs;
	
	private List<TreeNode> organizationList = new ArrayList<TreeNode>();
	
	public OrgUserSelectedTreeAction()
	{
		business = new OrgUserbusiness();
	}
	
	
	public String toDwrySelectPage()
	{
		return "toDwrySelectPage";
	}
	
	public String toDwSelectPage()
	{
		return "toDwSelectPage";
	}
	
	public String toDwSelectPage2()
	{
		return "toDwSelectPage2";
	}
	
	/**
	 * 流口协管员专用
	 * @return
	 */
	public String toDwSelectPage3()
	{
		return "toDwSelectPage3";
	}
	
	public String toXzqhTreePage()
	{
		return "toXzqhTreePage";
	}
	
	/**
	 * 通过父类查询子机构
	 */
	public void queryOrgListByParentCode()
	{
		List<TreeNode> orgList = new ArrayList<TreeNode>();
		if (isRoot)
		{
			TreeNode tn = business.queryOrganizationByOrgCode(rootOrgCode);
			orgList.add(tn);
		}
		else
		{
			orgList = business.queryOrganizationListByParentCode(rootOrgCode);
		}
		responseWrite(orgList);
	}
	
	/**
	 * 通过父类查询子机构
	 */
	public void queryOrgListByParentCode2()
	{
		List<TreeNode> orgList = new ArrayList<TreeNode>();
		if (isRoot)
		{
			TreeNode tn = business.queryOrganizationByOrgCode(rootOrgCode);
			orgList.add(tn);
		}
		else
		{
			orgList = business.queryOrganizationListByParentCode2(rootOrgCode,leve);
		}
		responseWrite(orgList);
	}
	
	
	/**
	 * 通过父类查询子机构
	 * 流口协管员专用
	 */
	public void queryOrgListByParentCode3()
	{
		List<TreeNode> orgList = new ArrayList<TreeNode>();
		List<TreeNode> orgListRj = new ArrayList<TreeNode>();
		if (isRoot)
		{
			TreeNode tn = business.queryOrganizationByOrgCode(rootOrgCode);
			orgList.add(tn);
		}
		else
		{
			orgList = business.queryOrganizationListByParentCode3(rootOrgCode,leve);
			orgListRj = business.queryRjOrg();
			if(leve==3){
				loop:
					for (TreeNode treeNode : orgList) {
					for (TreeNode treeNodeRj : orgListRj) {
						if(treeNodeRj.getParentId().substring(0, 6).equals(treeNode.getId().substring(0, 6))){
							orgList.add(treeNodeRj);
							break loop;
						}
					}
				}
			}
		}
		responseWrite(orgList);
	}
	
	/**
	 * 查询用户信息列表
	 */
	public void queryUserListByOrgCode()
	{
		List<UserBean> userList = business.queryUserListByOrgCode(rootOrgCode,pageNum);
		responseWrite(userList);
	}
	
	/**
	 * 搜索机构通过关键字
	 */
	public void searchOrgListBySearchName()
	{
		List<TreeNode> orgList = business.searchOrganizationListBySearchName(searchname);
		responseWrite(orgList);
	}
	
	/**
	 * 搜索用户列表通过搜索名称
	 */
	public void seachUserBeanListBySearchName()
	{
		List<UserBean> userList = business.seachUserBeanListBySearchName(searchname);
		responseWrite(userList);
	}
	
	/**
	 * 查询所有的孩子机构包含自身
	 */
	public void queryOrgChildOrgListByParentCode()
	{
		List<OrganizationBean> list = business.queryOrgChildOrgListByParentCode(rootOrgCode, leve);
		responseWrite(list);
	}
	
	public void loadChildXzqh()
	{
		List<TreeNode> xzqhList = business.queryChildXzqhByParentDm(rootOrgCode);
		responseWrite(xzqhList);
	}
	
	/**
	 * 查询行政区划
	 */
	public void queryXzqhListByParentDm()
	{
		List<TreeNode> xzqhList = null;
		if ("0".equals(rootOrgCode))
		{
			xzqhList = business.queryAllXzqhList();
		}
		else
		{
			xzqhList = business.queryChildXzqhListByParentDm(rootOrgCode);
		}
		responseWrite(xzqhList);
	}
	
	
	
	public String toOrgUserPageList(){
		
		return "toOrgUserPageList";
	}
	
	/**
	 * 查询机构用户列表
	 * @return
	 * @throws Exception 
	 */
	public void queryUserListPageInfoByOrgCode() throws Exception
	{
		LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
		PageResultInfo<UserLxfsBean> userList = null;
		if ("1".equals(ispcs) && ValidateHelper.isNotEmptyString(rootOrgCode) &&  rootOrgCode.toUpperCase().indexOf("S") < 0)
		{
			userList = business.queryUserListOfPcsPageInfoByOrgCode(rootOrgCode, getPageInfo());
		}
		else if (loginInfo.getLeve() == 5)
		{
			userList = business.queryUserListPageInfoByOrgCode(loginInfo.getOrgcode(),getPageInfo());
		}
		else
		{
			userList = business.queryUserListPageInfoByOrgCode(rootOrgCode,getPageInfo());
		}
		responseWrite(userList);
	}
	
	public String getMutilSelect() {
		return mutilSelect;
	}


	public void setMutilSelect(String mutilSelect) {
		this.mutilSelect = mutilSelect;
	}


	public String getRootOrgCode() {
		return rootOrgCode;
	}


	public void setRootOrgCode(String rootOrgCode) {
		this.rootOrgCode = rootOrgCode;
	}


	public String getNodeSelectedType() {
		return nodeSelectedType;
	}


	public void setNodeSelectedType(String nodeSelectedType) {
		this.nodeSelectedType = nodeSelectedType;
	}


	public String getNodeNotSelectedType() {
		return nodeNotSelectedType;
	}


	public void setNodeNotSelectedType(String nodeNotSelectedType) {
		this.nodeNotSelectedType = nodeNotSelectedType;
	}


	public int getPageNum() {
		return pageNum;
	}


	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}


	public String getSearchname() {
		return searchname;
	}


	public void setSearchname(String searchname) {
		this.searchname = searchname;
	}


	public List<TreeNode> getOrganizationList() {
		return organizationList;
	}


	public void setOrganizationList(List<TreeNode> organizationList) {
		this.organizationList = organizationList;
	}


	public boolean isRoot() {
		return isRoot;
	}


	public void setIsRoot(boolean isRoot) {
		this.isRoot = isRoot;
	}


	public int getLeve() {
		return leve;
	}


	public void setLeve(int leve) {
		this.leve = leve;
	}


	public String getIsAsyn()
	{
		return isAsyn;
	}


	public void setIsAsyn(String isAsyn)
	{
		this.isAsyn = isAsyn;
	}


	public String getIspcs()
	{
		return ispcs;
	}


	public void setIspcs(String ispcs)
	{
		this.ispcs = ispcs;
	}
	
	
	
}
