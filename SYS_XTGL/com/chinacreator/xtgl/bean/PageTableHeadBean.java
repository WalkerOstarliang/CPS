package com.chinacreator.xtgl.bean;

import com.chinacreator.common.bean.BaseValue;

public class PageTableHeadBean extends BaseValue{

	private static final long serialVersionUID = 1L;
	
	private String tablename;
	private String title;
	private String align;
	private String style;
	private String width;
	private String xh;
	
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
	public String getAlign() {
		return align;
	}
	public void setAlign(String align) {
		this.align = align;
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
	public String getXh() {
		return xh;
	}
	public void setXh(String xh) {
		this.xh = xh;
	}

}
