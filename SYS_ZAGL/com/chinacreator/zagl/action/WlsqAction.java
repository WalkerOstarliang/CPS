package com.chinacreator.zagl.action;

import com.chinacreator.common.bean.LoginInfo;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.cps.action.CPSBaseAction;
import com.chinacreator.common.helper.ActionContextHelper;
import com.chinacreator.common.helper.DateTimeHelper;
import com.chinacreator.zagl.bean.WlsqBean;
import com.chinacreator.zagl.query.WlsqQuery;
import com.chinacreator.zagl.services.WlsqService;
import com.chinacreator.zagl.services.impl.WlsqServiceImpl;

/**
 * 网络社区Action
 */
public class WlsqAction extends CPSBaseAction{
	private static final long serialVersionUID = -5075764513186801768L;
	
	private WlsqBean wlsq;
	private WlsqService service;
	private WlsqQuery query;
	private LoginInfo loginInfo;
	
	public WlsqAction(){
		wlsq = new WlsqBean();
		service = new WlsqServiceImpl();
		query = new WlsqQuery();
		loginInfo = ActionContextHelper.getLoginInfo();
	}
	
	/**
	 * 跳转到网络社区页面
	 * @return
	 */
	public String toWlsq() throws Exception{
		String operType = wlsq.getOpertype();
		//操作类型为新增
		if(CommonConstant.OPERTYPE_ADD.equals(operType)){
			wlsq.setDjrxm(loginInfo.getRealname());
			wlsq.setDjrjh(loginInfo.getUsername());
			wlsq.setDjdwdm(loginInfo.getOrgcode());
			wlsq.setDjdwmc(loginInfo.getOrgname());
			wlsq.setDjsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss"));
			
			wlsq.setCzbs(CommonConstant.CZBZ_ADD);
			wlsq.setCzrxm(loginInfo.getRealname());
			wlsq.setCzdwdm(loginInfo.getOrgcode());
			wlsq.setCzdwmc(loginInfo.getOrgname());
			wlsq.setCzsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss"));
		}else{
			wlsq = service.queryWlsqByWlsqbh(wlsq.getWlsqbh());
			wlsq.setOpertype(operType);
			
			//操作类型为修改
			if(CommonConstant.OPERTYPE_UPDATE.equals(operType)){
				wlsq.setCzbs(CommonConstant.CZBZ_UPDATE);
				wlsq.setCzrxm(loginInfo.getRealname());
				wlsq.setCzdwdm(loginInfo.getOrgcode());
				wlsq.setCzdwmc(loginInfo.getOrgname());
				wlsq.setCzsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss"));
			}
		}
		return "toWlsq";
	}
	
	/**
	 * 跳转到网络社区列表页面
	 * @return
	 */
	public String toWlsqList(){
		LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
		query.setCitygajgjgdm(loginInfo.getCitygajgdm());
		query.setCountrygajgjgdm(loginInfo.getCountrygajgdm());
		query.setPcsdm(loginInfo.getPcsdm());
		return "toWlsqList";
	}
	
	/**
	 * 保存网络社区
	 * @throws Exception
	 */
	public void saveWlsq() throws Exception{
		responseWrite(service.saveWlsq(wlsq));
	}
	
	/**
	 * 删除网络社区
	 * @throws Exception
	 */
	public void deleteWlsq() throws Exception{
		String tip = "";
		if(service.deleteWlsqByWlsqbh(wlsq.getWlsqbh())){
			tip = "操作成功!";
		}else{
			tip = "操作失败!";
		}
		responseWrite(tip);
	}
	
	/**
	 * 分页查询网络社区
	 * @throws Exception
	 */
	public void queryWlsqByPageResultInfo() throws Exception{
		responseWrite(service.queryWlsqByPageResultInfo(getPageInfo(), query));
	}

	public WlsqBean getWlsq() {
		return wlsq;
	}

	public void setWlsq(WlsqBean wlsq) {
		this.wlsq = wlsq;
	}

	public WlsqQuery getQuery() {
		return query;
	}

	public void setQuery(WlsqQuery query) {
		this.query = query;
	}
	
}
