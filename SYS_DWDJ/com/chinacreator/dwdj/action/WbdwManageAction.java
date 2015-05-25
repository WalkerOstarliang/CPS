package com.chinacreator.dwdj.action;

import com.chinacreator.common.bean.LoginInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.cps.action.CPSBaseAction;
import com.chinacreator.common.helper.ActionContextHelper;
import com.chinacreator.common.helper.ValidateHelper;
import com.chinacreator.dwdj.bean.WbdwJdhxBean;
import com.chinacreator.dwdj.bean.WbdwQzjcBean;
import com.chinacreator.dwdj.bean.WbdwShBean;
import com.chinacreator.dwdj.bean.WbdwWxhxBean;
import com.chinacreator.dwdj.query.WbdwShQueryBean;
import com.chinacreator.dwdj.service.WbdwManagerServiceImpl;
import com.chinacreator.dwdj.service.WbdwManagerService;

/**
 * 危爆单位管理
 */
public class WbdwManageAction extends CPSBaseAction {

	private static final long serialVersionUID = 326700922325214209L;

	private String wbdwjclb;// 危爆单位检查类别；
	private WbdwQzjcBean dwcx;
	private WbdwQzjcBean qzjcBean;
	private WbdwJdhxBean jdhxBean;
	private WbdwWxhxBean wxhxBean;
	private WbdwManagerService service;
	private LoginInfo loginUser;
	private WbdwShBean sh;
	
	private WbdwShQueryBean wbdwshQuery;

	public WbdwManageAction() {
		super();
		loginUser = ActionContextHelper.getLoginInfo();
		qzjcBean = new WbdwQzjcBean();
		service = new WbdwManagerServiceImpl();
		
		wbdwshQuery = new WbdwShQueryBean();
		sh = new WbdwShBean();
	}

	/**
	 * 危爆单位审核
	 */
	public void wbdwSh() throws Exception {
		responseWrite(service.WbdwSh(sh));
	}

	/**
	 * 跳转到危爆单位审核详情页面
	 * @return
	 */
	public String toWbdwShInfoPage(){
		sh = service.queryWbdwShById(wbdwshQuery.getId());
		return "toWbdwShInfoPage";
	}

	/**
	 * 查询危爆单位审核列表
	 */
	public void queryWbDwShList() {
		responseWrite(service.queryWbDwShList(getPageInfo(), wbdwshQuery));
	}


	/**
	 * 跳转到审核列表页面
	 * @return
	 */
	public String toWbdwShListPage(){
		initQueryBean(wbdwshQuery);
		return "toWbdwShListPage";
	}
	
	/**
	 * 危爆单位枪支检查
	 */
	public String toAqjcWbdw() {
		if (ValidateHelper.isEmptyString(qzjcBean.getId())) {
			PageResultInfo<WbdwQzjcBean> resultInfo = service
					.queryWbdwQzjcResultInfoByJgbh(getPageInfo(), qzjcBean);
			if (resultInfo.getDatas().size() != 0) {
				qzjcBean = resultInfo.getDatas().get(0);
				qzjcBean.setId("");
			}
			qzjcBean.setJcrxm(loginUser.getRealname());
		} else {
			PageResultInfo<WbdwQzjcBean> resultInfo = service
					.queryWbdwQzjcResultInfoById(getPageInfo(), qzjcBean);
			if (resultInfo.getDatas().size() != 0) {
				qzjcBean = resultInfo.getDatas().get(0);
			}
		}
		return "toAqjcWbdw";
	}

	/**
	 * 危爆单位剧毒化学
	 */
	public String toJdhxWbdw() {
		if (ValidateHelper.isNotEmptyString(jdhxBean.getId())) {
			PageResultInfo<WbdwJdhxBean> resultInfo = service
					.queryWbdwJdhxPageResultInfoById(getPageInfo(), jdhxBean);
			if (resultInfo.getDatas().size() > 0) {
				jdhxBean = resultInfo.getDatas().get(0);
			}
		}
		return "toJdhxWbdw";
	}

