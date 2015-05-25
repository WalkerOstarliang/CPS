package com.chinacreator.nbgl.bean;

import com.chinacreator.common.bean.BaseValue;

/**
 * 关键词
 */
public class GjcBean extends BaseValue{
	private static final long serialVersionUID = -8554286484616424475L;
	
	/**
	 * 主键ID
	 */
	private String id;
	
	/**
	 * 关键词内容
	 */
	private String gjc;
	
	private String gjc_old;
	private String gjc_new;
	
	/**
	 * 创建人
	 */
	private String cjr;
	
	/**
	 * 创建时间
	 */
	private String cjsj;
	
	/**
	 * 操作证标识
	 */
	private String czbz;
	
	/**
	 * 操作时间
	 */
	private String czsj;
	
	/**
	 * 操作人
	 */
	private String czr;
	
	/**
	 * 操作人身份证号
	 */
	private String czrsfzh;
	
	/**
	 * 创建人身份证号
	 */
	private String cjrsfzh;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getGjc() {
		return gjc;
	}

	public void setGjc(String gjc) {
		this.gjc = gjc;
	}

	public String getCjr() {
		return cjr;
	}

	public void setCjr(String cjr) {
		this.cjr = cjr;
	}

	public String getCjsj() {
		return cjsj;
	}

	public void setCjsj(String cjsj) {
		this.cjsj = cjsj;
	}

	public String getCzbz() {
		return czbz;
	}

	public void setCzbz(String czbz) {
		this.czbz = czbz;
	}

	public String getCzsj() {
		return czsj;
	}

	public void setCzsj(String czsj) {
		this.czsj = czsj;
	}

	public String getCzr() {
		return czr;
	}

	public void setCzr(String czr) {
		this.czr = czr;
	}

	public String getCzrsfzh() {
		return czrsfzh;
	}

	public void setCzrsfzh(String czrsfzh) {
		this.czrsfzh = czrsfzh;
	}

	public String getCjrsfzh() {
		return cjrsfzh;
	}

	public void setCjrsfzh(String cjrsfzh) {
		this.cjrsfzh = cjrsfzh;
	}

	public String getGjc_old() {
		return gjc_old;
	}

	public void setGjc_old(String gjcOld) {
		gjc_old = gjcOld;
	}

	public String getGjc_new() {
		return gjc_new;
	}

	public void setGjc_new(String gjcNew) {
		gjc_new = gjcNew;
	}
}
