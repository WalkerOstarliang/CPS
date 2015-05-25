package com.chinacreator.xqgk.bean;

import java.util.LinkedList;
import java.util.List;

import com.chinacreator.common.bean.BaseValue;

/**
 * 辖区基本信息
 * @author Administrator
 */
public class XqgkQueryInfo extends BaseValue {

	private static final long serialVersionUID = 50685102832835826L;
	
	private int id;      
	private String code;//模块代码
	private String name;//模块名
	private int typeOrder;//显示数据项序号
	private String iconName;//图片名
	private String linkUrl;//链接地址
	
	private List<XqgkQueryInfoDetail> list = new LinkedList<XqgkQueryInfoDetail>();
	
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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getTypeOrder() {
		return typeOrder;
	}
	public void setTypeOrder(int typeOrder) {
		this.typeOrder = typeOrder;
	}
	public String getIconName() {
		return iconName;
	}
	public void setIconName(String iconName) {
		this.iconName = iconName;
	}
	public List<XqgkQueryInfoDetail> getList() {
		return list;
	}
	public void addData2List(XqgkQueryInfoDetail detail) {
		list.add(detail);
	}
	public String getLinkUrl() {
		return linkUrl;
	}
	public void setLinkUrl(String linkUrl) {
		this.linkUrl = linkUrl;
	}
}
