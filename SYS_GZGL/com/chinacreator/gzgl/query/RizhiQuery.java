package com.chinacreator.gzgl.query;

import com.chinacreator.common.bean.QueryBean;

/**
 * 查询bean
 * @author royee
 *
 */
public class RizhiQuery extends QueryBean
{
	/**
	 * 
	 */
	private static final long serialVersionUID = 4509700343840654666L;

	/**
	 * 日志标题
	 */
	private String title;
	
	/**
	 * 开始日期
	 */
	private String beginDate;
	
	/**
	 * 结束日期
	 */
	private String endDate;

	/**
	 * 日志编号
	 */
	private String rzbh;
	
	/**
	 * 民警警号
	 */
	private String mjjh;
	
	/**
	 * 民警姓名
	 */
	private String mjxm;
	
	/**
	 * 工作时间
	 */
	private String gzsj; 
	
	/**
	 * 日志周期   0:周报   1：月报
	 */
	private String rzzq;
	
	//是否下载
	private String isDowload;
	
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getBeginDate()
	{
		return beginDate;
	}

	public void setBeginDate(String beginDate)
	{
		this.beginDate = beginDate;
	}

	public String getEndDate()
	{
		return endDate;
	}

	public void setEndDate(String endDate)
	{
		this.endDate = endDate;
	}

	public String getRzbh()
	{
		return rzbh;
	}

	public void setRzbh(String rzbh)
	{
		this.rzbh = rzbh;
	}

	public String getMjjh()
	{
		return mjjh;
	}

	public void setMjjh(String mjjh)
	{
		this.mjjh = mjjh;
	}

	public String getGzsj() {
		return gzsj;
	}

	public void setGzsj(String gzsj) {
		this.gzsj = gzsj;
	}

	public String getRzzq() {
		return rzzq;
	}

	public void setRzzq(String rzzq) {
		this.rzzq = rzzq;
	}

	public String getIsDowload() {
		return isDowload;
	}

	public void setIsDowload(String isDowload) {
		this.isDowload = isDowload;
	}

	public String getMjxm() {
		return mjxm;
	}

	public void setMjxm(String mjxm) {
		this.mjxm = mjxm;
	}
}
