package com.chinacreator.xqgk.bean;

import com.chinacreator.common.bean.BaseValue;

/**
 * 辖区基本信息数据项(展示)
 * @author Administrator
 *
 */
public class XqgkShowNumInfo extends BaseValue {

	private static final long serialVersionUID = -7291757407194859312L;

	private int id;
	
	private String numStr;

	public String getNumStr() {
		return numStr;
	}

	public void setNumStr(String numStr) {
		this.numStr = numStr;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
	
}
