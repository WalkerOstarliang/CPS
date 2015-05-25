package com.chinacreator.afgl.action;

import com.chinacreator.afgl.bean.KywpxxBean;
import com.chinacreator.afgl.query.KywpxxQuery;
import com.chinacreator.afgl.services.KywpxxService;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.cps.action.CPSBaseAction;

/**
 * 可疑物品信息
 */
public class KywpxxAction extends CPSBaseAction{

	private static final long serialVersionUID = 7309901752134378580L;

	private KywpxxService kywpxxService;
	private KywpxxBean kywpxxBean;
	private KywpxxQuery kywpxxQuery;
	
	public KywpxxAction(){
		kywpxxService = new KywpxxService();
		kywpxxBean = new KywpxxBean();
		kywpxxQuery = new KywpxxQuery();
	}
	
	/**
	 * 跳转到可疑物品信息列表
	 */
	public String toKywpxxList(){
		initQueryBean(kywpxxQuery);
		return "toKywpxxList";
	}
	
	/**
	 * 从卡口盘查到可疑物品信息列表
	 */
	public String toKywpxxListByPcbh(){
		initQueryBean(kywpxxQuery);
		return "toKywpxxListByPcbh";
	}
	
	/**
	 * 跳转到可疑物品高级查询
	 */
	public String toGjQueryKywpxx(){
		initQueryBean(kywpxxQuery);
		return "toGjQueryKywpxx";
	}
	
	/**
	 * 查询可疑物品信息列表并写到页面
	 */
	public void kywpxxList()  throws Exception{
		PageResultInfo<KywpxxBean> kywpxxResultInfo= kywpxxService.kywpxxList(getPageInfo(), kywpxxQuery);
		responseWrite(kywpxxResultInfo);
	}
	
	/**
	 * 跳转到新增可疑物品
	 */
	public String toAddKywpxx(){
		kywpxxBean.setCzbs(kywpxxQuery.getCzbs());
		kywpxxBean.setPcbh(kywpxxQuery.getPcbh());
		return "toAddKywpxx";
	}
	
	/**
	 * 新增可疑物品
	 */
	public void addKywpxx() throws Exception{
		kywpxxService.addKywpxx(kywpxxBean);
	}
	
	/**
	 * 跳转到修改可疑物品
	 */
	public String toUpdateKywpxxByKywpbh() throws Exception{
		kywpxxBean = kywpxxService.getKywpxxByKywpbh(kywpxxQuery);
		kywpxxBean.setCzbs(kywpxxQuery.getCzbs());
		return "toUpdateKywpxxByKywpbh";
	}
	
	/**
	 * 查看可疑物品
	 */
	public String viewKywpxxByKywpbh() throws Exception{
		kywpxxBean = kywpxxService.getKywpxxByKywpbh(kywpxxQuery);
		return "viewKywpxxByKywpbh";
	}
	
	public void getKywpxxByPcbh() throws Exception{
		PageResultInfo<KywpxxBean> kywpxxResultInfo= kywpxxService.kywpxxList(getPageInfo(), kywpxxQuery);
		responseWrite(kywpxxResultInfo.getDatas());
	}

	public KywpxxBean getKywpxxBean() {
		return kywpxxBean;
	}

	public void setKywpxxBean(KywpxxBean kywpxxBean) {
		this.kywpxxBean = kywpxxBean;
	}

	public KywpxxQuery getKywpxxQuery() {
		return kywpxxQuery;
	}

	public void setKywpxxQuery(KywpxxQuery kywpxxQuery) {
		this.kywpxxQuery = kywpxxQuery;
	}

}
