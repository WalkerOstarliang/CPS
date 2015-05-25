package com.chinacreator.menu.business;

import java.lang.reflect.Field;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.transaction.RollbackException;

import org.dom4j.Document;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;

import com.chinacreator.common.bean.LoginInfo;
import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.helper.ActionContextHelper;
import com.chinacreator.common.helper.CommonDBBaseHelper;
import com.chinacreator.common.helper.DateTimeHelper;
import com.chinacreator.common.helper.DictionaryCacheHellper;
import com.chinacreator.common.helper.PaginationHelper;
import com.chinacreator.common.helper.ValidateHelper;
import com.chinacreator.menu.bean.AjjbxxBean;
import com.chinacreator.menu.bean.MenuBean;
import com.chinacreator.menu.bean.MhtjQueryBean;
import com.chinacreator.menu.bean.OutSiteMenuBean;
import com.chinacreator.menu.bean.XqajtjBean;
import com.chinacreator.menu.bean.XqfaqktjBean;
import com.chinacreator.menu.bean.XqqktjBean;
import com.chinacreator.menu.bean.XttxListBean;
import com.chinacreator.menu.bean.XttxpzBean;
import com.chinacreator.menu.query.IndexQueryBean;
import com.frameworkset.common.poolman.ConfigSQLExecutor;
import com.frameworkset.common.poolman.DBUtil;
import com.frameworkset.common.poolman.PreparedDBUtil;
import com.frameworkset.common.poolman.Record;
import com.frameworkset.common.poolman.SQLExecutor;
import com.frameworkset.common.poolman.SQLParams;
import com.frameworkset.common.poolman.handle.NullRowHandler;
import com.frameworkset.common.poolman.handle.RowHandler;
import com.frameworkset.orm.transaction.TransactionManager;
import com.frameworkset.util.ListInfo;

public class MenuManagerBusiness
{
	private static ConfigSQLExecutor executor =  new ConfigSQLExecutor("com/chinacreator/menu/business/menu-sql.xml");
	
