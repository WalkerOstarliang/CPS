package com.chinacreator.qzgl.bean;

import com.chinacreator.common.bean.BaseValue;
import com.chinacreator.common.helper.DictionaryCacheHellper;
/**
 * 乞讨人员亲朋好友
 * @author Administrator
 *
 */
public class QtryqyBean  extends BaseValue{

	/**
	 * 
	 */
	private static final long serialVersionUID = 990436565745164988L;
	private String id  ; //  varchar2(22)   n      6位行政编码+6位日期+10位序列号
	private String jtpyxm    ; //  varchar2(30)  y      家庭朋友姓名
	private String jtpylxdh   ; //   varchar2(30)  y      亲戚朋友联系电话
	private String jtpygx   ; //   varchar2(10)  y      亲戚朋友关系（参照“社会关系”字典）
	private String jtpygxms ; // 亲朋关系描述
	private String djsj    ; //  date  y      登记时间
	private String djrxm   ; //   varchar2(30)  y      登记人姓名
	private String djrjh   ; //   varchar2(30)  y      登记人警号
	private String djdwdm   ; //   varchar2(12)  y      登记单位代码
	private String djdwmc   ; //   varchar2(120)  y      登记单位名称
	private String czrxm    ; //  varchar2(30)  y      操作人姓名
	private String czrjh   ; //   varchar2(10)  y      操作人警号
	private String czsj    ; //  date  y      操作时间
	private String czdwdm   ; //   varchar2(12)  y      操作单位代码
	private String czdwmc   ; //   varchar2(30)  y      操作单位名称
	private String zxbs   ; //   varchar2(2)  y      注销标识（'0':正常；'1':注销；'2':删除）
	private String scsj   ; //   date  y      删除时间
	private String qtryid    ; //  varchar2(22)  n      乞讨人员id（关联乞讨人员表id）
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getJtpyxm() {
		return jtpyxm;
	}
	public void setJtpyxm(String jtpyxm) {
		this.jtpyxm = jtpyxm;
	}
	public String getJtpylxdh() {
		return jtpylxdh;
	}
	public void setJtpylxdh(String jtpylxdh) {
		this.jtpylxdh = jtpylxdh;
	}
	public String getJtpygx() {
		return jtpygx;
	}
	public void setJtpygx(String jtpygx) {
		this.jtpygx = jtpygx;
	}
	public String getDjsj() {
		return djsj;
	}
	public void setDjsj(String djsj) {
		this.djsj = djsj;
	}
	public String getDjrxm() {
		return djrxm;
	}
	public void setDjrxm(String djrxm) {
		this.djrxm = djrxm;
	}
	public String getDjrjh() {
		return djrjh;
	}
	public void setDjrjh(String djrjh) {
		this.djrjh = djrjh;
	}
	public String getDjdwdm() {
		return djdwdm;
	}
	public void setDjdwdm(String djdwdm) {
		this.djdwdm = djdwdm;
	}
	public String getDjdwmc() {
		return djdwmc;
	}
	public void setDjdwmc(String djdwmc) {
		this.djdwmc = djdwmc;
	}
	public String getCzrxm() {
		return czrxm;
	}
	public void setCzrxm(String czrxm) {
		this.czrxm = czrxm;
	}
	public String getCzrjh() {
		return czrjh;
	}
	public void setCzrjh(String czrjh) {
		this.czrjh = czrjh;
	}
	public String getCzsj() {
		return czsj;
	}
	public void setCzsj(String czsj) {
		this.czsj = czsj;
	}
	public String getCzdwdm() {
		return czdwdm;
	}
	public void setCzdwdm(String czdwdm) {
		this.czdwdm = czdwdm;
	}
	public String getCzdwmc() {
		return czdwmc;
	}
	public void setCzdwmc(String czdwmc) {
		this.czdwmc = czdwmc;
	}
	public String getZxbs() {
		return zxbs;
	}
	public void setZxbs(String zxbs) {
		this.zxbs = zxbs;
	}
	public String getScsj() {
		return scsj;
	}
	public void setScsj(String scsj) {
		this.scsj = scsj;
	}
	public String getQtryid() {
		return qtryid;
	}
	public void setQtryid(String qtryid) {
		this.qtryid = qtryid;
	}
	public String getJtpygxms() {
		jtpygxms = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("SHGX", jtpygx); 
		return jtpygxms;
	}
	public void setJtpygxms(String jtpygxms) {
		this.jtpygxms = jtpygxms;
	}
	
}
