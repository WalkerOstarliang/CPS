package com.chinacreator.qzgl.bean;

import com.chinacreator.common.bean.BaseValue;
/**
 * 省厅治安系统开展排查填报
 * @author Administrator
 *
 */
public class ZapcTbBean extends BaseValue{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private  String  id           ;   //  varchar2(20)  y      主键id
	private  String  hja          ;   //  varchar2(10)  y      排查发现可能引发个人极端暴力犯罪的线索数：合计(必须填写数字)
	private  String  lljf         ;   //  varchar2(10)  y      原因分析：邻里纠纷(必须填写数字)
	private  String  zdcq         ;   //  varchar2(10)  y      原因分析：征地拆迁(必须填写数字)
	private  String  tqgz         ;   //  varchar2(10)  y      原因分析：拖欠工资(必须填写数字)
	private  String  fzcsw        ;   //  varchar2(10)  y      原因分析：非正常死亡(必须填写数字)
	private  String  sfss         ;   //  varchar2(10)  y      原因分析：涉法涉诉(必须填写数字)
	private  String  qtyy         ;   //  varchar2(10)  y      原因分析：其他(必须填写数字)
	private  String  mjpcfx       ;   //  varchar2(10)  y      线索来源渠道分析：民警排查发现(必须填写数字)
	private  String  hlwjh        ;   //  varchar2(10)  y      "线索来源渠道分析：互联网截获(必须填写数字)"
	private  String  dhjb         ;   //  varchar2(10)  y      线索来源渠道分析：110接报(必须填写数字)
	private  String  qzjb         ;   //  varchar2(10)  y      线索来源渠道分析：群众举报(必须填写数字)
	private  String  hjb          ;   //  varchar2(10)  y      治安系统化解处置个人极端暴力犯罪案事件数：合计(必须填写数字)
	private  String  qsydw        ;   //  varchar2(10)  y      预谋实施的场所部位分析：企事业单位(必须填写数字)
	private  String  dzjg         ;   //  varchar2(10)  y      预谋实施的场所部位分析：党政机关(必须填写数字)
	private  String  xx           ;   //  varchar2(10)  y      预谋实施的场所部位分析：学校(必须填写数字)
	private  String  jccz         ;   //  varchar2(10)  y      预谋实施的场所部位分析：机场、车站、码头、地铁(必须填写数字)
	private  String  gc           ;   //  varchar2(10)  y      预谋实施的场所部位分析：广场、商业网点等人员密集公共场所(必须填写数字)
	private  String  jj           ;   //  varchar2(10)  y      预谋实施的场所部位分析：进京(必须填写数字)
	private  String  qtbw         ;   //  varchar2(10)  y      预谋实施的场所部位分析：其他(必须填写数字)
	private  String  bzwp         ;   //  varchar2(10)  y      使用工具情况分析：爆炸物品(必须填写数字)
	private  String  qz           ;   //  varchar2(10)  y      使用工具情况分析：枪支(必须填写数字)
	private  String  qy           ;   //  varchar2(10)  y      使用工具情况分析：汽油等易燃物品(必须填写数字)
	private  String  jd           ;   //  varchar2(10)  y      使用工具情况分析：剧毒化学品(必须填写数字)
	private  String  dj           ;   //  varchar2(10)  y      使用工具情况分析：刀具(必须填写数字)
	private  String  qtgj         ;   //  varchar2(10)  y      使用工具情况分析：其他(必须填写数字)
	private  String  yjqtjz       ;   //  varchar2(10)  y      移交其他警种和政府有关部门(必须填写数字)
	private  String  hjc          ;   //  varchar2(10)  y      稳控打击有个人极端暴力犯罪倾向的重点人数：合计(必须填写数字)
	private  String  esyx         ;   //  varchar2(10)  y      年龄阶段分析：20岁以下(必须填写数字)
	private  String  eszss        ;   //  varchar2(10)  y      年龄阶段分析：20-40岁(必须填写数字)
	private  String  syzws        ;   //  varchar2(10)  y      年龄阶段分析：41-50岁(必须填写数字)
	private  String  ssyys        ;   //  varchar2(10)  y      年龄阶段分析：51岁以上(必须填写数字)
	private  String  wyry         ;   //  varchar2(10)  y      重点人群分析：无业人员(必须填写数字)
	private  String  wlwgry       ;   //  varchar2(10)  y      重点人群分析：外来务工人员(必须填写数字)
	private  String  sfry         ;   //  varchar2(10)  y      重点人群分析：上访人员(必须填写数字)
	private  String  jsbr         ;   //  varchar2(10)  y      重点人群分析：精神病人(必须填写数字)
	private  String  qtrq         ;   //  varchar2(10)  y      重点人群分析：其他(必须填写数字)
	private  String  zacf         ;   //  varchar2(10)  y      采取处置措施情况：治安处罚(必须填写数字)
	private  String  xscf         ;   //  varchar2(10)  y      采取处置措施情况：刑事处罚(必须填写数字)
	private  String  rcwk         ;   //  varchar2(10)  y      采取处置措施情况：日常稳控(必须填写数字)
	
