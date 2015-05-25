package com.chinacreator.lsgl.bean.queryBean;

import org.apache.commons.lang.StringUtils;

import com.chinacreator.common.bean.BaseValue;

public class LsfwQueryBean extends BaseValue {

	private static final long serialVersionUID = 1L;
	private String stid;
	private String fjh;	//房间号
	private String ssDate;	//开始时间
	private String seDate;	//结束时间
	private String hasPic;	//是否有照片
	
	public LsfwQueryBean(String fjh, String ssDate, String seDate, String hasPic, String stid) {
		this.stid = stid;
		if(StringUtils.isNotEmpty(fjh)){
			this.fjh = fjh;
		}
		if(StringUtils.isNotEmpty(ssDate)){
			this.ssDate = ssDate;
		}
		if(StringUtils.isNotEmpty(seDate)){
			this.seDate = seDate;
		}
		if(StringUtils.isNotEmpty(hasPic)){
			this.hasPic = hasPic;
		}
	}
	public String getFjh() {
		return fjh;
	}
	public void setFjh(String fjh) {
		this.fjh = fjh;
	}
	public String getSsDate() {
		return ssDate;
	}
	public void setSsDate(String ssDate) {
		this.ssDate = ssDate;
	}
	public String getSeDate() {
		return seDate;
	}
	public void setSeDate(String seDate) {
		this.seDate = seDate;
	}
	public String getHasPic() {
		return hasPic;
	}
	public void setHasPic(String hasPic) {
		this.hasPic = hasPic;
	}
	public String getStid() {
		return stid;
	}
	public void setStid(String stid) {
		this.stid = stid;
	}
	
}
