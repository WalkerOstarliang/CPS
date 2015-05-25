package com.chinacreator.xtgl.action;

import java.util.ArrayList;
import java.util.List;

import com.chinacreator.common.action.PaginationAction;
import com.chinacreator.common.bean.LoginInfo;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.helper.ActionContextHelper;
import com.chinacreator.common.helper.DateTimeHelper;
import com.chinacreator.xtgl.bean.DwjcpzBean;
import com.chinacreator.xtgl.bean.JjrzdBean;
import com.chinacreator.xtgl.query.DwjcpzQueryBean;
import com.chinacreator.xtgl.service.DwjcpzService;
import com.chinacreator.xtgl.service.impl.DwjcpzServiceImpl;

/**
 * 单位检查参数配置管理
 */
public class DwjcpzAction extends PaginationAction{
	
	private static final long serialVersionUID = 3713529017198616418L;
	
	private DwjcpzBean dwjcpz;
	private DwjcpzService dwjcpzService;
	
	private DwjcpzQueryBean dwjcpzQuery;
	
	/**
	 * 特殊日期
	 */
	private String[] tsrq;
	
	private List<JjrzdBean> jjrZd;
	
	public DwjcpzAction(){
		super();
		dwjcpz = new DwjcpzBean();
		jjrZd = new ArrayList<JjrzdBean>();
		dwjcpzService = new DwjcpzServiceImpl();
		dwjcpzQuery = new DwjcpzQueryBean();
	}
	
	/**
	 * 保存单位检查配置
	 * @throws Exception
	 */
	public void saveDwjcpz() throws Exception{
		responseWrite(dwjcpzService.saveDwjcpz(dwjcpz));
	}
	
	/**
	 * 跳转到单位检查配置列表
	 * @return
	 */
	public String toDwjcpzList(){
		return "toDwjcpzList";
	}
	
	/**
	 * 跳转到单位检查配置
	 * @return
	 * @throws Exception
	 */
	public String toDwjcpz() throws Exception{
		LoginInfo login = ActionContextHelper.getLoginInfo();
		if(CommonConstant.OPERTYPE_ADD.equals(dwjcpz.getOpertype())){
			dwjcpz.setDjrxm(login.getRealname());
			dwjcpz.setDjdwmc(login.getOrgname());
			dwjcpz.setDjdwdm(login.getOrgcode());
			dwjcpz.setDjrq(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss"));
			
			dwjcpz.setCzbs(CommonConstant.CZBZ_ADD);
			dwjcpz.setCzrxm(login.getRealname());
			dwjcpz.setCzrjh(login.getUsername());
			dwjcpz.setCzdwmc(login.getOrgname());
			dwjcpz.setCzdwdm(login.getOrgcode());
			dwjcpz.setCzsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss"));
		}else{
			String opertype = dwjcpz.getOpertype();
			dwjcpz = dwjcpzService.queryDwjcpzById(dwjcpz.getId());
			dwjcpz.setOpertype(opertype);
			if(CommonConstant.OPERTYPE_UPDATE.equals(opertype)){
				dwjcpz.setCzbs(CommonConstant.CZBZ_ADD);
				dwjcpz.setCzrxm(login.getRealname());
				dwjcpz.setCzrjh(login.getUsername());
				dwjcpz.setCzdwmc(login.getOrgname());
				dwjcpz.setCzdwdm(login.getOrgcode());
				dwjcpz.setCzsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss"));
			}
		}
		return "toDwjcpz";
	}
	
	/**
	 * 查询单位检查配置列表
	 */
	public void queryDwjcpzList() throws Exception{
		responseWrite(dwjcpzService.queryDwjcpzPageResultInfo(getPageInfo(),dwjcpzQuery ));
	}
	
	/**
	 * 删除单位检查配置
	 * @throws Exception
	 */
	public void deleteDwjcpz() throws Exception{
		dwjcpzService.deleteDwjcpz(dwjcpz.getId());
	}
	
	
	
	public DwjcpzBean getDwjcpz() {
		return dwjcpz;
	}

	public void setDwjcpz(DwjcpzBean dwjcpz) {
		this.dwjcpz = dwjcpz;
	}

	public List<JjrzdBean> getJjrZd() throws Exception{
		jjrZd = dwjcpzService.getJjrZd();
		return jjrZd;
	}

	public void setJjrZd(List<JjrzdBean> jjrZd) {
		this.jjrZd = jjrZd;
	}
	
	public String[] getTsrq() {
		return tsrq;
	}

	public void setTsrq(String[] tsrq) {
		this.tsrq = tsrq;
	}

	public DwjcpzQueryBean getDwjcpzQuery() {
		return dwjcpzQuery;
	}

	public void setDwjcpzQuery(DwjcpzQueryBean dwjcpzQuery) {
		this.dwjcpzQuery = dwjcpzQuery;
	}
}
