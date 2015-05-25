package com.chinacreator.zagl.bean;

import com.chinacreator.common.bean.BaseValue;
import com.chinacreator.common.bean.LoginInfo;
import com.chinacreator.common.helper.ActionContextHelper;
import com.chinacreator.common.helper.DictionaryCacheHellper;
import com.chinacreator.common.helper.ValidateHelper;

public class DxhdBean extends BaseValue{
	private static final long serialVersionUID = 4365692725060971078L;
	private String hdbh;          	//活动编号
	private String hdmc;			//活动名称
	private String hdxz;			//活动性质
	private String hdxzmc;			//活动性质
	private String hdgm;			//活动规模
	private String cgmc;			//场馆名称
	private String jbqssj;			//举办起始时间
	private String jbjzsj;			//举办截止时间
	private String mcxy;			//每场限员 单位：人
	private String mpxsl;			//门票销售量
	private String aqtds;			//安全通道数 单位：扇
	private String bars;			//保安人数 单位：人
	private String mjrs;			//民警人数 单位：人
	private String fbcs;			//防爆车数 单位：辆
	private String jqs;				//警犬 单位：只
	private String xfcs;			//消防车数 单位：辆
	private String cls;				//车辆数 单位：辆
	private String qtqcs;			//其他器材数
	private String xccx;			//现场次序
	private String xccxmc;			//现场次序
	private String ajcs;			//安检次数 单位：次
	private String qksfzc;			//情况是否正常
	private String qksfzcmc;			//情况是否正常
	private String zaajs;			//治安案件数 单位：件
	private String xsajs;			//刑事案件数 单位：件
	private String cjsjld;			//参加的市级领导人姓名 多个使用"," 分隔
	private String cjstld;			//参加的省厅领导人姓名 多个使用"," 分隔
	private String qtdw;			//牵头单位
	private String cydw;			//参与单位多个使用
	private String jbjg;			//举办结果
	private String clqk;			//处理情况
	private String xfyj;			//消防意见
	private String jgyj;			//交管意见
	private String zbdw;			//主办单位
	private String zbdwfrdb;		//主办单位法人代表
	private String zbdwlxr;			//主办单位联系人
	private String zbdwlxrdh;		//主办单位联系人电话
	private String cbdw;			//承办单位
	private String cbdwfrdb;		//承办单位法人代表
	private String cbdwlxr;			//承办单位联系人
	private String cbdwlxrdh;		//承办单位联系人电话
	private String slr;				//受理人
	private String scr;				//审查人
	private String shrq;			//审核日期
	private String shdwdm;			//审核单位代码
	private String shdwmc;			//审核单位名称
	private String shjg;			//审核结果
	private String shjgmc;			//审核结果
	private String shyj;			//审核意见
	private String djdwdm;			//登记单位代码
	private String djdwmc;			//登记单位名称
	private String djrxm;			//登记人姓名
	private String djrq;			//登记日期
	private String czbs;            //操作标识
	private String czdwdm;          //操作单位代码
	private String czdwmc;          //操作单位名称
	private String czrxm;           //操作人姓名
	private String czsj;            //操作时间
	
	private String cgdz;
	private String hdqy;
	private String xl;
	
	private String djrjh;
	
	private String czrjh;
	private String djrsfzh;
	private String czrsfzh;
	
	private String cz;
	
