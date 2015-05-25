package com.chinacreator.afgl.bean;

/**
 * 卡口信息
 *
 */
public class KkxxBean {
	private String kkbh;  			//卡口编号
	private String kkmc; 			//卡口名称
	private String kkjls; 			//卡口警力数
	private String kkzzxfrs; 		//卡口专职巡防人数
	private String kkzbqk; 			//卡口装备情况
	private String kkcjsj; 			//卡口创建时间
	private String sszrqdm; 		//所属责任区代码
	private String sszrqmc; 		//所属责任区名称
	private String kkwz; 			//卡口位置
	private String kkfw; 			//卡口范围
	private String zxbs; 			//注销标识
	private String zxbsmc; 			//注销标识名称；1：已注销；0：使用中
	private String zxrq; 			//注销日期
	private String zxyy; 			//注销原因
	private String djrxm; 			//登记人姓名
	private String djrjh; 			//登记人警号
	private String djdwdm; 			//登记单位代码
	private String djdwmc; 			//登记单位名称
	private String djsj;			//登记时间
	private String cz;				//操作
	private String isCheckbox;				//复选框
	private String czbs;				//操作标识；用来标识新增、修改、删除
	public String getKkbh() {
		return kkbh;
	}
	public void setKkbh(String kkbh) {
		this.kkbh = kkbh;
	}
	public String getKkmc() {
		return kkmc;
	}
	public void setKkmc(String kkmc) {
		this.kkmc = kkmc;
	}
	public String getKkjls() {
		return kkjls;
	}
	public void setKkjls(String kkjls) {
		this.kkjls = kkjls;
	}
	public String getKkzzxfrs() {
		return kkzzxfrs;
	}
	public void setKkzzxfrs(String kkzzxfrs) {
		this.kkzzxfrs = kkzzxfrs;
	}
	public String getKkzbqk() {
		return kkzbqk;
	}
	public void setKkzbqk(String kkzbqk) {
		this.kkzbqk = kkzbqk;
	}
	public String getKkcjsj() {
		return kkcjsj;
	}
	public void setKkcjsj(String kkcjsj) {
		this.kkcjsj = kkcjsj;
	}
	public String getSszrqdm() {
		return sszrqdm;
	}
	public void setSszrqdm(String sszrqdm) {
		this.sszrqdm = sszrqdm;
	}
	public String getSszrqmc() {
		return sszrqmc;
	}
	public void setSszrqmc(String sszrqmc) {
		this.sszrqmc = sszrqmc;
	}
	public String getKkwz() {
		return kkwz;
	}
	public void setKkwz(String kkwz) {
		this.kkwz = kkwz;
	}
	public String getKkfw() {
		return kkfw;
	}
	public void setKkfw(String kkfw) {
		this.kkfw = kkfw;
	}
	public String getZxbs() {
		return zxbs;
	}
	public void setZxbs(String zxbs) {
		this.zxbs = zxbs;
	}
	public String getZxrq() {
		return zxrq;
	}
	public void setZxrq(String zxrq) {
		this.zxrq = zxrq;
	}
	public String getZxyy() {
		return zxyy;
	}
	public void setZxyy(String zxyy) {
		this.zxyy = zxyy;
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
	public String getDjsj() {
		return djsj;
	}
	public void setDjsj(String djsj) {
		this.djsj = djsj;
	}
	public String getCz() {
		return cz;
	}
	public void setCz(String cz) {
		this.cz = cz;
	}
	public String getCzbs() {
		return czbs;
	}
	public void setCzbs(String czbs) {
		this.czbs = czbs;
	}
	public String getZxbsmc() {
		if("1".equals(zxbs)){
			zxbsmc = "已注销";
		}else{
			zxbsmc = "使用中";
		}
		return zxbsmc;
	}
	public void setZxbsmc(String zxbsmc) {
		this.zxbsmc = zxbsmc;
	}
	public String getIsCheckbox() {
		return isCheckbox;
	}
	public void setIsCheckbox(String isCheckbox) {
		this.isCheckbox = isCheckbox;
	}
	
}