	private  String  sjzy = "0"         ;   //  varchar2(10)  y      收缴炸药（公斤）(必须填写数字)
	private  String  lg = "0"            ;   //  varchar2(10)  y      雷管（枚）(必须填写数字)
	private  String  jdhxp  = "0"         ;   //  varchar2(10)  y      剧毒化学品（克）(必须填写数字)
	private  String  qzb   = "0"          ;   //  varchar2(10)  y      枪支（把）(必须填写数字)
	private  String  zdb   = "0"          ;   //  varchar2(10)  y      子弹（发）(必须填写数字)
	private  String  qyb   = "0"          ;   //  varchar2(10)  y      汽油等易燃物品（升）(必须填写数字)
	
	
	private  String  djdwdm       ;   //  varchar2(12)  y      登记单位代码
	private  String  djdwmc       ;   //  varchar2(150)  y      登记单位名称
	private  String  parentcode   ;   //  varchar2(12)  y      上级单位代码
	private  String  parentname   ;   //  varchar2(150)  y      上级单位名称
	private  String  leve         ;   //  varchar2(10)  y      单位级别
	private  String  tjyf         ;   //  varchar2(6)  y      统计月份：（例如201501）
	private  String  tjqsrq       ;   //  varchar2(8)  y      统计起始日期（例如20150104）
	private  String  tjjzrq       ;   //  varchar2(8)  y      统计截至日期（例如20150202）
	private  String  tbsj         ;   //  date  y  sysdate    填报时间
	private  String  djrjh        ;   //  varchar2(30)  y      登记人警号
	private  String  djrxm        ;   //  varchar2(30)  y      登记人姓名
	private  String  djrsfzh      ;   //  varchar2(18)  y      登记人身份证号
	private  String  ip           ;   //  varchar2(100)  y      填写机器ip地址
	
