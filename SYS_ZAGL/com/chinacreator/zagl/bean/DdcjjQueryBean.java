package com.chinacreator.zagl.bean;

import com.chinacreator.common.bean.QueryBean;

public class DdcjjQueryBean extends QueryBean{

	/**
	 * 交警采集电动车查询QueryBean
	 */
	private static final long serialVersionUID = -1951933040128640866L;
	
	private String car_holder;	//所有人
	
	private String car_addr;	//住址
	
	private String car_telephone;	//联系电话
	
	private String car_num;	//号牌号码
	
	private String car_record;	//档案编号
	
	private String car_brand;	//品牌型号
	
	private String car_motor;	//车架号
	
	private String car_agent;	//经办人
	
	private String car_audit;	//审核人
	
	private String car_agentdate;	//经办日期
	
	private String car_isomux;	//所属区域
	
	private String car_opername;	//操作员
	
	private String car_operdate;	//操作日期
	
	private String car_update;	//更新日期
	
	private String car_level;	//数据级别

	
	/**
	 * 经办日期 开始时间
	 */
	private String xssj_start;
	
	/**
	 * 经办日期 结束时间
	 */
	private String xssj_end;
	
	
	public String getCar_holder() {
		return car_holder;
	}

	public void setCar_holder(String car_holder) {
		this.car_holder = car_holder;
	}

	public String getCar_addr() {
		return car_addr;
	}

	public void setCar_addr(String car_addr) {
		this.car_addr = car_addr;
	}

	public String getCar_telephone() {
		return car_telephone;
	}

	public void setCar_telephone(String car_telephone) {
		this.car_telephone = car_telephone;
	}

	public String getCar_num() {
		return car_num;
	}

	public void setCar_num(String car_num) {
		this.car_num = car_num;
	}

	public String getCar_record() {
		return car_record;
	}

	public void setCar_record(String car_record) {
		this.car_record = car_record;
	}

	public String getCar_brand() {
		return car_brand;
	}

	public void setCar_brand(String car_brand) {
		this.car_brand = car_brand;
	}

	public String getCar_motor() {
		return car_motor;
	}

	public void setCar_motor(String car_motor) {
		this.car_motor = car_motor;
	}

	public String getCar_agent() {
		return car_agent;
	}

	public void setCar_agent(String car_agent) {
		this.car_agent = car_agent;
	}

	public String getCar_audit() {
		return car_audit;
	}

	public void setCar_audit(String car_audit) {
		this.car_audit = car_audit;
	}

	public String getCar_agentdate() {
		return car_agentdate;
	}

	public void setCar_agentdate(String car_agentdate) {
		this.car_agentdate = car_agentdate;
	}

	public String getCar_isomux() {
		return car_isomux;
	}

	public void setCar_isomux(String car_isomux) {
		this.car_isomux = car_isomux;
	}

	public String getCar_opername() {
		return car_opername;
	}

	public void setCar_opername(String car_opername) {
		this.car_opername = car_opername;
	}

	public String getCar_operdate() {
		return car_operdate;
	}

	public void setCar_operdate(String car_operdate) {
		this.car_operdate = car_operdate;
	}

	public String getCar_update() {
		return car_update;
	}

	public void setCar_update(String car_update) {
		this.car_update = car_update;
	}

	public String getCar_level() {
		return car_level;
	}

	public void setCar_level(String car_level) {
		this.car_level = car_level;
	}

	public String getXssj_start() {
		return xssj_start;
	}

	public void setXssj_start(String xssj_start) {
		this.xssj_start = xssj_start;
	}

	public String getXssj_end() {
		return xssj_end;
	}

	public void setXssj_end(String xssj_end) {
		this.xssj_end = xssj_end;
	}
	

}
