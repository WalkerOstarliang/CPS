package com.chinacreator.afgl.action;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.chinacreator.afgl.bean.ZbhcyxxBean;
import com.chinacreator.afgl.bean.ZbhxxBean;
import com.chinacreator.afgl.query.ZbhcyxxQuery;
import com.chinacreator.afgl.query.ZbhxxQuery;
import com.chinacreator.afgl.services.ZbhxxService;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.cps.action.CPSBaseAction;

/**
 * 治保会信息
 */
public class ZbhxxAction extends CPSBaseAction{

	private static final long serialVersionUID = 7309901752134378580L;

	private ZbhxxService zbhxxService;
	private ZbhxxBean zbhxxBean;
	private ZbhcyxxBean zbhcyxxBean;
	private ZbhxxQuery zbhxxQuery;
	private List<ZbhxxBean> zbhxxList;
	private String zbhbh;
	
	private ZbhcyxxQuery query;
	
	public ZbhxxAction()
	{
		zbhxxService = new ZbhxxService();
		zbhxxBean = new ZbhxxBean();
		zbhcyxxBean = new ZbhcyxxBean();
		zbhxxQuery = new ZbhxxQuery();
		zbhxxList = new ArrayList<ZbhxxBean>();
		
		query = new ZbhcyxxQuery();
	}
	
	/**
	 * 跳转到治保会信息列表
	 */
	public String toZbhxxList(){
		initQueryBean(zbhxxQuery);
		return "toZbhxxList";
	}
	
	/**
	 * 查询治保会信息列表并写到页面
	 */
	public void zbhxxList() throws Exception
	{
		PageResultInfo<ZbhxxBean> zbhxxResultInfo= zbhxxService.zbhxxList(getPageInfo(), zbhxxQuery);
		responseWrite(zbhxxResultInfo);
	}
	
	public String toAddZbhcyxx() throws SQLException
	{
		zbhcyxxBean = zbhxxService.queryZbhxxBeanByZbhbh(zbhbh);
		return "toAddZbhcyxx";
	}
	
	/**
	 * 提交治保会表单
	 * @return
	 */
	public void addZbhxx()
	{
		try
		{
			String zbhbh = zbhxxService.addZbhxx(zbhxxBean);
			responseWrite(zbhbh);
		}
		catch(Exception e)
		{
			e.printStackTrace();
			responseWrite(null);
		}
	}
	
	/**
	 * 跳转到修改治保会信息页面
	 * @return
	 */
	public String toUpdateZbhxxByZbhbh() throws Exception{
		zbhxxBean = zbhxxService.getZbhxxByZbhbh(zbhxxQuery);
		return "toUpdateZbhxxByZbhbh";
	}
	
	/**
	 * 跳转到删除治保会信息页面
	 * @return
	 */
	public String toDeleteZbhxxByZbhbh() throws Exception{
		zbhxxBean = zbhxxService.getZbhxxByZbhbh(zbhxxQuery);
		return "toDeleteZbhxxByZbhbh";
	}
	
	/**
	 * 跳转到批量删除治保会信息页面
	 * @return
	 */
	public String toBatchDeleteZbhxxByZbhbhs() throws Exception{
		zbhxxList = zbhxxService.getzbhxxListByZbhbhs(zbhxxQuery);
		return "toBatchDeleteZbhxxByZbhbhs";
	}
	
	/**
	 * 批量删除治保会信息
	 * @return
	 */
	public void batchDeleteZbhxxByZbhbhs() throws Exception{
		zbhxxService.batchDeleteZbhxxByZbhbhs(zbhxxList, zbhxxBean);
	}
	
	/**
	 * 查看治保会信息
	 * @return
	 */
	public String viewZbhxxByZbhbh() throws Exception{
		zbhxxBean = zbhxxService.getZbhxxByZbhbh(zbhxxQuery);
		return "viewZbhxxByZbhbh";
	}
	
	/**
	 * 得到治保会信息
	 * @return
	 */
	public void getZbhxxByZbhbh() throws Exception{
		zbhxxBean = zbhxxService.getZbhxxByZbhbh(zbhxxQuery);
		responseWrite(zbhxxBean);
	}

	/**
	 * 跳转到选择治保会信息列表
	 * @return
	 */
	public String toSelectZbhxx(){
		initQueryBean(zbhxxQuery);
		return "toSelectZbhxx";
	}
	
	/**
	 * 跳转到高级查询治保会信息列表
	 * @return
	 */
	public String toGjQueryZbhxx(){
		initQueryBean(zbhxxQuery);
		return "toGjQueryZbhxx";
	}

	/**
	 * 跳转到新增治保会信息页面
	 * @return
	 */
	public String toAddZbhxx(){
		zbhxxBean.setCzbs(zbhxxQuery.getCzbs());
		return "toAddZbhxx";
	}
	
	/**
	 * 通过治保会编号查找治保会成员
	 * @return
	 * @throws SQLException 
	 */
	public void zbhcyxxList() throws SQLException
	{
		if(zbhxxBean!=null)
		{
			zbhbh = zbhxxBean.getZbhbh();
		}
		PageResultInfo<ZbhcyxxBean> zbhcyxxResultInfo= zbhxxService.zbhcyxxList(getPageInfo(),query);
		responseWrite(zbhcyxxResultInfo);
	}
	
	public void isExistZbhmc(){
		boolean flag=false;
		try {
			 flag=zbhxxService.queryZhbByNameAndOrg(zbhxxBean.getZbhmc(), zbhxxBean.getDjdwdm());
		} catch (SQLException e) {
			flag=false;
			e.printStackTrace();
		}
		responseWrite(flag);
	}
	
	
	/**
	 * 跳转到治保会成员页面
	 * @return
	 */
	public String toZbhCyListPage(){
		initQueryBean(query);
		return "toZbhCyListPage";
	}
	
	public ZbhxxBean getZbhxxBean() {
		return zbhxxBean;
	}

	public void setZbhxxBean(ZbhxxBean zbhxxBean) {
		this.zbhxxBean = zbhxxBean;
	}

	public ZbhxxQuery getZbhxxQuery() {
		return zbhxxQuery;
	}

	public void setZbhxxQuery(ZbhxxQuery zbhxxQuery) {
		this.zbhxxQuery = zbhxxQuery;
	}

	public List<ZbhxxBean> getZbhxxList() {
		return zbhxxList;
	}

	public void setZbhxxList(List<ZbhxxBean> zbhxxList) {
		this.zbhxxList = zbhxxList;
	}

	public String getZbhbh() {
		return zbhbh;
	}

	public void setZbhbh(String zbhbh) {
		this.zbhbh = zbhbh;
	}

	public ZbhcyxxBean getZbhcyxxBean() {
		return zbhcyxxBean;
	}

	public void setZbhcyxxBean(ZbhcyxxBean zbhcyxxBean) {
		this.zbhcyxxBean = zbhcyxxBean;
	}

	public ZbhcyxxQuery getQuery() {
		return query;
	}

	public void setQuery(ZbhcyxxQuery query) {
		this.query = query;
	}
}
