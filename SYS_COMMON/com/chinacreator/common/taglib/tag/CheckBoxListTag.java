package com.chinacreator.common.taglib.tag;

import java.util.List;

import com.chinacreator.common.bean.SystemDictionaryBean;
import com.chinacreator.common.helper.DictionaryCacheHellper;
import com.chinacreator.common.helper.ValidateHelper;
import com.chinacreator.common.taglib.bean.TagPropertyBean;
import com.chinacreator.common.taglib.helper.TagTemplateHelper;

public class CheckBoxListTag extends BaseBodyTagSupport
{
	/**
	 * 
	 */
	private static final long	serialVersionUID	= -1934438268790018249L;
	private String id;
	private String name;
	private String value;
	private String zdlb;
	private String disabled;
	private int cols = 0;
	
	@Override
	public String getEndTempFileName()
	{
		return "checkboxlist_end.ftl";
	}
	
	@Override
	public String getStartTempFileName()
	{
		return "checkboxlist_start.ftl";
	}
	
	@Override
	public void setTagPropertyBean(TagPropertyBean bean)
	{
		TagTemplateHelper.converTagPropertyToBean(this, bean);
		List<SystemDictionaryBean> diclist = DictionaryCacheHellper.getSystemDictionaryListByZdlb(zdlb);
		if (ValidateHelper.isNotEmptyCollection(diclist))
		{
			bean.getRoot().put("diclist", diclist);
		}
		if (ValidateHelper.isNotEmptyString(value))
		{
			bean.getRoot().put("valueArr", value.split(","));
		}
	}

	public String getId()
	{
		return id;
	}

	public void setId(String id)
	{
		this.id = id;
	}

	public String getName()
	{
		return name;
	}

	public void setName(String name)
	{
		this.name = name;
	}

	public String getValue()
	{
		return value;
	}

	public void setValue(String value)
	{
		this.value = value;
	}

	public String getZdlb()
	{
		return zdlb;
	}

	public void setZdlb(String zdlb)
	{
		this.zdlb = zdlb;
	}

	public int getCols()
	{
		return cols;
	}

	public void setCols(int cols)
	{
		this.cols = cols;
	}

	public String getDisabled()
	{
		return disabled;
	}

	public void setDisabled(String disabled)
	{
		this.disabled = disabled;
	}
	
	
}
