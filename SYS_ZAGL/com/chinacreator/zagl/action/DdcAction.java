package com.chinacreator.zagl.action;

import java.util.ArrayList;
import java.util.List;

import com.chinacreator.common.bean.LoginInfo;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.cps.action.CPSBaseAction;
import com.chinacreator.common.helper.ActionContextHelper;
import com.chinacreator.common.helper.DateTimeHelper;
import com.chinacreator.zagl.bean.DdcBean;
import com.chinacreator.zagl.bean.OperateBean;
import com.chinacreator.zagl.query.DdcQueryBean;
import com.chinacreator.zagl.services.DdcService;
import com.chinacreator.zagl.services.impl.DdcServiceimpl;

/**
 * 电动车Action
 */
public class DdcAction extends CPSBaseAction {
	private static final long serialVersionUID = 5437729682307173367L;
	
	/**
	 * 电动车查询条件
	 */
	private DdcQueryBean query;
	
	/**
	 * 电动车信息
	 */
	private DdcBean ddc;
	
	private String v_ddcid;
	
	private List<DdcBean> ddcList;
	
	private DdcService service;
 	
	public DdcAction(){
		super();
		query = new DdcQueryBean();
		ddc = new DdcBean();
		ddcList = new ArrayList<DdcBean>();
		service = new DdcServiceimpl();
	}

	/**
	 * 跳转到电动车列表页面
	 * @return
	 */
	public String toListPage(){
		initQueryBean(query);
		return "toListPage";
	}
	
	/**
	 * 跳转到电动车采集页面
	 * @return
	 */
	public String toDdcCjPage() throws Exception{
		if(CommonConstant.OPERTYPE_ADD.equals(operType)){
			ddc = new DdcBean();
			initDjxx(ddc);
		}else{
			ddc = service.queryDdcInfoById(ddc.getDdcid());
		}
		return "toDdcPage";
	}
	
	/**
	 * 保存电动车
	 */
	public void saveDdc(){
		responseWrite(service.saveDdc(ddc));
	}
	
	/**
	 * 查询电动车信息
	 */
	public void queryDdcInfo(){
		ddc = service.queryDdcInfoById(ddc.getDdcid());
	}
	
	/**
	 * 查询电动车列表
	 */
	public void queryDdcList(){
		responseWrite(service.queryDdcList(query, getPageInfo()));
	}
	
	/**
	 * 导出Excel
	 * @return
	 */
	public String dowloadExcel(){
		ddcList = service.dowloadExcel(query);
		return "dowloadExcel";
	}
	
	/**
	 * 能够选择某几条记录导出
	 * @return
	 */
	public String downloadDdccjxzExcel(){
		ddcList = service.downloadDdccjxzExcel(v_ddcid);
		return "dowloadExcel";
	}
	
	public DdcQueryBean getQuery() {
		return query;
	}

	public void setQuery(DdcQueryBean query) {
		this.query = query;
	}

	public DdcBean getDdc() {
		return ddc;
	}

	public void setDdc(DdcBean ddc) {
		this.ddc = ddc;
	}
	
	public List<DdcBean> getDdcList() {
		return ddcList;
	}

	public void setDdcList(List<DdcBean> ddcList) {
		this.ddcList = ddcList;
	}

	/**
	 * 初始化登记信息
	 * @param bean
	 */
	private void initDjxx(OperateBean bean) throws Exception {
		if(bean != null){
			LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
			bean.setDjrxm(loginInfo.getRealname());
			bean.setDjdwmc(loginInfo.getOrgname());
			bean.setDjdwdm(loginInfo.getOrgcode());
			bean.setDjsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss"));
			bean.setDjrjh(loginInfo.getUsername());
			bean.setDjrsfzh(loginInfo.getSfzh());
		}else{
			throw new Exception("对象为空，无法初始化登记信息!");
		}
	}

	public String getV_ddcid() {
		return v_ddcid;
	}

	public void setV_ddcid(String v_ddcid) {
		this.v_ddcid = v_ddcid;
	}
}