	/**
	 * 危爆单位爆炸物品
	 */
	public String toWxhxWbdw() {
		if (ValidateHelper.isNotEmptyString(wxhxBean.getId())) {
			PageResultInfo<WbdwWxhxBean> resultInfo = service
					.queryWbdwWxhxPageResultInfoById(getPageInfo(), wxhxBean);
			if (resultInfo.getDatas().size() > 0) {
				wxhxBean = resultInfo.getDatas().get(0);
			}
		}
		return "toWxhxWbdw";
	}

	/**
	 * 危爆单位枪支检查保存或修改（id是否存在为判断依据）
	 */
	public void submitWbdwQzjc() {
		responseWrite(service.insertQzjcBean(qzjcBean));
	}

	/**
	 * 分页查询危爆单位枪支检查信息
	 */
	public void queryWbdwQzjc() {
		PageResultInfo<WbdwQzjcBean> pageResultInfo = service
				.queryWbdwQzjcPageResultInfoByJgbh(getPageInfo(), qzjcBean);
		responseWrite(pageResultInfo);
	}

	/**
	 * 危爆单位剧毒化学保存或修改（id是否存在为判断依据）
	 */
	public void submitWbdwJdhx() {
		responseWrite(service.insertJdhxBean(jdhxBean));
	}

	/**
	 * 分页查询危爆单位剧毒化学信息
	 */
	public void queryWbdwJdhx() {
		PageResultInfo<WbdwJdhxBean> pageResultInfo = service
				.queryWbdwJdhxPageResultInfoByJgbh(getPageInfo(), jdhxBean);
		responseWrite(pageResultInfo);
	}

	/**
	 * 危爆单位危险化学保存或修改（id是否存在为判断依据）
	 */
	public void submitWbdwWxhx() {
		responseWrite(service.insertWxhxBean(wxhxBean));
	}

	/**
	 * 分页查询危爆单位危险化学信息
	 */
	public void queryWbdwWxhx() {
		PageResultInfo<WbdwWxhxBean> pageResultInfo = service
				.queryWbdwWxhxPageResultInfoByJgbh(getPageInfo(), wxhxBean);
		responseWrite(pageResultInfo);
	}

	public WbdwQzjcBean getQzjcBean() {
		return qzjcBean;
	}

	public void setQzjcBean(WbdwQzjcBean qzjcBean) {
		this.qzjcBean = qzjcBean;
	}

	public WbdwManagerService getService() {
		return service;
	}

	public void setService(WbdwManagerService service) {
		this.service = service;
	}

	public WbdwQzjcBean getDwcx() {
		return dwcx;
	}

	public void setDwcx(WbdwQzjcBean dwcx) {
		this.dwcx = dwcx;
	}

	public WbdwJdhxBean getJdhxBean() {
		return jdhxBean;
	}

	public void setJdhxBean(WbdwJdhxBean jdhxBean) {
		this.jdhxBean = jdhxBean;
	}

	public WbdwWxhxBean getWxhxBean() {
		return wxhxBean;
	}

	public void setWxhxBean(WbdwWxhxBean wxhxBean) {
		this.wxhxBean = wxhxBean;
	}

	public String getWbdwjclb() {
		return wbdwjclb;
	}

	public void setWbdwjclb(String wbdwjclb) {
		this.wbdwjclb = wbdwjclb;
	}

	public WbdwShQueryBean getWbdwshQuery() {
		return wbdwshQuery;
	}

	public void setWbdwshQuery(WbdwShQueryBean wbdwshQuery) {
		this.wbdwshQuery = wbdwshQuery;
	}

	public WbdwShBean getSh() {
		return sh;
	}

	public void setSh(WbdwShBean sh) {
		this.sh = sh;
	}

}
