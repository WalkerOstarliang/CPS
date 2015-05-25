package com.chinacreator.afgl.action;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.List;

import com.chinacreator.afgl.bean.ZbhcyxxBean;
import com.chinacreator.afgl.query.ZbhcyxxQuery;
import com.chinacreator.afgl.services.ZbhcyxxService;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.cps.action.CPSBaseAction;

/**
 * 治保会成员信息
 */
public class ZbhcyxxAction extends CPSBaseAction{

	private static final long serialVersionUID = 7309901752134378580L;

	private ZbhcyxxService zbhcyxxService;
	private ZbhcyxxBean zbhcyxxBean;
	private ZbhcyxxQuery zbhcyxxQuery;
	private List<ZbhcyxxBean> zbhcyxxList;
	
	private String sfzh;
	
	public ZbhcyxxAction(){
		zbhcyxxService = new ZbhcyxxService();
		zbhcyxxBean = new ZbhcyxxBean();
		zbhcyxxQuery = new ZbhcyxxQuery();
		zbhcyxxList = new ArrayList<ZbhcyxxBean>();
	}
	
	/**
	 * 跳转到治保会成员信息列表
	 */
	public String toZbhcyxxList(){
		initQueryBean(zbhcyxxQuery);
		return "toZbhcyxxList";
	}
	
	/**
	 * 查询治保会成员信息列表并写到页面
	 */
	public void zbhcyxxList() throws Exception{
		PageResultInfo<ZbhcyxxBean> zbhcyxxResultInfo= zbhcyxxService.zbhcyxxList(getPageInfo(), zbhcyxxQuery);
		responseWrite(zbhcyxxResultInfo);
	}
	
	/**
	 * 跳转到新增治保会成员信息页面
	 * @return
	 */
	public String toAddZbhcyxx() throws Exception
	{
		zbhcyxxBean = zbhcyxxService.getZbhcyxxByZbhcybh(zbhcyxxQuery);
		return "toAddZbhcyxx";
	}
	
	/**
	 * 注销治保会成员信息
	 * @date Mar 27, 2015 3:28:33 PM
	 */
	public void zxZbhcyxx()
	{
		try
		{
			zbhcyxxService.zxZbhcyxxByzbhcybh(zbhcyxxQuery.getZbhcybh());
			responseWrite(true);
		}
		catch(Exception e)
		{
			e.printStackTrace();
			responseWrite(false);
		}
	}
	
	/**
	 * 提交治保会成员表单
	 * @return
	 */
	public void addZbhcyxx()
	{
		try
		{
			zbhcyxxService.addZbhcyxx(zbhcyxxBean);
			responseWrite(zbhcyxxBean.getZbhcybh());
		}
		catch(Exception e)
		{
			e.printStackTrace();
			responseWrite(null);
		}
	}
	
	/**
	 * 跳转到修改治保会成员信息页面
	 * @return
	 */
	public String toUpdateZbhcyxxByZbhcybh() throws Exception{
		zbhcyxxBean = zbhcyxxService.getZbhcyxxByZbhcybh(zbhcyxxQuery);
		return "toUpdateZbhcyxxByZbhcybh";
	}
	
	/**
	 * 跳转到删除治保会成员信息页面
	 * @return
	 */
	public String toDeleteZbhcyxxByZbhcybh() throws Exception{
		zbhcyxxBean = zbhcyxxService.getZbhcyxxByZbhcybh(zbhcyxxQuery);
		return "toDeleteZbhcyxxByZbhcybh";
	}
	
	/**
	 * 跳转到批量删除治保会成员信息页面
	 * @return
	 */
	public String toBatchDeleteZbhcyxxByZbhcybhs() throws Exception{
		zbhcyxxList = zbhcyxxService.getZbhcyxxListByZbhcybhs(zbhcyxxQuery);
		return "toBatchDeleteZbhcyxxByZbhcybhs";
	}
	
	/**
	 * 批量删除治保会成员信息
	 * @return
	 */
	public void batchDeleteZbhcyxxByZbhcybhs() throws Exception{
		zbhcyxxService.batchDeleteZbhcyxxByZbhcybhs(zbhcyxxList, zbhcyxxBean);
	}
	
	/**
	 * 查看治保会成员信息
	 * @return
	 */
	public String viewZbhcyxxByZbhcybh() throws Exception{
		zbhcyxxBean = zbhcyxxService.getZbhcyxxByZbhcybh(zbhcyxxQuery);
		return "viewZbhcyxxByZbhcybh";
	}
	
	/**
	 * 得到治保会成员信息
	 * @return
	 */
	public void getZbhcyxxByZbhcybh() throws Exception{
		zbhcyxxBean = zbhcyxxService.getZbhcyxxByZbhcybh(zbhcyxxQuery);
		responseWrite(zbhcyxxBean);
	}

	/**
	 * 跳转到选择治保会成员信息列表
	 * @return
	 */
	public String toSelectZbhcyxx(){
		initQueryBean(zbhcyxxQuery);
		return "toSelectZbhcyxx";
	}
	
	/**
	 * 跳转到高级查询治保会成员信息列表
	 * @return
	 */
	public String toGjQueryZbhcyxx(){ 
		initQueryBean(zbhcyxxQuery);
		return "toGjQueryZbhcyxx";
	}
	
	/**
	 * 在治保会列表中点击查看成员信息
	 * @return
	 */
	public String toZbhcyxxListByZbhbh(){
		//System.out.println(zbhcyxxQuery.getZbhmc());
		try {
			zbhcyxxQuery.setZbhmc(URLDecoder.decode(zbhcyxxQuery.getZbhmc(), "utf-8"));
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		initQueryBean(zbhcyxxQuery);
		return "toZbhcyxxListByZbhbh";
	}
	
	//判断该治保会中是否存在该身份证
	public void isExistSfzhInZbh(){
		boolean flag=false;
		try {
			flag=zbhcyxxService.getZbhcyxxBySfzhAndZbhbh(zbhcyxxBean.getSfzh(), zbhcyxxBean.getZbhbh());
		} catch (Exception e) {
			flag=false;
			e.printStackTrace();
		}
		responseWrite(flag);
	}

	public ZbhcyxxBean getZbhcyxxBean() {
		return zbhcyxxBean;
	}

	public void setZbhcyxxBean(ZbhcyxxBean zbhcyxxBean) {
		this.zbhcyxxBean = zbhcyxxBean;
	}

	public ZbhcyxxQuery getZbhcyxxQuery() {
		return zbhcyxxQuery;
	}

	public void setZbhcyxxQuery(ZbhcyxxQuery zbhcyxxQuery) {
		this.zbhcyxxQuery = zbhcyxxQuery;
	}

	public List<ZbhcyxxBean> getZbhcyxxList() {
		return zbhcyxxList;
	}

	public void setZbhcyxxList(List<ZbhcyxxBean> zbhcyxxList) {
		this.zbhcyxxList = zbhcyxxList;
	}

	public String getSfzh() {
		return sfzh;
	}

	public void setSfzh(String sfzh) {
		this.sfzh = sfzh;
	}
}
