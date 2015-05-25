package com.chinacreator.common.cps.bean;

import com.chinacreator.common.bean.BaseValue;

public class TreeNode extends BaseValue{
	/**
	 * 
	 */
	private static final long	serialVersionUID	= 3919671135222822126L;
	private String id;
	private String name;
	private String parentId;
	private String jc;
	private String checked;  //勾选状态
	private String open;     //打开状态
	private boolean async = false;
	private boolean isParent = false;
	private String nocheck; //禁用勾选
	private String ispcs;
	private String leve;
	
	public String getOpen() {
		return open;
	}
	public void setOpen(String open) {
		this.open = open;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getParentId() {
		return parentId;
	}
	public void setParentId(String parentId) {
		this.parentId = parentId;
	}
	public String getJc() {
		return jc;
	}
	public void setJc(String jc) {
		this.jc = jc;
	}
	public String getChecked() {
		return checked;
	}
	public void setChecked(String checked) {
		this.checked = checked;
	}
	public boolean getIsParent() {
		if (async)
		{
			isParent = true;
		}
		return isParent;
	}
	public void setIsParent(boolean isParent) {
		this.isParent = isParent;
	}
	public boolean isAsync() {
		return async;
	}
	public void setAsync(boolean async) {
		this.async = async;
	}
	public String getNocheck() {
		return nocheck;
	}
	public void setNocheck(String nocheck) {
		this.nocheck = nocheck;
	}
	public String getIspcs()
	{
		return ispcs;
	}
	public void setIspcs(String ispcs)
	{
		this.ispcs = ispcs;
	}
	public String getLeve() {
		return leve;
	}
	public void setLeve(String leve) {
		this.leve = leve;
	}
	
}
