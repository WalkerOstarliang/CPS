package com.chinacreator.afgl.action;

import java.util.ArrayList;
import java.util.List;

import com.chinacreator.afgl.bean.KkxxBean;
import com.chinacreator.afgl.query.KkxxQuery;
import com.chinacreator.afgl.services.KkxxService;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.cps.action.CPSBaseAction;

/**
 * 卡口信息
 */
public class KkxxAction extends CPSBaseAction{

	private static final long serialVersionUID = 7309901752134378580L;

	private KkxxService kkxxService;
	private KkxxBean kkxxBean;
	private KkxxQuery kkxxQuery;
	private List<KkxxBean> kkxxList;
	
	public KkxxAction(){
		kkxxService = new KkxxService();
		kkxxBean = new KkxxBean();
		kkxxQuery = new KkxxQuery();
		kkxxList = new ArrayList<KkxxBean>();
	}
	
	/**
	 * 跳转到卡口信息列表
	 */
	public String toKkxxList(){
		initQueryBean(kkxxQuery);
		return "toKkxxList";
	}
	
	/**
	 * 查询卡口信息列表并写到页面
	 */
	public void kkxxList() throws Exception{
		PageResultInfo<KkxxBean> kkxxResultInfo= kkxxService.kkxxList(getPageInfo(), kkxxQuery);
		responseWrite(kkxxResultInfo);
	}
	
	/**
	 * 跳转到新增卡口信息页面
	 * @return
	 */
	public String toAddKkxx(){
		kkxxBean.setCzbs(kkxxQuery.getCzbs());
		return "toAddKkxx";
	}
	
	/**
	 * 提交卡口表单
	 * @return
	 */
	public void addKkxx() throws Exception{
		kkxxService.addKkxx(kkxxBean);
	}
	
	/**
	 * 跳转到修改卡口信息页面
	 * @return
	 */
	public String toUpdateKkxxByKkxx() throws Exception{
		kkxxBean = kkxxService.getKkxxByKkbh(kkxxQuery);
		return "toUpdateKkxxByKkxx";
	}
	
	/**
	 * 跳转到删除卡口信息页面
	 * @return
	 */
	public String toDeleteKkxxByKkxx() throws Exception{
		kkxxBean = kkxxService.getKkxxByKkbh(kkxxQuery);
		return "toDeleteKkxxByKkxx";
	}
	
	/**
	 * 跳转到批量删除卡口信息页面
	 * @return
	 */
	public String toBatchDeleteKkxxByKkbhs() throws Exception{
		kkxxList = kkxxService.getKkxxListByKkbhs(kkxxQuery);
		return "toBatchDeleteKkxxByKkbhs";
	}
	
	/**
	 * 批量删除卡口信息
	 * @return
	 */
	public void batchDeleteKkxxByKkbhs() throws Exception{
		kkxxService.batchDeleteKkxxByKkbhs(kkxxList, kkxxBean);
	}
	
	/**
	 * 查看卡口信息
	 * @return
	 */
	public String viewKkxxByKkbh() throws Exception{
		kkxxBean = kkxxService.getKkxxByKkbh(kkxxQuery);
		return "viewKkxxByKkbh";
	}
	
	/**
	 * 得到卡口信息
	 * @return
	 */
	public void getKkxxByKkbh() throws Exception{
		kkxxBean = kkxxService.getKkxxByKkbh(kkxxQuery);
		responseWrite(kkxxBean);
	}

	/**
	 * 跳转到选择卡口信息列表
	 * @return
	 */
	public String toSelectKkxx(){
		initQueryBean(kkxxQuery);
		return "toSelectKkxx";
	}
	
	/**
	 * 跳转到高级查询卡口信息列表
	 * @return
	 */
	public String toGjQueryKkxx(){
		initQueryBean(kkxxQuery);
		return "toGjQueryKkxx";
	}
	
	public KkxxBean getKkxxBean() {
		return kkxxBean;
	}

	public void setKkxxBean(KkxxBean kkxxBean) {
		this.kkxxBean = kkxxBean;
	}

	public KkxxQuery getKkxxQuery() {
		return kkxxQuery;
	}

	public void setKkxxQuery(KkxxQuery kkxxQuery) {
		this.kkxxQuery = kkxxQuery;
	}

	public List<KkxxBean> getKkxxList() {
		return kkxxList;
	}

	public void setKkxxList(List<KkxxBean> kkxxList) {
		this.kkxxList = kkxxList;
	}
	
}
