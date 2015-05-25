package com.chinacreator.zagl.bean;

import com.chinacreator.common.helper.DictionaryCacheHellper;

public class DdcjjBean extends OperateBean{

	/**
	 * 交警采集的电动车查询Bean
	 */
	private static final long serialVersionUID = -5410781337688835297L;

	private String car_id;	//编号
	
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
	private String car_isomuxms;// 所属区域描述
	
	private String car_opername;	//操作员
	
	private String car_operdate;	//操作日期
	
	private String car_update;	//更新日期
	private String car_level;	//数据级别
	
	private String car_brandcount;	//
	private String car_cardcount;	//
	private String car_state;	//
	private String car_checker;	//
	private String car_checkdate;	//
	private String car_carisomux;	//
	private String car_certnum;	//
	private String car_color1;	//
	private String car_color2;	//
	private String car_color3;	//
	private String car_cert;	//
	
	//操作
	private String cz;  //
	
	public String getCar_id() {
		return car_id;
	}
	public void setCar_id(String car_id) {
		this.car_id = car_id;
	}
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
	public String getCar_brandcount() {
		return car_brandcount;
	}
	public void setCar_brandcount(String car_brandcount) {
		this.car_brandcount = car_brandcount;
	}
	public String getCar_cardcount() {
		return car_cardcount;
	}
	public void setCar_cardcount(String car_cardcount) {
		this.car_cardcount = car_cardcount;
	}
	public String getCar_state() {
		return car_state;
	}
	public void setCar_state(String car_state) {
		this.car_state = car_state;
	}
	public String getCar_checker() {
		return car_checker;
	}
	public void setCar_checker(String car_checker) {
		this.car_checker = car_checker;
	}
	public String getCar_checkdate() {
		return car_checkdate;
	}
	public void setCar_checkdate(String car_checkdate) {
		this.car_checkdate = car_checkdate;
	}
	public String getCar_carisomux() {
		return car_carisomux;
	}
	public void setCar_carisomux(String car_carisomux) {
		this.car_carisomux = car_carisomux;
	}
	public String getCar_certnum() {
		return car_certnum;
	}
	public void setCar_certnum(String car_certnum) {
		this.car_certnum = car_certnum;
	}
	public String getCar_color1() {
		return car_color1;
	}
	public void setCar_color1(String car_color1) {
		this.car_color1 = car_color1;
	}
	public String getCar_color2() {
		return car_color2;
	}
	public void setCar_color2(String car_color2) {
		this.car_color2 = car_color2;
	}
	public String getCar_color3() {
		return car_color3;
	}
	public void setCar_color3(String car_color3) {
		this.car_color3 = car_color3;
	}
	public String getCar_cert() {
		return car_cert;
	}
	public void setCar_cert(String car_cert) {
		this.car_cert = car_cert;
	}
	public String getCz() {
		cz = "<span class=\"cps_span_href\" onclick=\"openDdcxInfoWin('" + this.car_id + "')\" " +
				"style=\"color:green\">详情</span>&nbsp;";
		return cz;
	}
	public void setCz(String cz) {
		this.cz = cz;
	}
	public String getCar_isomuxms() {
		car_isomuxms=DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("GA_CAR_ISOMUXDM", this.car_isomux);
		return car_isomuxms;
	}
	public void setCar_isomuxms(String car_isomuxms) {
		this.car_isomuxms = car_isomuxms;
	}

}
