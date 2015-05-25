package com.chinacreator.common.cps.helper;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.transaction.RollbackException;

import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.cps.business.OrgUserbusiness;
import com.chinacreator.common.helper.CommonDBBaseHelper;
import com.chinacreator.common.helper.DateTimeHelper;
import com.chinacreator.common.helper.DictionaryCacheHellper;
import com.chinacreator.common.helper.ValidateHelper;
import com.chinacreator.remote.bean.CzrkInfoBean;
import com.chinacreator.remote.business.RemoteRequestService;
import com.frameworkset.common.poolman.DBUtil;
import com.frameworkset.common.poolman.SQLExecutor;
import com.frameworkset.orm.transaction.TransactionManager;

/**
 * 系统化编码公共获取方式
 * 
 * @author mingchun.xiong
 * @date 2013-8-6
 */
public class CommonSequenceHelper
{
	/**
	 * 获取人员编号
	 * @param xzqh 6位行政区划
	 * @return
	 */
	public static String getRybh(String xzqh)
	{
		try
		{
			String sql = "select f_get_rybh(?) from dual";
			return SQLExecutor.queryFieldWithDBName(CommonConstant.DBNAME_SQJW, sql, xzqh);
		}
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 获得重点人员工作对象编号
	 * @param org_code
	 * @return
	 */
	public static String getZdrybh(String org_code){
		try {
			String sql="select 'GD'||substr(?,0,6)||lpad(seq_zdry_zdrybh.nextval,12,'0') from dual";
			return SQLExecutor.queryFieldWithDBName(CommonConstant.DBNAME_SQJW, sql, org_code);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	/**
	 * 获得重点人员工作编号编号   精神病人、 涉稳 吸毒 矫正 关注。。
 	 */
	public static String getZdryGzdxbh(String xzqh,String sequence){
		try {
			String rq = DateTimeHelper.getNowDateStr("yyyyMMdd");

			String sql="select ?||"+rq+"||lpad("+sequence+".nextval,6,'0') from dual";
			return SQLExecutor.queryFieldWithDBName(CommonConstant.DBNAME_SQJW, sql, xzqh);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 *  获取技防物防设备编号
	 * @return
	 */
	public static String getSbbh(String sqbh)
	{
		try
		{
			String sql = "select to_char(nvl(max(to_number(ssbh) + 1),? || '00001')) from t_af_xqjfwfssxx where sqbh=?";
			return SQLExecutor.queryFieldWithDBName(CommonConstant.DBNAME_SQJW, sql, sqbh,sqbh);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return null;
	}
	
	
	/**
	 * 获取小区编号
	 * @param sqbh
	 * @return
	 */
	public static String getXqbh(String sqbh)
	{
		try
		{
			String sql = " select nvl(max(to_number(xqbh) + 1),? || '001') from t_af_xqjbxx where sssqbh=?";
			return SQLExecutor.queryFieldWithDBName(CommonConstant.DBNAME_SQJW, sql, sqbh, sqbh);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return null;
	}
	
	

	
	/**
	 * 获取列管申请信息编号
	 * @param dwdm 单位编码12位
	 * @return
	 */
	public static String getLGSQXXBH(String dwdm)
	{
		//获取行政代码
		String xzdm = DictionaryCacheHellper.getSystemParamenterValueByKey("current.xzdm");
		String dw8dm = dwdm.substring(0, 8);
		String rq = DateTimeHelper.getNowDateStr("yyyyMMdd");
		String seq = CommonDBBaseHelper.getSequence(CommonConstant.DBNAME_SQJW, "SEQ_ZDRY_LGSQXXBH");
		
		String result = xzdm + dw8dm + rq + seq;
		return result;
	}
	
	/**
	 * 
	 * @param dwdm 当前登录机构代码
	 * @param dwtype 单位类型 JG：机构基本信息 ，TZ:特种行业 ,NB:内部单位，GC：公共场所 其他单位待定
	 * @return
	 */
	public static String getJGBH(String dwdm, String dwtype)
	{
		//获取行政代码
		String rq = DateTimeHelper.getNowDateStr("yyMMdd");
		String seq = CommonDBBaseHelper.getSequence(CommonConstant.DBNAME_SQJW, "seq_za_jgbh");
		String result = dwtype  + dwdm + rq + seq;
		return result;
	}
	
	public static String getDWBH(String prefix)
	{
		return prefix + DateTimeHelper.getNowDateStr("yyyyMMdd") + CommonDBBaseHelper.getSequence(CommonConstant.DBNAME_SQJW, "seq_za_dwbh", "left", 10, "0");
	}
	
	/**
	 * 获取安保设施编号
	 * @param dwdm 当前登录用户的单位代码
	 * @return
	 */
	public static String getABSSBH(String dwdm)
	{
		if (ValidateHelper.isNotEmptyString(dwdm))
		{
			String xzdm = DictionaryCacheHellper.getSystemParamenterValueByKey("current.xzdm");
			String rq = DateTimeHelper.getNowDateStr("yyMMdd");
			String seq = CommonDBBaseHelper.getSequence(CommonConstant.DBNAME_SQJW, "SEQ_ABSSBH");
			return xzdm + dwdm + rq + seq;
		}
		else
		{
			return null;
		}
	}
	
	/**
	 * 得到安防的编号
	 * @param dwdm 当前登录机构代码
	 * @return
	 */
	public static String getAfbh(String dwdm, String seqname)
	{
		//获取行政代码
		String xzdm = DictionaryCacheHellper.getSystemParamenterValueByKey("current.xzdm");
		String dw8dm = dwdm.substring(0, 8);
		String rq = DateTimeHelper.getNowDateStr("yyMMdd");
		String seq = CommonDBBaseHelper.getSequence(CommonConstant.DBNAME_SQJW, seqname);
		
		String result = xzdm + dw8dm + rq + seq;
		return result;
	}
	
	/**
	 * 获取社区编号 12位街道 + 3为流水号
	 * @param jdxzdm 街道乡镇代码
	 * @return
	 */
	public static String getSQBH(String jdxzdm)
	{
		try
		{
			String sql = "select nvl(max(to_number(sqbh)) + 1,'" + jdxzdm +"'||'001') from t_af_sqjbxx where substr(sqbh,1,12)='" + jdxzdm +"'";
			return SQLExecutor.queryFieldWithDBName(CommonConstant.DBNAME_SQJW, sql);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 获取社区居委会编号
	 * @param xzqh
	 * @return
	 */
	public static String getSQJWHBH(String xzqh)
	{
		try
		{
			String sql = "select '" + xzqh + "'||seq_jwhbh.nextval from dual";
			return SQLExecutor.queryFieldWithDBName(CommonConstant.DBNAME_SQJW, sql);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 获取社区干部编号
	 * @param sqbh
	 * @return
	 */
	public static String getSQGBBH(String sqbh)
	{
		try
		{
			String sql = "select to_char(nvl(max(to_number(gbbh)) + 1,'" + sqbh + "'||'001')) from t_af_sqgbxx ";
			return SQLExecutor.queryFieldWithDBName(CommonConstant.DBNAME_SQJW, sql);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 获取重点要害部位编号
	 * @return
	 */
	public static String getZDYHBWBH()
	{
		try
		{
			return CommonDBBaseHelper.getSequence(CommonConstant.DBNAME_SQJW, "seq_zdyhbwbh");
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 获取单位处罚信息编号
	 * @return
	 */
	public static String getDWCFXXBH()
	{
		try
		{
			return CommonDBBaseHelper.getSequence(CommonConstant.DBNAME_SQJW, "seq_dwcfxxbh");
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 单位从业人员编号
	 * @param dwdm
	 * @return
	 */
	public static String getDWCYRYBH(String dwdm)
	{
		try
		{
			String sql = "SELECT '" + dwdm + "'||to_char(sysdate,'yyyymmdd')||SEQ_CYRYBH.Nextval FROM dual";
			return SQLExecutor.queryFieldWithDBName(CommonConstant.DBNAME_SQJW, sql);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 单位安全检查编号
	 * @return
	 */
	public static String getDWAQJCXXBH(){
		String sql = "SELECT to_char(sysdate,'yyyymmddHH24miss')||SEQ_ZA_AQJCXX.Nextval FROM dual";
		try {
			return SQLExecutor.queryFieldWithDBName(CommonConstant.DBNAME_SQJW, sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 安保人员编号
	 * @return
	 */
	public static String getABRYBH(){
		String sql = "SELECT to_char(sysdate,'yyyymmddHH24miss')||SEQ_ABRYBH.Nextval FROM dual";
		try {
			return SQLExecutor.queryFieldWithDBName(CommonConstant.DBNAME_SQJW, sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 获取内保单位编号
	 * @return
	 */
	public static String getNBDWBH(){
		String sql = "SELECT to_char(sysdate,'yyyymmddHH24miss')||SEQ_NBDWBH.Nextval FROM dual";
		try {
			return SQLExecutor.queryFieldWithDBName(CommonConstant.DBNAME_SQJW, sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 获取特种行业机构编号(旅馆编号)
	 * @return
	 */
	public static String getTZHYJGBH(){
		String sql = "SELECT F_GET_LGBH() FROM dual";
		try {
			return SQLExecutor.queryFieldWithDBName(CommonConstant.DBNAME_SQJW, sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	
	/**
	 * 获取单位检查配置ID
	 * @return
	 */
	public static String getDwjcId(){
		String sql = "SELECT SEQ_DWJCPZ.NEXTVAL FROM DUAL";
		try 
		{
			return SQLExecutor.queryFieldWithDBName(CommonConstant.DBNAME_SQJW, sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 获取地址编号
	 * @param stid 实体ID
	 * @return
	 */
	public static String getDzbm(String stid)
	{
		String sql = "select f_get_dzbm(?) from dual";
		try
		{
			return SQLExecutor.queryFieldWithDBName(CommonConstant.DBNAME_SQJW, sql,stid);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return null;
	}
	
	public static String getStbm(String sqbm, String jlxdm,String xqmc)
	{
		String sql = "select f_get_stbm(?,?,?) from dual";
		try
		{
			return SQLExecutor.queryFieldWithDBName(CommonConstant.DBNAME_SQJW, sql,sqbm,jlxdm,xqmc);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 获取房屋编号
	 * @param sqdm 12位社区代码
	 * @return 返回房屋编号
	 * @date 2013-8-7 下午03:20:16
	 */
	public static String getFWBM(String sqdm)
	{
		String sql = "select 'F'||?||seq_lsgl_fwbh.nextval from dual";
		try
		{
			return SQLExecutor.queryFieldWithDBName(CommonConstant.DBNAME_SQJW, sql,sqdm);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return null;
	}
	
	public static String getCZFWBM(String orgcode)
	{
		String sql = "select 'CZF'||substr(?,1,8)||lpad(seq_lsgl_czfwbm.nextval,9,'0') from dual";
		try
		{
			return SQLExecutor.queryFieldWithDBName(CommonConstant.DBNAME_SQJW, sql,orgcode);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return null;
	}
	
	public static String getCzfwbpbm(String orgcode, String czfwbh)
	{
		String sql = "select f_get_czfwbpbm(?,?) from dual";
		try
		{
			return SQLExecutor.queryFieldWithDBName(CommonConstant.DBNAME_SQJW, sql,orgcode,czfwbh);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 获取常住人口编号
	 * @param xzqh
	 * @return
	 * @date 2013-8-30 上午10:02:27
	 */
	public static String getCzrkbh(String xzqh)
	{
		String sql = "select 'RCZ'||substr(?,1,6)||lpad(SEQ_RK_RKID.nextval,11,'0') from dual";
		try
		{
			return SQLExecutor.queryFieldWithDBName(CommonConstant.DBNAME_SQJW, sql,xzqh);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 获取暂住编号
	 * @param orgcode 当前登录用户的orgcode
	 * @return
	 * @date 2013-9-2 上午09:56:39
	 */
	public static String getZzbh(String orgcode)
	{
		String sql = "select 'RZK'||substr(?,1,6)||lpad(SEQ_RK_RKID.nextval,11,'0') from dual";
		try
		{
			return SQLExecutor.queryFieldWithDBName(CommonConstant.DBNAME_SQJW, sql,orgcode);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 寄住人口编号
	 * @param orgcode
	 * @return
	 * @date 2013-9-4 上午09:33:19
	 */
	public static String getJzbh(String orgcode)
	{
		String sql = "select 'RJZ'||substr(?,1,6)||lpad(SEQ_RK_RKID.nextval,11,'0') from dual";
		try
		{
			return SQLExecutor.queryFieldWithDBName(CommonConstant.DBNAME_SQJW, sql,orgcode);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 未落户人口编号
	 * @param orgcode
	 * @return
	 * @date 2013-9-4 上午09:33:10
	 */
	public static String getWlhrkBh(String orgcode)
	{
		String sql = "select 'RWK'||substr(?,1,6)||lpad(SEQ_RK_RKID.nextval,11,'0') from dual";
		try
		{
			return SQLExecutor.queryFieldWithDBName(CommonConstant.DBNAME_SQJW, sql,orgcode);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 获取境外编号
	 * @param orgcode
	 * @return
	 * @date 2013-9-4 下午06:21:03
	 */
	public static String getJwbh(String orgcode)
	{
		String sql = "select 'RJW'||substr(?,1,6)||lpad(SEQ_RK_RKID.nextval,11,'0') from dual";
		try
		{
			return SQLExecutor.queryFieldWithDBName(CommonConstant.DBNAME_SQJW, sql,orgcode);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 获取信息员（耳目）编号
	 * @param xzqh
	 * @return
	 */
	public static String getZAEMBH(String xzqh) {
		String sql = "select ?||lpad(SEQ_COMMON_ZAEMBH.nextval,14,'0') from dual";
		try {
			return SQLExecutor.queryFieldWithDBName(CommonConstant.DBNAME_SQJW, sql, xzqh);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	/**
	 *  获取人员属性
	 * @param sfzh  身份证号
	 * @param newrysx 人员类别
	 * @param oper I 新增, D删除 
	 * @return
	 * @date 2013-9-9 下午02:07:16
	 */
	public static String getRysx(String sfzh, String rysx, String oper)
	{
		String newrysx = "";
		try
		{
			String sql = "select f_get_rysx(?,?,?) from dual";
			newrysx = SQLExecutor.queryFieldWithDBName(CommonConstant.DBNAME_SQJW, sql, sfzh,rysx,oper);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return newrysx;
	}
	
	/**
	 * 获取人员属性描述
	 * @param rysxs
	 * @return
	 * @date 2013-9-9 上午10:48:45
	 */
	public static String getRysxms(String rysxs)
	{
		List<String> rysxmss = new ArrayList<String>();
		if (ValidateHelper.isNotEmptyString(rysxs))
		{
			for (int i=0;i<rysxs.length();i++)
			{
				if (rysxs.charAt(i)=='1')
				{
					if (i+1 < 10)
					{
						rysxmss.add(DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("ZDY_RYSX", "0" + (i+1)));
					}
					else
					{
						rysxmss.add(DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("ZDY_RYSX", String.valueOf(i+1)));
					}
				}
			}
		}
		return rysxmss.toString().replace("[", "").replace("]", "");
	}
	
	/**
	 * 通过身份证与房屋ID获取人员类别
	 * @param sfzh
	 * @param fwid
	 * @param userinfos  userinfos[0]=sfzh, userinfos[1]=realname,userinfos[2]=orgcode
	 * @return
	 * @date 2013-9-18 下午02:46:16
	 */
	public static String getRylb(String sfzh, String fwid, String ... userinfos)
	{
		String sql = "select f_get_rylb(?,?) from dual";
		String rylb = "";
		try
		{
			OrgUserbusiness orgUserbusiness = new OrgUserbusiness();
			//查找本地库St表
			int size = orgUserbusiness.queryCzrkStCount(sfzh);
			// 本地库没有找到数据
			if (size <= 0)
			{
				// 查询远程服务找人要信息
				RemoteRequestService rrs = new RemoteRequestService();
				try
				{
					CzrkInfoBean czrkbean = null;
					if (userinfos != null && userinfos.length >= 3)
					{
						czrkbean = rrs.queryCzrkInfoBySfzhAndUserInfo(sfzh, userinfos[0], userinfos[1], userinfos[2]);
					}
					else
					{
						czrkbean = rrs.getRemoteCzrkInfoBySfzh(sfzh);
					}
					//流动人口
					if (czrkbean != null)
					{
						rylb="2";
					}
					//未落户
					else
					{
						rylb = "3";
					}
				}
				catch(Exception e)
				{
					e.printStackTrace();
					rylb = "0";
				}
			}
			else
			{
				rylb = SQLExecutor.queryFieldWithDBName(CommonConstant.DBNAME_SQJW, sql, sfzh, fwid);
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return rylb;
	}
	/**
	 * 获取街路巷代码
	 * @param org_code
	 * @return
	 */
	public static String getJlxDm(String xzqh)
	{
		try 
		{
			String sql="select f_get_jlxdm(?) from dual";
			return SQLExecutor.queryFieldWithDBName(CommonConstant.DBNAME_SQJW, sql, xzqh);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 获取重点人员细类描述
	 * @param zdryxl
	 * @return
	 * @date 2013-12-17 下午02:01:27
	 */
	public static String getZdryxlmcs(String zdryxl)
	{
		String result = "";
		if (ValidateHelper.isNotEmptyString(zdryxl))
		{
			String[] zdryxls = zdryxl.split(",");
			for (String zdryxldm : zdryxls)
			{
				String mc = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("GA_ZDRYLBDM", zdryxldm);
				if (ValidateHelper.isEmptyString(result))
				{
					result+=mc;
				}
				else
				{
					result+="," + mc;
				}
			}
		}
		return result;
	}
	
	//根据重点人员标识获取重点人员类别名称
	public static String getZdrylbmc(String zdrybz){
		String mc = "";
		if(ValidateHelper.isNotEmptyString(zdrybz)){
			DBUtil db = new DBUtil();
			String sql = "select f_get_zdrylbbjmc('" + zdrybz + "') from dual";
			try {
				db.executeSelect(sql);
				if(db.size()>0){
					mc = db.getString(0, 0);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
		}
		return mc;
	}
	
	public static String getSfzhByRybh(String rybh){
		String sql = "select f_get_sfzhbyrybh(?) from dual"; 
		try {
			return SQLExecutor.queryFieldWithDBName(CommonConstant.DBNAME_SQJW, sql, rybh);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	public static String getRybhBySfzh(String sfzh){
		String sql = "select f_get_rybhbysfzh(?) from dual"; 
		try {
			return SQLExecutor.queryFieldWithDBName(CommonConstant.DBNAME_SQJW, sql, sfzh);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 通过房屋ID获取地址名称
	 * @param fwid
	 * @return
	 * @date Aug 15, 2014 3:20:48 PM
	 */
	public static String getDzmcByFwid(String fwid)
	{
		String sql = "select F_GET_DZMC_BYFWID(?) from dual"; 
		try 
		{
			return SQLExecutor.queryFieldWithDBName(CommonConstant.DBNAME_SQJW, sql, fwid);
		} 
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 通过rkfwglid查找地址名称
	 * @param rkfwglid
	 * @return
	 * @date Aug 15, 2014 3:24:13 PM
	 */
	public static String getDzmcByRkfwglid(String rkfwglid)
	{
		String sql = "select f_get_dzmc_byrkfwglid(?) from dual"; 
		try 
		{
			return SQLExecutor.queryFieldWithDBName(CommonConstant.DBNAME_SQJW, sql, rkfwglid);
		} 
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 获取流口协管员编号
	 */
	public static synchronized String getLkXgyBh(String orgcode)
	{
		String seq = null; 
		TransactionManager tm = null;
		try
		{
			tm = new TransactionManager();
			tm.begin();
			String querysql = "select lpad(seq,4,'0') from t_common_fjbhseq where xzqhdm=substr(?,1,6)";
			seq = SQLExecutor.queryFieldWithDBName(CommonConstant.DBNAME_SQJW, querysql, orgcode);
			
			String updatesql = "update t_common_fjbhseq set seq=seq+1 where xzqhdm=substr(?,1,6)";
			
			SQLExecutor.updateWithDBName(CommonConstant.DBNAME_SQJW, updatesql, orgcode);
			tm.commit();
		}
		catch(Exception e)
		{
			e.printStackTrace();
			try
			{
				tm.rollback();
			}
			catch(RollbackException e1)
			{
			}
		}
		String dm = orgcode.substring(4,6);
		if("99".equals(dm)){
			dm = "08";
		}
		seq = dm.concat(seq);
		return seq;
	}
}
