package com.chinacreator.zagl.bean;

import com.chinacreator.common.bean.BaseValue;
import com.chinacreator.common.helper.DictionaryCacheHellper;
import com.chinacreator.common.helper.ValidateHelper;

/**内保单位**/
public class NbdwBean extends BaseValue {

	private static final long serialVersionUID = -7760824709575199380L;
	
	/**
	 * 内保编号  主键(NB+12位单位代码  + 6位日期 + 5位流水号)
	 */
	private String nbdwbh;
	
	/**
	 * 机构编号
	 */
	private String jgbh;
	
	/**
	 * 单位分类
	 */
	private String dwfl;
	
	private String dwflmc;
	
	/**
	 * 单位细类
	 */
	private String dwxl;
	
	private String dwxlmc;
	
	/**
	 * 单位性质
	 */
	private String dwxz;
	private String dwxzmc;
	
	/**
	 * 技防情况
	 */
	private String jfqk;
	
	/**
	 * 管理部门
	 */
	private String glbm;
	
	/**
	 * 保卫机构设置
	 */
	private String bwjgsz;
	
	/**
	 * 生产经营状况
	 */
	private String scjyzk;
	
	/**
	 * 重要部位级别
	 */
	private String zybws;
	
	
	/**
	 * 要害部位数
	 */
	private String yhbws;
	
	/**
	 * 重点等级
	 */
	private String zddj;
	
	private String zddjmc;
	
	/**
	 * 判定依据
	 */
	private String pdyj;
	
	/**
	 * 年利润
	 */
	private String nlr;
	
	/**
	 * 年销售额
	 */
	private String nxse;
	
	/**
	 * 在岗职工数
	 */
	private String zgzgs;
	
	/**
	 * 外聘专家数
	 */
	private String wpzjs;
	
	/**
	 * 临时工数
	 */
	private String lsgs;
	
	/**
	 * 外籍师生员工数
	 */
	private String wjssygs;
	
	/**
	 * 职工学生人数
	 */
	private String zgxsrs;
	
	/**
	 * 港澳台师生员工数
	 */
	private String gatssygs;
	
	/**
	 * 少数民族师生员工
	 */
	private String ssmzssygs;
	
	/**
	 * 保卫组织类别
	 */
	private String bwzzlb;
	
	/**
	 * 保卫部门负责人
	 */
	private String bwbmfzr;
	
	/**
	 * 保卫负责人联系电话
	 */
	private String bwfzrlxdh;
	
	/**
	 * 专职保卫干部数
	 */
	private String zzbwgbs;
	
	/**
	 * 兼职保卫干部数
	 */
	private String jzbwgbs;
	
	/**
	 * 经警数
	 */
	private String jjs;
	
	/**
	 * 保安数
	 */
	private String bas;
	
	/**
	 * 护卫人数
	 */
	private String hwrs;
	
	/**
	 * 护卫犬数
	 */
	private String hwqs;
	
	/**
	 * 签订治安责任书日期
	 */
	private String qdzazrssj;
	
	/**
	 * 装备电台数
	 */
	private String zbdts;
	
	/**
	 * 装备摩托车数
	 */
	private String zbmtcs;
	
	/**
	 * 装备情况
	 */
	private String zbqk;

	private String jgs;
	private String zbqcs;
	private String sfyjzb;
	private String sfnwwht;
	private String ytwzym;
	private String nbjywmc;
	private String bwzzmc;
	private String hlwckip;
	private String nbbbsmc;
	private String bz;
	private String dwllr;
	private String bwbmfzrsfzh;
	private String ltxrys;
	private String xgzgs;
	private String xjygs;
	
	public String getNbdwbh() {
		return nbdwbh;
	}

	public void setNbdwbh(String nbdwbh) {
		this.nbdwbh = nbdwbh;
	}

	public String getJgbh() {
		return jgbh;
	}

	public void setJgbh(String jgbh) {
		this.jgbh = jgbh;
	}

	public String getDwfl() {
		return dwfl;
	}

	public void setDwfl(String dwfl) {
		this.dwfl = dwfl;
	}

	public String getDwxz() {
		return dwxz;
	}

	public void setDwxz(String dwxz) {
		this.dwxz = dwxz;
	}

	public String getJfqk() {
		return jfqk;
	}

