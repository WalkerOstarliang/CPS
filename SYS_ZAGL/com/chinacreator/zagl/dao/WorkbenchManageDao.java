package com.chinacreator.zagl.dao;

import java.sql.SQLException;
import java.util.List;

import com.chinacreator.common.bean.BaseValue;
import com.chinacreator.common.bean.LoginInfo;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.cps.chart.Charts;
import com.chinacreator.common.helper.ActionContextHelper;
import com.frameworkset.common.poolman.ConfigSQLExecutor;
import com.frameworkset.common.poolman.SQLExecutor;

/**
 * 工作台管理DAO
 */
public class WorkbenchManageDao extends BaseValue{

	private static final long serialVersionUID = 4906624482600757955L;
	private static ConfigSQLExecutor executor = new ConfigSQLExecutor(
			"com/chinacreator/zagl/dao/workbenchmanage-sql.xml");
	/*登录用户信息*/
	private static LoginInfo loginUser = ActionContextHelper.getLoginInfo();
	
	/**
	 * 单位类别分布情况
	 * @return
	 */
	public static List<Charts> getOrgTypeStatistics(){
		List<Charts> list = null;
		String userCode = loginUser.getOrgcode();
		String orgLevel = getOrgLevel(userCode);
		String length = "";
		if("-1".equals(userCode)){
			return list;
		}else if("1".equals(orgLevel)){
			length = "2";
		}else if("2".equals(orgLevel)){
			length = "4";
		}else if("3".equals(orgLevel)){
			length = "6";
		}else{
			length = "8";
		}
		
		try {
			list = executor.queryListWithDBName(Charts.class, CommonConstant.DBNAME_SQJW, "getOrgTypeStatistics" , userCode , length);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
		
	}
	
	/**
	 * 单位分布情况
	 * @param userCode 用户机构代码
	 * @param orgLevel 机构级别
	 * @return
	 */
	public static List<Charts> getOrgStatistics(String userCode,int orgLevel){
		List<Charts> list = null;
		if(orgLevel == -1){
			userCode = loginUser.getOrgcode();
			orgLevel = loginUser.getLeve();
		}
		int orglength = 0;
		if(orgLevel == 1){
			orglength = 4;
		}else if(orgLevel == 2){
			orglength = 6;
		}else if(orgLevel == 3){
			orglength = 8;
		}else if(orgLevel == 4){
			orglength = 10;
		}else if(orgLevel == 5){
			orglength = 12;
		}
		try {
			String sql = " select 'javascript:orgStatistics('||org.code||')' link, org.org_name title, nvl(k.data, 0) data  "+
       " from (select code, org_name "+
             " from td_sm_organization "+
				" where code like '43%' "+
				" and code <> rpad(substr(code, 0, "+(orglength-2)+"), 12, '0') "+
				" and parent_id = rpad(substr(" + userCode + ", 0, "+orglength+"), 12, '0') "+
				" and code = rpad(substr(code, 0, "+orglength+"), 12, '0') "+
				"  group by code, org_name) org "+
				"  left join (select rpad(substr(dw.sspcsdm, 0, "+orglength+"), 12, '0') code, "+
				" count(dw.jgbh) as data "+
				"  from t_za_jg_jbxx dw "+
				" where exists "+
				" (select code "+
				"  from td_sm_organization "+
				" where code = dw.sspcsdm "+
				" start with code = rpad(substr(" + userCode + ", 0, "+orglength+"), 12, '0') "+
				" connect by prior org_id = parent_id) "+
				" group by rpad(substr(dw.sspcsdm, 0, "+orglength+"), 12, '0')) k on org.code = k.code";
			
			list = SQLExecutor.queryList(Charts.class,sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	/**
	 *	通过用户机构代码获取用户级别
	 * @param orgCode 用户机构代码
	 * @return
	 */
	private static String getOrgLevel(String orgCode){
		String level = "-1";
		if("00".equals(orgCode.substring(2, 4))){
			level = "1";                      //省厅级别
		}else if(!"00".equals(orgCode.substring(2, 4)) && "00".equals(orgCode.substring(4, 6))){
			level = "2";                      //市局级别
		}else if(!"00".equals(orgCode.substring(2, 4)) && !"00".equals(orgCode.substring(4, 6))){
			level = "3";                      //区县级别
		}else if(!"00".equals(orgCode.substring(2, 4)) && !"00".equals(orgCode.substring(4, 6)) && !"00".equals(orgCode.subSequence(6, 8))){
			level = "4";                      //派出所级别
		}
		return level;
	}
}
