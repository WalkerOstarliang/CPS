package com.chinacreator.cs.bean;

import java.util.ArrayList;
import java.util.List;

import com.chinacreator.common.bean.BaseValue;

public class MenuFunctionBean extends BaseValue
{
	/**
	 * 
	 */
	private static final long	serialVersionUID	= -5785594103633371961L;

	private String functionid;
	
	private String name;
	
	private String parentid;
	
	private String path;
	
	private String type;
	
	private String functionsn;
	
	private String target;
	
	private String menuindex;
	
	private List<MenuFunctionBean> childMenuBeans = new ArrayList<MenuFunctionBean>();

	public String getFunctionid()
	{
		return functionid;
	}

	public void setFunctionid(String functionid)
	{
		this.functionid = functionid;
	}

	public String getName()
	{
		return name;
	}

	public void setName(String name)
	{
		this.name = name;
	}

	public String getParentid()
	{
		return parentid;
	}

	public void setParentid(String parentid)
	{
		this.parentid = parentid;
	}

	public String getPath()
	{
		return path;
	}

	public void setPath(String path)
	{
		this.path = path;
	}

	public String getType()
	{
		return type;
	}

	public void setType(String type)
	{
		this.type = type;
	}

	public String getFunctionsn()
	{
		return functionsn;
	}

	public void setFunctionsn(String functionsn)
	{
		this.functionsn = functionsn;
	}

	public String getTarget()
	{
		return target;
	}

	public void setTarget(String target)
	{
		this.target = target;
	}

	public List<MenuFunctionBean> getChildMenuBeans()
	{
		return childMenuBeans;
	}

	public void setChildMenuBeans(List<MenuFunctionBean> childMenuBeans)
	{
		this.childMenuBeans = childMenuBeans;
	}

	public String getMenuindex() {
		return menuindex;
	}

	public void setMenuindex(String menuindex) {
		this.menuindex = menuindex;
	}
}
