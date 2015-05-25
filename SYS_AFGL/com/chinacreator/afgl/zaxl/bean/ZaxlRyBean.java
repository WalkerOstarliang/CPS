package com.chinacreator.afgl.zaxl.bean;

import com.chinacreator.zagl.bean.OperateBean;
/**
 * 治安巡逻--巡逻人员
 * @author Administrator
 *
 */
public class ZaxlRyBean extends OperateBean{

	/**
	 * 
	 */
	private static final long serialVersionUID = -3104829496485348399L;
	private String id  ; // varchar2(27)  n      主键（6位行政区划 + 14位时间 + 7位序列）
	private String zaxlid  ; //  varchar2(27)  y      治安巡逻id（关联治安巡逻表）
	private String xldyxm  ; //  varchar2(30)  y      巡逻人员姓名
	private String xldysfzh  ; //  varchar2(18)  y      巡逻人员身份证号
	private String xldylxdh   ; // varchar2(20)  y      巡逻人员联系电话

	private String zw	 ; //  varchar2(1)	y			职务：（1：民警；2：巡逻民警；3：社区干部；4：群众）
	private String zwms  ; // 	varchar2(10)	y			职务描述：（1：民警；2：巡逻民警；3：社区干部；4：群众）
	
	private String cz ; 
	
	public String getCz() {
		return cz;
	}
	public void setCz(String cz) {
		this.cz = cz;
	}
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
	public String getXldyxm() {
		return xldyxm;
	}
	public void setXldyxm(String xldyxm) {
		this.xldyxm = xldyxm;
	}
	public String getXldysfzh() {
		return xldysfzh;
	}
	public void setXldysfzh(String xldysfzh) {
		this.xldysfzh = xldysfzh;
	}
	public String getXldylxdh() {
		return xldylxdh;
	}
	public void setXldylxdh(String xldylxdh) {
		this.xldylxdh = xldylxdh;
	}
	public String getZw() {
		return zw;
	}
	public void setZw(String zw) {
		this.zw = zw;
	}
	public String getZwms() {
		if("1".equals(zw)){
			zwms = "民警";
		}else if("2".equals(zw)){
			zwms ="巡逻民警";
		}else if("3".equals(zw)){
			zwms ="社区干部";
		}else if("4".equals(zw)){
			zwms ="群众";
		}
		return zwms;
	}
	public void setZwms(String zwms) {
		if("1".equals(zw)){
			zwms = "民警";
		}else if("2".equals(zw)){
			zwms ="巡逻民警";
		}else if("3".equals(zw)){
			zwms ="社区干部";
		}else if("4".equals(zw)){
			zwms ="群众";
		}
		this.zwms = zwms;
	}
	
}
