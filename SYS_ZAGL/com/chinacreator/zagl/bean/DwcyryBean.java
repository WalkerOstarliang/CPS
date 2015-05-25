package com.chinacreator.zagl.bean;

import com.chinacreator.common.bean.LoginInfo;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.cps.bean.RkJbxxBean;
import com.chinacreator.common.helper.ActionContextHelper;
import com.chinacreator.common.helper.DictionaryCacheHellper;
import com.chinacreator.common.helper.ValidateHelper;
import com.chinacreator.lsgl.bean.JwrkxxBean;

/**从业人员信息**/

public class DwcyryBean extends RkJbxxBean {

	private static final long serialVersionUID = 8943217255075358162L;
	
	/**
	 * 从业人员编号
	 */
	private String cyrybh;
	
	private String mzmc;
	
	/**
	 * 行业类别
	 */
	private  String hylb;
	
	/**
	 * 人员编号
	 */
	private String rybh;
	
	/**
	 * 机构编号
	 */
	private String jgbh;
	
	/**
	 * 工作单位
	 */
	private String dwmc;
	
	/**
	 * 部门名称
	 */
	private String bmmc;
	
	/**
	 * 工资来源
	 */
	private String gzly;
	
	/**
	 * 聘用期限
	 */
	private String pynx;
	
	/**
	 * 职务类别
	 */
	private String zwlb;
	
	private String zwlbmc;
	
	/**
	 * 职务名称
	 */
	private String zwmc;
	
	/**
	 * 手机号码
	 */
	private String sjhm;
	
	/**
	 * 其他联系电话
	 */
	private String qtlxdh;
	
	/**
	 * 注销标识名称
	 */
	private String zxbs_mc;
	
	/**
	 * 政审情况
	 */
	private String zsqk;
	
	/**
	 * 培训证号
	 */
	private String pxzh;
	
	/**
	 * 培训证书
	 */
	private String pxzs;
	
	/**
	 * 服务对象类别
	 */
	private String zdfwdxlb;
	
	/**
	 * 保卫措施
	 */
	private String bwcs;
	
	/**
	 * 控制措施
	 */
	private String kzcs;
	
	/**
	 * 主要贡献
	 */
	private String zygx;
	
	/**
	 * 主要问题
	 */
	private String zywt;
	
	/**
	 * 奖惩情况
	 */
	private String jcqk;
	
	/**
	 * 备注
	 */
	private String bz;
	
	/**
	 * 注销原因
	 */
	private String zxyy;
	
	/**
	 * 注销标识
	 */
	private String zxbs;
	
	/**
	 * 注销日期
	 */
	private String zxrq;
	
	/**
	 * 操作人姓名
	 */
	private String czrxm;
	
	/**
	 * 操作单位代码
	 */
	private String czdwdm;
	
	/**
	 * 操作单位代名称
	 */
	private String czdwmc;
	
	/**
	 * 操作时间
	 */
	private String czsj;
	
	/**
	 * 操作标识
	 */
	private String czbs;
	
	/**
	 * 登记单位代码
	 */
	private String djdwdm;
	
	/**
	 * 登记单位名称
	 */
	private String djdwmc;
	
	/**
	 * 登记人
	 */
	private String djrxm;
	
	/**
	 * 登记时间
	 */
	private String djsj;
	
	/**
	 * 登记人警号
	 */
	private String djrjh;
	
	/**
	 * 操作人警号
	 */
	private String czrjh;
	
	/**
	 * 居住地社区代码
	 */
	private String jzdsqdm;
	
	/**
	 * 居住地社区名称
	 */
	private String jzdsqmc;
	
	private String xbmc;
	
	private String lzsj;
	
	private String rzsj;
	
	private String cyryygh;
	
	private String rkfwglid;
	
	private String xzdz;
	
	private String xzdxz;
	
	private String xzdjwq;
	
	private String xzdjwqmc;
	
	private String fkrxm;
	
	private String fkrjh;
	
	private String fkdwdm;
	
	private String fkdwmc;
	
	private String fksj;
	
	private String fknr;
	
	/**
	 * 删除时间
	 */
	private String scsj;
	
	/**
	 * 居住地派出所代码
	 */
	private String jzdpcsdm;
	
	/**
	 * 居住地派出所名称
	 */
	private String jzdpcsmc;
	
	
	/**
	 * 是否安保人员
	 */
	private String sfabry;
	