	public String getHdbh() {
		return hdbh;
	}
	public void setHdbh(String hdbh) {
		this.hdbh = hdbh;
	}
	public String getHdmc() {
		return hdmc;
	}
	public void setHdmc(String hdmc) {
		this.hdmc = hdmc;
	}
	public String getHdxz() {
		return hdxz;
	}
	public void setHdxz(String hdxz) {
		this.hdxz = hdxz;
	}
	public String getHdgm() {
		return hdgm;
	}
	public void setHdgm(String hdgm) {
		this.hdgm = hdgm;
	}
	public String getCgmc() {
		return cgmc;
	}
	public void setCgmc(String cgmc) {
		this.cgmc = cgmc;
	}
	public String getJbqssj() {
		return jbqssj;
	}
	public void setJbqssj(String jbqssj) {
		this.jbqssj = jbqssj;
	}
	public String getJbjzsj() {
		return jbjzsj;
	}
	public void setJbjzsj(String jbjzsj) {
		this.jbjzsj = jbjzsj;
	}
	public String getMcxy() {
		return mcxy;
	}
	public void setMcxy(String mcxy) {
		this.mcxy = mcxy;
	}
	public String getMpxsl() {
		return mpxsl;
	}
	public void setMpxsl(String mpxsl) {
		this.mpxsl = mpxsl;
	}
	public String getAqtds() {
		return aqtds;
	}
	public void setAqtds(String aqtds) {
		this.aqtds = aqtds;
	}
	public String getBars() {
		return bars;
	}
	public void setBars(String bars) {
		this.bars = bars;
	}
	public String getMjrs() {
		return mjrs;
	}
	public void setMjrs(String mjrs) {
		this.mjrs = mjrs;
	}
	public String getFbcs() {
		return fbcs;
	}
	public void setFbcs(String fbcs) {
		this.fbcs = fbcs;
	}
	public String getJqs() {
		return jqs;
	}
	public void setJqs(String jqs) {
		this.jqs = jqs;
	}
	public String getXfcs() {
		return xfcs;
	}
	public void setXfcs(String xfcs) {
		this.xfcs = xfcs;
	}
	public String getCls() {
		return cls;
	}
	public void setCls(String cls) {
		this.cls = cls;
	}
	public String getQtqcs() {
		return qtqcs;
	}
	public void setQtqcs(String qtqcs) {
		this.qtqcs = qtqcs;
	}
	public String getXccx() {
		return xccx;
	}
	public void setXccx(String xccx) {
		this.xccx = xccx;
	}
	public String getAjcs() {
		return ajcs;
	}
	public void setAjcs(String ajcs) {
		this.ajcs = ajcs;
	}
	public String getQksfzc() {
		return qksfzc;
	}
	public void setQksfzc(String qksfzc) {
		this.qksfzc = qksfzc;
	}
	public String getZaajs() {
		return zaajs;
	}
	public void setZaajs(String zaajs) {
		this.zaajs = zaajs;
	}
	public String getXsajs() {
		return xsajs;
	}
	public void setXsajs(String xsajs) {
		this.xsajs = xsajs;
	}
	public String getCjsjld() {
		return cjsjld;
	}
	public void setCjsjld(String cjsjld) {
		this.cjsjld = cjsjld;
	}
	public String getCjstld() {
		return cjstld;
	}
	public void setCjstld(String cjstld) {
		this.cjstld = cjstld;
	}
	public String getQtdw() {
		return qtdw;
	}
	public void setQtdw(String qtdw) {
		this.qtdw = qtdw;
	}
	public String getCydw() {
		return cydw;
	}
	public void setCydw(String cydw) {
		this.cydw = cydw;
	}
	public String getJbjg() {
		return jbjg;
	}
	public void setJbjg(String jbjg) {
		this.jbjg = jbjg;
	}
	public String getClqk() {
		return clqk;
	}
	public void setClqk(String clqk) {
		this.clqk = clqk;
	}
	public String getXfyj() {
		return xfyj;
	}
	public void setXfyj(String xfyj) {
		this.xfyj = xfyj;
	}
	public String getJgyj() {
		return jgyj;
	}
	public void setJgyj(String jgyj) {
		this.jgyj = jgyj;
	}
	public String getZbdw() {
		return zbdw;
	}
	public void setZbdw(String zbdw) {
		this.zbdw = zbdw;
	}
	public String getZbdwfrdb() {
		return zbdwfrdb;
	}
	public void setZbdwfrdb(String zbdwfrdb) {
		this.zbdwfrdb = zbdwfrdb;
	}
	public String getZbdwlxr() {
		return zbdwlxr;
	}
	public void setZbdwlxr(String zbdwlxr) {
		this.zbdwlxr = zbdwlxr;
	}
	public String getZbdwlxrdh() {
		return zbdwlxrdh;
	}
	public void setZbdwlxrdh(String zbdwlxrdh) {
		this.zbdwlxrdh = zbdwlxrdh;
	}
	public String getCbdw() {
		return cbdw;
	}
	public void setCbdw(String cbdw) {
		this.cbdw = cbdw;
	}
	public String getCbdwfrdb() {
		return cbdwfrdb;
	}
	public void setCbdwfrdb(String cbdwfrdb) {
		this.cbdwfrdb = cbdwfrdb;
	}
	public String getCbdwlxr() {
		return cbdwlxr;
	}
	public void setCbdwlxr(String cbdwlxr) {
		this.cbdwlxr = cbdwlxr;
	}
	public String getCbdwlxrdh() {
		return cbdwlxrdh;
	}
	public void setCbdwlxrdh(String cbdwlxrdh) {
		this.cbdwlxrdh = cbdwlxrdh;
	}
	public String getSlr() {
		return slr;
	}
	public void setSlr(String slr) {
		this.slr = slr;
	}
	public String getScr() {
		return scr;
	}
	public void setScr(String scr) {
		this.scr = scr;
	}
	public String getShrq() {
		return shrq;
	}
	public void setShrq(String shrq) {
		this.shrq = shrq;
	}
	public String getShdwdm() {
		return shdwdm;
	}
	public void setShdwdm(String shdwdm) {
		this.shdwdm = shdwdm;
	}
	public String getShdwmc() {
		return shdwmc;
	}
	public void setShdwmc(String shdwmc) {
		this.shdwmc = shdwmc;
	}
	public String getShjg() {
		return shjg;
	}
	public void setShjg(String shjg) {
		this.shjg = shjg;
	}
	public String getShyj() {
		return shyj;
	}
	public void setShyj(String shyj) {
		this.shyj = shyj;
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
	public String getDjrxm() {
		return djrxm;
	}
	public void setDjrxm(String djrxm) {
		this.djrxm = djrxm;
	}
	public String getDjrq() {
		return djrq;
	}
	public void setDjrq(String djrq) {
		this.djrq = djrq;
	}
	public String getCzbs() {
		return czbs;
	}
	public void setCzbs(String czbs) {
		this.czbs = czbs;
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
	public String getHdxzmc() {
		if(ValidateHelper.isNotEmptyString(hdxz)){
			hdxzmc = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("HD_HDXZ", hdxz);
		}
		return hdxzmc;
	}
	public void setHdxzmc(String hdxzmc) {
		this.hdxzmc = hdxzmc;
	}
	public String getXccxmc() {
		if(ValidateHelper.isNotEmptyString(xccx)){
			xccxmc = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("HD_XCCX", xccx);
		}
		return xccxmc;
	}
	public void setXccxmc(String xccxmc) {
		this.xccxmc = xccxmc;
	}
	public String getQksfzcmc() {
		if(ValidateHelper.isNotEmptyString(qksfzc)){
			qksfzcmc = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("HD_QKSFZC", qksfzc);
		}
		return qksfzcmc;
	}
	public void setQksfzcmc(String qksfzcmc) {
		this.qksfzcmc = qksfzcmc;
	}
	public String getShjgmc() {
		if(ValidateHelper.isNotEmptyString(shjg)){
			shjgmc = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("ZDRY_CLJG", shjg);
		}
		return shjgmc;
	}
	public void setShjgmc(String shjgmc) {
		this.shjgmc = shjgmc;
	}
	
	
	public String getCgdz()
	{
		return cgdz;
	}
	public void setCgdz(String cgdz)
	{
		this.cgdz = cgdz;
	}
	public String getHdqy()
	{
		return hdqy;
	}
	public void setHdqy(String hdqy)
	{
		this.hdqy = hdqy;
	}
	public String getXl()
	{
		return xl;
	}
	public void setXl(String xl)
	{
		this.xl = xl;
	}
	public String getCz() {
		StringBuffer cz_buff = new StringBuffer();
		cz_buff.append("<span onclick=\"viewDxhdByHdbh('"+ this.hdbh +"')\" style=\"color:green\" class=\"cps_span_href\">详情</span>&nbsp;");
		LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
		String orgUser = loginInfo.getOrgcode();
		if(djdwdm != null && orgUser != null && orgUser.substring(0, 8).equals(djdwdm.substring(0, 8))){
			cz_buff.append("<span onclick=\"openUpdateDxhdByHdbh('"+ this.hdbh +"')\" style=\"color:green\" class=\"cps_span_href\">修改</span>&nbsp;");
			cz_buff.append("<span onclick=\"deleteDxhdByHdbh('"+ this.hdbh +"')\" style=\"color:green\" class=\"cps_span_href\">删除</span>&nbsp;");
		}
		cz = cz_buff.toString();
		return cz;
	}
	public void setCz(String cz) {
		this.cz = cz;
	}
	public String getDjrjh() {
		return djrjh;
	}
	public void setDjrjh(String djrjh) {
		this.djrjh = djrjh;
	}
	public String getCzrjh() {
		return czrjh;
	}
	public void setCzrjh(String czrjh) {
		this.czrjh = czrjh;
	}
	public String getDjrsfzh() {
		return djrsfzh;
	}
	public void setDjrsfzh(String djrsfzh) {
		this.djrsfzh = djrsfzh;
	}
	public String getCzrsfzh() {
		return czrsfzh;
	}
	public void setCzrsfzh(String czrsfzh) {
		this.czrsfzh = czrsfzh;
	}
}
