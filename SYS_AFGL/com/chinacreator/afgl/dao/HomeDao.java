package com.chinacreator.afgl.dao;

import java.util.List;

import com.chinacreator.afgl.bean.AfjgtjBean;
import com.chinacreator.afgl.bean.KkfbqkBean;
import com.chinacreator.afgl.bean.KkpcqktjBean;
import com.chinacreator.common.bean.LoginInfo;
import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.helper.ActionContextHelper;
import com.chinacreator.common.helper.ValidateHelper;
import com.frameworkset.common.poolman.ConfigSQLExecutor;
import com.frameworkset.common.poolman.SQLExecutor;
import com.frameworkset.util.ListInfo;

/**
 * home页面统计信息
 */
public class HomeDao
{
	
	private static ConfigSQLExecutor executor =  new ConfigSQLExecutor("com/chinacreator/afgl/dao/home-sql.xml");
	
	/**
	 * 得到卡口分布情况
	 * 传入parent_id,机构级别
	 */
	public static List<KkfbqkBean> homeKkfbqk(String dwdm, String dwlevel) throws Exception{
		if(ValidateHelper.isEmptyString(dwdm)||ValidateHelper.isEmptyString(dwlevel)){
			LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
			dwdm = loginInfo.getOrgcode();
			dwlevel = loginInfo.getLeve() + "";
		}
		// 1：省级用户 2：市级用户 3：县级用户 4：派出所用户  5：社区民警
		int orglength = 0;
		if("1".equals(dwlevel)){
			orglength = 4;
		}else if("2".equals(dwlevel)){
			orglength = 6;
		}else if("3".equals(dwlevel)){
			orglength = 8;
		}else if("4".equals(dwlevel)){
			orglength = 10;
		}else if("5".equals(dwlevel)){
			orglength = 12;
		}
		StringBuffer sb = new StringBuffer("select org.org_id dwdm, org.org_name title,nvl(k.DATA,0) data from ")
										.append("(select org_id,org_name from TD_SM_ORGANIZATION where org_id like '43%' ")
										.append("and org_id <> RPAD(SUBSTR(org_id, 0, "+(orglength-2)+"), 12, '0') ")
										.append(" and parent_id= RPAD(SUBSTR(" + dwdm + ",0,"+orglength+"),12,'0') ")
										.append("and org_id = RPAD(SUBSTR(org_id, 0, "+orglength+"), 12, '0') group by org_id,org_name) org left join ")
										.append("(SELECT RPAD(SUBSTR(KK.SSZRQDM,0,"+orglength+"),12,'0') ORGID, COUNT(KK.KKBH) AS DATA")
										.append(" FROM T_AF_ZAKKXX KK")
										.append(" WHERE EXISTS(SELECT ORG_ID FROM TD_SM_ORGANIZATION ")
										.append(" WHERE ORG_ID=KK.SSZRQDM START WITH ORG_ID=").append("RPAD(SUBSTR(" + dwdm + ",0,"+orglength+"),12,'0')")
										.append(" CONNECT BY PRIOR ORG_ID=PARENT_ID)")
										.append(" GROUP BY RPAD(SUBSTR(KK.SSZRQDM,0,"+orglength+"),12,'0')) k on org.org_id=k.ORGID");
		
		List<KkfbqkBean> resultList = SQLExecutor.queryList(KkfbqkBean.class, sb.toString());
		
		return resultList;
	}
	
	@SuppressWarnings("unchecked")
	public static PageResultInfo<KkpcqktjBean> kkpcqktjList(PageInfo pageInfo, String dwdm, String dwlevel) throws Exception{
		PageResultInfo<KkpcqktjBean> resultInfo = new PageResultInfo<KkpcqktjBean>();
		ListInfo listInfo = new ListInfo();
		listInfo = executor.queryListInfoWithDBName(KkpcqktjBean.class, CommonConstant.DBNAME_SQJW,
					"kkpcqktjList", pageInfo.getOffset(), pageInfo.getPageSize(), dwdm);
		resultInfo.setDatas((List<KkpcqktjBean>)listInfo.getDatas());
		resultInfo.setTotalCount(listInfo.getTotalSize());
		resultInfo.setCurrentPage(pageInfo.getCurrentPage());
		resultInfo.setPageSize(pageInfo.getPageSize());
		return resultInfo;
	}
	@SuppressWarnings("unchecked")
	public static PageResultInfo<AfjgtjBean> afjgtjList(PageInfo pageInfo, String dwdm, String dwlevel) throws Exception{
		PageResultInfo<AfjgtjBean> resultInfo = new PageResultInfo<AfjgtjBean>();
		ListInfo listInfo = new ListInfo();
		listInfo = executor.queryListInfoWithDBName(AfjgtjBean.class, CommonConstant.DBNAME_SQJW,
					"afjgtjList", pageInfo.getOffset(), pageInfo.getPageSize(), dwdm);
		resultInfo.setDatas((List<AfjgtjBean>)listInfo.getDatas());
		resultInfo.setTotalCount(listInfo.getTotalSize());
		resultInfo.setCurrentPage(pageInfo.getCurrentPage());
		resultInfo.setPageSize(pageInfo.getPageSize());
		return resultInfo;
	}
}
