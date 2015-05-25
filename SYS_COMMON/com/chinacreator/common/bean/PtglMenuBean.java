package com.chinacreator.common.bean;

public class PtglMenuBean extends BaseValue
{
	/**
	 * 
	 */
	private static final long	serialVersionUID	= 644651130674414267L;

	private String function_id;
	
	private String name;
	
	private String parent_id;
	
	private String path;
	
	private String type;
	
	private String function_sn;
	
	private String imagepath;
	
	private String function_desc;
	
	private String target;

	public String getFunction_id()
	{
		return function_id;
	}

	public void setFunction_id(String functionId)
	{
		function_id = functionId;
	}

	public String getName()
	{
		return name;
	}

	public void setName(String name)
	{
		this.name = name;
	}

	public String getParent_id()
	{
		return parent_id;
	}

	public void setParent_id(String parentId)
	{
		parent_id = parentId;
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

	public String getFunction_sn()
	{
		return function_sn;
	}

	public void setFunction_sn(String functionSn)
	{
		function_sn = functionSn;
	}

	public String getImagepath()
	{
		return imagepath;
	}

	public void setImagepath(String imagepath)
	{
		this.imagepath = imagepath;
	}

	public String getFunction_desc()
	{
		return function_desc;
	}

	public void setFunction_desc(String functionDesc)
	{
		function_desc = functionDesc;
	}

	public String getTarget()
	{
		return target;
	}

	public void setTarget(String target)
	{
		this.target = target;
	}
	
	
}
