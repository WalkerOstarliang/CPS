package com.chinacreator.ckyj.bean;

import java.util.ArrayList;
import java.util.List;

import com.chinacreator.common.bean.BaseValue;

public class CkyjQsFkBean extends BaseValue {

	private static final long serialVersionUID = 5502196104286077449L;
	
	/**
	 * 预警信息
	 */
	CkyjxxBean ckyj = new CkyjxxBean();
	
	/**
	 * 预警签收
	 */
	YjqsBean yjqs = new YjqsBean();
	
	/**
	 * 预警所有的反馈信息
	 */
	List<YjfkBean> yjfkList = new ArrayList<YjfkBean>();
	
	/**
	 * 预警反馈
	 */
	YjfkBean yjfk = new YjfkBean();

	public CkyjxxBean getCkyj() {
		return ckyj;
	}

	public void setCkyj(CkyjxxBean ckyj) {
		this.ckyj = ckyj;
	}

	public YjqsBean getYjqs() {
		return yjqs;
	}

	public void setYjqs(YjqsBean yjqs) {
		this.yjqs = yjqs;
	}

	public List<YjfkBean> getYjfkList() {
		return yjfkList;
	}

	public void setYjfkList(List<YjfkBean> yjfkList) {
		this.yjfkList = yjfkList;
	}

	public YjfkBean getYjfk() {
		return yjfk;
	}

	public void setYjfk(YjfkBean yjfk) {
		this.yjfk = yjfk;
	}
}
