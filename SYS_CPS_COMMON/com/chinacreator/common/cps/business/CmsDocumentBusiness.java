package com.chinacreator.common.cps.business;

import java.util.List;

import com.chinacreator.common.bean.LoginInfo;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.cps.bean.CmsDocument;
import com.chinacreator.common.helper.ActionContextHelper;
import com.chinacreator.common.helper.ValidateHelper;
import com.frameworkset.common.poolman.ConfigSQLExecutor;
import com.frameworkset.common.poolman.SQLParams;

public class CmsDocumentBusiness
{
	private static ConfigSQLExecutor executor =  new ConfigSQLExecutor("com/chinacreator/common/cps/business/cms-sql.xml");
	
	public List<CmsDocument> queryCmsDocumentList(String channelId, String orgLeve)
	{
		LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
		List<CmsDocument> list = null;
		if (ValidateHelper.isNotEmptyString(channelId))
		{
			try
			{
				SQLParams params = new SQLParams();
				params.addSQLParam("channelId", channelId, SQLParams.STRING);
				params.addSQLParam("orgLeve", orgLeve, SQLParams.STRING);
				params.addSQLParam("leve", loginInfo.getLeve(), SQLParams.INT);
				params.addSQLParam("orgcode", loginInfo.getOrgcode(), SQLParams.STRING);
				
				list = executor.queryListBeanWithDBName(CmsDocument.class, CommonConstant.DBNAME_SQJW, "queryCmsDocumentList", params);
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
		}
		return list;
	}
}