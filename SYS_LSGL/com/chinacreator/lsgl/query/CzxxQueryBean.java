package com.chinacreator.lsgl.query;

import com.chinacreator.common.bean.QueryBean;

/**
 * 承租信息queryBean
 * @company  chinacreator
 * @author zhun.liu
 * @date  Nov 25, 2013  6:22:43 PM
 */
public class CzxxQueryBean extends QueryBean{
	/**
	 * 
	 */
	private static final long serialVersionUID = -4728271557855582093L;
	private String hzrxm;
	private String hzrsfzh;
	
	
	public String getHzrxm() {
		return hzrxm;
	}
	public void setHzrxm(String hzrxm) {
		this.hzrxm = hzrxm;
	}
	public String getHzrsfzh() {
		return hzrsfzh;
	}
	public void setHzrsfzh(String hzrsfzh) {
		this.hzrsfzh = hzrsfzh;
	}
	
}
