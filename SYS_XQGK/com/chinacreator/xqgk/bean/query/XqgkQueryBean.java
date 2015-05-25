package com.chinacreator.xqgk.bean.query;

import com.chinacreator.xqgk.utils.DeptUtils;

public class XqgkQueryBean {

	private String orgCode;
	
	private int level;
	
	private String type;
	
	private String numCol;
	
	private String tjDate;
	
	public XqgkQueryBean(String type, String orgCode, String tjDate){
		this.type = type;
		this.orgCode = orgCode;
		this.level = DeptUtils.getLevel(orgCode);
		this.tjDate = tjDate;
		if("syrk".equals(type)){
			this.numCol = "czrks + ldrks + jzrks + wlhrks";
		}else if("czrk".equals(type)){
			this.numCol = "czrks";
		}else if("ldrk".equals(type)){
			this.numCol = "ldrks";
		}else if("jwrk".equals(type)){
			this.numCol = "jwrks";
		}else if("jzrk".equals(type)){
			this.numCol = "jzrks";
		}else if("zdry".equals(type)){
			this.numCol = "qlsdrys + qlswrys + qlztrys + qlxsfzrys + qlzszhjsbrys + qlsfrys + qlskrys + qlgzdxrys";
		}else if("syfw".equals(type)){
			this.numCol = "fws";
		}else if("czfw".equals(type)){
			this.numCol = "czfws";
		}else if("swfwcs".equals(type)){
			this.numCol = "swcss";
		}else if("lgcs".equals(type)){
			this.numCol = "lgcs";
		}else{
			this.numCol = "";
		}
	}
	
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

	public int getLevel() {
		return level;
	}

	public void setLevel(int level) {
		this.level = level;
	}

	public String getNumCol() {
		return numCol;
	}

	public void setNumCol(String numCol) {
		this.numCol = numCol;
	}

	public String getTjDate() {
		return tjDate;
	}

	public void setTjDate(String tjDate) {
		this.tjDate = tjDate;
	}

	
}
