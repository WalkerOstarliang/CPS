package com.chinacreator.dzgl.action;


import java.util.ArrayList;
import java.util.List;

import com.chinacreator.common.bean.LoginInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.bean.QueryBean;
import com.chinacreator.common.bean.SystemDictionaryBean;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.cps.action.CPSBaseAction;
import com.chinacreator.common.cps.bean.RkJbxxBean;
import com.chinacreator.common.helper.ActionContextHelper;
import com.chinacreator.common.helper.DateTimeHelper;
import com.chinacreator.common.helper.DictionaryCacheHellper;
import com.chinacreator.common.helper.ValidateHelper;
import com.chinacreator.dzgl.bean.DzxxBean;
import com.chinacreator.dzgl.bean.StxxBean;
import com.chinacreator.dzgl.bean.StxxFwjgDetailBean;
import com.chinacreator.dzgl.query.DzxxQueryBean;
import com.chinacreator.dzgl.service.DzxxService;
import com.chinacreator.lsgl.bean.FwJbxxBean;

public class DzglAction extends CPSBaseAction
{

	/**
	 * 
	 */
	private static final long	serialVersionUID	= 8840539946023284702L;
	
	private DzxxService dzxxService;
	private DzxxBean dzxxBean;
	private StxxBean stxxBean;
	private DzxxQueryBean queryBean;
	private String offsetX;
	private String offsetY;
	private List<StxxBean> stxxBeansList;
	private StxxFwjgDetailBean fwjgDetail;
	private String stid;
	private String dyh;
	private String fwid;
	private List<RkJbxxBean> fwrkBeans;
	
	public DzglAction()
	{
		super();
		dzxxService = new DzxxService();
		dzxxBean = new DzxxBean();
		stxxBean = new StxxBean();
		queryBean = new DzxxQueryBean();
	}
	
	protected void initQueryBean(QueryBean queryBean)
	{
		super.initQueryBean(queryBean);
	}
	
	public String toStxxBeanSelectPage()
	{
		initQueryBean(queryBean);
		return "toStxxBeanSelectPage";
	}
	
	//列表模式
	public String toStxxListPage()
	{
		initQueryBean(queryBean);
		return "toStxxListPage";
	}
	//地图模式
	public String toStxxListPageMap()
	{
		initQueryBean(queryBean);
		return "toStxxListPagetMap";
	}
	
	public String toDzxxListPage()
	{
		initQueryBean(queryBean);
		return "toDzxxListPage";
	}
	