	public List<MenuBean> queryOneLevelMenuBeans()
	{
		try
		{
			return executor.queryListWithDBName(MenuBean.class, CommonConstant.DBNAME_SQJW, "queryOneLevelMenuBeans");
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return new ArrayList<MenuBean>();
	}
	
	public Map<MenuBean, List<MenuBean>> queryChildMenuMapByOneLevelMenuId(String oneLevelMenuId)
	{
		Map<MenuBean, List<MenuBean>> menuBeanMap = new LinkedHashMap<MenuBean, List<MenuBean>>();
		List<MenuBean> twoMenuList = queryChildMenuByParentId(oneLevelMenuId);
		if (ValidateHelper.isNotEmptyCollection(twoMenuList))
		{
			for (MenuBean menuBean : twoMenuList)
			{
				List<MenuBean> menuList = queryChildMenuByParentId(menuBean.getMenuid());
				menuBeanMap.put(menuBean, menuList);
			}
		}
		return menuBeanMap;
	}
	
	public List<MenuBean> queryChildMenuByParentId(String parentId)
	{
		try
		{
			LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
			return executor.queryListWithDBName(MenuBean.class, CommonConstant.DBNAME_SQJW, "queryChildMenuByParentId", loginInfo.getSfzh(),parentId);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return new ArrayList<MenuBean>();
	}
	
	public MenuBean queryMenuBeanByMenuid(String menuid)
	{
		try
		{
			return executor.queryObjectWithDBName(MenuBean.class, CommonConstant.DBNAME_SQJW, "queryMenuBeanByMenuid", menuid);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return null;
	}
	
	public boolean deleteMenuBean(String menuid)
	{
		try
		{
			executor.deleteWithDBName(CommonConstant.DBNAME_SQJW, "deleteMenuBean", menuid);
			return true;
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return false;
	}
	
	public boolean deleteOutSiteMenuBean(String menuid)
	{
		try
		{
			executor.deleteWithDBName(CommonConstant.DBNAME_SQJW, "deleteOutSiteMenuBean", menuid);
			return true;
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return false;
	}
	
	
	
	public boolean saveMenuBean(MenuBean menuBean)
	{
		try
		{
			String sql = executor.getSql("saveMenuBean");
			String menuid = CommonDBBaseHelper.getSequence(CommonConstant.DBNAME_SQJW, "seq_common_menu");
			PreparedDBUtil util = new PreparedDBUtil();
			util.preparedInsert(CommonConstant.DBNAME_SQJW, sql);
			util.setString(1, menuid);
			util.setString(2, menuBean.getTitle());
			util.setString(3, menuBean.getHref());
			util.setString(4, menuBean.getParentid());
			util.setString(5, menuBean.getMenulevel());
			util.setString(6, menuid);
			util.setBlob(7, menuBean.getImageicon());
			util.executePrepared();
			return true;
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return false;
	}
	
	public boolean updateMenuBean(MenuBean menuBean)
	{
		TransactionManager tm = null;
		try
		{
			tm = new TransactionManager();
			tm.begin();
			executor.updateBean(CommonConstant.DBNAME_SQJW, "updateMenuBean", menuBean);
			if (menuBean.getImageicon() != null)
			{
				updateMenuImageIcon(menuBean);
			}
			tm.commit();
			return true;
		}
		catch(Exception e)
		{
			e.printStackTrace();
			try
			{
				tm.rollback();
			}
			catch (RollbackException e1)
			{
				e1.printStackTrace();
			}
		}
		return false;
	}
	
	public boolean updateMenuImageIcon(MenuBean menuBean)
	{
		try
		{
			String sql = "update t_common_menu set imageicon=? where menuid=?";
			PreparedDBUtil util = new PreparedDBUtil();
			util.preparedUpdate(CommonConstant.DBNAME_SQJW, sql);
			util.setBlob(1, menuBean.getImageicon());
			util.setString(2, menuBean.getMenuid());
			util.executePrepared();
			return true;
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return false;
	}
	
	public Blob queryImageIcon(String menuid)
	{
		try
		{
			String sql = "select imageicon from t_common_menu where menuid='" + menuid + "'";
			DBUtil util = new DBUtil();
			util.executeSelect(CommonConstant.DBNAME_SQJW, sql);
			if (util.size() > 0)
			{
				return util.getBlob(0, "imageicon");
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return null;
	}
	
	public List<OutSiteMenuBean> queryOutSiteMenuBeans()
	{
		List<OutSiteMenuBean> list = null;
		try
		{
			LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
			list = executor.queryListWithDBName(OutSiteMenuBean.class, CommonConstant.DBNAME_SQJW, "queryOutSiteMenuBeans",loginInfo.getSfzh());
		}
		catch(Exception e)
		{
			e.printStackTrace();
			list = new ArrayList<OutSiteMenuBean>();
		}
		return list;
	}
	
	public boolean saveOutSiteMenuBean(OutSiteMenuBean outsiteMenuBean)
	{
		try
		{
			LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
			outsiteMenuBean.setCreatedate(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss"));
			outsiteMenuBean.setCreateusersfzh(loginInfo.getSfzh());
			executor.insertBean(CommonConstant.DBNAME_SQJW, "saveOutSiteMenuBean", outsiteMenuBean);
			return true;
		}
		catch(Exception e)
		{
			e.printStackTrace();
			return false;
		}
	}
	
	public boolean updateOutSiteMenuBean(String menuid)
	{
		try
		{
			executor.updateWithDBName(CommonConstant.DBNAME_SQJW, "updateOutSiteMenuBean", menuid);
			return true;
		}
		catch(Exception e)
		{
			e.printStackTrace();
			return false;
		}
	}
	
	public List<MenuBean> queryShortCutMenuBeans(String sfzh)
	{
		List<MenuBean> list = null;
		try
		{
			list = executor.queryListWithDBName(MenuBean.class, CommonConstant.DBNAME_SQJW, "queryShortCutMenuBeans", sfzh);
		}
		catch(Exception e)
		{
			e.printStackTrace();
			list = new ArrayList<MenuBean>();
		}
		return list;
	}
	
	public void insertMenuShortCut(String sfzh, String menuid)
	{
		try
		{
			executor.insertWithDBName(CommonConstant.DBNAME_SQJW, "insertMenuShortCut", sfzh, menuid);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	
	public void deleteMenuShortCut(String sfzh, String menuid)
	{
		try
		{
			executor.deleteWithDBName(CommonConstant.DBNAME_SQJW, "deleteMenuShortCut", sfzh, menuid);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	
	public List<XttxpzBean> queryXttxpzBeans()
	{
		List<XttxpzBean> list = null;
		try
		{
			list = executor.queryListWithDBName(XttxpzBean.class, CommonConstant.DBNAME_SQJW, "queryXttxpzBeans");
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return list;
	}
	
	public XttxpzBean queryXttxpzBeanById(String pzid)
	{
		XttxpzBean bean = null;
		try
		{
			bean = executor.queryObjectWithDBName(XttxpzBean.class, CommonConstant.DBNAME_SQJW, "queryXttxpzBeanById", pzid);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return bean;
	}
	
	public List<List<String>> downLoadExcel(String pzid){
		XttxpzBean pz = queryXttxpzBeanById(pzid);
		LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
		
		String downLoadSQL = pz.getDownloadSql();
		final List<List<String>> resultList = new ArrayList<List<String>>();
		try {
			SQLExecutor.queryBeanWithDBNameByNullRowHandler(new NullRowHandler<String>() {
				@Override
				public void handleRow(Record record) throws Exception {
					List<String> data = new ArrayList<String>();
					
					Field fields = record.getClass().getDeclaredField("fields");
					fields.setAccessible(true);
					String[] keys = (String[]) fields.get(record);
					for (String key : keys)
					{
						data.add(record.getString(key));
					}
					resultList.add(data);
				}
			}, CommonConstant.DBNAME_SQJW, downLoadSQL, loginInfo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return resultList;
	}
	
	public int queryCountXttxpz(XttxpzBean pzBean)
	{
		LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
		try
		{
			List<XttxListBean> listInfo = SQLExecutor.queryListBeanWithDBName(XttxListBean.class, CommonConstant.DBNAME_SQJW, pzBean.getSql(), loginInfo);
			return listInfo.size();
		}
		catch(Exception e)
		{
			e.printStackTrace();
			return 0;
		}
	}
	
	public List<XttxListBean> queryXttxListBeansPageResult(XttxpzBean pzBean)
	{
		List<XttxListBean> listBeans = new ArrayList<XttxListBean>();
		LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
		try
		{
			List<XttxListBean> listInfo = SQLExecutor.queryListBeanWithDBName(XttxListBean.class, CommonConstant.DBNAME_SQJW, pzBean.getSql(), loginInfo);
			if (listInfo != null && listInfo.size() > 0)
			{
				XttxListBean listBean = null;
				
				for (int i=0;i<listInfo.size();i++)
				{
					listBean = listInfo.get(i);
					String title = pzBean.getDescription();
					String blsj = DateTimeHelper.getNowDateStr("yyyy-MM-dd");
					String blhref = pzBean.getHref();
					if(ValidateHelper.isNotEmptyString(pzBean.getResultfield()))
					{
						String[] resultfields = pzBean.getResultfield().split(",");
						for (String field : resultfields)
						{
							title = title.replace("#[" + field + "]",listBean.getTitle());
							blhref = blhref.replace("#[" + field + "]",listBean.getBlhref());
						}
					}
					listBean.setBlhref(blhref);
					listBean.setBlsj(blsj);
					listBean.setTitle(title);
					listBean.setType(pzBean.getTitle());
					listBeans.add(listBean);
				}
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return listBeans;
	}
	
	/**
	 * 查询辖区治安统计
	 * @param queryBean
	 * @return
	 */
	public XqfaqktjBean queryXqfaqktjBean(MhtjQueryBean queryBean)
	{
		LoginInfo login = ActionContextHelper.getLoginInfo();
		String dwdm = "";
		String parent_dm = "";
		if(login.getLeve() == 1){
			parent_dm = login.getOrgcode().substring(0,2) + "0000000000";
			dwdm = login.getOrgcode().substring(0,2) + "0000000000";
		}else if(login.getLeve() == 2){
			parent_dm = login.getOrgcode().substring(0,2) + "0000000000";
			dwdm = login.getOrgcode().substring(0,4) + "00000000";
		}else if(login.getLeve() == 3){
			parent_dm = login.getOrgcode().substring(0,4) + "00000000";
			dwdm = login.getOrgcode().substring(0,6) + "000000";
		}else if(login.getLeve() == 4){
			parent_dm = login.getOrgcode().substring(0,6) + "000000";
			dwdm = login.getOrgcode().substring(0,8) + "0000";
		}else if(login.getLeve() == 5){
			parent_dm = login.getOrgcode().substring(0,8) + "0000";
			dwdm = login.getOrgcode();
		}
		
		XqfaqktjBean tjBean = null;
		if(queryBean == null){
			queryBean = new MhtjQueryBean();
			queryBean.setDwdm(dwdm);
		}else{
			queryBean.setDwdm(dwdm);
		}
		try
		{
			queryBean.setParent_dm("");
			tjBean = executor.queryObjectBeanWithDBName(XqfaqktjBean.class, CommonConstant.DBNAME_SQJW, "queryCountXqJzFazs", queryBean);
			if (tjBean != null)
			{
				queryBean.setDwdm("");
				queryBean.setParent_dm(parent_dm);
				tjBean.setByfatjList(queryXqajtjList(queryBean));
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
			tjBean = new XqfaqktjBean();
		}
		
		return tjBean;
	}
	
	public List<XqajtjBean> queryXqajtjList(MhtjQueryBean queryBean){
		try {
			return executor.queryListBeanWithDBName(XqajtjBean.class, CommonConstant.DBNAME_SQJW, "queryXqajtjList", queryBean);
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	} 
	
	
	public PageResultInfo<XttxListBean> queryXttxListBeansPageResult(final XttxpzBean pzBean, PageInfo pageInfo)
	{
		PageResultInfo<XttxListBean> pageResult = new PageResultInfo<XttxListBean>();
		LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
		try
		{
			//ListInfo listInfo = SQLExecutor.queryListInfoWithDBName(XttxListBean.class, CommonConstant.DBNAME_SQJW, pzBean.getSql(), pageInfo.getOffset(), pageInfo.getPageSize(), loginInfo);
			ListInfo listInfo = SQLExecutor.queryListInfoBeanWithDBNameByRowHandler(new RowHandler<XttxListBean>()
			{
				@Override
				public void handleRow(XttxListBean bean, Record record)
						throws Exception
				{
					bean.setType(pzBean.getTitle());
					bean.setTitle(pzBean.getDescription());
					bean.setBlhref(pzBean.getHref());
					if (record.getString("blsj") != null)
					{
						bean.setBlsj(record.getString("blsj"));
					}
					else
					{
						bean.setBlsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd"));
					}
					String[] resultfields = pzBean.getResultfield().split(",");
					for (String field : resultfields)
					{
						String str = record.getString(field);
						if (str != null)
						{
							bean.setTitle(bean.getTitle().replace("#[" + field + "]" , str));
							bean.setBlhref(bean.getBlhref().replace("#[" + field + "]" , str));
						}
						else
						{
							bean.setTitle(bean.getTitle().replace("#[" + field + "]" , ""));
							bean.setBlhref(bean.getBlhref().replace("#[" + field + "]" , ""));
						}
					}
				}
			}, XttxListBean.class, CommonConstant.DBNAME_SQJW, pzBean.getSql(), pageInfo.getOffset(), pageInfo.getPageSize(), loginInfo);
			pageResult = PaginationHelper.wrapPageResultInfo(pageInfo, listInfo);
		}
		catch(Exception e)
		{
			e.printStackTrace();
			pageResult = new PageResultInfo<XttxListBean>();
		}
		return pageResult;
	}
	
	public List<XqqktjBean> queryMhxqtjBeanList(MhtjQueryBean queryBean)
	{
		List<XqqktjBean> list = null;
		try
		{
			list = executor.queryListBeanWithDBName(XqqktjBean.class, CommonConstant.DBNAME_SQJW, "queryMhxxcjtjForPcsLevel", queryBean);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return list;
	}
	
	/**
	 * 查询前十条案件信息
	 * @return
	 * @date Sep 24, 2014 8:40:10 AM
	 */
	public List<AjjbxxBean> queryQmstAjxx(IndexQueryBean queryBean)
	{
		try
		{
			return executor.queryListBeanWithDBName(AjjbxxBean.class, CommonConstant.DBNAME_SQJW, "queryQmstAjxx",queryBean);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return null;
	}
	
	public String loadXqqktjXml(String orgcode,String level)
	{
		String xml = "";
		try
		{
			SQLParams params = new SQLParams();
			params.addSQLParam("orgcode", orgcode, SQLParams.STRING);
			params.addSQLParam("leve", level, SQLParams.STRING);
			XqqktjBean bean = executor.queryObjectBeanWithDBName(XqqktjBean.class, CommonConstant.DBNAME_SQJW, "queryXqqktjNumber", params);
			if (bean != null)
			{
				bean.setDm(orgcode);
				bean.setMc(DictionaryCacheHellper.getOrganizationOrgNameByCode(orgcode));
				xml = createXqtjXml(bean);
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return xml;
	}
	
	public String createXqtjXml(XqqktjBean bean)
	{
		Document document = DocumentHelper.createDocument();
		document.setXMLEncoding("GBK");
		
		Element chartroot = document.addElement("chart")
				.addAttribute("caption",  bean.getMc() + "--辖区情况统计")
				//.addAttribute("xAxisName", "辖区情况统计")
				.addAttribute("baseFontSize", "13")
				.addAttribute("yAxisName", "数量");
		if (bean != null)
		{
			chartroot.addElement("set")
					.addAttribute("label", "常住人口")
					.addAttribute("value", bean.getCzrks());
					//.addAttribute("link", "javascript:openTjDetailPage('/lsgl/rk/toRkListPage.action?queryBean.rylb=1')");
			
			chartroot.addElement("set")
					.addAttribute("label", "暂住人口")
					.addAttribute("value", bean.getLdrks());
					//.addAttribute("link", "javascript:openTjDetailPage('/lsgl/rk/toRkListPage.action?queryBean.rylb=2')");
			
			chartroot.addElement("set")
					.addAttribute("label", "房屋数")
					.addAttribute("value", bean.getFws());
					//.addAttribute("link", "javascript:openTjDetailPage('/lsgl/fw/toFwJbxxListPage.action')");
			
			chartroot.addElement("set")
					.addAttribute("label", "出租屋数")
					.addAttribute("value", bean.getCzfws());
					//.addAttribute("link", "javascript:openTjDetailPage('/lsgl/fw/toFwJbxxListPage.action?queryBean.sfczw=1')");
			
			chartroot.addElement("set")
					.addAttribute("label", "重点人员")
					.addAttribute("value", bean.getZddxs());
					//.addAttribute("link", "javascript:openTjDetailPage('/lsgl/zdry/toZdryListPage.action')");
			
			chartroot.addElement("set")
					.addAttribute("label", "吸毒人员")
					.addAttribute("value", bean.getXdrys());
					//.addAttribute("link", "javascript:openTjDetailPage('/lsgl/zdry/toZdryListPage.action?queryBean.dxlb=6')");
			
			chartroot.addElement("set")
					.addAttribute("label", "精神病人")
					.addAttribute("value", bean.getJsbrs());
					//.addAttribute("link", "javascript:openTjDetailPage('/lsgl/zdry/toZdryListPage.action?queryBean.dxlb=4')");
			
			chartroot.addElement("set")
					.addAttribute("label", "特种行业")
					.addAttribute("value", bean.getTzhys());
			
			chartroot.addElement("set")
					.addAttribute("label", "企事业单位")
					.addAttribute("value", bean.getNbdws());
			
			chartroot.addElement("set")
					.addAttribute("label", "公共场所")
					.addAttribute("value", bean.getGgcss());
			
			chartroot.addElement("set")
					.addAttribute("label", "上网场所")
					.addAttribute("value", bean.getGgcss());
			
			chartroot.addElement("set")
					.addAttribute("label", "危险品单位")
					.addAttribute("value", bean.getWxpdws());
			
			chartroot.addElement("set")
					.addAttribute("label", "涉外单位")
					.addAttribute("value", bean.getSwdws());
		}
		return document.asXML();	
	}
	
	public PageResultInfo<AjjbxxBean> queryAjjbxxListPageInfo(IndexQueryBean queryBean, PageInfo pageInfo)
	{
		try
		{
			ListInfo listInfo = executor.queryListInfoBeanWithDBName(AjjbxxBean.class, CommonConstant.DBNAME_SQJW, "queryAjjbxxListPageInfo", pageInfo.getOffset(), pageInfo.getPageSize(), queryBean);
			return PaginationHelper.wrapPageResultInfo(pageInfo, listInfo);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return new PageResultInfo<AjjbxxBean>();
	}
	 
	public AjjbxxBean queryAjxxDetailById(String id)
	{
		try
		{
			SQLParams params = new SQLParams();
			params.addSQLParam("id", id, SQLParams.STRING);
			AjjbxxBean bean = executor.queryObjectBeanWithDBName(AjjbxxBean.class, CommonConstant.DBNAME_SQJW, "queryAjjbxxListPageInfo", params);
			return bean;
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return null;
	}
}
