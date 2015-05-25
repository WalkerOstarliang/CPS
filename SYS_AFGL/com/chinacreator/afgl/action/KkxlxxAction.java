package com.chinacreator.afgl.action;

import com.chinacreator.afgl.bean.KkxlxxBean;
import com.chinacreator.afgl.query.KkxlxxQuery;
import com.chinacreator.afgl.services.KkxlxxService;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.cps.action.CPSBaseAction;
import com.chinacreator.common.helper.ValidateHelper;

/**
 * 卡口巡逻信息
 */
public class KkxlxxAction extends CPSBaseAction{

	private static final long serialVersionUID = 7309901752134378580L;

	private KkxlxxService kkxlxxService;
	private KkxlxxBean kkxlxxBean;
	private KkxlxxQuery kkxlxxQuery;
	
	public KkxlxxAction(){
		kkxlxxService = new KkxlxxService();
		kkxlxxBean = new KkxlxxBean();
		kkxlxxQuery = new KkxlxxQuery();
	}
	
	/**
	 * 跳转到卡口巡逻信息列表
	 */
	public String toKkxlxxList(){
		initQueryBean(kkxlxxQuery);
		return "toKkxlxxList";
	}
	
	/**
	 * 查询卡口巡逻信息列表并写到页面
	 */
	public void kkxlxxList()  throws Exception{
		PageResultInfo<KkxlxxBean> kkxlxxResultInfo= kkxlxxService.kkxlxxList(getPageInfo(), kkxlxxQuery);
		responseWrite(kkxlxxResultInfo);
	}

	/**
	 * 跳转到新增卡口巡逻信息
	 * @return
	 */
	public String toAddKkxlxx() throws Exception{
		PageResultInfo<KkxlxxBean> kkxlxxResultInfo= kkxlxxService.kkxlxxList(getPageInfo(), kkxlxxQuery);
		if(ValidateHelper.isNotEmptyCollection(kkxlxxResultInfo.getDatas())){
			kkxlxxBean = kkxlxxResultInfo.getDatas().get(0);
		}
		kkxlxxBean.setCzbs(kkxlxxQuery.getCzbs());
		return "toAddKkxlxx";
	}
	
	/**
	 * 新增卡口巡逻信息
	 * @return
	 */
	public void addKkxlxx() throws Exception{
		kkxlxxService.addKkxlxx(kkxlxxBean);
	}
	
	/**
	 * 跳转到修改卡口巡逻信息
	 * @return
	 */
	public String toUpdateKkxlxxByKkxx() throws Exception{
		kkxlxxBean = kkxlxxService.getKkxlxxByXlbh(kkxlxxQuery);
		kkxlxxBean.setCzbs(kkxlxxQuery.getCzbs());
		return "toUpdateKkxlxxByKkxx";
	}
	
	/**
	 * 查看卡口巡逻信息
	 * @return
	 */
	public String viewKkxlxxByXlbh() throws Exception{
		kkxlxxBean = kkxlxxService.getKkxlxxByXlbh(kkxlxxQuery);
		return "viewKkxlxxByXlbh";
	}
	
	/**
	 * 得到卡口巡逻信息
	 * @return
	 */
	public void getKkxlxxByXlbh() throws Exception{
		kkxlxxBean = kkxlxxService.getKkxlxxByXlbh(kkxlxxQuery);
		responseWrite(kkxlxxBean);
	}
	
	/**
	 * 跳转到高级查询卡口巡逻列表
	 * @return
	 */
	public String toGjQueryKkxlxx(){
		initQueryBean(kkxlxxQuery);
		return "toGjQueryKkxlxx";
	}
	
	public KkxlxxBean getKkxlxxBean() {
		return kkxlxxBean;
	}

	public void setKkxlxxBean(KkxlxxBean kkxlxxBean) {
		this.kkxlxxBean = kkxlxxBean;
	}

	public KkxlxxQuery getKkxlxxQuery() {
		return kkxlxxQuery;
	}

	public void setKkxlxxQuery(KkxlxxQuery kkxlxxQuery) {
		this.kkxlxxQuery = kkxlxxQuery;
	}
}
