package com.chinacreator.xtgl.action;

import java.util.HashMap;
import java.util.Map;

import com.chinacreator.common.cps.action.CPSBaseAction;
import com.chinacreator.xtgl.bean.KfpzBean;
import com.chinacreator.xtgl.bean.KhkpParamBean;
import com.chinacreator.xtgl.service.KhkpKfxService;
import com.chinacreator.xtgl.service.impl.KhkpKfxServiceImpl;
@SuppressWarnings("unchecked")
public class KhkpKfxAction extends CPSBaseAction{

	private static final long serialVersionUID = 1L;
	
	
	private KhkpKfxService service;
	private KhkpParamBean param;
	private KfpzBean pz;
	
	private Map map;
	//分数
	private String fs;
	
	public KhkpKfxAction(){
		service = new KhkpKfxServiceImpl();
		param = new KhkpParamBean();
		pz = new KfpzBean();
		map = new HashMap();
	}
	
	/**
	 * 生成扣分项详情
	 */
	public String createMs(){
		map = service.getResultMap(param);
		return "createMs";
	}


	public KhkpKfxService getService() {
		return service;
	}

	public void setService(KhkpKfxService service) {
		this.service = service;
	}

	public KhkpParamBean getParam() {
		return param;
	}

	public void setParam(KhkpParamBean param) {
		this.param = param;
	}

	public KfpzBean getPz() {
		return pz;
	}

	public void setPz(KfpzBean pz) {
		this.pz = pz;
	}

	public Map getMap() {
		return map;
	}

	public void setMap(Map map) {
		this.map = map;
	}

	public String getFs() {
		return fs;
	}

	public void setFs(String fs) {
		this.fs = fs;
	}
}
