package com.chinacreator.gis.query;

import com.chinacreator.common.bean.QueryBean;

public class StxxQueryBean extends QueryBean
{

	private static final long serialVersionUID = 1596971854791842770L;
	
	private String stmc;
	private String startRow;
	private String endRow;
	private int page;
	
	public String getStmc()
	{
		return stmc;
	}
	public void setStmc(String stmc)
	{
		this.stmc = stmc;
	}
	public String getStartRow()
	{
		return startRow;
	}
	public void setStartRow(String startRow)
	{
		this.startRow = startRow;
	}
	public String getEndRow()
	{
		return endRow;
	}
	public void setEndRow(String endRow)
	{
		this.endRow = endRow;
	}
	public int getPage()
	{
		return page;
	}
	public void setPage(int page)
	{
		this.page = page;
	}

}
