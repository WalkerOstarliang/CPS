package com.chinacreator.dwdj.query;

import com.chinacreator.common.bean.QueryBean;
/**
 * 根据派出所代码查询所属社区
 * @author Administrator
 *
 */
public class SssqQuery  extends QueryBean{

	/**
	 * 
	 */
	private static final long serialVersionUID = -3672305382068496495L;
	private String pcsdm;
	private String pcsmc;
	private String sssqdm;
	private String sssqmc;
	public String getPcsdm() {
		return pcsdm;
	}
	public void setPcsdm(String pcsdm) {
		this.pcsdm = pcsdm;
	}
	public String getPcsmc() {
		return pcsmc;
	}
	public void setPcsmc(String pcsmc) {
		this.pcsmc = pcsmc;
	}
	public String getSssqdm() {
		return sssqdm;
	}
	public void setSssqdm(String sssqdm) {
		this.sssqdm = sssqdm;
	}
	public String getSssqmc() {
		return sssqmc;
	}
	public void setSssqmc(String sssqmc) {
		this.sssqmc = sssqmc;
	}
	
	
}
