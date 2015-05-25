package com.chinacreator.khkp.query;

import com.chinacreator.common.bean.QueryBean;

/**
 * 两实数据统计查询bean
 */
public class LssjTjQueryBean extends QueryBean {

	private static final long serialVersionUID = -4534576651404614314L;
	
	/**
	 * 统计级别
	 */
	private String tjjb;
	
	/**
	 * 统计开始时间
	 */
	private String tjsj_start;
	
	/**
	 * 统计结束时间
	 */
	private String tjsj_end;
	
	/**
	 * 统计类型
	 */
	private String tjlx;
	
	/**
	 * 统计单位代码
	 */
	private String tjdwdm;
	
	/**
	 * 统计单位级别
	 */
	private String tjdwjb;

	public String getTjjb() {
		return tjjb;
	}

	public void setTjjb(String tjjb) {
		this.tjjb = tjjb;
	}

	public String getTjsj_start() {
		return tjsj_start;
	}

	public void setTjsj_start(String tjsj_start) {
		this.tjsj_start = tjsj_start;
	}

	public String getTjsj_end() {
		return tjsj_end;
	}

	public void setTjsj_end(String tjsj_end) {
		this.tjsj_end = tjsj_end;
	}

	public String getTjlx() {
		return tjlx;
	}

	public void setTjlx(String tjlx) {
		this.tjlx = tjlx;
	}

	public String getTjdwdm() {
		return tjdwdm;
	}

	public void setTjdwdm(String tjdwdm) {
		this.tjdwdm = tjdwdm;
	}

	public String getTjdwjb() {
		return tjdwjb;
	}

	public void setTjdwjb(String tjdwjb) {
		this.tjdwjb = tjdwjb;
	}
}
