package com.chinacreator.zagl.bean;

import com.chinacreator.common.cps.bean.RkJbxxBean;
import com.chinacreator.common.helper.DictionaryCacheHellper;

/**安保人员信息**/
public class DwabryBean extends RkJbxxBean {
	private static final long serialVersionUID = 2665060288723026915L;
	/**
	 * 编号（主键）
	 */
	private String bh;
	
	/**
	 * 机构编号
	 */
	private String jgbh;
	
	/**
	 * 人员编号
	 */
	private String rybh;
	
	/**
	 * 原工作单位
	 */
	private String ygzdw;
	
	/**
	 * 工作岗位
	 */
	private String gzgw;
	
	/**
	 * 担保人姓名
	 */
	private String dbrxm;
	
	/**
	 * 担保人联系电话
	 */
	private String dbrlxdh;
	
	/**
	 * 职务类别
	 */
	private String zwlb;
	
	/**
	 * 职务类别名称
	 */
	private String zwlbmc;
	
	/**
	 * 培训情况
	 */
	private String pxqk;
	
	/**
	 * 奖惩情况
	 */
	private String jcqk;
	
	/**
	 * 操作人
	 */
	private String czrxm;
	
	/**
	 * 操作时间
	 */
	private String czsj;
	
	/**
	 * 操作单位代码
	 */
	private String czdwdm;
	
	/**
	 * 操作单位名称
	 */
	private String czdwmc;
	
	/**
	 * 操作标识
	 */
	private String czbs;
	
	/**
	 * 登记人姓名
	 */
	private String djrxm;
	
	/**
	 * 登记单位代码
	 */
	private String djdwdm;
	
	/**
	 * 登记单位名称
	 */
	private String djdwmc;
	
	/**
	 * 登记时间
	 */
	private String djsj;
	
	public String getBh() {
		return bh;
	}

	public void setBh(String bh) {
		this.bh = bh;
	}

	public String getJgbh() {
		return jgbh;
	}

	public void setJgbh(String jgbh) {
		this.jgbh = jgbh;
	}

	public String getRybh() {
		return rybh;
	}

	public void setRybh(String rybh) {
		this.rybh = rybh;
	}

	public String getYgzdw() {
		return ygzdw;
	}

	public void setYgzdw(String ygzdw) {
		this.ygzdw = ygzdw;
	}

	public String getGzgw() {
		return gzgw;
	}

	public void setGzgw(String gzgw) {
		this.gzgw = gzgw;
	}

	public String getDbrxm() {
		return dbrxm;
	}

	public void setDbrxm(String dbrxm) {
		this.dbrxm = dbrxm;
	}

	public String getDbrlxdh() {
		return dbrlxdh;
	}

	public void setDbrlxdh(String dbrlxdh) {
		this.dbrlxdh = dbrlxdh;
	}

	public String getZwlb() {
		return zwlb;
	}

	public void setZwlb(String zwlb) {
		this.zwlb = zwlb;
	}

	public String getPxqk() {
		return pxqk;
	}

	public void setPxqk(String pxqk) {
		this.pxqk = pxqk;
	}

	public String getJcqk() {
		return jcqk;
	}

	public void setJcqk(String jcqk) {
		this.jcqk = jcqk;
	}

	public String getCzrxm() {
		return czrxm;
	}

	public void setCzrxm(String czrxm) {
		this.czrxm = czrxm;
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

	public String getCzbs() {
		return czbs;
	}

	public void setCzbs(String czbs) {
		this.czbs = czbs;
	}

	public String getDjrxm() {
		return djrxm;
	}

	public void setDjrxm(String djrxm) {
		this.djrxm = djrxm;
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

	public String getDjsj() {
		return djsj;
	}

	public void setDjsj(String djsj) {
		this.djsj = djsj;
	}

	public String getZwlbmc() {
		zwlbmc = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("ZAGL_RY_ZW", this.zwlb);
		return zwlbmc;
	}

	public void setZwlbmc(String zwlbmc) {
		this.zwlbmc = zwlbmc;
	}
}
