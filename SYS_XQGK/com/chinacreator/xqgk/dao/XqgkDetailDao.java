package com.chinacreator.xqgk.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.xqgk.bean.base.MapHandler;
import com.chinacreator.xqgk.bean.query.CyryQueryBean;
import com.chinacreator.xqgk.bean.query.SydwQueryBean;
import com.chinacreator.xqgk.bean.query.SyfwQueryBean;
import com.chinacreator.xqgk.bean.query.SyjzQueryBean;
import com.chinacreator.xqgk.bean.query.SyrkQueryBean;
import com.chinacreator.xqgk.bean.query.XqzaQueryBean;
import com.chinacreator.xqgk.bean.query.ZdryQueryBean;
import com.chinacreator.xqgk.bean.show.CyryBean;
import com.chinacreator.xqgk.bean.show.SydwBean;
import com.chinacreator.xqgk.bean.show.SyfwBean;
import com.chinacreator.xqgk.bean.show.SyjzBean;
import com.chinacreator.xqgk.bean.show.SyrkBean;
import com.chinacreator.xqgk.bean.show.XqzaBean;
import com.chinacreator.xqgk.bean.show.ZdryBean;
import com.chinacreator.xqgk.utils.DateUtils;
import com.chinacreator.xqgk.utils.UtilsConf;
import com.frameworkset.common.poolman.ConfigSQLExecutor;
import com.frameworkset.common.poolman.PreparedDBUtil;
import com.frameworkset.common.poolman.SQLParams;

@SuppressWarnings("unchecked")
public class XqgkDetailDao implements java.io.Serializable {

	private static final long serialVersionUID = 6549157728155400407L;
	private ConfigSQLExecutor executor = new ConfigSQLExecutor("com/chinacreator/xqgk/dao/sql/xqgkDetail-sql.xml");
	
	public static XqgkDetailDao getInstance(){
		return new XqgkDetailDao();
	}
	
	
	/**
	 * 获取辖区各下级单位实有人口信息
	 * @param query
	 * @return
	 * @throws Exception
	 */
	public List<SyrkBean> querySyrkInfoOfDept(SyrkQueryBean query) throws Exception {
		return executor.queryListBeanWithDBName(SyrkBean.class, CommonConstant.DBNAME_SQJW, "querySyrkInfoOfDept", query);
	}
	
	/**
	 * 获取辖区各下级单位实有建筑信息
	 * @param query
	 * @return
	 * @throws Exception
	 */
	public List<SyjzBean> querySyjzInfoOfDept(SyjzQueryBean query) throws Exception {
		return executor.queryListBeanWithDBName(SyjzBean.class, CommonConstant.DBNAME_SQJW, "querySyjzInfoOfDept", query);
	}
	/**
	 * 获取辖区各下级单位实有从业人员信息
	 */
	public List<CyryBean> queryCyryInfoOfDept(CyryQueryBean query) throws Exception {
		List <CyryBean> list = executor.queryListBeanWithDBName(CyryBean.class, CommonConstant.DBNAME_SQJW, "queryCyryInfoOfDept", query);
		return list;
	}
	
	/**
	 * 获取辖区各下级单位实有房屋信息
	 * @param query
	 * @return
	 * @throws Exception
	 */
	public List<SyfwBean> querySyfwInfoOfDept(SyfwQueryBean query) throws Exception {
		return executor.queryListBeanWithDBName(SyfwBean.class, CommonConstant.DBNAME_SQJW, "querySyfwInfoOfDept", query);
	}
	
	/**
	 * 获取辖区各下级单位实有单位信息
	 * @param query
	 * @return
	 * @throws Exception
	 */
	public List<SydwBean> querySydwInfoOfDept(SydwQueryBean query) throws Exception {
		return executor.queryListBeanWithDBName(SydwBean.class, CommonConstant.DBNAME_SQJW, "querySydwInfoOfDept", query);
	}
	
