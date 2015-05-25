package com.chinacreator.gis.service;

import java.util.ArrayList;
import java.util.List;

import com.chinacreator.common.bean.BaseValue;
import com.chinacreator.common.bean.LoginInfo;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.helper.ActionContextHelper;
import com.chinacreator.common.helper.StringArrayListHelper;
import com.chinacreator.common.helper.ValidateHelper;
import com.chinacreator.gis.bean.StxxBean;
import com.chinacreator.gis.dao.StxxDao;
import com.chinacreator.gis.query.StxxQueryBean;
import com.frameworkset.common.poolman.DBUtil;
import com.frameworkset.common.poolman.SQLExecutor;

public class StxxService extends BaseValue
{
	private static final long serialVersionUID = -8740386298475986037L;

	private StxxDao stxxDao = new StxxDao();

	// private LoginInfo user = ActionContextHelper.getLoginInfo();

	/**
	 * 查询实体信息
	 */
	public List<StxxBean> queryStxx(StxxQueryBean stxx )
	{
		LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
		int page = stxx.getPage();
		
		if (page <= 0)
			page = 1;

		int pageSize = 10;
		int startRow = (page - 1) * pageSize + 1;
		int endRow = page * pageSize;
		stxx.setStartRow(startRow + "");
		stxx.setEndRow(endRow + "");
		
		stxx.setOrgcode(loginInfo.getOrgcode());
		return stxxDao.queryStxxPage(stxx);
	}
	
	public String queryPgisSqdmByJwqdm(String jwqdm)
	{
		String sql = "select gis.gis_area from t_common_hnxzqh xzqh,gis_cs_sqjw_rela gis where xzqh.dm = gis.kc_code and ssjwsdm = '" + jwqdm + "'";
		String pgisdm = "";
		try
		{
			List<String> dmlist = new ArrayList<String>();
			DBUtil util = new DBUtil();
			util.executeSelect(CommonConstant.DBNAME_SQJW, sql);
			if (util.size() > 0)
			{
				for (int i=0;i<util.size();i++)
				{
					dmlist.add(util.getString(i, "gis_area"));
				}
			}
			pgisdm = StringArrayListHelper.converListToString(dmlist, ",");
		}
		catch(Exception e)
		{
			e.printStackTrace();
			pgisdm = "";
		}
		return pgisdm;
	}
	
	/**
	 * 查询pgis代码通过社区代码
	 * @param sqdm
	 * @return
	 * @date Jul 16, 2014 11:09:33 AM
	 */
	public String queryPgisdmBySqdm(String sqdm)
	{
		String sql = "select gis_area from gis_cs_sqjw_rela where kc_code=?";
		String pgisdm = "";
		try
		{
			pgisdm = SQLExecutor.queryFieldWithDBName(CommonConstant.DBNAME_SQJW, sql,sqdm);
			if (ValidateHelper.isEmptyString(pgisdm))
			{
				pgisdm = sqdm;
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return pgisdm;
	}
}
