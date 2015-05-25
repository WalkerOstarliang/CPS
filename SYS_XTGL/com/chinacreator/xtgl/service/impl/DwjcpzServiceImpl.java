package com.chinacreator.xtgl.service.impl;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.chinacreator.common.bean.LoginInfo;
import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.bean.QueryBean;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.helper.ActionContextHelper;
import com.chinacreator.common.helper.CommonDBBaseHelper;
import com.chinacreator.common.helper.DateTimeHelper;
import com.chinacreator.common.helper.DictionaryCacheHellper;
import com.chinacreator.common.helper.ValidateHelper;
import com.chinacreator.xtgl.bean.DwjcpzBean;
import com.chinacreator.xtgl.bean.JjrzdBean;
import com.chinacreator.xtgl.dao.DwjcpzDao;
import com.chinacreator.xtgl.dao.impl.DwjcpzDaoImpl;
import com.chinacreator.xtgl.service.DwjcpzService;
import com.chinacreator.xtgl.util.DwJczqPzUtil;
import com.frameworkset.common.poolman.DBUtil;
import com.frameworkset.orm.transaction.TransactionManager;

public class DwjcpzServiceImpl implements DwjcpzService{

	private static final long serialVersionUID = -4606149415464501672L;
	private DwjcpzDao dao = new DwjcpzDaoImpl();

	public void deleteDwjcpz(String ids) throws SQLException {
		List<DwjcpzBean> dwjcpzList = new ArrayList<DwjcpzBean>();
		LoginInfo loginfo = ActionContextHelper.getLoginInfo();
		for(String id : ids.split(",")){
			DwjcpzBean bean = new DwjcpzBean();
			bean.setId(id);
			bean.setCzbs(CommonConstant.CZBZ_DEL);
			bean.setCzrxm(loginfo.getRealname());
			bean.setCzrjh(loginfo.getUsername());
			bean.setCzdwmc(loginfo.getOrgname());
			bean.setCzdwdm(loginfo.getOrgcode());
			bean.setCzrjh(loginfo.getUsername());
			dwjcpzList.add(bean);
		}
		dao.batchDeleteDwjcpz(dwjcpzList);
	}

	public DwjcpzBean queryDwjcpzById(String id) throws SQLException {
		List<JjrzdBean> list = dao.queryJjrjcById(id);
		DwjcpzBean dwjcpz = dao.queryDwjcpzById(id);
		String [] tsrq = new String[list.size()];
		for(int i = 0 ; i <  list.size() ; i++){
			tsrq[i] = list.get(i).getDm();
		}
		dwjcpz.setTsrq(tsrq);
		return dwjcpz;
	}

	public PageResultInfo<DwjcpzBean> queryDwjcpzPageResultInfo(
			PageInfo pageInfo, QueryBean bean) throws SQLException {
		return dao.queryDwjcpzPageResultInfo(pageInfo, bean);
	}

