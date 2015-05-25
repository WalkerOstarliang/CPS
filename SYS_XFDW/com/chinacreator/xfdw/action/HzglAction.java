package com.chinacreator.xfdw.action;

import java.util.List;

import javax.transaction.RollbackException;

import com.chinacreator.common.bean.LoginInfo;
import com.chinacreator.common.bean.SystemDictionaryBean;
import com.chinacreator.common.cps.action.CPSBaseAction;
import com.chinacreator.common.helper.ActionContextHelper;
import com.chinacreator.common.helper.DictionaryCacheHellper;
import com.chinacreator.xfdw.bean.HzldBean;
import com.chinacreator.xfdw.bean.HzpfBean;
import com.chinacreator.xfdw.query.HzldQuery;
import com.chinacreator.xfdw.service.HzglService;
import com.frameworkset.orm.transaction.TransactionManager;

/**
 * @ClassName: HzglAction
 * @author 禹文超
 * @mail wenchao.yu@163.com
 * @date Mar 19, 20153:36:15 PM
 * @Description: TODO 火灾管理(派发-签收-退回)Action
 */

public class HzglAction extends CPSBaseAction {

	private static final long serialVersionUID = 1L;

	private static final String RETURN_OK = "1";

	@SuppressWarnings("unused")
	private static final String RETURN_ERROR = "0";

	private HzglService hzglService;
	private HzldBean hzldBean;
	private HzldQuery queryBean;
	List<SystemDictionaryBean> sqList;

	public HzglAction() {
		super();
		hzglService = new HzglService();

		if (hzldBean == null) {
			hzldBean = new HzldBean();
		}

		if (queryBean == null) {
			queryBean = new HzldQuery();
		}
	}

	/**
	 * 跳转火灾落地管理页面
	 * 
	 * @return
	 */
	public String toHzldListPage() {

		return "toHzldListPage";
	}

	/**
	 * 跳转火灾派发页面
	 * 
	 * @return
	 */
	public String toHzpfPage() {
		return "toHzpfPage";
	}

	/**
	 * 跳转火灾派发页面
	 * 
	 * @return
	 */
	public String toHzThPage() {
		return "toHzThPage";
	}

	/**
	 * 跳转火灾信息详情页面
	 * 
	 * @return
	 */
	public String toHzldDeailPage() {
		hzldBean = hzglService.queryByHzxhInfo(queryBean);
		this.getRequest().setAttribute("czType", this.getRequest().getParameter("czType"));
		return "toHzldDeailPage";
	}

	/**
	 * 跳转火灾签收页面
	 * 
	 * @return
	 */
	public String toHzldPfPage() {
		LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
		List<SystemDictionaryBean> list = DictionaryCacheHellper
				.getSqcByJwsdm(loginInfo.getOrgcode());
		this.getRequest().setAttribute("sqList", list);
		return "toHzldPfPage";
	}

	/**
	 * 火灾落地数据查询
	 */
	public void queryHzldList() {
		LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
		queryBean.setSsdwdm(loginInfo.getOrgcode());
		responseWrite(hzglService.queryHzldList(queryBean, getPageInfo()));
	}
	
	/**
	 * 根据火灾序号查看流转轨迹
	 */
	public void queryByHzpfInfo(){
		responseWrite(hzglService.queryByHzpfInfo(queryBean, getPageInfo()));
	}
	
	/**
	 * 派发
	 */
	public void pfHzInfo() {
		hzldBean.setZt(HzldBean.HZLD_DCL);
		TransactionManager tm = new TransactionManager();
		try {
			tm.begin();
			hzglService.updateHzInfo(hzldBean, getHzpfBean(hzldBean.getHzxh(),
					hzldBean.getSsdwdm(), HzpfBean.HZPF_PF));
			this.responseWrite(RETURN_OK);
			tm.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * 签收
	 */
	public void qsHzInfo() {
		try {
			hzldBean.setZt(HzldBean.HZLD_YQS);

			LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
			hzglService.updateHzInfo(hzldBean, getHzpfBean(hzldBean.getHzxh(),
					loginInfo.getOrgcode(), HzpfBean.HZPF_QS));
			this.responseWrite(RETURN_OK);
		} catch (RollbackException e) {
			e.printStackTrace();
		}
	}

	/**
	 * 退回
	 */
	public void thHzInfo() {
		try {
			hzldBean.setZt(HzldBean.HZLD_WCL);

			hzldBean.setSsdwdm(hzglService.queryThDwdm(hzldBean));
			HzpfBean hzpfBean = getHzpfBean(hzldBean.getHzxh(), hzldBean
					.getSsdwdm(), HzpfBean.HZPF_TH);
			hzglService.updateHzInfo(hzldBean, hzpfBean);
			this.responseWrite(RETURN_OK);
		} catch (Exception e) {

			e.printStackTrace();
		}
	}

	/**
	 * 派发参数设置
	 * 
	 * @param hzxh
	 * @param pfdw
	 * @return
	 */
	private HzpfBean getHzpfBean(String hzxh, String pfdw, String clzt) {
		String bzsm = this.getRequest().getParameter("bzsm");
		LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
		HzpfBean bean = new HzpfBean();
		bean.setHzxh(hzxh);
		bean.setCzrjh(loginInfo.getUsername());
		bean.setCzrsfzh(loginInfo.getSfzh());
		bean.setCzrdwdm(loginInfo.getOrgcode());
		bean.setCldwdm(pfdw);
		bean.setCzip(this.getIpAddress());
		bean.setClzt(clzt);
		bean.setBzsm(bzsm);
		return bean;
	}

	public HzldBean getHzldBean() {
		return hzldBean;
	}

	public void setHzldBean(HzldBean hzldBean) {
		this.hzldBean = hzldBean;
	}

	public HzglService getHzglService() {
		return hzglService;
	}

	public void setHzglService(HzglService hzglService) {
		this.hzglService = hzglService;
	}

	public HzldQuery getQueryBean() {
		return queryBean;
	}

	public void setQueryBean(HzldQuery queryBean) {
		this.queryBean = queryBean;
	}

	public List<SystemDictionaryBean> getSqList() {
		return sqList;
	}

	public void setSqList(List<SystemDictionaryBean> sqList) {
		this.sqList = sqList;
	}

}
