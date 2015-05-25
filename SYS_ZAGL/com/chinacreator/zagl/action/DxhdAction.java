package com.chinacreator.zagl.action;

import com.chinacreator.common.bean.LoginInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.cps.action.CPSBaseAction;
import com.chinacreator.common.helper.ActionContextHelper;
import com.chinacreator.common.helper.DateTimeHelper;
import com.chinacreator.zagl.bean.DxhdBean;
import com.chinacreator.zagl.query.DxhdQuery;
import com.chinacreator.zagl.services.DxhdService;

/**
 * 大型活动Action
 */
public class DxhdAction extends CPSBaseAction{
	private static final long serialVersionUID = -5075764513186801768L;
	
	private DxhdService dxhdService = new DxhdService();
	private DxhdBean dxhdBean = new DxhdBean();
	private DxhdQuery dxhdQuery = new DxhdQuery();
	
	/**
	 * 大型活动列表
	 */
	public String toDxhdList(){
		LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
		dxhdQuery.setCitygajgjgdm(loginInfo.getCitygajgdm());
		dxhdQuery.setCountrygajgjgdm(loginInfo.getCountrygajgdm());
		dxhdQuery.setPcsdm(loginInfo.getPcsdm());
		return "toDxhdList";
	}
	
	public void dxhdList() throws Exception{
		PageResultInfo<DxhdBean> resultInfo = dxhdService.dxhdList(dxhdQuery, getPageInfo());
		responseWrite(resultInfo);
	}
	
	/**
	 * 跳转到新增页面
	 */
	public String toAddDxhd()
	{
		dxhdBean.setCzbs(CommonConstant.CZBZ_ADD);
		LoginInfo logininfo = ActionContextHelper.getLoginInfo();
		dxhdBean.setDjrxm(logininfo.getRealname());
		dxhdBean.setDjdwdm(logininfo.getOrgcode());
		dxhdBean.setDjdwmc(logininfo.getOrgname());
		dxhdBean.setDjrq(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss"));
		
		dxhdBean.setCzrxm(logininfo.getRealname());
		dxhdBean.setCzdwmc(logininfo.getOrgname());
		dxhdBean.setCzdwdm(logininfo.getOrgcode());
		dxhdBean.setCzsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss"));
		return "toAddDxhd";
	}
	
	/**
	 * 跳转到修改页面
	 */
	public String toUpdateDxhdByHdbh() throws Exception{
		dxhdBean = dxhdService.getDxhdByHdbh(dxhdBean.getHdbh());
		dxhdBean.setCzbs(CommonConstant.CZBZ_UPDATE);
		LoginInfo logininfo = ActionContextHelper.getLoginInfo();
		dxhdBean.setCzrxm(logininfo.getRealname());
		dxhdBean.setCzdwmc(logininfo.getOrgname());
		dxhdBean.setCzdwdm(logininfo.getOrgcode());
		dxhdBean.setCzsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss"));
		return "toUpdateDxhdByHdbh";
	}
	
	/**
	 * 新增大型活动
	 */
	public void addDxhd() 
	{
		try
		{
			dxhdBean = dxhdService.addDxhd(dxhdBean);
			responseWrite(dxhdBean);
		}
		catch(Exception e)
		{
			e.printStackTrace();
			responseWrite(null);
		}
	}
	
	/**
	 * 删除大型活动
	 * @return
	 */
	public void deleteDxhdByHdbh() throws Exception{
		dxhdService.deleteDxhdByHdbh(dxhdBean);
	}
	
	/**
	 * 查看详情
	 */
	public String toViewDxhdByHdbh() throws Exception{
		dxhdBean = dxhdService.getDxhdByHdbh(dxhdBean.getHdbh());
		dxhdBean.setCzbs(CommonConstant.OPERTYPE_DETAIL);
		return "toViewDxhdByHdbh";
	} 
	
	/**
	 * 批量删除大型活动
	 * @return
	 */
	public void batchDeleteDxhdByHdbh() throws Exception{
		dxhdService.batchDeleteDxhdByHdbh(dxhdBean);
	}

	public DxhdBean getDxhdBean() {
		return dxhdBean;
	}

	public void setDxhdBean(DxhdBean dxhdBean) {
		this.dxhdBean = dxhdBean;
	}

	public DxhdQuery getDxhdQuery() {
		return dxhdQuery;
	}

	public void setDxhdQuery(DxhdQuery dxhdQuery) {
		this.dxhdQuery = dxhdQuery;
	}
}
