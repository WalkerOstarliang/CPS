package com.chinacreator.qzgl.query;

import com.chinacreator.common.bean.QueryBean;
/**
 * 查询乞讨人员亲友信息条件
 * @author Administrator
 *
 */
public class QtryqyQueryBean  extends QueryBean{

	/**
	 * 
	 */
	private static final long serialVersionUID = 6320821044629116045L;
	private String qtryid; // 乞讨人员id

	public String getQtryid() {
		return qtryid;
	}

	public void setQtryid(String qtryid) {
		this.qtryid = qtryid;
	}
	
}