	public void setJfqk(String jfqk) {
		this.jfqk = jfqk;
	}

	public String getGlbm() {
		return glbm;
	}

	public void setGlbm(String glbm) {
		this.glbm = glbm;
	}

	public String getBwjgsz() {
		return bwjgsz;
	}

	public void setBwjgsz(String bwjgsz) {
		this.bwjgsz = bwjgsz;
	}

	public String getScjyzk() {
		return scjyzk;
	}

	public void setScjyzk(String scjyzk) {
		this.scjyzk = scjyzk;
	}

	public String getZybws() {
		return zybws;
	}

	public String getDwxl() {
		return dwxl;
	}

	public void setDwxl(String dwxl) {
		this.dwxl = dwxl;
	}

	public void setZybws(String zybws) {
		this.zybws = zybws;
	}

	public String getYhbws() {
		return yhbws;
	}

	public void setYhbws(String yhbws) {
		this.yhbws = yhbws;
	}

	public String getZddj() {
		return zddj;
	}

	public void setZddj(String zddj) {
		this.zddj = zddj;
	}

	public String getPdyj() {
		return pdyj;
	}

	public void setPdyj(String pdyj) {
		this.pdyj = pdyj;
	}

	public String getNlr() {
		return nlr;
	}

	public void setNlr(String nlr) {
		this.nlr = nlr;
	}

	public String getNxse() {
		return nxse;
	}

	public void setNxse(String nxse) {
		this.nxse = nxse;
	}

	public String getZgzgs() {
		return zgzgs;
	}

	public void setZgzgs(String zgzgs) {
		this.zgzgs = zgzgs;
	}

	public String getWpzjs() {
		return wpzjs;
	}

	public void setWpzjs(String wpzjs) {
		this.wpzjs = wpzjs;
	}

	public String getLsgs() {
		return lsgs;
	}

	public void setLsgs(String lsgs) {
		this.lsgs = lsgs;
	}

	public String getWjssygs() {
		return wjssygs;
	}

	public void setWjssygs(String wjssygs) {
		this.wjssygs = wjssygs;
	}

	public String getZgxsrs() {
		return zgxsrs;
	}

	public void setZgxsrs(String zgxsrs) {
		this.zgxsrs = zgxsrs;
	}

	public String getGatssygs() {
		return gatssygs;
	}

	public void setGatssygs(String gatssygs) {
		this.gatssygs = gatssygs;
	}

	public String getSsmzssygs() {
		return ssmzssygs;
	}

	public void setSsmzssygs(String ssmzssygs) {
		this.ssmzssygs = ssmzssygs;
	}

	public String getBwzzlb() {
		return bwzzlb;
	}

	public void setBwzzlb(String bwzzlb) {
		this.bwzzlb = bwzzlb;
	}

	public String getBwbmfzr() {
		return bwbmfzr;
	}

	public void setBwbmfzr(String bwbmfzr) {
		this.bwbmfzr = bwbmfzr;
	}

	public String getBwfzrlxdh() {
		return bwfzrlxdh;
	}

	public void setBwfzrlxdh(String bwfzrlxdh) {
		this.bwfzrlxdh = bwfzrlxdh;
	}

	public String getZzbwgbs() {
		return zzbwgbs;
	}

	public void setZzbwgbs(String zzbwgbs) {
		this.zzbwgbs = zzbwgbs;
	}

	public String getJzbwgbs() {
		return jzbwgbs;
	}

	public void setJzbwgbs(String jzbwgbs) {
		this.jzbwgbs = jzbwgbs;
	}

	public String getJjs() {
		return jjs;
	}

	public void setJjs(String jjs) {
		this.jjs = jjs;
	}

	public String getBas() {
		return bas;
	}

	public void setBas(String bas) {
		this.bas = bas;
	}

	public String getHwrs() {
		return hwrs;
	}

	public void setHwrs(String hwrs) {
		this.hwrs = hwrs;
	}

	public String getHwqs() {
		return hwqs;
	}

	public void setHwqs(String hwqs) {
		this.hwqs = hwqs;
	}

	public String getQdzazrssj() {
		return qdzazrssj;
	}

	public void setQdzazrssj(String qdzazrssj) {
		this.qdzazrssj = qdzazrssj;
	}

	public String getZbdts() {
		return zbdts;
	}