	/**
	 * 房屋id
	 */
	private String fwid;
	
	/**
	 * 地址Id
	 */
	private String dzid;
	
	/**
	 * 操作
	 */
	private String cz;
	
	/**
	 * 是否境外人员
	 */
	private String sfjwry;
	
	private String zjzl;
	
	private String zjhm;
	
	private String zjzlmc;
	
	/*
	 * 数据核查    办理期限 
	 */
	private String blqx;
	
	private String djrsfzh;
	private String czrsfzh;
	
	/**
	 * 境外人口信息
	 */
	private JwrkxxBean jwrk = new JwrkxxBean();
	
	/**
	 * 派发时间
	 */
	private String pfsj;

	private String sfdjsyrk;
	
	private String syrkdjsj;
	
	private String gj;

	private String gjms;
	
	private String ywm;
	
	private String ywx;
	
	private String zjzlms;
	//姓名描述
	private String xmms;
	
	private String cyrydjcz;
	
	/**
	 * 是否重点人员
	 */
	private boolean sfZdry = false;
	
	/**
	 * 重点人员类别名称
	 */
	public String zdrylbmc;
	
	
	private String sfjwtdj ;  // 数据来源标识 0：内网PC登记 1：警务通登记  2：外网平台登记
	private String sfjwtdjms ; // 数据来源描述 
	
	public String getSfjwtdj() {
		return sfjwtdj;
	}

	public void setSfjwtdj(String sfjwtdj) {
		this.sfjwtdj = sfjwtdj;
	}

	public String getSfjwtdjms() {
		return sfjwtdjms;
	}

	public void setSfjwtdjms(String sfjwtdjms) {
		this.sfjwtdjms = sfjwtdjms;
	}

	public String getCyrybh() {
		return cyrybh;
	}

	public void setCyrybh(String cyrybh) {
		this.cyrybh = cyrybh;
	}

	public String getRybh() {
		return rybh;
	}

	public void setRybh(String rybh) {
		this.rybh = rybh;
	}

	public String getJgbh() {
		return jgbh;
	}

	public void setJgbh(String jgbh) {
		this.jgbh = jgbh;
	}


	public String getBmmc() {
		return bmmc;
	}

	public void setBmmc(String bmmc) {
		this.bmmc = bmmc;
	}

	public String getGzly() {
		return gzly;
	}

	public void setGzly(String gzly) {
		this.gzly = gzly;
	}

	public String getPynx()
	{
		return pynx;
	}

	public void setPynx(String pynx)
	{
		this.pynx = pynx;
	}

	public String getZwlb() {
		return zwlb;
	}

	public void setZwlb(String zwlb) {
		this.zwlb = zwlb;
	}

	public String getSjhm() {
		return sjhm;
	}

	public void setSjhm(String sjhm) {
		this.sjhm = sjhm;
	}

	public String getQtlxdh() {
		return qtlxdh;
	}

	public void setQtlxdh(String qtlxdh) {
		this.qtlxdh = qtlxdh;
	}

	public String getZsqk() {
		return zsqk;
	}

	public void setZsqk(String zsqk) {
		this.zsqk = zsqk;
	}

	public String getPxzh() {
		return pxzh;
	}

	public void setPxzh(String pxzh) {
		this.pxzh = pxzh;
	}

	public String getPxzs() {
		return pxzs;
	}

	public void setPxzs(String pxzs) {
		this.pxzs = pxzs;
	}

	public String getZdfwdxlb() {
		return zdfwdxlb;
	}

	public void setZdfwdxlb(String zdfwdxlb) {
		this.zdfwdxlb = zdfwdxlb;
	}

	public String getBwcs() {
		return bwcs;
	}

	public void setBwcs(String bwcs) {
		this.bwcs = bwcs;
	}

	public String getKzcs() {
		return kzcs;
	}

	public void setKzcs(String kzcs) {
		this.kzcs = kzcs;
	}

	public String getZygx() {
		return zygx;
	}

	public void setZygx(String zygx) {
		this.zygx = zygx;
	}

	public String getZywt() {
		return zywt;
	}

	public void setZywt(String zywt) {
		this.zywt = zywt;
	}

	public String getJcqk() {
		return jcqk;
	}

	public void setJcqk(String jcqk) {
		this.jcqk = jcqk;
	}

