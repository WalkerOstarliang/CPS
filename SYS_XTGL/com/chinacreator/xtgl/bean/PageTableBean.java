package com.chinacreator.xtgl.bean;

import java.util.ArrayList;
import java.util.List;

import com.chinacreator.common.bean.BaseValue;

public class PageTableBean extends BaseValue {

	private static final long serialVersionUID = 1L;
	
	private String tablename; 
	private String title;
	private String classStr;
	private String style;
	private String width;
	private String khlx;
	
	private List<PageTableHeadBean> tableHeadList = new ArrayList<PageTableHeadBean>();

	public String getTablename() {
		return tablename;
	}

	public void setTablename(String tablename) {
		this.tablename = tablename;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getClassStr() {
		return classStr;
	}

	public void setClassStr(String classStr) {
		this.classStr = classStr;
	}

	public String getStyle() {
		return style;
	}

	public void setStyle(String style) {
		this.style = style;
	}

	public String getWidth() {
		return width;
	}

	public void setWidth(String width) {
		this.width = width;
	}

	public String getKhlx() {
		return khlx;
	}

	public void setKhlx(String khlx) {
		this.khlx = khlx;
	}

	public List<PageTableHeadBean> getTableHeadList() {
		return tableHeadList;
	}

	public void setTableHeadList(List<PageTableHeadBean> tableHeadList) {
		this.tableHeadList = tableHeadList;
	}
}
