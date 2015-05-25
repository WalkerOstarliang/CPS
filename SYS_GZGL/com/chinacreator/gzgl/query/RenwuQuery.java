package com.chinacreator.gzgl.query;

import com.chinacreator.common.bean.QueryBean;

/**
 * 任务查询bean
 * @author zhujiaojie
 *
 */
public class RenwuQuery extends QueryBean
{

	/**
	 * 
	 */
	private static final long serialVersionUID = -4234916499536866066L;

	private String rwbh;                //任务编号
	 
	private String rwclzt;              //任务处理状态
	
	private String yqclwcrq;            //要求处理完成日期
	
	private String rwwcqk;              //任务完成情况

	private String clmjid;              //处理民警ID
	
	private String clmjjh;              //处理民警警号
	
	private String jcsj_start;          //检查时间(开始)
	
	private String jcsj_end;            //检查时间（结束）
	
	private String op;                  //操作模式
	
	private String rwlx;                //任务类型（用于查询：0：登记任务  1：处理任务）
	
	private String rwfkzt;              //任务反馈状态
	
	private String djrxm;               //登记人姓名  
	private String rwbt;				//任务标题
	
	public String getRwbh()
	{
		return rwbh;
	}

	public void setRwbh(String rwbh)
	{
		this.rwbh = rwbh;
	}

	public String getRwclzt()
	{
		return rwclzt;
	}

	public void setRwclzt(String rwclzt)
	{
		this.rwclzt = rwclzt;
	}

	public String getYqclwcrq()
	{
		return yqclwcrq;
	}

	public void setYqclwcrq(String yqclwcrq)
	{
		this.yqclwcrq = yqclwcrq;
	}

	public String getRwwcqk()
	{
		return rwwcqk;
	}

	public void setRwwcqk(String rwwcqk)
	{
		this.rwwcqk = rwwcqk;
	}

	public String getClmjid()
	{
		return clmjid;
	}

	public void setClmjid(String clmjid)
	{
		this.clmjid = clmjid;
	}

	public String getJcsj_start() {
		return jcsj_start;
	}

	public void setJcsj_start(String jcsjStart) {
		jcsj_start = jcsjStart;
	}

	public String getJcsj_end() {
		return jcsj_end;
	}

	public void setJcsj_end(String jcsjEnd) {
		jcsj_end = jcsjEnd;
	}

	public String getOp() {
		return op;
	}

	public void setOp(String op) {
		this.op = op;
	}

	public String getRwlx() {
		return rwlx;
	}

	public void setRwlx(String rwlx) {
		this.rwlx = rwlx;
	}

	public String getRwfkzt() {
		return rwfkzt;
	}

	public void setRwfkzt(String rwfkzt) {
		this.rwfkzt = rwfkzt;
	}

	public String getDjrxm() {
		return djrxm;
	}

	public void setDjrxm(String djrxm) {
		this.djrxm = djrxm;
	}

	public String getRwbt() {
		return rwbt;
	}

	public void setRwbt(String rwbt) {
		this.rwbt = rwbt;
	}

	public String getClmjjh() {
		return clmjjh;
	}

	public void setClmjjh(String clmjjh) {
		this.clmjjh = clmjjh;
	}
	
	
}
