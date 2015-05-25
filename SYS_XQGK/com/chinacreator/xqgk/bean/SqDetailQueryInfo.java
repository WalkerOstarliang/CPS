package com.chinacreator.xqgk.bean;

import java.util.LinkedList;
import java.util.List;

public class SqDetailQueryInfo {

	private int id;
	private String code;
	private String typeName;
	private String sql;
	private String actUrl;
	private List<SqDetailColumnInfo> list = new LinkedList<SqDetailColumnInfo>();
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
	public String getSql() {
		return sql;
	}
	public void setSql(String sql) {
		this.sql = sql;
	}
	public String getActUrl() {
		return actUrl;
	}
	public void setActUrl(String actUrl) {
		this.actUrl = actUrl;
	}
	public List<SqDetailColumnInfo> getList() {
		return list;
	}
	public void addData2List(SqDetailColumnInfo detail) {
		list.add(detail);
	}
	public String getTypeName() {
		return typeName;
	}
	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}
}
