package com.chinacreator.zdry.bean;

import java.util.Date;

import org.apache.commons.lang.StringUtils;

import com.chinacreator.common.bean.BaseValue;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.helper.DateTimeHelper;
import com.chinacreator.common.helper.DictionaryCacheHellper;

/**
 * @author 禹文超
 * @mail wenchao.yu@chinacreator.com
 * @Description: TODO(重点人口列管申请流转信息实体类)
 * @date Mar 5, 2013 5:22:14 PM
 */
public class Lksqlzxx extends BaseValue {

	/**
	 * 
	 */
	private static final long serialVersionUID = 8695285721390930167L;
	private String id;
	private String sqxxbh;
	private String clrxm;
	private String cldwdm;
	private String cldwmc;
	private String cldwlx;
	private String cljg;
	private String lcgsqlx;

	private String cljgyj;
	private Date clsj;

	private String cldwlxmc;
	private String toChar_clsj;
	private String cljgmc;

	public String getToChar_clsj() {
		toChar_clsj = DateTimeHelper.conver(clsj, "yyyy-MM-dd");
		return toChar_clsj;
	}

	public void setToChar_clsj(String toChar_clsj) {
		this.toChar_clsj = toChar_clsj;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getSqxxbh() {
		return sqxxbh;
	}

	public void setSqxxbh(String sqxxbh) {
		this.sqxxbh = sqxxbh;
	}

	public String getClrxm() {
		return clrxm;
	}

	public void setClrxm(String clrxm) {
		this.clrxm = clrxm;
	}

	public String getCldwdm() {
		return cldwdm;
	}

	public void setCldwdm(String cldwdm) {
		this.cldwdm = cldwdm;
	}

	public String getCldwmc() {
		return cldwmc;
	}

	public void setCldwmc(String cldwmc) {
		this.cldwmc = cldwmc;
	}

	public String getCldwlx() {
		return cldwlx;
	}

	public void setCldwlx(String cldwlx) {
		this.cldwlx = cldwlx;
	}

	public String getCljg() {
		return cljg;
	}

	public void setCljg(String cljg) {
		this.cljg = cljg;
	}

	public String getCljgyj() {
		return cljgyj;
	}

	public void setCljgyj(String cljgyj) {
		this.cljgyj = cljgyj;
	}

	public Date getClsj() {
		return clsj;
	}

	public void setClsj(Date clsj) {
		this.clsj = clsj;
	}

	public String getCldwlxmc() {
		cldwlxmc = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm(
				CommonConstant.ZDRY_ZDLB_CLDWLX, cldwlx);
		return cldwlxmc;
	}

	public String getCljgmc() {
		if(StringUtils.isNotBlank(cljg)){
			cljgmc = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm(
					CommonConstant.ZDRY_ZDLB_CLJG, cljg.trim());
		}
		return cljgmc;
	}

	public String getLcgsqlx() {
		return lcgsqlx;
	}

	public void setLcgsqlx(String lcgsqlx) {
		this.lcgsqlx = lcgsqlx;
	}
}
