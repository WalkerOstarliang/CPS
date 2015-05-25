package com.chinacreator.afgl.zaxl.dao.imol;

import java.sql.SQLException;
import java.util.List;

import com.chinacreator.afgl.zaxl.bean.XldyxxBean;
import com.chinacreator.afgl.zaxl.bean.ZaxlBean;
import com.chinacreator.afgl.zaxl.bean.ZaxlPcdxBean;
import com.chinacreator.afgl.zaxl.bean.ZaxlQueryBean;
import com.chinacreator.afgl.zaxl.bean.ZaxlRyBean;
import com.chinacreator.afgl.zaxl.bean.ZaxlSqgbBean;
import com.chinacreator.afgl.zaxl.dao.ZaxlDao;
import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.bean.QueryBean;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.helper.ActionContextHelper;
import com.chinacreator.common.helper.CommonDBBaseHelper;
import com.chinacreator.common.helper.DateTimeHelper;
import com.chinacreator.common.helper.PaginationHelper;
import com.frameworkset.common.poolman.ConfigSQLExecutor;
import com.frameworkset.util.ListInfo;

public class ZaxlDaoImpl implements ZaxlDao {

	private static final long serialVersionUID = -8463286266396844149L;
	
	private ConfigSQLExecutor executor = new ConfigSQLExecutor(
							"com/chinacreator/afgl/zaxl/dao/imol/zaxl-sql.xml");
	
	@Override
	public void cancelZaxl(ZaxlBean bean) throws SQLException {
		executor.updateBean(CommonConstant.DBNAME_SQJW, "cancelZaxl", bean);
	}

	@Override
	public void insertZaxl(ZaxlBean bean) throws SQLException {
		executor.insertBean(CommonConstant.DBNAME_SQJW, "insertZaxl", bean);
	}

	@Override
	public ZaxlBean queryZaxlById(String id) throws SQLException {
		return executor.queryObjectWithDBName(ZaxlBean.class, CommonConstant.DBNAME_SQJW, "queryZaxlById", id);
	}

	@Override
	public PageResultInfo<ZaxlBean> queryZaxlList(QueryBean query,
			PageInfo pageinfo) throws SQLException {
		ListInfo listinfo = executor.queryListInfoBeanWithDBName(ZaxlBean.class, 
					CommonConstant.DBNAME_SQJW, "queryZaxlList", pageinfo.getOffset(), 
					pageinfo.getPageSize(), query);
		return PaginationHelper.wrapPageResultInfo(pageinfo,listinfo);
	}

	@Override
	public void updateZaxl(ZaxlBean bean) throws SQLException {
		executor.updateBean(CommonConstant.DBNAME_SQJW, "updateZaxl", bean);
	}

	public PageResultInfo<ZaxlRyBean> queryZaxlryList(QueryBean query,
			PageInfo pageinfo) throws SQLException {
		ListInfo listinfo = executor.queryListInfoBeanWithDBName(ZaxlRyBean.class, 
				CommonConstant.DBNAME_SQJW, "queryZaxlryList", pageinfo.getOffset(), 
				pageinfo.getPageSize(), query);
		return PaginationHelper.wrapPageResultInfo(pageinfo,listinfo);
	}

