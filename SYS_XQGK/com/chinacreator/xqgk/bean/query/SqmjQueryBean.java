package com.chinacreator.xqgk.bean.query;

import com.chinacreator.common.bean.BaseValue;

public class SqmjQueryBean extends BaseValue {

	/**
	 * 
	 */
	private static final long	serialVersionUID	= -4298028865596623310L;

	private String deptCode;
	
	public SqmjQueryBean(String deptCode){
		this.deptCode = deptCode;
	}
	
	public String getDeptCode() {
		return deptCode;
	}

	public void setDeptCode(String deptCode) {
		this.deptCode = deptCode;
	}

}