	/**
	 * 获取辖区各下级单位实有单位信息
	 * @param query
	 * @return
	 * @throws Exception
	 */
	public List<ZdryBean> queryZdryInfoOfDept(ZdryQueryBean query) throws Exception {
		return executor.queryListBeanWithDBName(ZdryBean.class, CommonConstant.DBNAME_SQJW, "queryZdryInfoOfDept", query);
	}
	
	/**
	 * 获取辖区本级重点人员信息
	 * @param deptCode
	 * @return
	 * @throws Exception
	 */
	public List<ZdryBean> querySelfZdryOfDept(String deptCode) throws Exception {
		return executor.queryListWithDBName(ZdryBean.class, CommonConstant.DBNAME_SQJW, "querySelfZdryOfDept", deptCode);
	}
	
	/**
	 * 获取辖区治安信息
	 * @param query
	 * @return
	 * @throws Exception
	 */
	public List<XqzaBean> queryXqzaInfo(XqzaQueryBean query) throws Exception {
		return executor.queryListBeanWithDBName(XqzaBean.class, CommonConstant.DBNAME_SQJW, "queryXqzaInfo", query);
	}
	
	/**
	 * 获取辖区各下级单位发案信息
	 * @param query
	 * @return
	 * @throws Exception
	 */
	public List<XqzaBean> queryXqzaInfoOfDept(XqzaQueryBean query) throws Exception {
		return executor.queryListBeanWithDBName(XqzaBean.class, CommonConstant.DBNAME_SQJW, "queryXqzaInfoOfDept", query);
	}
	
	
	/*-----------------------------------------------------------------*/
	public List<HashMap> getDetailNumOfChild(String levelCode, int level, String codeType) throws Exception{
		int checkNum = 2 * level;//单位代码位数
		int groupNum = checkNum + 2;//子单位分组位数
		boolean needDate = false;//是否需要时间参数
		
		String dsName = CommonConstant.DBNAME_SQJW;
		StringBuilder sql = new StringBuilder();
		if("bzdz".equals(codeType)){//标准地址
			String groupCol = " DZ.DJRDWDM ";
			if(level < 4){
				groupCol = " SUBSTR(DZ.DJRDWDM,1," + groupNum + ") ";
			}
			sql.append("select a.code CODE, a.cou N1, b.cou N2 from ");
			sql.append("(SELECT COUNT(1) cou, " + groupCol + " code FROM T_COMMON_DZXX DZ WHERE DZ.DJRDWDM like #[deptCode] group by " + groupCol + ") a ");
			sql.append(" left join ");
			sql.append("(SELECT COUNT(1) cou, " + groupCol + " code FROM T_COMMON_DZXX DZ WHERE DZ.DJRDWDM like #[deptCode] AND GXSJ >= #[startDate] AND GXSJ <= #[endDate] group by " + groupCol + ") b ");
			sql.append(" on a.code = b.code ");
			sql.append(" order by a.code ");
			
			needDate = true;
		}else if("st".equals(codeType)){//实体
			String groupCol = " ST.DJDWDM ";
			if(level < 4){
				groupCol = " SUBSTR(ST.DJDWDM,1," + groupNum + ") ";
			}
			
			sql.append("select a.code CODE, a.cou N1, b.cou N2 from ");
			sql.append("(SELECT COUNT(1) cou, " + groupCol + " code FROM T_COMMON_STXX ST WHERE ST.DJDWDM like #[deptCode] group by " + groupCol + ") a ");
			sql.append(" left join ");
			sql.append("(SELECT COUNT(1) cou, " + groupCol + " code FROM T_COMMON_STXX ST WHERE ST.DJDWDM like #[deptCode] AND GXSJ >= #[startDate] AND GXSJ <= #[endDate] group by " + groupCol + ") b ");
			sql.append(" on a.code = b.code ");
			sql.append(" order by a.code ");
			
			needDate = true;
		}else if("syrk".equals(codeType)){//实有人口
			String groupCol = " RK.CZDWDM ";
			if(level < 4){
				groupCol = " SUBSTR(RK.CZDWDM,1," + groupNum + ") ";
			}
			
			sql.append("select a.code CODE, a.cou N1, b.cou N2 from ");
			sql.append("(SELECT COUNT(1) cou, " + groupCol + " code FROM T_LSGL_RK_JBXX RK WHERE RK.CZDWDM like #[deptCode] group by " + groupCol + ") a ");
			sql.append(" left join ");
			sql.append("(SELECT COUNT(1) cou, " + groupCol + " code FROM T_LSGL_RK_JBXX RK WHERE RK.CZDWDM like #[deptCode] AND RK.CZSJ >= #[startDate] AND RK.CZSJ <= #[endDate] group by " + groupCol + ") b ");
			sql.append(" on a.code = b.code ");
			sql.append(" order by a.code ");
			
			needDate = true;
		}else if("sydw".equals(codeType)){//实有单位
			String groupCol = " DW.ZRDWPCSDM ";
			if(level < 4){
				groupCol = " SUBSTR(DW.ZRDWPCSDM,1," + groupNum + ") ";
			}
			
			sql.append("select a.code CODE, a.cou N1, b.cou N2 from ");
			sql.append("(SELECT COUNT(1) cou, " + groupCol + " code FROM T_ZA_JG_JBXX DW WHERE DW.CZBS != '3' AND (DW.ZXBS = '0' OR DW.ZXBS IS NULL) AND DW.ZRDWPCSDM like #[deptCode] group by " + groupCol + ") a ");
			sql.append(" left join ");
			sql.append("(SELECT COUNT(1) cou, " + groupCol + " code FROM T_ZA_JG_JBXX DW WHERE DW.CZBS != '3' AND (DW.ZXBS = '0' OR DW.ZXBS IS NULL) AND DW.ZRDWPCSDM like #[deptCode] AND DJSJ >= #[startDate] AND DJSJ <= #[endDate]group by " + groupCol + ") b ");
			sql.append(" on a.code = b.code ");
			sql.append(" order by a.code ");
			
			needDate = true;
		}else if("zdrygj".equals(codeType)){//重点人员轨迹
			String groupCol = " GJ.PLACEUNITCODE ";
			if(level < 4){
				groupCol = " SUBSTR(GJ.PLACEUNITCODE,1," + groupNum + ") ";
			}
			
			sql.append("select a.code CODE, a.cou N1, b.cou N2 from ");
			sql.append("(SELECT COUNT(1) cou, " + groupCol + " code FROM t_compareinfo GJ WHERE GJ.PLACEUNITCODE like #[deptCode] and GJ.activeinfotype='101005' group by " + groupCol + ") a");
			sql.append(" left join ");
			sql.append("(SELECT COUNT(1) cou, " + groupCol + " code FROM t_compareinfo GJ WHERE GJ.PLACEUNITCODE like #[deptCode] and GJ.activeinfotype='101007' group by " + groupCol + ") b");
			sql.append(" on a.code = b.code ");
			sql.append(" order by a.code ");
			
			needDate = false;
			dsName = UtilsConf.DBNAME_QBPT;
		}else{
			return new ArrayList<HashMap>();
		}
		
		SQLParams param = new SQLParams();
		param.addSQLParam("deptCode", levelCode, SQLParams.STRING);
		if(needDate){
			param.addSQLParam("startDate", DateUtils.getFirstDateOfMonth(), SQLParams.DATE);
			param.addSQLParam("endDate", DateUtils.getLastDateOfMonth(), SQLParams.DATE);
		}
		
		PreparedDBUtil pdb = new PreparedDBUtil();
		pdb.preparedSelect(param, dsName, sql.toString());
		List<HashMap> resList = pdb.executePreparedForList(HashMap.class, new MapHandler());
		return resList;
	}

}