	public String toStxxDetailPage()
	{
		try
		{
			LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
			if (CommonConstant.OPERTYPE_ADD.equals(operType))
			{
				stxxBean.setDjsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd hh:mm:ss"));
				stxxBean.setSjxzqh(loginInfo.getCitydm());
				
				if (!loginInfo.getIsGxdz())
				{
					stxxBean.setXzqh(loginInfo.getCountrydm());
				}
				else
				{
					stxxBean.setXzqh(loginInfo.getGxYxzqhList().get(0));
				}
				stxxBean.setJdxzdm(loginInfo.getJdxzdm());
			}
			else
			{
				stxxBean = dzxxService.queryStxxBeanByStId(stxxBean.getId());
			}
			if(stxxBean !=null)
			{
				if (ValidateHelper.isEmptyString(stxxBean.getSjxzqh()))
				{
					stxxBean.setSjxzqh(loginInfo.getCitydm());
				}
				if (ValidateHelper.isEmptyString(stxxBean.getXzqh()))
				{
					if (!loginInfo.getIsGxdz())
					{
						stxxBean.setXzqh(loginInfo.getCountrydm());
					}
					/*
					buss = new DictionaryBusiness();
					xzqhMap = buss.getXzqhByPz(loginInfo.getCountrydm());
					if(ValidateHelper.isNotEmptyString(xzqhMap.get("yxzqh"))){
						//stxxBean.setXzqh(xzqhMap.get("yxzqh"));
					}else{
						//stxxBean.setXzqh(loginInfo.getCountrydm());
					}*/
				}
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return "toStxxDetailPage";
	}
	
	//跳转到实体信息(上下结构)
	public String toStxxDetailDivInfo(){
		toStxxDetailPage();
		return "toStxxDetailDivInfo";
	}
	
	//跳转到实体信息(左右结构)
	public String toStxxDetailPageInfo(){
		toStxxDetailPage();
		return "toStxxDetailPageInfo";
	}
	
	/**
	 * 跳转至房屋结构明细
	 * @return
	 * @date Apr 20, 2015 10:45:43 AM
	 */
	public String toStxxFwJgDetailPage()
	{
		toStxxDetailPage();
		if (!CommonConstant.OPERTYPE_ADD.equals(operType) 
				&& ValidateHelper.isNotEmptyString(stxxBean.getId()))
		{
			fwjgDetail = new StxxFwjgDetailBean();
			SystemDictionaryBean dicBean = new SystemDictionaryBean();
			dicBean.setDm("");
			dicBean.setMc("全部");
			fwjgDetail.getDyhList().add(dicBean);
			//获取楼栋实体所有单元号
			List<SystemDictionaryBean> dyhlist = dzxxService.queryStxxDyhxxList(stxxBean.getId());
			fwjgDetail.getDyhList().addAll(dyhlist);
		}
		else
		{
			fwjgDetail = new StxxFwjgDetailBean();
			SystemDictionaryBean dicBean = new SystemDictionaryBean();
			dicBean.setDm("");
			dicBean.setMc("全部");
			fwjgDetail.getDyhList().add(dicBean);
		}
		return "toStxxFwJgDetailPage";
	}
	
	public String toFwrkShowPage()
	{
		fwrkBeans = dzxxService.queryFwRkxxBeansByFwid(fwid);
		return "toFwrkShowPage";
	}
	
	public String loadFwlcjgPage()
	{
		fwjgDetail = new StxxFwjgDetailBean();
		List<FwJbxxBean> fwjglist = dzxxService.queryFwjgList(stid,dyh);
		fwjgDetail.setFwjbxxBeans(fwjglist);
		//重新排序楼层与房间号
		fwjgDetail.sortFwListToLinkedMap();
		return "loadFwlcjgPage";
	}
	
	public String toStxxDetailNoMapPageInfo()
	{
		LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
		toStxxDetailPage();
		if (stxxBean == null)
		{
			stxxBean = new StxxBean();
			stxxBean.setSjxzqh(loginInfo.getCitydm());
			stxxBean.setXzqh(loginInfo.getCountrydm());
			stxxBean.setJdxzdm(loginInfo.getJdxzdm());
			stxxBean.setX(offsetX);
			stxxBean.setY(offsetY);
		}
		else if (stxxBean != null)
		{
			if (ValidateHelper.isEmptyString(stxxBean.getSjxzqh()))
			{
				stxxBean.setSjxzqh(loginInfo.getCitydm());
			}
			if (ValidateHelper.isEmptyString(stxxBean.getXzqh()))
			{
				stxxBean.setXzqh(loginInfo.getCountrydm());
			}
			
			if (ValidateHelper.isEmptyString(stxxBean.getJdxzdm()))
			{
				stxxBean.setJdxzdm(loginInfo.getJdxzdm());
			}
			
			if(ValidateHelper.isNotEmptyString(offsetX)){
				stxxBean.setX(offsetX);
			}
			if(ValidateHelper.isNotEmptyString(offsetY)){
				stxxBean.setY(offsetY);
			}
			
			if(ValidateHelper.isEmptyString(stxxBean.getJdxzdm())){
				stxxBean.setJdxzdm(loginInfo.getJdxzdm());
			}
		}
		return "toStxxDetailNoMapPageInfo";
	}
	
	
	public String toDzxxDetailPage()
	{
		try
		{
			stxxBean = dzxxService.queryStxxBeanByStId(stxxBean.getId());
			if (CommonConstant.OPERTYPE_UPDATE.equals(operType))
			{
				dzxxBean = dzxxService.queryDzxxBeanByDzid(dzxxBean.getDzid());
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return "toDzxxDetailPage";
	}
	
	public void saveStxxBean()
	{
		try
		{
			stxxBean.setXzqhmc(DictionaryCacheHellper.getXzqhmcByQhdm(stxxBean.getXzqh()));
			stxxBean = dzxxService.saveStxxBean(stxxBean);
			responseWrite(stxxBean);
		}
		catch(Exception e)
		{
			e.printStackTrace();
			responseWrite(null);
		}
	}
	
	public void saveDzxxBean()
	{
		try
		{
			dzxxBean.setStid(stxxBean.getId());
			dzxxBean = dzxxService.saveDzxxBean(dzxxBean);
			responseWrite(dzxxBean);
		}
		catch(Exception e)
		{
			e.printStackTrace();
			responseWrite(null);
		}
	}
	
	public void queryStxxBeansPageResult()
	{
		LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
		PageResultInfo<StxxBean> pageResult = new PageResultInfo<StxxBean>();
		try
		{
			queryBean.setOrgcode(loginInfo.getOrgcode());
			queryBean.setLeve(loginInfo.getLeve());
			pageResult = dzxxService.queryStxxBeansPageResult(getPageInfo(), queryBean);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		responseWrite(pageResult);
	}
	
	public String exportStxxBeans()
	{
		LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
		try
		{
			queryBean.setOrgcode(loginInfo.getOrgcode());
			queryBean.setLeve(loginInfo.getLeve());
			stxxBeansList = dzxxService.queryStxxBeans(queryBean);
		}
		catch(Exception e)
		{
			e.printStackTrace();
			stxxBeansList = new ArrayList<StxxBean>();
		}
		return "exportStxxBeans";
	}
	
	public void queryDzxxBeansPageResult()
	{
		PageResultInfo<DzxxBean> pageResult = new PageResultInfo<DzxxBean>();
		try
		{
			pageResult = dzxxService.queryDzxxBeansPageResultInfo(getPageInfo(), queryBean);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		responseWrite(pageResult);
	}
	
	public void deleteStxx(){
		try {
			if(!dzxxService.queryStxxIsIncludeFwxx(stxxBean.getId()))
			{
				dzxxService.deleteStxx(stxxBean);
				responseWrite(true);
			}
		} catch (Exception e) {
			responseWrite(false);
			e.printStackTrace();
		}
	}
	
	public void deleteStxxBean()
	{
		try
		{
			if(!dzxxService.queryStxxIsIncludeFwxx(stxxBean.getId()))
			{
				dzxxService.deleteStxxBeanByStId(stxxBean.getId());
				responseWrite(true);
			}
			else
			{
				responseWrite("exsitsfw");
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
			responseWrite(false);
		}
		
	}
	
	public void queryStxxIsIncludeFwxx() throws Exception{
		boolean flag=dzxxService.queryStxxIsIncludeFwxx(stxxBean.getId());
		responseWrite(flag);
	}
	
	
	/**
	 *  恢复实体信息
	 */
	public void recoveryStxx(){
		try {
			dzxxService.recoveryStxx(stxxBean);
			responseWrite(true);
		} catch (Exception e) {
			responseWrite(false);
			e.printStackTrace();
		}
	}

	public DzxxBean getDzxxBean()
	{
		return dzxxBean;
	}

	public void setDzxxBean(DzxxBean dzxxBean)
	{
		this.dzxxBean = dzxxBean;
	}

	public StxxBean getStxxBean()
	{
		return stxxBean;
	}

	public void setStxxBean(StxxBean stxxBean)
	{
		this.stxxBean = stxxBean;
	}

	public DzxxQueryBean getQueryBean()
	{
		return queryBean;
	}

	public void setQueryBean(DzxxQueryBean queryBean)
	{
		this.queryBean = queryBean;
	}

	public String getOffsetX() {
		return offsetX;
	}

	public void setOffsetX(String offsetX) {
		this.offsetX = offsetX;
	}

	public String getOffsetY() {
		return offsetY;
	}

	public void setOffsetY(String offsetY) {
		this.offsetY = offsetY;
	}

	public List<StxxBean> getStxxBeansList()
	{
		return stxxBeansList;
	}

	public void setStxxBeansList(List<StxxBean> stxxBeansList)
	{
		this.stxxBeansList = stxxBeansList;
	}

	public StxxFwjgDetailBean getFwjgDetail()
	{
		return fwjgDetail;
	}

	public void setFwjgDetail(StxxFwjgDetailBean fwjgDetail)
	{
		this.fwjgDetail = fwjgDetail;
	}

	public String getStid()
	{
		return stid;
	}

	public void setStid(String stid)
	{
		this.stid = stid;
	}

	public String getDyh()
	{
		return dyh;
	}

	public void setDyh(String dyh)
	{
		this.dyh = dyh;
	}

	public String getFwid()
	{
		return fwid;
	}

	public void setFwid(String fwid)
	{
		this.fwid = fwid;
	}

	public List<RkJbxxBean> getFwrkBeans()
	{
		return fwrkBeans;
	}

	public void setFwrkBeans(List<RkJbxxBean> fwrkBeans)
	{
		this.fwrkBeans = fwrkBeans;
	}
	
}