	private  String titless =""; // 标题
	private  String tbdwmc =""; // 填报单位名称
	private  String tbrxm ="" ; // 填报人姓名
	
	
	public String getTbdwmc() {
		return tbdwmc;
	}
	public void setTbdwmc(String tbdwmc) {
		this.tbdwmc = tbdwmc;
	}
	public String getTbrxm() {
		return tbrxm;
	}
	public void setTbrxm(String tbrxm) {
		this.tbrxm = tbrxm;
	}
	public String getTitless() {
		return titless;
	}
	public void setTitless(String titless) {
		this.titless = titless;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getHja() {
		return hja;
	}
	public void setHja(String hja) {
		this.hja = hja;
	}
	public String getLljf() {
		return lljf;
	}
	public void setLljf(String lljf) {
		this.lljf = lljf;
	}
	public String getZdcq() {
		return zdcq;
	}
	public void setZdcq(String zdcq) {
		this.zdcq = zdcq;
	}
	public String getTqgz() {
		return tqgz;
	}
	public void setTqgz(String tqgz) {
		this.tqgz = tqgz;
	}
	public String getFzcsw() {
		return fzcsw;
	}
	public void setFzcsw(String fzcsw) {
		this.fzcsw = fzcsw;
	}
	public String getSfss() {
		return sfss;
	}
	public void setSfss(String sfss) {
		this.sfss = sfss;
	}
	public String getQtyy() {
		return qtyy;
	}
	public void setQtyy(String qtyy) {
		this.qtyy = qtyy;
	}
	public String getMjpcfx() {
		return mjpcfx;
	}
	public void setMjpcfx(String mjpcfx) {
		this.mjpcfx = mjpcfx;
	}
	public String getHlwjh() {
		return hlwjh;
	}
	public void setHlwjh(String hlwjh) {
		this.hlwjh = hlwjh;
	}
	public String getDhjb() {
		return dhjb;
	}
	public void setDhjb(String dhjb) {
		this.dhjb = dhjb;
	}
	public String getQzjb() {
		return qzjb;
	}
	public void setQzjb(String qzjb) {
		this.qzjb = qzjb;
	}
	public String getHjb() {
		return hjb;
	}
	public void setHjb(String hjb) {
		this.hjb = hjb;
	}
	public String getQsydw() {
		return qsydw;
	}
	public void setQsydw(String qsydw) {
		this.qsydw = qsydw;
	}
	public String getDzjg() {
		return dzjg;
	}
	public void setDzjg(String dzjg) {
		this.dzjg = dzjg;
	}
	public String getXx() {
		return xx;
	}
	public void setXx(String xx) {
		this.xx = xx;
	}
	public String getJccz() {
		return jccz;
	}
	public void setJccz(String jccz) {
		this.jccz = jccz;
	}
	public String getGc() {
		return gc;
	}
	public void setGc(String gc) {
		this.gc = gc;
	}
	public String getJj() {
		return jj;
	}
	public void setJj(String jj) {
		this.jj = jj;
	}
	public String getQtbw() {
		return qtbw;
	}
	public void setQtbw(String qtbw) {
		this.qtbw = qtbw;
	}
	public String getBzwp() {
		return bzwp;
	}
	public void setBzwp(String bzwp) {
		this.bzwp = bzwp;
	}
	public String getQz() {
		return qz;
	}
	public void setQz(String qz) {
		this.qz = qz;
	}
	public String getQy() {
		return qy;
	}
	public void setQy(String qy) {
		this.qy = qy;
	}
	public String getJd() {
		return jd;
	}
	public void setJd(String jd) {
		this.jd = jd;
	}
	public String getDj() {
		return dj;
	}
	public void setDj(String dj) {
		this.dj = dj;
	}
	public String getQtgj() {
		return qtgj;
	}
	public void setQtgj(String qtgj) {
		this.qtgj = qtgj;
	}
	public String getYjqtjz() {
		return yjqtjz;
	}
	public void setYjqtjz(String yjqtjz) {
		this.yjqtjz = yjqtjz;
	}
	public String getHjc() {
		return hjc;
	}
	public void setHjc(String hjc) {
		this.hjc = hjc;
	}
	public String getEsyx() {
		return esyx;
	}
	public void setEsyx(String esyx) {
		this.esyx = esyx;
	}
	public String getEszss() {
		return eszss;
	}
	public void setEszss(String eszss) {
		this.eszss = eszss;
	}
	public String getSyzws() {
		return syzws;
	}
	public void setSyzws(String syzws) {
		this.syzws = syzws;
	}
	public String getSsyys() {
		return ssyys;
	}
	public void setSsyys(String ssyys) {
		this.ssyys = ssyys;
	}
	public String getWyry() {
		return wyry;
	}
	public void setWyry(String wyry) {
		this.wyry = wyry;
	}
	public String getWlwgry() {
		return wlwgry;
	}
	public void setWlwgry(String wlwgry) {
		this.wlwgry = wlwgry;
	}
	public String getSfry() {
		return sfry;
	}
	public void setSfry(String sfry) {
		this.sfry = sfry;
	}
	public String getJsbr() {
		return jsbr;
	}
	public void setJsbr(String jsbr) {
		this.jsbr = jsbr;
	}
	public String getQtrq() {
		return qtrq;
	}
	public void setQtrq(String qtrq) {
		this.qtrq = qtrq;
	}
	public String getZacf() {
		return zacf;
	}
	public void setZacf(String zacf) {
		this.zacf = zacf;
	}
	public String getXscf() {
		return xscf;
	}
	public void setXscf(String xscf) {
		this.xscf = xscf;
	}
	public String getRcwk() {
		return rcwk;
	}
	public void setRcwk(String rcwk) {
		this.rcwk = rcwk;
	}
	public String getSjzy() {
		return sjzy;
	}
	public void setSjzy(String sjzy) {
		this.sjzy = sjzy;
	}
	public String getLg() {
		return lg;
	}
	public void setLg(String lg) {
		this.lg = lg;
	}
	public String getJdhxp() {
		return jdhxp;
	}
	public void setJdhxp(String jdhxp) {
		this.jdhxp = jdhxp;
	}
	public String getQzb() {
		return qzb;
	}
	public void setQzb(String qzb) {
		this.qzb = qzb;
	}
	public String getZdb() {
		return zdb;
	}
	public void setZdb(String zdb) {
		this.zdb = zdb;
	}
	public String getQyb() {
		return qyb;
	}
	public void setQyb(String qyb) {
		this.qyb = qyb;
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
	public String getParentcode() {
		return parentcode;
	}
	public void setParentcode(String parentcode) {
		this.parentcode = parentcode;
	}
	public String getParentname() {
		return parentname;
	}
	public void setParentname(String parentname) {
		this.parentname = parentname;
	}
	public String getLeve() {
		return leve;
	}
	public void setLeve(String leve) {
		this.leve = leve;
	}
	public String getTjyf() {
		return tjyf;
	}
	public void setTjyf(String tjyf) {
		this.tjyf = tjyf;
	}
	public String getTjqsrq() {
		return tjqsrq;
	}
	public void setTjqsrq(String tjqsrq) {
		this.tjqsrq = tjqsrq;
	}
	public String getTjjzrq() {
		return tjjzrq;
	}
	public void setTjjzrq(String tjjzrq) {
		this.tjjzrq = tjjzrq;
	}
	public String getTbsj() {
		return tbsj;
	}
	public void setTbsj(String tbsj) {
		this.tbsj = tbsj;
	}
	public String getDjrjh() {
		return djrjh;
	}
	public void setDjrjh(String djrjh) {
		this.djrjh = djrjh;
	}
	public String getDjrxm() {
		return djrxm;
	}
	public void setDjrxm(String djrxm) {
		this.djrxm = djrxm;
	}
	public String getDjrsfzh() {
		return djrsfzh;
	}
	public void setDjrsfzh(String djrsfzh) {
		this.djrsfzh = djrsfzh;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	
}
