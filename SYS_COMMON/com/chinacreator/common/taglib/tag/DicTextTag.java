package com.chinacreator.common.taglib.tag;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.BodyTagSupport;

import com.chinacreator.common.helper.DictionaryCacheHellper;
import com.chinacreator.common.helper.ValidateHelper;

/**
 * 输出字典文本
 * @author mingchun.xiong
 *
 */
public class DicTextTag extends BodyTagSupport
{

	/**
	 * serialVersionUID
	 */
	private static final long	serialVersionUID	= 4780117315064849347L;
	
	private String zdlb;
	
	private String dm;
	
	private String value;

	
	@Override
	public int doStartTag() throws JspException {
		try
		{
			String text = "";
			if (ValidateHelper.isNotEmptyString(zdlb))
			{
				text = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm(zdlb, dm);
			}
			else
			{
				text = value;
			}
			pageContext.getOut().write(text + "&nbsp;");
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return super.doStartTag();
	}

	public String getZdlb() {
		return zdlb;
	}

	public void setZdlb(String zdlb) {
		this.zdlb = zdlb;
	}

	public String getDm() {
		return dm;
	}

	public void setDm(String dm) {
		this.dm = dm;
	}

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}
	
	
	
}
