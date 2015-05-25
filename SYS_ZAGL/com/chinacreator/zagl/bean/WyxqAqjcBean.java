package com.chinacreator.zagl.bean;

public class WyxqAqjcBean extends OperateBean{
	private static final long serialVersionUID = -8732448354618893499L;
	
	private String id;	//主键ID
	private String xqmc;	//物业小区名称（单位名称）
	private String sspcsdm;	//所属派出所代码
	private String sspcsmc;	//所属派出所名称
	private String jcmjjh;	//安全检查民警警号
	private String jcmjxm;	//安全检查民警姓名
	private String jcrq;	//安全检查日期
	private String qkms;	//安全检查情况描述
	/*制度防范
	 * 
	 */
	private String zdlsnbzabwzd;	//制定和落实内部治安保卫制度（0否，1是）
	private String lsnbzabwzr;	//落实内部治安保卫工作责任制（0否，1是）
	private String lsygaqffpx;	//落实员工安全防范培训教育（0否，1是）
	private String lfrywpdjsx;	//来访人员及物品出入登记手续（0否，1是）
	/*
	 * 技防
	 */
	private String dymjxt;	//单元门禁系统（0否，1是）
	private String spbjxtyz;	//视频监控或入侵报警系统是否运转正常（0否，1是）
	/**
	 * 物防
	 */
	private String sfjztcc;	//是否有集中停车场（0否，1是）
	private String yhbwfdcfdm;	//重点要害部位防盗窗和防盗门（0否，1是）
	private String wqsfwh;	//封闭式小区围墙是否完好（0否，1是）
	/**
	 * 人防
	 */
	private String sfzgabry;	//配备足够数量的安保人员（0否，1是）
	private String sfgqpx;	//进行上岗前培训和定期开展培训（0否，1是）
	private String sffwqxbj;	//配备使用防卫器械和报警装备（0否，1是）
	/**
	 * 保安监管
	 */
	private String sfcsgz;	//保安员全部持《保安员证》上岗（0否，1是）
	private String sfdqjy;	//定期开展教育、培训（0否，1是）
	private String sfybafz;	//保安员是否着符合要求的保安员服装上岗（0否，1是）
	private String sfrzlz;	//保安员是否认真履职，有较强的安全防范意识（0否，1是）
	private String sfzzabdw;	//是否为自招保安员单位（0否，1是）
	private String sfblzzba;	//是否办理自招保安员单位备案（0否，1是）
	/**
	 * 关联外键
	 */
	private String wyxdwqid;	//关联物业小区单位表t_za_wyxq的主键ID
	
	/**
	 * 公用字段
	 * @return
	 */