	public String getBz() {
		return bz;
	}

	public void setBz(String bz) {
		this.bz = bz;
	}

	public String getZxyy() {
		return zxyy;
	}

	public void setZxyy(String zxyy) {
		this.zxyy = zxyy;
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

	public String getCzrxm() {
		return czrxm;
	}

	public void setCzrxm(String czrxm) {
		this.czrxm = czrxm;
	}

	public String getCzdwdm() {
		return czdwdm;
	}

	public void setCzdwdm(String czdwdm) {
		this.czdwdm = czdwdm;
	}

	public String getCzsj() {
		return czsj;
	}

	public void setCzsj(String czsj) {
		this.czsj = czsj;
	}

	public String getCzbs() {
		return czbs;
	}

	public void setCzbs(String czbs) {
		this.czbs = czbs;
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

	public String getDjsj() {
		return djsj;
	}

	public void setDjsj(String djsj) {
		this.djsj = djsj;
	}


	public String getCzdwmc() {
		return czdwmc;
	}

	public void setCzdwmc(String czdwmc) {
		this.czdwmc = czdwmc;
	}

	public String getZwmc() {
		zwmc = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("ZAGL_RY_ZW", this.zwlb);
		return zwmc;
	}

	public void setZwmc(String zwmc) {
		this.zwmc = zwmc;
	}

	public String getDwmc() {
		return dwmc;
	}

	public void setDwmc(String dwmc) {
		this.dwmc = dwmc;
	}

	public String getLzsj()
	{
		return lzsj;
	}

	public void setLzsj(String lzsj)
	{
		this.lzsj = lzsj;
	}

	public String getCyryygh()
	{
		return cyryygh;
	}

	public void setCyryygh(String cyryygh)
	{
		this.cyryygh = cyryygh;
	}

	public String getRzsj()
	{
		return rzsj;
	}

	public void setRzsj(String rzsj)
	{
		this.rzsj = rzsj;
	}

	public String getRkfwglid()
	{
		return rkfwglid;
	}

	public void setRkfwglid(String rkfwglid)
	{
		this.rkfwglid = rkfwglid;
	}

	public String getXzdz()
	{
		return xzdz;
	}

	public void setXzdz(String xzdz)
	{
		this.xzdz = xzdz;
	}

	public String getXbmc() {
		String xb = getXb();
		if(xb != null){
			xbmc = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("GB_XB", xb);
		}
		return xbmc;
	}

	public void setXbmc(String xbmc) {
		this.xbmc = xbmc;
	}

	public String getXzdxz() {
		return xzdxz;
	}

	public void setXzdxz(String xzdxz) {
		this.xzdxz = xzdxz;
	}

	public String getCz() {
		cz = "<span class=\"cps_span_href\" onclick=\"cyryDetail('" + cyrybh + "','" + CommonConstant.OPERTYPE_DETAIL + "')\">详情</span>&nbsp;";
		LoginInfo login = ActionContextHelper.getLoginInfo();
		if(login != null && login.getLeve() == 5)
		{
			if((login.getOrgcode().equals(this.djdwdm) || login.getOrgcode().equals(this.czdwdm)))
			{
				if(CommonConstant.ZX_DIC_ZC.equals(this.zxbs))
				{
					if ("1".equals(sfjwry))
					{
						cz += "<span class=\"cps_span_href\" onclick=\"updateJwrkCyryBean('" + cyrybh + "','" + jgbh + "','" + gj + "','" + zjzl + "','" + zjhm + "','" + ywm + "','" + ywx + "')\">修改</span>&nbsp;";
					}
					else
					{
						cz += "<span class=\"cps_span_href\" onclick=\"updateJnrkCyryBean('" + cyrybh + "','" + jgbh + "','" + getSfzh() + "')\">修改</span>&nbsp;";
					}
					cz += "<span class=\"cps_span_href\" onclick=\"delCyry('" + cyrybh + "')\">注销</span>&nbsp;";
					cz += "<span class=\"cps_span_href\" onclick=\"deleteCyryByCyrybh('" + cyrybh + "')\">删除</span>&nbsp;";
				}
				
			}
		}
		return cz;
	}

	public void setCz(String cz) {
		this.cz = cz;
	}

	public String getZxbs_mc() {
		if("0".equals(this.zxbs)){
			zxbs_mc = "正常";
		}else if("1".equals(this.zxbs)){
			zxbs_mc = "<font color='red'>已注销</font>";
		}
		return zxbs_mc;
	}

	public void setZxbs_mc(String zxbs_mc) {
		this.zxbs_mc = zxbs_mc;
	}

	public String getFwid() {
		return fwid;
	}

	public void setFwid(String fwid) {
		this.fwid = fwid;
	}

	public String getDzid() {
		return dzid;
	}

	public void setDzid(String dzid) {
		this.dzid = dzid;
	}

	public String getZwlbmc() {
		if(ValidateHelper.isNotEmptyString(this.zwlb)){
			zwlbmc = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("ZAGL_RY_ZW", this.zwlb);
		}
		return zwlbmc;
	}

	public void setZwlbmc(String zwlbmc) {
		this.zwlbmc = zwlbmc;
	}

	public String getMzmc() {
		if(ValidateHelper.isNotEmptyString(this.getMz())){
			mzmc = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("GB_MZ",this.getMz());
		}
		return mzmc;
	}

	public void setMzmc(String mzmc) {
		this.mzmc = mzmc;
	}

	public String getHylb() {
		return hylb;
	}

	public void setHylb(String hylb) {
		this.hylb = hylb;
	}

	public String getSfabry() {
		return sfabry;
	}

	public void setSfabry(String sfabry) {
		this.sfabry = sfabry;
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

	public String getXzdjwq()
	{
		return xzdjwq;
	}

	public void setXzdjwq(String xzdjwq)
	{
		this.xzdjwq = xzdjwq;
	}

	public String getFkrxm()
	{
		return fkrxm;
	}

	public void setFkrxm(String fkrxm)
	{
		this.fkrxm = fkrxm;
	}

	public String getFkrjh()
	{
		return fkrjh;
	}

	public void setFkrjh(String fkrjh)
	{
		this.fkrjh = fkrjh;
	}

	public String getFkdwdm()
	{
		return fkdwdm;
	}

	public void setFkdwdm(String fkdwdm)
	{
		this.fkdwdm = fkdwdm;
	}

	public String getFkdwmc()
	{
		return fkdwmc;
	}

	public void setFkdwmc(String fkdwmc)
	{
		this.fkdwmc = fkdwmc;
	}

	public String getFksj()
	{
		return fksj;
	}

	public void setFksj(String fksj)
	{
		this.fksj = fksj;
	}

	public String getFknr()
	{
		return fknr;
	}

	public void setFknr(String fknr)
	{
		this.fknr = fknr;
	}

	public String getXzdjwqmc()
	{
		return xzdjwqmc;
	}

	public void setXzdjwqmc(String xzdjwqmc)
	{
		this.xzdjwqmc = xzdjwqmc;
	}

	public String getJzdsqdm() {
		return jzdsqdm;
	}

	public void setJzdsqdm(String jzdsqdm) {
		this.jzdsqdm = jzdsqdm;
	}

	public String getJzdsqmc() {
		return jzdsqmc;
	}

	public void setJzdsqmc(String jzdsqmc) {
		this.jzdsqmc = jzdsqmc;
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

	public String getBlqx() {
		return blqx;
	}

	public void setBlqx(String blqx) {
		this.blqx = blqx;
	}

	public String getJzdpcsdm() {
		return jzdpcsdm;
	}

	public void setJzdpcsdm(String jzdpcsdm) {
		this.jzdpcsdm = jzdpcsdm;
	}

	public String getJzdpcsmc() {
		return jzdpcsmc;
	}

	public void setJzdpcsmc(String jzdpcsmc) {
		this.jzdpcsmc = jzdpcsmc;
	}

	public String getSfjwry() {
		if(ValidateHelper.isEmptyString(sfjwry)){
			sfjwry = CommonConstant.FOU;
		}
		return sfjwry;
	}

	public void setSfjwry(String sfjwry) {
		this.sfjwry = sfjwry;
	}

	public JwrkxxBean getJwrk() {
		return jwrk;
	}

	public void setJwrk(JwrkxxBean jwrk) {
		this.jwrk = jwrk;
	}

	public String getPfsj() {
		return pfsj;
	}

	public void setPfsj(String pfsj) {
		this.pfsj = pfsj;
	}

	public String getScsj() {
		if(CommonConstant.CZBZ_DEL.equals(this.czbs)){
			scsj = "<font color='red'>" + this.czsj + "</font>";
		}
		return scsj;
	}

	public void setScsj(String scsj) {
		this.scsj = scsj;
	}

	public String getZjzl()
	{
		return zjzl;
	}

	public void setZjzl(String zjzl)
	{
		this.zjzl = zjzl;
	}

	public String getZjhm()
	{
		return zjhm;
	}

	public void setZjhm(String zjhm)
	{
		this.zjhm = zjhm;
	}

	public String getZjzlmc()
	{
		zjzlmc = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("GB_ZJZL", zjzl);
		return zjzlmc;
	}

	public void setZjzlmc(String zjzlmc)
	{
		this.zjzlmc = zjzlmc;
	}

	public String getGj()
	{
		return gj;
	}

	public void setGj(String gj)
	{
		this.gj = gj;
	}

	public String getYwm()
	{
		return ywm;
	}

	public void setYwm(String ywm)
	{
		this.ywm = ywm;
	}

	public String getYwx()
	{
		return ywx;
	}

	public void setYwx(String ywx)
	{
		this.ywx = ywx;
	}

	public String getZjzlms()
	{
		zjzlms = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("GB_ZJZL", zjzl);
		return zjzlms;
	}

	public void setZjzlms(String zjzlms)
	{
		this.zjzlms = zjzlms;
	}

	public String getGjms()
	{
		gjms = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("GB_GJ", gj);
		return gjms;
	}

	public void setGjms(String gjms)
	{
		this.gjms = gjms;
	}

	public String getXmms()
	{
		if ("1".equals(sfjwry))
		{
			if (ValidateHelper.isNotEmptyString(ywm) && ValidateHelper.isNotEmptyString(ywx))
			{
				xmms = ywm + " " + ywx;
			}
			else
			{
				xmms = getXm();
			}
		}
		else
		{
			xmms = getXm();
		}
		return xmms;
	}

	public void setXmms(String xmms)
	{
		this.xmms = xmms;
	}

	public String getCyrydjcz()
	{
		//cyrydjcz = "<span class=\"cps_span_href\" onclick=\"cyryDetail('" + cyrybh + "','" + CommonConstant.OPERTYPE_DETAIL + "')\">详情</span>&nbsp;";
		cyrydjcz = "";
		LoginInfo login = ActionContextHelper.getLoginInfo();
		if(login != null && login.getLeve() == 5)
		{
			if((login.getOrgcode().equals(this.djdwdm) || login.getOrgcode().equals(this.czdwdm)))
			{
				if(CommonConstant.ZX_DIC_ZC.equals(this.zxbs))
				{
					if ("1".equals(sfjwry))
					{
						cyrydjcz += "<span class=\"cps_span_href\" onclick=\"updateJwrkCyryBean('" + cyrybh + "','" + jgbh + "','" + gj + "','" + zjzl + "','" + zjhm + "','" + ywm + "','" + ywx + "')\">修改</span>&nbsp;";
					}
					else
					{
						cyrydjcz += "<span class=\"cps_span_href\" onclick=\"updateJnrkCyryBean('" + cyrybh + "','" + jgbh + "','" + getSfzh() + "')\">修改</span>&nbsp;";
					}
					//cyrydjcz += "<span class=\"cps_span_href\" onclick=\"delCyry('" + cyrybh + "')\">注销</span>&nbsp;";
				}
				
			}
		}
		return cyrydjcz;
	}

	public void setCyrydjcz(String cyrydjcz)
	{
		this.cyrydjcz = cyrydjcz;
	}

	public String getSfdjsyrk()
	{
		return sfdjsyrk;
	}

	public void setSfdjsyrk(String sfdjsyrk)
	{
		this.sfdjsyrk = sfdjsyrk;
	}

	public String getSyrkdjsj()
	{
		return syrkdjsj;
	}

	public void setSyrkdjsj(String syrkdjsj)
	{
		this.syrkdjsj = syrkdjsj;
	}

	public boolean isSfZdry() {
		return sfZdry;
	}

	public void setSfZdry(boolean sfZdry) {
		this.sfZdry = sfZdry;
	}

	public String getZdrylbmc() {
		return zdrylbmc;
	}

	public void setZdrylbmc(String zdrylbmc) {
		this.zdrylbmc = zdrylbmc;
	}
}
