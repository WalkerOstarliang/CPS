package com.chinacreator.afgl.action;

import java.util.List;

import com.chinacreator.afgl.bean.SqJbxxBean;
import com.chinacreator.afgl.bean.Xqjbxx;
import com.chinacreator.afgl.query.SqJbxxQueryBean;
import com.chinacreator.afgl.services.SqJbxxService;
import com.chinacreator.common.bean.LoginInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.cps.action.CPSBaseAction;
import com.chinacreator.common.cps.bean.TreeNode;
import com.chinacreator.common.cps.business.OrgUserbusiness;
import com.chinacreator.common.helper.ActionContextHelper;
import com.chinacreator.common.helper.DateTimeHelper;

/**
 * 社区基本情况管理
 * @author mingchun.xiong
 *
 */
public class SqJbxxglAction extends CPSBaseAction
{

	/**
	 * serialVersionUID
	 */
	private static final long	serialVersionUID	= 4793024772616173893L;
	
	private List<TreeNode> xqxzqhList = null;
	
	private SqJbxxService sqService;
	
	private SqJbxxBean sqBean;
	
	private SqJbxxQueryBean queryBean;
	
	private String sqbhs;
	
	private String sqdm;
	
	private String pcsdm;
	
	private String jwsdm;
	
	private String fromJwqdm;
	
	private boolean readonly = false;
	
	private String op;
	
	public SqJbxxglAction()
	{
		super();
		sqService = new SqJbxxService();
		queryBean = new SqJbxxQueryBean();
	}
	
	public String toSqJbxxListPage()
	{
		initQueryBean(queryBean);
		return "toSqJbxxListPage";
	}
	
	/**
	 * 打开社区列表现在窗口
	 * @return
	 */
	public String toOpenSqListSelectWin()
	{
		initQueryBean(queryBean);
		return "toOpenSqListSelectWin";
	}
	
	/**
	 * 重点人员托管所需
	 * @return
	 */
	public String toSqListSelectWin()
	{
		LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
		queryBean.setCitygajgjgdm(loginInfo.getCitygajgdm());
		//initQueryBean(queryBean);
		return "toOpenSqListSelectWin";
	}
	
	public String toXtglSqJbxxInfoPage()
	{
		try
		{
			sqBean = sqService.querySqJbxxBeanByDm(sqdm);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return "toXtglSqJbxxInfoPage";
	}
	
	public String toSqJbxxBeanInfoPage() throws Exception
	{
		LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
		if (CommonConstant.OPERTYPE_ADD.equals(operType))
		{
			if (sqBean == null)
			{
				sqBean = new SqJbxxBean();
				sqBean.setSsxzqh(loginInfo.getCountrydm());
				sqBean.setGxsqjwsdm(loginInfo.getJwsqdm());
				
				sqBean.setSspcsdm(loginInfo.getPcsdm());
				sqBean.setDjsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss"));
				sqBean.setSqmjlxdh(loginInfo.getMoblie() != null ? loginInfo.getMoblie() : loginInfo.getTelephone());
				sqBean.setSqmjxm(loginInfo.getRealname());
				sqBean.setDjdwdm(loginInfo.getOrgcode());
				sqBean.setDjdwmc(loginInfo.getOrgname());
				sqBean.setDjrjh(loginInfo.getUsername());
				sqBean.setDjrxm(loginInfo.getRealname());
				sqBean.setZxbs("1"); //正常
			}
		}
		else if (CommonConstant.OPERTYPE_UPDATE.equals(operType))
		{
			sqBean = sqService.querySqJbxxBeanBySqbh(sqbhs);
			sqBean.setDjsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd"));
		}
		else if (CommonConstant.OPERTYPE_DETAIL.equals(operType))
		{
			sqBean = sqService.querySqJbxxBeanBySqbh(sqbhs);
		}
		return "toSqJbxxBeanInfoPage";
	}
	
	/**
	 * 调整至社区基本信息的新增，修改，详情页面
	 * @return
	 */
	public String toSqJbxxInfoPage()
	{
		return "toSqJbxxInfoPage";
	}
	
	/**
	 * 社区基本列表查询
	 */
	public void querySqJbxxBeanList() throws Exception
	{
		PageResultInfo<SqJbxxBean> list = sqService.querySqJbxxPageResultByQueryBean(queryBean, getPageInfo());
		responseWrite(list);
	}
	
	/**
	 * 删除社区基本信息，不做物理删除
	 */
	public void deleteSqJbxx() throws Exception
	{
		sqService.deleteSqJbxxBeanBySqbh(sqbhs);
		responseWrite(true);
	}
	
	/**
	 * 保存社区基本信息
	 */
	public void saveSqJbxxBean()
	{
		sqBean = sqService.saveSqJbxxBean(sqBean, operType);
		responseWrite(sqBean);
	}
	
	//查询辖区情况
	public void queryXqqk() throws Exception{
		Xqjbxx beanXqjbxx = sqService.queryXqqk(queryBean);
		responseWrite(beanXqjbxx);
	}

	/**
	 * 加载社区通过派出所代码
	 * @throws Exception
	 */
	public void loadSqJbxxBeanListByPcsdm() throws Exception
	{
		List<SqJbxxBean>  list = sqService.querySqJbxxBeanListByPcsdm(pcsdm);
		responseWrite(list);
	}
	
	public void loadSqJbxxBeanListByJwsdm() throws Exception
	{
		List<SqJbxxBean>  list = sqService.querySqJbxxBeanListByJwsdm(jwsdm);
		responseWrite(list);
	}
	
	public SqJbxxBean getSqBean() {
		return sqBean;
	}


	public void setSqBean(SqJbxxBean sqBean) {
		this.sqBean = sqBean;
	}


	public SqJbxxQueryBean getQueryBean() {
		return queryBean;
	}

	public void setQueryBean(SqJbxxQueryBean queryBean) {
		this.queryBean = queryBean;
	}

	public String getSqbhs() {
		return sqbhs;
	}

	public void setSqbhs(String sqbhs) {
		this.sqbhs = sqbhs;
	}

	public String getPcsdm() {
		return pcsdm;
	}

	public void setPcsdm(String pcsdm) {
		this.pcsdm = pcsdm;
	}

	public String getJwsdm() {
		return jwsdm;
	}

	public void setJwsdm(String jwsdm) {
		this.jwsdm = jwsdm;
	}

	public List<TreeNode> getXqxzqhList() {
		OrgUserbusiness business = new OrgUserbusiness();
		LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
		String xzqhdm = loginInfo.getOrgcode().substring(0, 4) + "00";
		xqxzqhList = business.queryChildXzqhListByParentDm(xzqhdm);
		return xqxzqhList;
	}

	public void setXqxzqhList(List<TreeNode> xqxzqhList) {
		this.xqxzqhList = xqxzqhList;
	}

	public boolean getReadonly()
	{
		return readonly;
	}

	public void setReadonly(boolean readonly)
	{
		this.readonly = readonly;
	}

	public String getSqdm()
	{
		return sqdm;
	}

	public void setSqdm(String sqdm)
	{
		this.sqdm = sqdm;
	}

	public String getOp() {
		return op;
	}

	public void setOp(String op) {
		this.op = op;
	}

	public String getFromJwqdm()
	{
		return fromJwqdm;
	}

	public void setFromJwqdm(String fromJwqdm)
	{
		this.fromJwqdm = fromJwqdm;
	}
	

}
