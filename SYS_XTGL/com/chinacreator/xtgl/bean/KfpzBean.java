package com.chinacreator.xtgl.bean;

import com.chinacreator.common.bean.BaseValue;

/**
 * 扣分配置
 */
public class KfpzBean extends BaseValue {

	private static final long serialVersionUID = 1L;
	
	/**
	 * 考核类型
	 */
	 private String khlx; 
	 
	 /**
	  * 标题
	  */
	 private String bt; 
	 
	 /**
	  * 扣分规则
	  */
	 private String kfgz;
	 
	 /**
	  * 查询语句
	  */
	 private String sql; 
	 
	 /**
	  * 返回值
	  */
	 private String fhz;
	 
	 /**
	  * 处理路径
	  */
	 private String cllj;
	 
	 /**
	  * 级别
	  */
	 private String leve;


	public String getKhlx() {
		return khlx;
	}

	public void setKhlx(String khlx) {
		this.khlx = khlx;
	}

	public String getBt() {
		return bt;
	}

	public void setBt(String bt) {
		this.bt = bt;
	}

	public String getKfgz() {
		return kfgz;
	}

	public void setKfgz(String kfgz) {
		this.kfgz = kfgz;
	}

	public String getSql() {
		return sql;
	}

	public void setSql(String sql) {
		this.sql = sql;
	}

	public String getFhz() {
		return fhz;
	}

	public void setFhz(String fhz) {
		this.fhz = fhz;
	}

	public String getCllj() {
		return cllj;
	}

	public void setCllj(String cllj) {
		this.cllj = cllj;
	}

	public String getLeve() {
		return leve;
	}

	public void setLeve(String leve) {
		this.leve = leve;
	}
}
