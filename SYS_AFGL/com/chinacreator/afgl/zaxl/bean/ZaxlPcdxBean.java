package com.chinacreator.afgl.zaxl.bean;

import com.chinacreator.zagl.bean.OperateBean;

/**
 * 治安巡逻 -- 被盘查人
 * @author Administrator
 *
 */
public class ZaxlPcdxBean  extends OperateBean{

    /**
	 * 
	 */
	private static final long serialVersionUID = 7237227757694209012L;
	private String	id  ;  //  varchar2(27)  n      主键（6位行政区划 + 14位时间 + 7位序列）
    private String	zaxlid   ;  //   varchar2(27)  y      治安巡逻id（关联治安巡逻表）
    private String	pcryxm   ;  //   varchar2(30)  y      盘查对象姓名
    private String	pcrysfzh  ;  //    varchar2(18)  y      盘查对象身份证号
    private String	pcrylxdh    ;  //  varchar2(20)  y      盘查对象联系电话
    
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getZaxlid() {
		return zaxlid;
	}
	public void setZaxlid(String zaxlid) {
		this.zaxlid = zaxlid;
	}
	public String getPcryxm() {
		return pcryxm;
	}
	public void setPcryxm(String pcryxm) {
		this.pcryxm = pcryxm;
	}
	public String getPcrysfzh() {
		return pcrysfzh;
	}
	public void setPcrysfzh(String pcrysfzh) {
		this.pcrysfzh = pcrysfzh;
	}
	public String getPcrylxdh() {
		return pcrylxdh;
	}
	public void setPcrylxdh(String pcrylxdh) {
		this.pcrylxdh = pcrylxdh;
	}
	
    
}