	private String aqyhms;  //隐患描述 aqyhms
	private String mjclyj; // 民警处理意见  mjclyj
	private String aqcl; // 处理  aqcl
	private String aqzgqx;  // 整改期限(天) aqzgqx
	private String sldspyj; // 所领导审批意见 sldspyj
	private String sldjh; // 所领导警号  sldjh
	private String sldxm;  // 所领导姓名 sldxm
	private String sldspsj; // 所领导审批时间 sldspsj
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getXqmc() {
		return xqmc;
	}
	public void setXqmc(String xqmc) {
		this.xqmc = xqmc;
	}
	public String getSspcsdm() {
		return sspcsdm;
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
	public String getJcmjjh() {
		return jcmjjh;
	}
	public void setJcmjjh(String jcmjjh) {
		this.jcmjjh = jcmjjh;
	}
	public String getJcmjxm() {
		return jcmjxm;
	}
	public void setJcmjxm(String jcmjxm) {
		this.jcmjxm = jcmjxm;
	}
	public String getJcrq() {
		return jcrq;
	}
	public void setJcrq(String jcrq) {
		this.jcrq = jcrq;
	}
	public String getQkms() {
		return qkms;
	}
	public void setQkms(String qkms) {
		this.qkms = qkms;
	}
	public String getZdlsnbzabwzd() {
		return zdlsnbzabwzd;
	}
	public void setZdlsnbzabwzd(String zdlsnbzabwzd) {
		this.zdlsnbzabwzd = zdlsnbzabwzd;
	}
	public String getLsnbzabwzr() {
		return lsnbzabwzr;
	}
	public void setLsnbzabwzr(String lsnbzabwzr) {
		this.lsnbzabwzr = lsnbzabwzr;
	}
	public String getLsygaqffpx() {
		return lsygaqffpx;
	}
	public void setLsygaqffpx(String lsygaqffpx) {
		this.lsygaqffpx = lsygaqffpx;
	}
	public String getLfrywpdjsx() {
		return lfrywpdjsx;
	}
	public void setLfrywpdjsx(String lfrywpdjsx) {
		this.lfrywpdjsx = lfrywpdjsx;
	}
	public String getDymjxt() {
		return dymjxt;
	}
	public void setDymjxt(String dymjxt) {
		this.dymjxt = dymjxt;
	}
	public String getSpbjxtyz() {
		return spbjxtyz;
	}
	public void setSpbjxtyz(String spbjxtyz) {
		this.spbjxtyz = spbjxtyz;
	}
	public String getSfjztcc() {
		return sfjztcc;
	}
	public void setSfjztcc(String sfjztcc) {
		this.sfjztcc = sfjztcc;
	}
	public String getYhbwfdcfdm() {
		return yhbwfdcfdm;
	}
	public void setYhbwfdcfdm(String yhbwfdcfdm) {
		this.yhbwfdcfdm = yhbwfdcfdm;
	}
	public String getWqsfwh() {
		return wqsfwh;
	}
	public void setWqsfwh(String wqsfwh) {
		this.wqsfwh = wqsfwh;
	}
	public String getSfzgabry() {
		return sfzgabry;
	}
	public void setSfzgabry(String sfzgabry) {
		this.sfzgabry = sfzgabry;
	}
	public String getSfgqpx() {
		return sfgqpx;
	}
	public void setSfgqpx(String sfgqpx) {
		this.sfgqpx = sfgqpx;
	}
	public String getSffwqxbj() {
		return sffwqxbj;
	}
	public void setSffwqxbj(String sffwqxbj) {
		this.sffwqxbj = sffwqxbj;
	}
	public String getSfcsgz() {
		return sfcsgz;
	}
	public void setSfcsgz(String sfcsgz) {
		this.sfcsgz = sfcsgz;
	}
	public String getSfdqjy() {
		return sfdqjy;
	}
	public void setSfdqjy(String sfdqjy) {
		this.sfdqjy = sfdqjy;
	}
	public String getSfybafz() {
		return sfybafz;
	}
	public void setSfybafz(String sfybafz) {
		this.sfybafz = sfybafz;
	}
	public String getSfrzlz() {
		return sfrzlz;
	}
	public void setSfrzlz(String sfrzlz) {
		this.sfrzlz = sfrzlz;
	}
	public String getSfzzabdw() {
		return sfzzabdw;
	}
	public void setSfzzabdw(String sfzzabdw) {
		this.sfzzabdw = sfzzabdw;
	}
	public String getSfblzzba() {
		return sfblzzba;
	}
	public void setSfblzzba(String sfblzzba) {
		this.sfblzzba = sfblzzba;
	}
	public String getWyxdwqid() {
		return wyxdwqid;
	}
	public void setWyxdwqid(String wyxdwqid) {
		this.wyxdwqid = wyxdwqid;
	}
	public String getAqyhms() {
		return aqyhms;
	}
	public void setAqyhms(String aqyhms) {
		this.aqyhms = aqyhms;
	}
	public String getMjclyj() {
		return mjclyj;
	}
	public void setMjclyj(String mjclyj) {
		this.mjclyj = mjclyj;
	}
	public String getAqcl() {
		return aqcl;
	}
	public void setAqcl(String aqcl) {
		this.aqcl = aqcl;
	}
	public String getAqzgqx() {
		return aqzgqx;
	}
	public void setAqzgqx(String aqzgqx) {
		this.aqzgqx = aqzgqx;
	}
	public String getSldspyj() {
		return sldspyj;
	}
	public void setSldspyj(String sldspyj) {
		this.sldspyj = sldspyj;
	}
	public String getSldjh() {
		return sldjh;
	}
	public void setSldjh(String sldjh) {
		this.sldjh = sldjh;
	}
	public String getSldxm() {
		return sldxm;
	}
	public void setSldxm(String sldxm) {
		this.sldxm = sldxm;
	}
	public String getSldspsj() {
		return sldspsj;
	}
	public void setSldspsj(String sldspsj) {
		this.sldspsj = sldspsj;
	}

	
	
}
