package com.chinacreator.afgl.bean;

import com.chinacreator.common.bean.BaseValue;
/**
 * 注销路面盘查信息
 * @author Administrator
 *
 */
public class AflmpcZxBean extends BaseValue{

	/**
	 * 
	 */
	private static final long serialVersionUID = 4431081955315969530L;
	private String id ; // 主键
	private String zxrjh ; // 注销人警号
	private String zxrxm ; // 注销人姓名
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getZxrjh() {
		return zxrjh;
	}
	public void setZxrjh(String zxrjh) {
		this.zxrjh = zxrjh;
	}
	public String getZxrxm() {
		return zxrxm;
	}
	public void setZxrxm(String zxrxm) {
		this.zxrxm = zxrxm;
	}
	
}
