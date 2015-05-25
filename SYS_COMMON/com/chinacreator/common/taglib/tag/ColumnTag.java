package com.chinacreator.common.taglib.tag;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.BodyTagSupport;
import javax.servlet.jsp.tagext.Tag;
import javax.servlet.jsp.tagext.TagSupport;

import com.chinacreator.common.taglib.bean.ColumnBean;

/**
 * 列标签属性标签<br/>
 * 该标签只能必须和TableGrid 标签结合使用<br/>
 * 使用方法如:<br/>
 * &lt;ct:column field="xm" title="序号" isNumber="true" align="center"&gt;&lt;/ct:column &gt; <br/>
 * 
 * @author 熊明春
 *
 */
public class ColumnTag extends BodyTagSupport {

	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = -6344589751746396120L;

	private String title;
	private String field;
	private String isNumber;
	private String isCheckbox;
	private String align = "center";
	private String width;
	private String maxlength;
	private String expand = "true";
	private String display = "true";
	private String sortable = "false";
	private String rowcallback;
	
	
	@Override
	public int doEndTag() throws JspException {
		try
		{
			Tag tag = TagSupport.findAncestorWithClass(this, TableGridTag.class);
			if (tag instanceof TableGridTag)
			{
				TableGridTag parentTag = (TableGridTag)tag;
				ColumnBean bean = new ColumnBean();
				org.springframework.beans.BeanUtils.copyProperties(this, bean);
				//BeanUtils.copyProperties(bean,this);
				parentTag.getColModel().add(bean);
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return EVAL_PAGE;
	}
	@Override
	public int doStartTag() throws JspException {
		return EVAL_BODY_INCLUDE;
	}
	
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
	public String getMaxlength() {
		return maxlength;
	}
	public void setMaxlength(String maxlength) {
		this.maxlength = maxlength;
	}
	 
	
	public String getWidth() {
		return width;
	}
	public void setWidth(String width) {
		this.width = width;
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
	
	
}
