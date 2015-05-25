package com.chinacreator.xtgl.action;

import java.text.SimpleDateFormat;
import java.util.Calendar;

import com.chinacreator.common.cps.action.CPSBaseAction;
import com.chinacreator.xtgl.query.SjhcQueryBean;
import com.chinacreator.xtgl.service.SjhcService;
import com.chinacreator.xtgl.service.impl.SjhcServiceImpl;

/**
 * 数据核查
 */
public class SjhcAction extends CPSBaseAction {

	private static final long serialVersionUID = -2725112071589569734L;
	
	private SjhcQueryBean query;
	private SjhcService service;
	
	/**
	 * 重点人员标题
	 */
	private String title = "";
	
	public SjhcAction(){
		super();
		query = new SjhcQueryBean();
		service = new SjhcServiceImpl();
	}
	
	/**
	 * 跳转到数据核查页面
	 * @return
	 */
	public String toSjhcPage(){
		super.initQueryBean(query);
		
		Calendar cal = Calendar.getInstance();
		if(cal.get(Calendar.DAY_OF_MONTH) == 1){
			cal.add(Calendar.MONTH, -1);
		}
		cal.set(Calendar.DAY_OF_MONTH, 1);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String kssj = sdf.format(cal.getTime());
		query.setStartTime(kssj);
		
		cal = Calendar.getInstance();
		cal.add(Calendar.DAY_OF_MONTH, -1);
		query.setEndTime(sdf.format(cal.getTime()));
		
		return "toSjhcPage";
	}
	
	/**
	 * 跳转到数据页面
	 * @return
	 */
	public String toDataPage(){
		if("201".equals(query.getKhlx())){
			title = "重点人员下发数据维护";
		}else if("202".equals(query.getKhlx())){
			title = "重点人员委托管理";
		}else if("203".equals(query.getKhlx())){
			title = "重点人员关系人信息质量";
		}
		return "dataPage_" + query.getKhlx();
	}

	/**
	 * 查询流动人口
	 */
	public void queryLdrk(){
		responseWrite(service.queryLdrk(query, getPageInfo()));
	}
	
	/**
	 * 查询从业人员
	 */
	public void queryCyry(){
		responseWrite(service.queryCyry(query, getPageInfo()));
	}
	
	/**
	 * 查询出租房屋巡查登记
	 */
	public void queryCzfw(){
		responseWrite(service.queryCzfw(query, getPageInfo()));
	}

	/**
	 * 查询登记出租房屋
	 */
	public void queryFw(){
		responseWrite(service.queryFw(query, getPageInfo()));
	}
	
	/**
	 * 查询实体
	 */
	public void querySt(){
		responseWrite(service.querySt(query, getPageInfo()));
	}
	
	/**
	 * 查询重点人员
	 */
	public void queryZdry(){
		responseWrite(service.queryZdry(query, getPageInfo()));
	}
	
	/**
	 * 查询路面盘查质量问题数据
	 */
	public void queryLmpc(){
		responseWrite(service.queryLmpc(query, getPageInfo()));
	}
	
	public SjhcQueryBean getQuery() {
		return query;
	}

	public void setQuery(SjhcQueryBean query) {
		this.query = query;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}
}
