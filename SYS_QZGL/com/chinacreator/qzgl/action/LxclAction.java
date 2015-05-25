package com.chinacreator.qzgl.action;

import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.cps.action.CPSBaseAction;
import com.chinacreator.common.helper.DateTimeHelper;
import com.chinacreator.qzgl.bean.LxdjBean;
import com.chinacreator.qzgl.query.LxclQueryBean;
import com.chinacreator.qzgl.services.LxdjService;

public class LxclAction extends CPSBaseAction
{

	/**
	 * 
	 */
	private static final long serialVersionUID = 5822574876883197899L;
	
	private LxclQueryBean querybean;
	
	private LxdjBean bean;
	
	private String bh;
	
	private LxdjService service;
	
	public LxclAction(){
		super();
		service = new LxdjService();
	}
	
	
	
	public LxdjBean getBean() {
		return bean;
	}



	public void setBean(LxdjBean bean) {
		this.bean = bean;
	}



	public static long getSerialversionuid() {
		return serialVersionUID;
	}


	public String toLxclListPage()
	{
		if (querybean == null)
		{
			querybean = new LxclQueryBean();
			initQueryBean(querybean);
		}
		return "toLxclListPage";
	}

	public void queryLxclBeanList() throws Exception
	{
		if(querybean == null){
			querybean = new LxclQueryBean();
			initQueryBean(querybean);
		}
		PageResultInfo<LxdjBean> list = service.lxcxList(querybean, getPageInfo());
		responseWrite(list);
	}
	
	public LxclQueryBean getQuerybean() {
		return querybean;
	}

	public void setQuerybean(LxclQueryBean queryBean) {
		this.querybean = queryBean;
	}

	public String toClOrZf() throws Exception{
		bean = service.getLxdjBeanByBh(bh);
		if(operType.trim().equals(CommonConstant.OPERTYPE_DETAIL))
		{
			return "toXQ";
		}
		bean.setClsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd"));
		return "toClOrZf";
	}
	
	public void clOrZf() throws Exception{
		if(operType.trim().equals("chuli")){//处理操作
			bean.setCllx("3");				//处理类型改为已处理
			//保存处理人信息（自动保存为登录人信息）
			//插入数据库
			service.chuliLxdj(bean);
		}
		else{								//不是处理就认为是转发
			//插入数据库
			service.zhuanfaLxdj(bean);
		}
	}



	public String getBh() {
		return bh;
	}



	public void setBh(String bh) throws Exception {
		this.bh = bh;
	}
	
	
}