	public DwjcpzBean saveDwjcpz(DwjcpzBean bean) throws Exception {
		if(bean == null){
			return null;
		}
		
		//检查周期（天）
		String jczq = getJczq(bean.getSz(), bean.getDw());
		
//		01	特种行业
//		02	公共场所	
//		03	企事业单位
		//行业类别与单位分类对应关系（字典类别）
		Map<String,String> map_dwfl = new HashMap<String,String>();
		map_dwfl.put("01", "ZAGL_THLB");
		map_dwfl.put("02", "GGCSLB");
		map_dwfl.put("03", "ZDY_DWFL");
		
		//行业类别与表名的对应关系
		Map<String,String> map_tabName = new HashMap<String,String>();
		map_tabName.put("01", "t_za_dw_tzhy");
		map_tabName.put("02", "t_za_dw_ggcs");
		map_tabName.put("03", "t_za_dw_nbdw");
		map_tabName.put("04", "t_za_dw_wxwpdw");
		map_tabName.put("05", "t_za_jg_swfwcs");
		map_tabName.put("06", "t_za_dw_swdw");
		
		//代码
		String pzdm = bean.getHylb();
		//标题
		String bt = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("ZDY_HYLB", bean.getHylb());
		
		//描述
		StringBuffer ms = new StringBuffer(); 
		//行业类别
		ms.append(DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("ZDY_HYLB", bean.getHylb()));
		//单位大类
		if(ValidateHelper.isNotEmptyString(bean.getDwdl())){
			ms.append("、" + DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm(map_dwfl.get(bean.getHylb()), bean.getDwdl()));
		}
		//单位细类
		if(ValidateHelper.isNotEmptyString(bean.getDwxl())){
			ms.append("、" + DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm(map_dwfl.get(bean.getHylb()), bean.getDwxl()));
		}
		ms.append("：【#[dwmc]】安全检查即将到期，请及时处理!上次处理时间为【#[scjcsj]】,检查周期为【" + bean.getSz());
		ms.append(DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("ZAGL_JCZQDW",bean.getDw()) + "】。");
		
		//SQL
		StringBuffer sql = new StringBuffer();
		sql.append(" select distinct dw.jgbh,dw.dwmc, f_get_dwmaxjcsj(dw.jgbh) as scjcsj");
		sql.append(" from t_za_jg_jbxx dw ");
		if(ValidateHelper.isNotEmptyString(bean.getHylb())){
			sql.append(" , " + map_tabName.get(bean.getHylb()) + " fb ");
		}
		//单位没有注销
		sql.append(" where dw.zxbs = 0 ");
		if(ValidateHelper.isNotEmptyString(bean.getHylb())){
			sql.append(" and dw.jgbh = fb.jgbh ");
			sql.append(" and instr(dw.hylb ," + bean.getHylb() +") >= 1");
			if(ValidateHelper.isNotEmptyString(bean.getDwdl())){
				pzdm += bean.getDwdl();
				if("01".equals(bean.getHylb())){
					sql.append(" and fb.thlb = " + bean.getDwdl());
				}else if("02".equals(bean.getHylb())){
					sql.append(" and fb.cslb = " + bean.getDwdl());
				}else if("03".equals(bean.getHylb())){
					sql.append(" and fb.dwfl = " + bean.getDwdl());
				}
				
				if(ValidateHelper.isNotEmptyString(bean.getDwxl())){
					pzdm += bean.getDwxl();
					
					if("01".equals(bean.getHylb())){
						sql.append(" and fb.thxl = " + bean.getDwxl());
					}else if("02".equals(bean.getHylb())){
						sql.append(" and fb.csxl = " + bean.getDwxl());
					}else if("03".equals(bean.getHylb())){
						sql.append(" and fb.dwxl = " + bean.getDwxl());
					}
				}
			}
		}	
		
		sql.append(" and ( (f_get_dwmaxjcsj(dw.jgbh) is null) or ((f_get_dwmaxjcsj(dw.jgbh) + " + jczq + ") - sysdate) <= " + bean.getTqtxts() + ") ");
		sql.append(" and (dw.zrdwpcsdm = #[orgcode] or dw.djdwdm = #[orgcode])");
		
		String href = "/zagl/dw/toDwInfoPage.action?dw.dwjbxx.jgbh=#[jgbh]&operType=update";
		
		String executesn = "0";
		DBUtil db = new DBUtil();
		db.setAutoCommit(false);
		db.executeSelect("select max(executesn) as sx from t_common_xttx_pz");
		if(db.size() > 0){
			executesn = db.getString(0,"sx");
		}
		
		String resultField = "jgbh,dwmc,scjcsj,sz";
		String setField = "orgcode,orgcode,orgcode";
 		
		
		LoginInfo login = ActionContextHelper.getLoginInfo();
		bean.setCzrjh(login.getUsername());
		bean.setCzrxm(login.getRealname());
		bean.setCzdwdm(login.getOrgcode());
		bean.setCzdwmc(login.getOrgname());
		bean.setCzsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss"));
		
		
		TransactionManager tr = new TransactionManager();
		try{
			tr.begin();
			
			//验证该配置是否在配置中已经存在 存在则根据配置代码修改，不存在则新增配置
			String pzyz_sql = " select * from t_common_xttx_pz where pzdm = '" + pzdm + "'";
			db.executeSelect(pzyz_sql);
			if(db.size() > 0){
				String sql_update = "update t_common_xttx_pz set " + 
				" title = '" + bt + "' ," + 
				" description = '" + ms.toString() + "' , " +
				" sql = '" + sql.toString() +"' ," + 
				" setfield = '" + setField + "' " +
				" where pzdm = '" +  pzdm + "'";
				db.executeUpdate(CommonConstant.DBNAME_SQJW,sql_update);
			}else{
				String sql_insert = "insert into t_common_xttx_pz(id, pzdm, title, description, sql, href, isvalid, executesn, resultfield, setfield) " 
					+ " values(seq_common.nextval,'" 
					+ pzdm + "','" + bt + "','" + ms.toString() + "','" + sql.toString() + "','" 
					+ href + "','1','" + (Integer.parseInt(executesn) + 10) + "','"
					+ resultField + "','" + setField + "')";
				db.executeInsert(CommonConstant.DBNAME_SQJW,sql_insert);
			}
		
			if(ValidateHelper.isEmptyString(bean.getId())){
				String id = CommonDBBaseHelper.getSequence(CommonConstant.DBNAME_SQJW, "seq_dwjcpz");
				bean.setId(id);
				bean.setJczq(jczq);
				
				if(bean.getTsrq() != null){
					List<JjrzdBean> jjrList = new ArrayList<JjrzdBean>();
					for(String dm : bean.getTsrq()){
						JjrzdBean jjr = new JjrzdBean();
						jjr.setId(id);
						jjr.setDm(dm);
						jjrList.add(jjr);
					}
					dao.insertJjrjc(jjrList);
				}
				bean.setCzbs(CommonConstant.CZBZ_ADD);
				bean.setDjrjh(login.getUsername());
				bean = dao.insertDwjcpz(bean);
				tr.commit();
			}else{
				bean.setJczq(jczq);
				dao.deleteJjrjc(bean.getId());
				
				if(bean.getTsrq() != null){
					List<JjrzdBean> jjrList = new ArrayList<JjrzdBean>();
					for(String dm : bean.getTsrq()){
						JjrzdBean jjr = new JjrzdBean();
						jjr.setId(bean.getId());
						jjr.setDm(dm);
						jjrList.add(jjr);
					}
					dao.insertJjrjc(jjrList);
				}
				bean.setCzbs(CommonConstant.CZBZ_UPDATE);
				bean = dao.updateDwjcpz(bean);
			}
			db.commitTransaction();
			tr.commit();
		}catch(Exception e){
			db.rollbackTransaction();
			bean = null;
			tr.rollback();
			e.printStackTrace();
		}	
		return bean;
	}
	
	/**
	 * 计算单位检查周期
	 * @param sz 数值
	 * @param dw 单位
	 * @return
	 */
	public String getJczq(String sz,String dw){
		double jczq = 0;
		if("01".equals(dw)){               //天
			jczq = Double.parseDouble(sz) * DwJczqPzUtil.DW_T;
		}else if("02".equals(dw)){         //周
			jczq = Double.parseDouble(sz) * DwJczqPzUtil.DW_Z;
		}else if("03".equals(dw)){         //月
			jczq = Double.parseDouble(sz) * DwJczqPzUtil.DW_Y;
		}else if("04".equals(dw)){         //季度
			jczq = Double.parseDouble(sz) * DwJczqPzUtil.DW_JD;
		}else if("05".equals(dw)){         //年
			jczq = Double.parseDouble(sz) * DwJczqPzUtil.DW_N;
		}
		return jczq + "";
	}

	public List<JjrzdBean> getJjrZd() throws SQLException {
		return dao.getJjrZd();
	}
}
