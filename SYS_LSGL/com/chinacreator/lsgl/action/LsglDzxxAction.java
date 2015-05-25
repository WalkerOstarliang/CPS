package com.chinacreator.lsgl.action;

import com.chinacreator.common.bean.LoginInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.cps.action.CPSBaseAction;
import com.chinacreator.common.cps.bean.DzxxBean;
import com.chinacreator.common.helper.ActionContextHelper;
import com.chinacreator.common.helper.DateTimeHelper;
import com.chinacreator.lsgl.query.DzQueryBean;
import com.chinacreator.lsgl.services.LsglDzService;
import com.chinacreator.lsgl.services.impl.LsglDzServiceImpl;

public class LsglDzxxAction extends CPSBaseAction{

	private static final long serialVersionUID = 1644942214693665885L;
	
	private DzxxBean dzxx;
	private DzQueryBean dzQuery;
	private LsglDzService service;
	
	private String operType ;
	
	public LsglDzxxAction(){
		super();
		dzxx = new DzxxBean();
		dzQuery = new DzQueryBean();
		service = new LsglDzServiceImpl();
	}
	
	/**
	 * 保存地址信息
	 * @throws Exception
	 */
	public void saveDzxx(){
		try {
			service.saveDzxx(dzxx);
			responseWrite(true);
		} catch (Exception e) {
			responseWrite(false);
			e.printStackTrace();
		}
	}
	
	/**
	 * 跳转到地址页面
	 * @return
	 * @throws Exception
	 */
	public String toDzxxDetail() throws Exception{
		LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
		if(operType.equals(CommonConstant.OPERTYPE_ADD)){
			dzxx.setDjrdwdm(loginInfo.getOrgcode());
			dzxx.setDjrdwmc(loginInfo.getOrgname());
			dzxx.setDjrxm(loginInfo.getRealname());
			dzxx.setDjsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd hh24:mm:ss"));
			dzxx.setSjxzqh(loginInfo.getCitydm());
			dzxx.setSsxqdm(loginInfo.getCountrydm());
		}else{
			dzxx = service.queryDzxxByDzid(dzxx.getDzid());
		}
		return "toDzxxDetail";
	}
	
	public String toDzxxList(){
		initQueryBean();
		return "toDzxxList";
	}
	
	/**
	 * 分页查询地址信息
	 * @throws Exception
	 */
	public void queryDzWithPageInfoRseult() throws Exception{
		PageResultInfo<DzxxBean> list=service.queryDzxxWithPageResultInfo(dzQuery, getPageInfo());
		responseWrite(list);
	}
	
	public void initQueryBean()
	{		
		LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
		dzQuery.setCitygajgjgdm(loginInfo.getCitygajgdm());
		dzQuery.setCountrygajgjgdm(loginInfo.getCountrygajgdm());
		dzQuery.setPcsdm(loginInfo.getPcsdm());
		dzQuery.setJdxzdm(loginInfo.getJdxzdm());
	}

	public String getOperType() {
		return operType;
	}

	public void setOperType(String operType) {
		this.operType = operType;
	}

	public DzxxBean getDzxx() {
		return dzxx;
	}

	public void setDzxx(DzxxBean dzxx) {
		this.dzxx = dzxx;
	}

	public DzQueryBean getDzQuery() {
		return dzQuery;
	}

	public void setDzQuery(DzQueryBean dzQuery) {
		this.dzQuery = dzQuery;
	}

}
