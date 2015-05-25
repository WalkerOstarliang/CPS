package com.chinacreator.common.taglib.bean;

import com.chinacreator.common.helper.ValidateHelper;

public class ColumnBean implements java.io.Serializable
{

	/**
	 * 
	 */
	private static final long	serialVersionUID	= 8653073741360045270L;
	
	private String title;
	private String field;
	private String isNumber;
	private String isCheckbox;
	private String sortable = "false";
	private String align;
	private String width;
	private String maxlength;
	
	/**
	 * 是否允许展开内容
	 */
	private String expand = "true";
	
	/**
	 * 默认显示列
	 */
	private String display = "true";
	
	/**
	 * 行回调
	 */
	private String rowcallback;
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getField() {
		return field;
	}
	public void setField(String field) {
		this.field = field;
	}
	public String getIsNumber() {
		return isNumber;
	}
	public void setIsNumber(String isNumber) {
		this.isNumber = isNumber;
	}
	public String getIsCheckbox() {
		return isCheckbox;
	}
	public void setIsCheckbox(String isCheckbox) {
		this.isCheckbox = isCheckbox;
	}
	public String getAlign() {
		return align;
	}
	public void setAlign(String align) {
		this.align = align;
	}
	public String getWidth() {
		return width;
	}
	public void setWidth(String width) {
		this.width = width;
	}
	public String getMaxlength() {
		return maxlength;
	}
	public void setMaxlength(String maxlength) {
		this.maxlength = maxlength;
	}
	
	public String getExpand() {
		return expand;
	}
	public void setExpand(String expand) {
		this.expand = expand;
	}
	public String getDisplay() {
		return display;
	}
	public void setDisplay(String display) {
		this.display = display;
	}
	public String getRowcallback() {
		return rowcallback;
	}
	public void setRowcallback(String rowcallback) {
		this.rowcallback = rowcallback;
	}
	
	public String getSortable() {
		return sortable;
	}
	public void setSortable(String sortable) {
		this.sortable = sortable;
	}
	
	public String toString()
	{
		StringBuffer sb = new StringBuffer();
		sb.append("{");
		if (ValidateHelper.isNotEmptyString(title))
		{
			sb.append("title : '"+title+"',");
		}
		if (ValidateHelper.isNotEmptyString(field))
		{
			sb.append("field : '"+field+"',");
		}
		if (ValidateHelper.isNotEmptyString(isNumber))
		{
			sb.append("isNumber : "+isNumber+",");
		}
		if (ValidateHelper.isNotEmptyString(isCheckbox))
		{
			sb.append("isCheckbox : " + isCheckbox+",");
		}
		if (ValidateHelper.isNotEmptyString(align))
		{
			sb.append("align : '"+align+"',");
		}
		if (ValidateHelper.isNotEmptyString(width))
		{
			sb.append("width : '"+width+"',");
		}
		if (ValidateHelper.isNotEmptyString(maxlength))
		{
			sb.append("maxlength : "+maxlength + ",");
		}
		
		
		sb.append("sortable : " + sortable + ",");
		
		sb.append("expand : "+expand+",");
		sb.append("display: " + display +",");
		sb.append("rowcallback : " + rowcallback + ",");
		sb.append("a : true");
		sb.append("}");
		return sb.toString();
	}
}
