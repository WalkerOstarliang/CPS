package com.chinacreator.nbgl.bean;

import com.chinacreator.common.bean.BaseValue;
import com.chinacreator.common.helper.ValidateHelper;

/**
 * 根据单位分类统计案件
 * @author sytx
 *
 */
public class AjtjByDwflBean extends BaseValue {
	/**
	 * 
	 */
	private static final long serialVersionUID = -1752918492411524659L;
	
	/**
	 * 单位分类
	 */
	private String dwfl;
	
	/**
	 * 代码
	 */
	private String dm;
	
	/**
	 * 扒窃
	 */
	private String pq;
	
	/**
	 * 其他盗窃
	 */
	private String qtdq;
	
	/**
	 * 其他入室盗窃
	 */
	private String qtrsdq;
	
	/**
	 * 入户盗窃
	 */
	private String rhdq;
	
	/**
	 * 抢劫
	 */
	private String qj;
	
	/**
	 * 抢夺
	 */
	private String qd;
	
	/**
	 * 电信诈骗
	 */
	private String dxzp;
	
	/**
	 * 合计
	 */
	private String hj;

	public String getDwfl() {
		if(ValidateHelper.isEmptyString(dwfl) && ValidateHelper.isEmptyString(dm)){
			dwfl = "总数";
		}
		return dwfl;
	}

	public void setDwfl(String dwfl) {
		this.dwfl = dwfl;
	}

	public String getDm() {
		return dm;
	}

	public void setDm(String dm) {
		this.dm = dm;
	}

	public String getPq() {
		return pq;
	}

	public void setPq(String pq) {
		this.pq = pq;
	}

	public String getQtdq() {
		return qtdq;
	}

	public void setQtdq(String qtdq) {
		this.qtdq = qtdq;
	}

	public String getQtrsdq() {
		return qtrsdq;
	}

	public void setQtrsdq(String qtrsdq) {
		this.qtrsdq = qtrsdq;
	}

	public String getRhdq() {
		return rhdq;
	}

	public void setRhdq(String rhdq) {
		this.rhdq = rhdq;
	}

	public String getQj() {
		return qj;
	}

	public void setQj(String qj) {
		this.qj = qj;
	}

	public String getQd() {
		return qd;
	}

	public void setQd(String qd) {
		this.qd = qd;
	}

	public String getDxzp() {
		return dxzp;
	}

	public void setDxzp(String dxzp) {
		this.dxzp = dxzp;
	}

	public String getHj() {
		return hj;
	}

	public void setHj(String hj) {
		this.hj = hj;
	} 
}
