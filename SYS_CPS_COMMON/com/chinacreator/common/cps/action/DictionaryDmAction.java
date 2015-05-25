package com.chinacreator.common.cps.action;

import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.bean.SystemDictionaryBean;
import com.chinacreator.common.cps.business.DictionaryBusiness;

public class DictionaryDmAction  extends CPSBaseAction{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -8392558425423094194L;
	private DictionaryBusiness service;
	private String zdlb;
	private SystemDictionaryBean bean;
	private String selectFlag;
	public DictionaryDmAction(){
		service=new DictionaryBusiness();
		bean=new SystemDictionaryBean();
	}
	
	/**
	 * 名称列表跳转
	 * @return
	 */
	public String toSelectDicPage(){
		bean.setZdlb(zdlb);
		return "toSelectDicPage";
	}
	
	/**
	 * 自定义添加 跳转
	 */
	public String toZdyInsertPage(){
		return "toZdyInsertPage";
	}
	
	/**
	 * 保存
	 * @throws Exception 
	 */
	public void saveZdyDctionary() throws Exception{
		service.insertDictionaryBean(bean);
		responseWrite(true);
	}
	/**
	 * 删除 
	 */
	public  void deleteZdyDictionary(){
		
	}
	
	/**
	 * 判断输入的mc是否存在于数据库中
	 * @throws Exception
	 */
	public void isExistMc() throws Exception{
		boolean flag=service.isExistMC(bean.getMc());
		responseWrite(flag);
	}
	/**
	 * 分页查询
	 * @throws Exception
	 */
	public void queryDictionaryBeanByZdlb() throws Exception{
		PageResultInfo<SystemDictionaryBean> list=service.queryDictionaryBeanByZdlb(bean, getPageInfo());
		responseWrite(list);
	}
	
	/**
	 * 插入dictionaryBean
	 * @throws Exception
	 */
	public void insertDictionaryBean() throws Exception{
		service.insertDictionaryBean(bean);
		responseWrite(true);
	}
	public String getZdlb() {
		return zdlb;
	}
	public void setZdlb(String zdlb) {
		this.zdlb = zdlb;
	}

	public SystemDictionaryBean getBean() {
		return bean;
	}

	public void setBean(SystemDictionaryBean bean) {
		this.bean = bean;
	}

	public String getSelectFlag() {
		return selectFlag;
	}

	public void setSelectFlag(String selectFlag) {
		this.selectFlag = selectFlag;
	}

	
  
}
