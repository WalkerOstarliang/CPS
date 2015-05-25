package com.chinacreator.zdry.query;

import com.chinacreator.common.bean.QueryBean;

/**
 * @author 禹文超
 * @mail wenchao.yu@chinacreator.com
 * @Description: TODO()
 * @date Mar 26, 2013 10:45:00 AM
 */
public class StatisticsQueryBean extends QueryBean {

	/**
	 * 
	 */
	private static final long serialVersionUID = -6084743057151896491L;

	private String title;
	private String zdryCount;
	private String zdryGkCount;

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getZdryCount() {
		return zdryCount;
	}

	public void setZdryCount(String zdryCount) {
		this.zdryCount = zdryCount;
	}

	public String getZdryGkCount() {
		return zdryGkCount;
	}

	public void setZdryGkCount(String zdryGkCount) {
		this.zdryGkCount = zdryGkCount;
	}

}
