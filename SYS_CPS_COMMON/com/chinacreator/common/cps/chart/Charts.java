package com.chinacreator.common.cps.chart;

import java.util.Map;
public class Charts{
	/**
	 * 
	 */
	private static final long serialVersionUID = -9094666975804838922L;
	
	private String columnName;
	private String title;
	private Object data;
	private String link;
	private Map<String,Object> mutilData;
	private Map<String,String> style;
	
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Object getData() {
		return data;
	}
	public void setData(Object data) {
		this.data = data;
	}
	public Map<String,Object> getMutilData() {
		return mutilData;
	}
	public void setMutilData(Map<String,Object> mutilData) {
		this.mutilData = mutilData;
	}
	public String getColumnName() {
		return columnName;
	}
	public void setColumnName(String columnName) {
		this.columnName = columnName;
	}
	public Map<String, String> getStyle() {
		return style;
	}
	public void setStyle(Map<String, String> style) {
		this.style = style;
	}
	public String getLink() {
		return link;
	}
	public void setLink(String link) {
		this.link = link;
	}


}
