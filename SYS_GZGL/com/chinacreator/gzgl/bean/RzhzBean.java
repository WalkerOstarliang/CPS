package com.chinacreator.gzgl.bean;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.chinacreator.common.bean.BaseValue;

/**
 * 日志汇总
 */
public class RzhzBean extends BaseValue {

	private static final long serialVersionUID = -5435061216625824209L;
	
	/**
	 * 汇总时间
	 */
	private String hzsj;
	
	/**
	 * 工作民警警号
	 */
	private String gzmjjh;
	
	/**
	 * 工作民警姓名
	 */
	private String gzmjxm;
	
	/**
	 * 汇总单位
	 */
	private String hzdw;
	
	/**
	 * 日志
	 */
	private List<Map<String,String>> rzList = new ArrayList<Map<String,String>>();

	public String getHzsj() {
		return hzsj;
	}

	public void setHzsj(String hzsj) {
		this.hzsj = hzsj;
	}

	public String getGzmjjh() {
		return gzmjjh;
	}

	public void setGzmjjh(String gzmjjh) {
		this.gzmjjh = gzmjjh;
	}

	public String getGzmjxm() {
		return gzmjxm;
	}

	public void setGzmjxm(String gzmjxm) {
		this.gzmjxm = gzmjxm;
	}

	public String getHzdw() {
		return hzdw;
	}

	public void setHzdw(String hzdw) {
		this.hzdw = hzdw;
	}

	public List<Map<String, String>> getRzList() {
		return rzList;
	}

	public void setRzList(List<Map<String, String>> rzList) {
		this.rzList = rzList;
	}
}
