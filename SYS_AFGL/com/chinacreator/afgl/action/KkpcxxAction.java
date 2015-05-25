package com.chinacreator.afgl.action;

import com.chinacreator.afgl.bean.ZapcxxBean;
import com.chinacreator.afgl.query.KkpcxxQuery;
import com.chinacreator.afgl.services.KkpcxxService;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.cps.action.CPSBaseAction;
import com.chinacreator.common.helper.ValidateHelper;

/**
 * 卡口盘查信息
 */
public class KkpcxxAction extends CPSBaseAction{

	private static final long serialVersionUID = 7309901752134378580L;

	private KkpcxxService kkpcxxService;
	private ZapcxxBean kkpcxxBean;
	private KkpcxxQuery kkpcxxQuery;
	
	public KkpcxxAction(){
		kkpcxxService = new KkpcxxService();
		kkpcxxBean = new ZapcxxBean();
		kkpcxxQuery = new KkpcxxQuery();
	}
	
	/**
	 * 跳转到卡口盘查信息列表
	 */
	public String toKkpcxxList(){
		kkpcxxQuery.setPclb("1");
		initQueryBean(kkpcxxQuery);
		return "toKkpcxxList";
	}
	
	/**
	 * 跳转到非卡口盘查信息列表
	 */
	public String toNotkkpcxxList(){
		kkpcxxQuery.setPclb("0");
		initQueryBean(kkpcxxQuery);
		return "toNotkkpcxxList";
	}
	
	/**
	 * 查询卡口盘查信息列表并写到页面
	 */
	public void kkpcxxList()  throws Exception{
		PageResultInfo<ZapcxxBean> kkpcxxResultInfo= kkpcxxService.kkpcxxList(getPageInfo(), kkpcxxQuery);
		responseWrite(kkpcxxResultInfo);
	}
	
	/**
	 * 跳转到登记卡口盘查信息
	 */
	public String toAddKkpcxx() throws Exception{
		PageResultInfo<ZapcxxBean> kkpcxxResultInfo= kkpcxxService.kkpcxxList(getPageInfo(), kkpcxxQuery);
		if(ValidateHelper.isNotEmptyCollection(kkpcxxResultInfo.getDatas())){
			kkpcxxBean = kkpcxxResultInfo.getDatas().get(0);
		}
		kkpcxxBean.setCzbs(kkpcxxQuery.getCzbs());
		return "toAddKkpcxx";
	}
	
	/**
	 * 新增卡口盘查信息
	 */
	public void addKkpcxx() throws Exception{
		kkpcxxService.addKkpcxx(kkpcxxBean);
	}
	
	/**
	 * 跳转到修改卡口盘查信息
	 */
	public String toUpdateKkpcxxByPcbh() throws Exception{
		kkpcxxBean = kkpcxxService.getKkpcxxByPcbh(kkpcxxQuery);
		kkpcxxBean.setCzbs(kkpcxxQuery.getCzbs());
		return "toUpdateKkpcxxByPcbh";
	}
	
	/**
	 * 查看卡口盘查信息
	 */
	public String viewKkpcxxByPcbh() throws Exception{
		kkpcxxBean = kkpcxxService.getKkpcxxByPcbh(kkpcxxQuery);
		return "viewKkpcxxByPcbh";
	}
	
	/**
	 * 跳转到高级查询卡口盘查信息
	 */
	public String toGjQueryKkpcxx() throws Exception{
		initQueryBean(kkpcxxQuery);
		return "toGjQueryKkpcxx";
	}
	
	/**
	 * 跳转到高级查询非卡口盘查信息
	 */
	public String toNotGjQueryKkpcxx() throws Exception{
		initQueryBean(kkpcxxQuery);
		return "toNotGjQueryKkpcxx";
	}
	
	/**
	 * 在卡口列表中点击查看卡口盘查信息
	 * @return
	 */
	public String toPcxxListByKkbh(){
		initQueryBean(kkpcxxQuery);
		return "toPcxxListByKkbh";
	}
	
	/**
	 * 得到卡口盘查信息
	 * @return
	 */
	public void getKkpcxxByPcbh() throws Exception{
		kkpcxxBean = kkpcxxService.getKkpcxxByPcbh(kkpcxxQuery);
		responseWrite(kkpcxxBean);
	}
	
	public ZapcxxBean getKkpcxxBean() {
		return kkpcxxBean;
	}

	public void setKkpcxxBean(ZapcxxBean kkpcxxBean) {
		this.kkpcxxBean = kkpcxxBean;
	}

	public KkpcxxQuery getKkpcxxQuery() {
		return kkpcxxQuery;
	}

	public void setKkpcxxQuery(KkpcxxQuery kkpcxxQuery) {
		this.kkpcxxQuery = kkpcxxQuery;
	}
}
