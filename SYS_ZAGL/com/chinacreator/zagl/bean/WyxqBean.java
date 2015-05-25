package com.chinacreator.zagl.bean;

import com.chinacreator.common.bean.LoginInfo;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.helper.ActionContextHelper;


/**
 * 物业小区
 */
public class WyxqBean extends OperateBean {

private static final long serialVersionUID = 7101161749446746411L;

	private String zxyy;    //注销原因
	private String id;    //主键ID
	private String xqmc;    //小区名称
	private String sssqmc;    //所属社区名称
	private String sssqdm;    //所属社区代码
	private String ssjwqdm;    //所属警务区代码
	private String ssjwqmc;    //所属警务区名称
	private String dzmc;    //地址名称
	private String wygs;    //物业公司
	private String wygsfzr;    //物业公司负责人
	private String lds;    //楼栋数
	private String jcks;    //进出口数
	private String sfyjztcc;    //是否有集中停车场
	private String tcws;    //停车位数
	private String dwfzrsfzh; //单位负责人身份证
	private String dwfzr;    //单位负责人
	private String abfzr;    //安保负责人
	private String dwfzrlxdh;    //单位负责人联系电话
	private String abfzrlxdh;    //安保负责人联系电话
	private String dwdh;    //单位电话
	private String dwbz;    //单位备注
	private String cyrs;    //从业人员数
	private String bwll;    //保卫力量
	private String bas;    //保安数
	private String wssysbas;    //五十岁以上保安数
	private String fhzbs;    //防护装备数
	private String jgs;    //警棍数
	private String gws;    //岗位数
	private String zbrs;    //值班人数
	private String gwwzjrs;    //岗位位置及人数
	private String fbsxq;    //是否封闭式小区
	private String wq;    //围墙
	private String dymj;    //单元门禁
	private String wfqt;    //物防其他信息
	private String wfbz;    //物防备注
	private String spjks;    //视频监控数
	private String dzwl;    //电子围栏
	private String mjxt;    //门禁系统
	private String jkzx;    //监控中心
	private String jfqt;    //技防其他信息
	private String sfzxzpba;    //是否自行招聘保安
	private String pqbafwgs;    //聘请保安服务公司
	private String sfba;    //是否备案
	private String pqbas;    //聘请保安数
	private String bazh;    //备案证号
	private String bafwqy;    //保安服务区域
	private String bajgbz;    //保安监管备注
	private String ssfxsjdm;    //所属分县市局代码
	private String ssfxsjmc;    //所属分县市局名称
	private String sspcsdm;    //所属派出所代码
	private String sspcsmc;    //所属派出所名称
	private String sqmjxm;    //社区民警姓名
	private String sqmjjh;    //社区民警警号
	private String zxbs;    //注销标识
	private String zxbsmc;  //注销标识名称
	
	/**
	 * 有无物业公司
	 */
	private String ywwygs;
	
	
	public String getZxbsmc() {
		if(CommonConstant.ZX_DIC_ZC.equals(this.zxbs)){
			zxbsmc = "正常";
		}else if(CommonConstant.ZX_DIC_ZX.equals(this.zxbs)){
			zxbsmc = "<font color='red'>已注销</font>";
		}
		return zxbsmc;
	}
	public void setZxbsmc(String zxbsmc) {
		this.zxbsmc = zxbsmc;
	}
	private String zxsj; //注销时间
	
	private String xqmj;	//小区面积
	private String jlrq;	//建立日期
	
	
	public String getZxsj() {
		return zxsj;
	}
	public void setZxsj(String zxsj) {
		this.zxsj = zxsj;
	}
	public String getXqmj() {
		return xqmj;
	}
	public void setXqmj(String xqmj) {
		this.xqmj = xqmj;
	}
	public String getJlrq() {
		return jlrq;
	}
	public void setJlrq(String jlrq) {
		this.jlrq = jlrq;
	}
	private String cz;
	