	public void saveZaxlryMjlist(List<ZaxlRyBean> zaxlrymjlist)
			throws SQLException {
		//executor
		for(int i=0;i<zaxlrymjlist.size();i++){
			ZaxlRyBean oldBean = executor.queryObjectWithDBName(ZaxlRyBean.class, CommonConstant.DBNAME_SQJW, "queryZaxlRyMjByZaxlidAndSfzh", zaxlrymjlist.get(i).getZaxlid(),zaxlrymjlist.get(i).getXldysfzh());
			if(oldBean != null){
				// update
				executor.updateBean(CommonConstant.DBNAME_SQJW, "updateZaxlryMjSQL", zaxlrymjlist.get(i));
			}else{
				// insert
				ZaxlRyBean newBean = zaxlrymjlist.get(i);
				String id = ActionContextHelper.getLoginInfo().getOrgcode().substring(0,6) + 
				DateTimeHelper.getNowDateStr("yyyyMMddHHmmss") + 
				CommonDBBaseHelper.getSequence(CommonConstant.DBNAME_SQJW, "SEQ_ZALXRYID");
				newBean.setId(id);
				newBean.initCzxx();
				newBean.initDjxx();
				newBean.setXldylxdh(newBean.getXldylxdh().replace("null", "")) ;
				executor.insertBean(CommonConstant.DBNAME_SQJW, "insertZaxlryMjSQL", newBean);
			}
		}
	}

	public void cancelZaxlryById(ZaxlQueryBean query) {
		String id = query.getId();
		try {
			executor.updateWithDBName(CommonConstant.DBNAME_SQJW, "cancelZaxlryByIdSQL", id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public PageResultInfo<XldyxxBean> queryXlmjlList(QueryBean query,
			PageInfo pageinfo) throws SQLException {
		ListInfo listinfo = executor.queryListInfoBeanWithDBName(XldyxxBean.class, 
				CommonConstant.DBNAME_SQJW, "queryXlmjlList", pageinfo.getOffset(), 
				pageinfo.getPageSize(), query);
		return PaginationHelper.wrapPageResultInfo(pageinfo,listinfo);
	}

	public PageResultInfo<ZaxlSqgbBean> querySqgblList(QueryBean query,
			PageInfo pageinfo) throws SQLException {
		ListInfo listinfo = executor.queryListInfoBeanWithDBName(ZaxlSqgbBean.class, 
				CommonConstant.DBNAME_SQJW, "querySqgblList", pageinfo.getOffset(), 
				pageinfo.getPageSize(), query);
		return PaginationHelper.wrapPageResultInfo(pageinfo,listinfo);
	}

	public PageResultInfo<ZaxlPcdxBean> queryZaxlpcryList(QueryBean query,
			PageInfo pageinfo) throws SQLException {
		ListInfo listinfo = executor.queryListInfoBeanWithDBName(ZaxlPcdxBean.class, 
				CommonConstant.DBNAME_SQJW, "queryZaxlpcryList", pageinfo.getOffset(), 
				pageinfo.getPageSize(), query);
		return PaginationHelper.wrapPageResultInfo(pageinfo,listinfo);
	}

	public void saveXlpcryxxInfoBean(ZaxlPcdxBean bean) {
		ZaxlPcdxBean oldBean;
		try {
			oldBean = executor.queryObjectWithDBName(ZaxlPcdxBean.class, CommonConstant.DBNAME_SQJW, "queryZaxlpcRyByZaxlidAndSfzh", bean.getZaxlid(),bean.getPcrysfzh());
			if(oldBean != null){
				// update
				bean.initCzxx();
				executor.updateBean(CommonConstant.DBNAME_SQJW, "updateZaxlpcrySQL", bean);
			}else{
				// insert
				ZaxlPcdxBean newBean = bean;
				String id = ActionContextHelper.getLoginInfo().getOrgcode().substring(0,6) + 
				DateTimeHelper.getNowDateStr("yyyyMMddHHmmss") + 
				CommonDBBaseHelper.getSequence(CommonConstant.DBNAME_SQJW, "SEQ_ZALXPCRYID");
				newBean.setId(id);
				newBean.initCzxx();
				newBean.initDjxx();
				newBean.setPcrylxdh(newBean.getPcrylxdh().replace("null", "")) ;
				executor.insertBean(CommonConstant.DBNAME_SQJW, "insertZaxlpcrySQL", newBean);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void cancelZaxlrpcryById(ZaxlQueryBean query) throws SQLException {
		executor.updateBean(CommonConstant.DBNAME_SQJW, "cancelZaxlrpcryById", query);
	}
}
