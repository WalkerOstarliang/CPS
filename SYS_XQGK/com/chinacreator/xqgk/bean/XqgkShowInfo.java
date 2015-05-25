package com.chinacreator.xqgk.bean;

import java.util.LinkedList;
import java.util.List;

import com.chinacreator.common.bean.BaseValue;

/**
 * 辖区基本信息(展示项)
 * @author Administrator
 *
 */
public class XqgkShowInfo extends BaseValue {

	private static final long serialVersionUID = 2860485458717469597L;

	private String code;
	
	private String name;

	private List<XqgkShowNumInfo> numInfoList = new LinkedList<XqgkShowNumInfo>();

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public List<XqgkShowNumInfo> getNumInfoList() {
		return numInfoList;
	}

	public void setNumInfoList(List<XqgkShowNumInfo> numInfoList) {
		this.numInfoList = numInfoList;
	}
	
	public void addData2List(XqgkShowNumInfo numInfo){
		numInfoList.add(numInfo);
	}

}
