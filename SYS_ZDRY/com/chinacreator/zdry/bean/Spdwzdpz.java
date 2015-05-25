package com.chinacreator.zdry.bean;

import java.util.Date;

import com.chinacreator.common.bean.BaseValue;

/**
 * @author 禹文超
 * @mail wenchao.yu@chinacreator.com
 * @Description: TODO(审批单位指定配置实体类)
 * @date Mar 27, 2013 10:55:13 AM
 */
public class Spdwzdpz extends BaseValue {

	/**
	 * 
	 */
	private static final long serialVersionUID = -7001335756657515076L;
	private String id;
	private String code;
	private String zdCode;
	private String zdCodeName;
	private Date zdsj;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getZdCode() {
		return zdCode;
	}

	public void setZdCode(String zdCode) {
		this.zdCode = zdCode;
	}

	public String getZdCodeName() {
		return zdCodeName;
	}

	public void setZdCodeName(String zdCodeName) {
		this.zdCodeName = zdCodeName;
	}

	public Date getZdsj() {
		return zdsj;
	}

	public void setZdsj(Date zdsj) {
		this.zdsj = zdsj;
	}
}
