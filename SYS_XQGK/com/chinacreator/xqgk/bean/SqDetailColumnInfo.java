package com.chinacreator.xqgk.bean;

public class SqDetailColumnInfo {

	private int id;
	private String code;
	private String showColName;
	private String widthNum;
	private String colName;
	private String align;
	private int isParam;
	private int ordNum;
	
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
	public String getColName() {
		return colName;
	}
	public void setColName(String colName) {
		this.colName = colName;
	}
	public String getShowColName() {
		return showColName;
	}
	public void setShowColName(String showColName) {
		this.showColName = showColName;
	}
	public int getOrdNum() {
		return ordNum;
	}
	public void setOrdNum(int ordNum) {
		this.ordNum = ordNum;
	}
	public String getWidthNum() {
		return widthNum;
	}
	public void setWidthNum(String widthNum) {
		this.widthNum = widthNum;
	}
	public String getAlign() {
		return align;
	}
	public void setAlign(String align) {
		this.align = align;
	}
	public int getIsParam() {
		return isParam;
	}
	public void setIsParam(int isParam) {
		this.isParam = isParam;
	}
	
}