	public void setZbdts(String zbdts) {
		this.zbdts = zbdts;
	}

	public String getZbmtcs() {
		return zbmtcs;
	}

	public void setZbmtcs(String zbmtcs) {
		this.zbmtcs = zbmtcs;
	}

	public String getZbqk() {
		return zbqk;
	}

	public void setZbqk(String zbqk) {
		this.zbqk = zbqk;
	}

	public String getJgs()
	{
		return jgs;
	}

	public void setJgs(String jgs)
	{
		this.jgs = jgs;
	}

	public String getZbqcs()
	{
		return zbqcs;
	}

	public void setZbqcs(String zbqcs)
	{
		this.zbqcs = zbqcs;
	}

	public String getSfyjzb()
	{
		return sfyjzb;
	}

	public void setSfyjzb(String sfyjzb)
	{
		this.sfyjzb = sfyjzb;
	}

	public String getSfnwwht()
	{
		return sfnwwht;
	}

	public void setSfnwwht(String sfnwwht)
	{
		this.sfnwwht = sfnwwht;
	}

	public String getYtwzym()
	{
		return ytwzym;
	}

	public void setYtwzym(String ytwzym)
	{
		this.ytwzym = ytwzym;
	}

	public String getNbjywmc()
	{
		return nbjywmc;
	}

	public void setNbjywmc(String nbjywmc)
	{
		this.nbjywmc = nbjywmc;
	}

	public String getBwzzmc()
	{
		return bwzzmc;
	}

	public void setBwzzmc(String bwzzmc)
	{
		this.bwzzmc = bwzzmc;
	}

	public String getHlwckip()
	{
		return hlwckip;
	}

	public void setHlwckip(String hlwckip)
	{
		this.hlwckip = hlwckip;
	}

	public String getNbbbsmc()
	{
		return nbbbsmc;
	}

	public void setNbbbsmc(String nbbbsmc)
	{
		this.nbbbsmc = nbbbsmc;
	}

	public String getBz()
	{
		return bz;
	}

	public void setBz(String bz)
	{
		this.bz = bz;
	}

	public String getDwllr()
	{
		return dwllr;
	}

	public void setDwllr(String dwllr)
	{
		this.dwllr = dwllr;
	}

	public String getBwbmfzrsfzh()
	{
		return bwbmfzrsfzh;
	}

	public void setBwbmfzrsfzh(String bwbmfzrsfzh)
	{
		this.bwbmfzrsfzh = bwbmfzrsfzh;
	}

	public String getLtxrys()
	{
		return ltxrys;
	}

	public void setLtxrys(String ltxrys)
	{
		this.ltxrys = ltxrys;
	}

	public String getXgzgs()
	{
		return xgzgs;
	}

	public void setXgzgs(String xgzgs)
	{
		this.xgzgs = xgzgs;
	}

	public String getXjygs()
	{
		return xjygs;
	}

	public void setXjygs(String xjygs)
	{
		this.xjygs = xjygs;
	}

	public String getDwflmc() {
		if(ValidateHelper.isNotEmptyString(this.dwfl)){
			dwflmc =  DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("ZDY_DWFL",this.dwfl);
		}
		return dwflmc;
	}

	public void setDwflmc(String dwflmc) {
		this.dwflmc = dwflmc;
	}

	public String getDwxlmc() {
		if(ValidateHelper.isNotEmptyString(this.dwxl)){
			dwxlmc =  DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("ZDY_DWFL",this.dwxl);
		}
		return dwxlmc;
	}

	public void setDwxlmc(String dwxlmc) {
		this.dwxlmc = dwxlmc;
	}

	public String getZddjmc() {
		if(ValidateHelper.isNotEmptyString(this.zddj)){
			zddjmc =  DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("ZAGL_ZDDJ",this.zddj);
		}
		return zddjmc;
	}

	public void setZddjmc(String zddjmc) {
		this.zddjmc = zddjmc;
	}

	public String getDwxzmc() {
		if(ValidateHelper.isNotEmptyString(this.dwxz)){
			dwxzmc = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("ZAGL_DWXZ",this.dwxz);
		}
		return dwxzmc;
	}

	public void setDwxzmc(String dwxzmc) {
		this.dwxzmc = dwxzmc;
	}
}
