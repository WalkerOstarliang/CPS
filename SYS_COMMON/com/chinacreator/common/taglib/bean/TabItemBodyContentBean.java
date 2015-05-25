package com.chinacreator.common.taglib.bean;

public class TabItemBodyContentBean implements java.io.Serializable
{

	/**
	 * serialVersionUID
	 */
	private static final long	serialVersionUID	= 2040482282838248777L;
	
	private String id;
	
	private String title;
	
	private String display;
	
	private String href;
	
	private String beforeClick;
	
	private String disabled;
	
	private String bodyContentHtml;

	public String getBodyContentHtml() {
		return bodyContentHtml;
	}

	public void setBodyContentHtml(String bodyContentHtml) {
		this.bodyContentHtml = bodyContentHtml;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDisplay() {
		return display;
	}

	public void setDisplay(String display) {
		this.display = display;
	}

	public String getHref() {
		return href;
	}

	public void setHref(String href) {
		this.href = href;
	}

	public String getBeforeClick() {
		return beforeClick;
	}

	public void setBeforeClick(String beforeClick) {
		this.beforeClick = beforeClick;
	}

	public String getDisabled() {
		return disabled;
	}

	public void setDisabled(String disabled) {
		this.disabled = disabled;
	}
	
	 
	
}
