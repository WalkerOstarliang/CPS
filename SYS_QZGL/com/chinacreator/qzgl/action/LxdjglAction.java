package com.chinacreator.qzgl.action;


import com.chinacreator.common.bean.LoginInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.cps.action.CPSBaseAction;
import com.chinacreator.common.helper.ActionContextHelper;
import com.chinacreator.common.helper.DateTimeHelper;
import com.chinacreator.qzgl.bean.LxdjBean;
import com.chinacreator.qzgl.query.LxdjQueryBean;
import com.chinacreator.qzgl.services.LxdjService;

public class LxdjglAction extends CPSBaseAction
{

	/**
	 * 
	 */
	private static final long serialVersionUID = 4643689693902285726L;
	
	private String bh;
	
	private String zf;
	
	private LxdjBean bean;
	
	private LxdjQueryBean querybean;
	
	private LxdjService service;
	
	public LxdjglAction(){
		super();
		service = new LxdjService();
	}
	
	public LxdjBean getBean() {
		return bean;
	}

	public void setBean(LxdjBean bean) {
		this.bean = bean;
	}

	public LxdjQueryBean getQuerybean() {
		return querybean;
	}

	public void setQuerybean(LxdjQueryBean querybean) {
		this.querybean = querybean;
	}
	
	public String getBh() {
		return bh;
	}
	
	public void setBh(String bh) {
		this.bh = bh;
	}
	

	public String toLxdjListPage()
	{
		if(querybean == null){
			querybean = new LxdjQueryBean();
		}
		initQueryBean(querybean);
		return "toLxdjListPage";
	}
	
	public void queryLxdjBeanList() throws Exception
	{
		if(querybean == null){
			querybean = new LxdjQueryBean();
			initQueryBean(querybean);
		}
		
		PageResultInfo<LxdjBean> list = service.lxcxList(querybean, getPageInfo());
		responseWrite(list);
	}
	/**
	 * 打开来访来信明细页面（新增、修改、查看）
	 * @return
	 * @throws Exception
	 */
	public String toAddLxdj() throws Exception
	{
		LoginInfo log = ActionContextHelper.getLoginInfo();
		if(CommonConstant.OPERTYPE_ADD.equals(operType)){//操作类型为新增
			if(bean == null){
				bean = new LxdjBean();
			}
			//保存登记人信息
			bean.setDjrxm(log.getRealname());
			bean.setDjdwdm(log.getOrgcode());
			bean.setDjrjh(log.getUsername());
			bean.setDjdwmc(log.getOrgname());
			//登记时间
			bean.setDjsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd"));
			
			//新增信息的处理类型为“未处理”
			bean.setCllx("1");
			
		}
		else				//修改信息或者查看信息
		{	//根据编号，获得该编号的来访来信明细
			bean = service.getLxdjBeanByBh(bh);
		}
		return "toAddLxdj";
	}
	
	/**
	 * 保存修改或新增的明细
	 * @throws Exception
	 */
	public void addLxdj() throws Exception{
		//更新数据库
		service.insertLxdjBean(bean,operType);
		responseWrite(true);
	}

	
	/**
	 * 删除来访来信明细
	 * @throws Exception
	 */
	public void deleteLxdj() throws Exception{
		service.deleteLxdjByBh(bh);
		responseWrite(true);
	}

	public String getZf() {
		return zf;
	}

	public void setZf(String zf) {
		this.zf = zf;
	}
	
}
