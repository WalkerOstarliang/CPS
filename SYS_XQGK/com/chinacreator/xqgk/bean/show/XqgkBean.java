package com.chinacreator.xqgk.bean.show;

import java.text.NumberFormat;
@SuppressWarnings("unused")
public class XqgkBean {

	private String orgCode;
	
	private String type;
	
	private int num;
	
	private String showNum;
	
	private int rankNum;
	
	private int rankTotal;
	
	public String getOrgCode() {
		return orgCode;
	}

	public void setOrgCode(String orgCode) {
		this.orgCode = orgCode;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public int getRankNum() {
		return rankNum;
	}

	public void setRankNum(int rankNum) {
		this.rankNum = rankNum;
	}

	public int getRankTotal() {
		return rankTotal;
	}

	public void setRankTotal(int rankTotal) {
		this.rankTotal = rankTotal;
	}

	public String getShowNum() {
		return NumberFormat.getNumberInstance().format(getNum());
	}
	
}