	public String getZxyy() {
		return zxyy;
	}
	public String getId() {
		return id;
	}
	public String getXqmc() {
		return xqmc;
	}
	public String getSssqmc() {
		return sssqmc;
	}
	public String getSssqdm() {
		return sssqdm;
	}
	public String getSsjwqdm() {
		return ssjwqdm;
	}
	public String getSsjwqmc() {
		return ssjwqmc;
	}
	public String getDzmc() {
		return dzmc;
	}
	public String getWygs() {
		return wygs;
	}
	public String getWygsfzr() {
		return wygsfzr;
	}
	public String getLds() {
		return lds;
	}
	public String getJcks() {
		return jcks;
	}
	public String getSfyjztcc() {
		return sfyjztcc;
	}
	public String getTcws() {
		return tcws;
	}
	public String getDwfzr() {
		return dwfzr;
	}
	public String getAbfzr() {
		return abfzr;
	}
	public String getDwfzrlxdh() {
		return dwfzrlxdh;
	}
	public String getAbfzrlxdh() {
		return abfzrlxdh;
	}
	public String getDwdh() {
		return dwdh;
	}
	public String getDwbz() {
		return dwbz;
	}
	public String getCyrs() {
		return cyrs;
	}
	public String getBwll() {
		return bwll;
	}
	public String getBas() {
		return bas;
	}
	public String getWssysbas() {
		return wssysbas;
	}
	public String getFhzbs() {
		return fhzbs;
	}
	public String getJgs() {
		return jgs;
	}
	public String getGws() {
		return gws;
	}
	public String getZbrs() {
		return zbrs;
	}
	public String getGwwzjrs() {
		return gwwzjrs;
	}
	public String getFbsxq() {
		return fbsxq;
	}
	public String getWq() {
		return wq;
	}
	public String getDymj() {
		return dymj;
	}
	public String getWfqt() {
		return wfqt;
	}
	public String getWfbz() {
		return wfbz;
	}
	public String getSpjks() {
		return spjks;
	}
	public String getDzwl() {
		return dzwl;
	}
	public String getMjxt() {
		return mjxt;
	}
	public String getJkzx() {
		return jkzx;
	}
	public String getJfqt() {
		return jfqt;
	}
	public String getSfzxzpba() {
		return sfzxzpba;
	}
	public String getPqbafwgs() {
		return pqbafwgs;
	}
	public String getSfba() {
		return sfba;
	}
	public String getPqbas() {
		return pqbas;
	}
	public String getBazh() {
		return bazh;
	}
	public String getBafwqy() {
		return bafwqy;
	}
	public String getBajgbz() {
		return bajgbz;
	}
	public String getSsfxsjdm() {
		return ssfxsjdm;
	}
	public String getSsfxsjmc() {
		return ssfxsjmc;
	}
	public String getSspcsdm() {
		return sspcsdm;
	}
	public String getSqmjxm() {
		return sqmjxm;
	}
	public String getSqmjjh() {
		return sqmjjh;
	}
	public void setZxyy(String zxyy) {
		this.zxyy = zxyy;
	}
	public void setId(String id) {
		this.id = id;
	}
	public void setXqmc(String xqmc) {
		this.xqmc = xqmc;
	}
	public void setSssqmc(String sssqmc) {
		this.sssqmc = sssqmc;
	}
	public void setSssqdm(String sssqdm) {
		this.sssqdm = sssqdm;
	}
	public void setSsjwqdm(String ssjwqdm) {
		this.ssjwqdm = ssjwqdm;
	}
	public void setSsjwqmc(String ssjwqmc) {
		this.ssjwqmc = ssjwqmc;
	}
	public void setDzmc(String dzmc) {
		this.dzmc = dzmc;
	}
	public void setWygs(String wygs) {
		this.wygs = wygs;
	}
	public void setWygsfzr(String wygsfzr) {
		this.wygsfzr = wygsfzr;
	}
	public void setLds(String lds) {
		this.lds = lds;
	}
	public void setJcks(String jcks) {
		this.jcks = jcks;
	}
	public void setSfyjztcc(String sfyjztcc) {
		this.sfyjztcc = sfyjztcc;
	}
	public void setTcws(String tcws) {
		this.tcws = tcws;
	}
	public void setDwfzr(String dwfzr) {
		this.dwfzr = dwfzr;
	}
	public void setAbfzr(String abfzr) {
		this.abfzr = abfzr;
	}
	public void setDwfzrlxdh(String dwfzrlxdh) {
		this.dwfzrlxdh = dwfzrlxdh;
	}
	public void setAbfzrlxdh(String abfzrlxdh) {
		this.abfzrlxdh = abfzrlxdh;
	}
	public void setDwdh(String dwdh) {
		this.dwdh = dwdh;
	}
	public void setDwbz(String dwbz) {
		this.dwbz = dwbz;
	}
	public void setCyrs(String cyrs) {
		this.cyrs = cyrs;
	}
	public void setBwll(String bwll) {
		this.bwll = bwll;
	}
	public void setBas(String bas) {
		this.bas = bas;
	}
	public void setWssysbas(String wssysbas) {
		this.wssysbas = wssysbas;
	}
	public void setFhzbs(String fhzbs) {
		this.fhzbs = fhzbs;
	}
	public void setJgs(String jgs) {
		this.jgs = jgs;
	}
	public void setGws(String gws) {
		this.gws = gws;
	}
	public void setZbrs(String zbrs) {
		this.zbrs = zbrs;
	}
	public void setGwwzjrs(String gwwzjrs) {
		this.gwwzjrs = gwwzjrs;
	}
	public void setFbsxq(String fbsxq) {
		this.fbsxq = fbsxq;
	}
	public void setWq(String wq) {
		this.wq = wq;
	}
	public void setDymj(String dymj) {
		this.dymj = dymj;
	}
	public void setWfqt(String wfqt) {
		this.wfqt = wfqt;
	}
	public void setWfbz(String wfbz) {
		this.wfbz = wfbz;
	}
	public void setSpjks(String spjks) {
		this.spjks = spjks;
	}
	public void setDzwl(String dzwl) {
		this.dzwl = dzwl;
	}
	public void setMjxt(String mjxt) {
		this.mjxt = mjxt;
	}
	public void setJkzx(String jkzx) {
		this.jkzx = jkzx;
	}
	public void setJfqt(String jfqt) {
		this.jfqt = jfqt;
	}
	public void setSfzxzpba(String sfzxzpba) {
		this.sfzxzpba = sfzxzpba;
	}
	public void setPqbafwgs(String pqbafwgs) {
		this.pqbafwgs = pqbafwgs;
	}
	public void setSfba(String sfba) {
		this.sfba = sfba;
	}
	public void setPqbas(String pqbas) {
		this.pqbas = pqbas;
	}
	public void setBazh(String bazh) {
		this.bazh = bazh;
	}
	public void setBafwqy(String bafwqy) {
		this.bafwqy = bafwqy;
	}
	public void setBajgbz(String bajgbz) {
		this.bajgbz = bajgbz;
	}
	public void setSsfxsjdm(String ssfxsjdm) {
		this.ssfxsjdm = ssfxsjdm;
	}
	public void setSsfxsjmc(String ssfxsjmc) {
		this.ssfxsjmc = ssfxsjmc;
	}
	public void setSspcsdm(String sspcsdm) {
		this.sspcsdm = sspcsdm;
	}
	public String getSspcsmc() {
		return sspcsmc;
	}
	public void setSspcsmc(String sspcsmc) {
		this.sspcsmc = sspcsmc;
	}
	public void setSqmjxm(String sqmjxm) {
		this.sqmjxm = sqmjxm;
	}
	public void setSqmjjh(String sqmjjh) {
		this.sqmjjh = sqmjjh;
	}
	public String getZxbs() {
		return zxbs;
	}
	public void setZxbs(String zxbs) {
		this.zxbs = zxbs;
	}
	public String getCz() {
		cz = "<span class=\"cps_span_href\" onclick=\"openWyxqWin('" + this.id + "','" + CommonConstant.OPERTYPE_DETAIL + "')\" style=\"color:green\">详情</span>&nbsp;";

		LoginInfo login = ActionContextHelper.getLoginInfo();
		if(login.getLeve() == 5 || login.getLeve() == 3 || login.getLeve() == 2){
			if(CommonConstant.ZX_DIC_ZC.equals(this.zxbs)){
				cz += "<span class=\"cps_span_href\" onclick=\"openWyxqWin('" + this.id + "','" + CommonConstant.OPERTYPE_UPDATE + "')\" style=\"color:green\">修改</span>&nbsp;";
			}
		}
		if(login.getLeve() == 5){
			cz += "<span class=\"cps_span_href\" onclick=\"openWyxqZxWin('" + this.id + "')\" style=\"color:green\">注销</span>&nbsp;";
			if("1".equals(this.ywwygs)){
				cz += "<span class=\"cps_span_href\" onclick=\"openWyxqAJWin('" + this.id + "','" + CommonConstant.OPERTYPE_ADD + "')\" style=\"color:green\">安全检查</span>&nbsp;";
			}
		}
		
		return cz;
	}
	public void setCz(String cz) {
		this.cz = cz;
	}
	public String getYwwygs() {
		return ywwygs;
	}
	public void setYwwygs(String ywwygs) {
		this.ywwygs = ywwygs;
	}
	public String getDwfzrsfzh() {
		return dwfzrsfzh;
	}
	public void setDwfzrsfzh(String dwfzrsfzh) {
		this.dwfzrsfzh = dwfzrsfzh;
	}
}
