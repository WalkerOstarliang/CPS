package com.chinacreator.xtgl.bean;

import com.chinacreator.common.bean.BaseValue;
import com.chinacreator.common.helper.ValidateHelper;

//社区考核统计
public class SqkhtjBean extends BaseValue {

	private static final long serialVersionUID = 5854636959316700457L;
	
	private String id;
	private String orgcode;
	private String mjxm;
	private String orgname;
	private String jwqfl;
	private String tjqssj;
	private String tjzzsj;
	private String jssj;
	private String jsjd;
	private String zfz;
	private String pm;
	private String a00000;
	private String a10000;
	private String a20000;
	private String a20001;
	private String a20002;
	private String a20003;
	private String a20004;
	private String a20005;
	private String a20006;
	private String a20007;
	private String a30000;
	private String a30001;
	private String a30002;
	private String a30003;
	private String a30004;
	private String a30005;
	private String a30006;
	private String a30007;
	private String b00000;
	private String b10000;
	private String b10001;
	private String b10002;
	private String b20000;
	private String b20001;
	private String b20002;
	private String b30000;
	private String b30001;
	private String b30002;
	private String b40000;
	private String b50000; 
	private String c00000;
	private String c10000;
	private String c20000;
	private String c30000;
	private String c40000;
	private String c50000;
	private String c60000;
	private String c70000;
	private String d00000;
	private String d10000;
	private String d10001;
	private String d10002;
	private String d20000;
	private String d20001;
	private String d20002;
	private String d20003;
	private String d20004;
	private String e00000;
	private String e10001;
	private String e10002;
	private String e20001;
	private String e20002;
	private String e30001;
	private String e30002;
	private String e40001;
	private String e40002;
	private String f00000;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getOrgcode() {
		if(ValidateHelper.isNotEmptyString(this.orgcode)){
			orgcode = orgcode.trim();
		}
		return orgcode;
	}
	public void setOrgcode(String orgcode) {
		this.orgcode = orgcode;
	}
	public String getOrgname() {
		if(ValidateHelper.isNotEmptyString(this.orgname)){
			orgname = orgname.trim();
		}
		return orgname;
	}
	public void setOrgname(String orgname) {
		this.orgname = orgname;
	}
	public String getJwqfl() {
		if(ValidateHelper.isNotEmptyString(this.jwqfl)){
			jwqfl = jwqfl.trim();
		}
		return jwqfl;
	}
	public void setJwqfl(String jwqfl) {
		this.jwqfl = jwqfl;
	}
	public String getTjqssj() {
		if(ValidateHelper.isNotEmptyString(this.tjqssj)){
			tjqssj = tjqssj.trim();
		}
		return tjqssj;
	}
	public void setTjqssj(String tjqssj) {
		this.tjqssj = tjqssj;
	}
	public String getTjzzsj() {
		if(ValidateHelper.isNotEmptyString(this.tjzzsj)){
			tjzzsj = tjzzsj.trim();
		}
		return tjzzsj;
	}
	public void setTjzzsj(String tjzzsj) {
		this.tjzzsj = tjzzsj;
	}
	public String getJssj() {
		if(ValidateHelper.isNotEmptyString(this.jssj)){
			jssj = jssj.trim();
		}
		return jssj;
	}
	public void setJssj(String jssj) {
		this.jssj = jssj;
	}
	public String getJsjd() {
		if(ValidateHelper.isNotEmptyString(this.jsjd)){
			jsjd = jsjd.trim();
		}
		return jsjd;
	}
	public void setJsjd(String jsjd) {
		this.jsjd = jsjd;
	}
	public String getZfz() {
		if(ValidateHelper.isNotEmptyString(this.zfz)){
			zfz = zfz.trim();
		}
		return zfz;
	}
	public void setZfz(String zfz) {
		this.zfz = zfz;
	}
	public String getA00000() {
		if(ValidateHelper.isNotEmptyString(this.a00000)){
			a00000 = a00000.trim();
		}
		return a00000;
	}
	public void setA00000(String a00000) {
		this.a00000 = a00000;
	}
	public String getA10000() {
		if(ValidateHelper.isNotEmptyString(this.a10000)){
			a10000 = a10000.trim();
		}
		return a10000;
	}
	public void setA10000(String a10000) {
		this.a10000 = a10000;
	}
	public String getA20000() {
		if(ValidateHelper.isNotEmptyString(this.a20000)){
			a20000 = a20000.trim();
		}
		return a20000;
	}
	public void setA20000(String a20000) {
		this.a20000 = a20000;
	}
	public String getA20001() {
		if(ValidateHelper.isNotEmptyString(this.a20001)){
			a20001 = a20001.trim();
		}
		return a20001;
	}
	public void setA20001(String a20001) {
		this.a20001 = a20001;
	}
	public String getA20002() {
		if(ValidateHelper.isNotEmptyString(this.a20002)){
			a20002 = a20002.trim();
		}
		return a20002;
	}
	public void setA20002(String a20002) {
		this.a20002 = a20002;
	}
	public String getA20003() {
		if(ValidateHelper.isNotEmptyString(this.a20003)){
			a20003 = a20003.trim();
		}
		return a20003;
	}
	public void setA20003(String a20003) {
		this.a20003 = a20003;
	}
	public String getA20004() {
		if(ValidateHelper.isNotEmptyString(this.a20004)){
			a20004 = a20004.trim();
		}
		return a20004;
	}
	public void setA20004(String a20004) {
		this.a20004 = a20004;
	}
	public String getA20005() {
		if(ValidateHelper.isNotEmptyString(this.a20005)){
			a20005 = a20005.trim();
		}
		return a20005;
	}
	public void setA20005(String a20005) {
		this.a20005 = a20005;
	}
	public String getA20006() {
		if(ValidateHelper.isNotEmptyString(this.a20006)){
			a20006 = a20006.trim();
		}
		return a20006;
	}
	public void setA20006(String a20006) {
		this.a20006 = a20006;
	}
	public String getA20007() {
		if(ValidateHelper.isNotEmptyString(this.a20007)){
			a20007 = a20007.trim();
		}
		return a20007;
	}
	public void setA20007(String a20007) {
		this.a20007 = a20007;
	}
	public String getA30000() {
		if(ValidateHelper.isNotEmptyString(this.a30000)){
			a30000 = a30000.trim();
		}
		return a30000;
	}
	public void setA30000(String a30000) {
		this.a30000 = a30000;
	}
	public String getA30001() {
		if(ValidateHelper.isNotEmptyString(this.a30001)){
			a30001 = a30001.trim();
		}
		return a30001;
	}
	public void setA30001(String a30001) {
		this.a30001 = a30001;
	}
	public String getA30002() {
		if(ValidateHelper.isNotEmptyString(this.a30002)){
			a30002 = a30002.trim();
		}
		return a30002;
	}
	public void setA30002(String a30002) {
		this.a30002 = a30002;
	}
	public String getA30003() {
		if(ValidateHelper.isNotEmptyString(this.a30003)){
			a30003 = a30003.trim();
		}
		return a30003;
	}
	public void setA30003(String a30003) {
		this.a30003 = a30003;
	}
	public String getA30004() {
		if(ValidateHelper.isNotEmptyString(this.a30004)){
			a30004 = a30004.trim();
		}
		return a30004;
	}
	public void setA30004(String a30004) {
		this.a30004 = a30004;
	}
	public String getB00000() {
		if(ValidateHelper.isNotEmptyString(this.b00000)){
			b00000 = b00000.trim();
		}
		return b00000;
	}
	public void setB00000(String b00000) {
		this.b00000 = b00000;
	}
	public String getB10000() {
		if(ValidateHelper.isNotEmptyString(this.b10000)){
			b10000 = b10000.trim();
		}
		return b10000;
	}
	public void setB10000(String b10000) {
		this.b10000 = b10000;
	}
	public String getB10001() {
		if(ValidateHelper.isNotEmptyString(this.b10001)){
			b10001 = b10001.trim();
		}
		return b10001;
	}
	public void setB10001(String b10001) {
		this.b10001 = b10001;
	}
	public String getB10002() {
		if(ValidateHelper.isNotEmptyString(this.b10002)){
			b10002 = b10002.trim();
		}
		return b10002;
	}
	public void setB10002(String b10002) {
		this.b10002 = b10002;
	}
	public String getB20000() {
		if(ValidateHelper.isNotEmptyString(this.b20000)){
			b20000 = b20000.trim();
		}
		return b20000;
	}
	public void setB20000(String b20000) {
		this.b20000 = b20000;
	}
	public String getB20001() {
		if(ValidateHelper.isNotEmptyString(this.b20001)){
			b20001 = b20001.trim();
		}
		return b20001;
	}
	public void setB20001(String b20001) {
		this.b20001 = b20001;
	}
	public String getB20002() {
		if(ValidateHelper.isNotEmptyString(this.b20002)){
			b20002 = b20002.trim();
		}
		return b20002;
	}
	public void setB20002(String b20002) {
		this.b20002 = b20002;
	}
	public String getB30000() {
		if(ValidateHelper.isNotEmptyString(this.b30000)){
			b30000 = b30000.trim();
		}
		return b30000;
	}
	public void setB30000(String b30000) {
		this.b30000 = b30000;
	}
	public String getB30001() {
		if(ValidateHelper.isNotEmptyString(this.b30001)){
			b30001 = b30001.trim();
		}
		return b30001;
	}
	public void setB30001(String b30001) {
		this.b30001 = b30001;
	}
	public String getB30002() {
		if(ValidateHelper.isNotEmptyString(this.b30002)){
			b30002 = b30002.trim();
		}
		return b30002;
	}
	public void setB30002(String b30002) {
		this.b30002 = b30002;
	}
	public String getC00000() {
		if(ValidateHelper.isNotEmptyString(this.c00000)){
			c00000 = c00000.trim();
		}
		return c00000;
	}
	public void setC00000(String c00000) {
		this.c00000 = c00000;
	}
	public String getC10000() {
		if(ValidateHelper.isNotEmptyString(this.c10000)){
			c10000 = c10000.trim();
		}
		return c10000;
	}
	public void setC10000(String c10000) {
		this.c10000 = c10000;
	}
	public String getC20000() {
		if(ValidateHelper.isNotEmptyString(this.c20000)){
			c20000 = c20000.trim();
		}
		return c20000;
	}
	public void setC20000(String c20000) {
		this.c20000 = c20000;
	}
	public String getC30000() {
		if(ValidateHelper.isNotEmptyString(this.c30000)){
			c30000 = c30000.trim();
		}
		return c30000;
	}
	public void setC30000(String c30000) {
		this.c30000 = c30000;
	}
	public String getC40000() {
		if(ValidateHelper.isNotEmptyString(this.c40000)){
			c40000 = c40000.trim();
		}
		return c40000;
	}
	public void setC40000(String c40000) {
		this.c40000 = c40000;
	}
	public String getC50000() {
		if(ValidateHelper.isNotEmptyString(this.c50000)){
			c50000 = c50000.trim();
		}
		return c50000;
	}
	public void setC50000(String c50000) {
		this.c50000 = c50000;
	}
	public String getC60000() {
		if(ValidateHelper.isNotEmptyString(this.c60000)){
			c60000 = c60000.trim();
		}
		return c60000;
	}
	public void setC60000(String c60000) {
		this.c60000 = c60000;
	}
	public String getC70000() {
		if(ValidateHelper.isNotEmptyString(this.c70000)){
			c70000 = c70000.trim();
		}
		return c70000;
	}
	public void setC70000(String c70000) {
		this.c70000 = c70000;
	}
	public String getD00000() {
		if(ValidateHelper.isNotEmptyString(this.d00000)){
			d00000 = d00000.trim();
		}
		return d00000;
	}
	public void setD00000(String d00000) {
		this.d00000 = d00000;
	}
	public String getD10000() {
		if(ValidateHelper.isNotEmptyString(this.d10000)){
			d10000 = d10000.trim();
		}
		return d10000;
	}
	public void setD10000(String d10000) {
		this.d10000 = d10000;
	}
	public String getD10001() {
		if(ValidateHelper.isNotEmptyString(this.d10001)){
			d10001 = d10001.trim();
		}
		return d10001;
	}
	public void setD10001(String d10001) {
		this.d10001 = d10001;
	}
	public String getD10002() {
		if(ValidateHelper.isNotEmptyString(this.d10002)){
			d10002 = d10002.trim();
		}
		return d10002;
	}
	public void setD10002(String d10002) {
		this.d10002 = d10002;
	}
	public String getD20000() {
		if(ValidateHelper.isNotEmptyString(this.d20000)){
			d20000 = d20000.trim();
		}
		return d20000;
	}
	public void setD20000(String d20000) {
		this.d20000 = d20000;
	}
	public String getD20001() {
		if(ValidateHelper.isNotEmptyString(this.d20001)){
			d20001 = d20001.trim();
		}
		return d20001;
	}
	public void setD20001(String d20001) {
		this.d20001 = d20001;
	}
	public String getD20002() {
		if(ValidateHelper.isNotEmptyString(this.d20002)){
			d20002 = d20002.trim();
		}
		return d20002;
	}
	public void setD20002(String d20002) {
		this.d20002 = d20002;
	}
	public String getD20003() {
		if(ValidateHelper.isNotEmptyString(this.d20003)){
			d20003 = d20003.trim();
		}
		return d20003;
	}
	public void setD20003(String d20003) {
		this.d20003 = d20003;
	}
	public String getD20004() {
		if(ValidateHelper.isNotEmptyString(this.d20004)){
			d20004 = d20004.trim();
		}
		return d20004;
	}
	public void setD20004(String d20004) {
		this.d20004 = d20004;
	}
	public String getE00000() {
		if(ValidateHelper.isNotEmptyString(this.e00000)){
			e00000 = e00000.trim();
		}
		return e00000;
	}
	public void setE00000(String e00000) {
		this.e00000 = e00000;
	}
	public String getE10001() {
		if(ValidateHelper.isNotEmptyString(this.e10001)){
			e10001 = e10001.trim();
		}
		return e10001;
	}
	public void setE10001(String e10001) {
		this.e10001 = e10001;
	}
	public String getE10002() {
		if(ValidateHelper.isNotEmptyString(this.e10002)){
			e10002 = e10002.trim();
		}
		return e10002;
	}
	public void setE10002(String e10002) {
		this.e10002 = e10002;
	}
	public String getE20001() {
		if(ValidateHelper.isNotEmptyString(this.e20001)){
			e20001 = e20001.trim();
		}
		return e20001;
	}
	public void setE20001(String e20001) {
		this.e20001 = e20001;
	}
	public String getE20002() {
		if(ValidateHelper.isNotEmptyString(this.e20002)){
			e20002 = e20002.trim();
		}
		return e20002;
	}
	public void setE20002(String e20002) {
		this.e20002 = e20002;
	}
	public String getE30001() {
		if(ValidateHelper.isNotEmptyString(this.e30001)){
			e30001 = e30001.trim();
		}
		return e30001;
	}
	public void setE30001(String e30001) {
		this.e30001 = e30001;
	}
	public String getE30002() {
		if(ValidateHelper.isNotEmptyString(this.e30002)){
			e30002 = e30002.trim();
		}
		return e30002;
	}
	public void setE30002(String e30002) {
		this.e30002 = e30002;
	}
	public String getE40001() {
		if(ValidateHelper.isNotEmptyString(this.e40001)){
			e40001 = e40001.trim();
		}
		return e40001;
	}
	public void setE40001(String e40001) {
		this.e40001 = e40001;
	}
	public String getE40002() {
		if(ValidateHelper.isNotEmptyString(this.e40002)){
			e40002 = e40002.trim();
		}
		return e40002;
	}
	public void setE40002(String e40002) {
		this.e40002 = e40002;
	}
	public String getF00000() {
		if(ValidateHelper.isNotEmptyString(this.f00000)){
			f00000 = f00000.trim();
		}
		return f00000;
	}
	public void setF00000(String f00000) {
		this.f00000 = f00000;
	}
	public String getPm() {
		if(ValidateHelper.isNotEmptyString(this.pm)){
			pm = pm.trim();
			if(ValidateHelper.isEmptyString(this.pm)){
				pm = "1";
			}
		}else{
			pm = "1";
		}
		return pm;
	}
	public void setPm(String pm) {
		this.pm = pm;
	}
	public String getMjxm() {
		if(ValidateHelper.isNotEmptyString(this.mjxm)){
			mjxm = mjxm.trim();
			if(ValidateHelper.isEmptyString(this.mjxm)){
				mjxm = " ";
			}
		}else{
			mjxm = " ";
		}
		return mjxm;
	}
	public void setMjxm(String mjxm) {
		this.mjxm = mjxm;
	}
	public String getB40000() {
		if(ValidateHelper.isNotEmptyString(this.b40000)){
			b40000 = b40000.trim();
		}
		return b40000;
	}
	public void setB40000(String b40000) {
		this.b40000 = b40000;
	}
	public String getB50000() {
		if(ValidateHelper.isNotEmptyString(this.b50000)){
			b50000 = b50000.trim();
		}
		return b50000;
	}
	public void setB50000(String b50000) {
		this.b50000 = b50000;
	}
	public String getA30005() {
		return a30005;
	}
	public void setA30005(String a30005) {
		this.a30005 = a30005;
	}
	public String getA30006() {
		return a30006;
	}
	public void setA30006(String a30006) {
		this.a30006 = a30006;
	}
	public String getA30007() {
		return a30007;
	}
	public void setA30007(String a30007) {
		this.a30007 = a30007;
	}
}