package com.chinacreator.xqgk.bean;

import com.chinacreator.common.bean.BaseValue;

/**
 * 辖区基本信息数据项
 * @author Administrator
 */
public class XqgkQueryInfoDetail extends BaseValue {

	private static final long serialVersionUID = 8385648144604375683L;
	
	private int id;      
	private String code;//模块代码
	private String typeName;//显示数据项名称
	private String unit;//显示数据项单位
	private int typeOrder;//显示数据项序号
	private String inLine;//显示数据项是否换新行
	private String dbSource;//数据源
	private String countSql;//查询数据sql
	private String needTime;//是否需要时间参数
	private String timeFormat;//时间格式
	private String isLikeParam;//是否需要截取机构代码（sql查询方式为like）
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getTypeName() {
		return typeName;
	}
	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}
	public String getUnit() {
		return unit;
	}
	public void setUnit(String unit) {
		this.unit = unit;
	}
	public int getTypeOrder() {
		return typeOrder;
	}
	public void setTypeOrder(int typeOrder) {
		this.typeOrder = typeOrder;
	}
	public String getInLine() {
		return inLine;
	}
	public void setInLine(String inLine) {
		this.inLine = inLine;
	}
	public String getDbSource() {
		return dbSource;
	}
	public void setDbSource(String dbSource) {
		this.dbSource = dbSource;
	}
	public String getCountSql() {
		return countSql;
	}
	public void setCountSql(String countSql) {
		this.countSql = countSql;
	}
	public String getNeedTime() {
		return needTime;
	}
	public void setNeedTime(String needTime) {
		this.needTime = needTime;
	}
	public String getIsLikeParam() {
		return isLikeParam;
	}
	public void setIsLikeParam(String isLikeParam) {
		this.isLikeParam = isLikeParam;
	}
	public String getTimeFormat() {
		return timeFormat;
	}
	public void setTimeFormat(String timeFormat) {
		this.timeFormat = timeFormat;
	}
}
