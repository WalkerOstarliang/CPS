package com.chinacreator.lsgl.bean;

import com.chinacreator.common.bean.LoginInfo;
import com.chinacreator.common.cps.bean.RkJbxxBean;
import com.chinacreator.common.cps.helper.CommonSequenceHelper;
import com.chinacreator.common.helper.ActionContextHelper;
import com.chinacreator.common.helper.CommonDBBaseHelper;
import com.chinacreator.common.helper.DictionaryCacheHellper;
import com.chinacreator.common.helper.ValidateHelper;

public class ZdryGzdxBean extends RkJbxxBean{
	private static final long serialVersionUID = 5336907167570675370L;
	private String gzdxbh;
	private String rybh;
	private String sfzh;
	private String rylb;
	private String zdrybh;
	private String dxlb;
	private String dxlbmc;
	private String salb;
	private String salbmc;
	private String ladw;
	private String ladwjgdm;
	private String cyzk;
	private String cyzkmc;
	private String cbclqk;
	private String ssyj;
	private String ywda;
	private String ywdamc;
	private String dabh;
	private String ztlx;
	private String ztlxmc;
	private String xmjjzs;
	private String iscjbj;
	private String iscjbjmc;
	private String bjcjlx;
	private String bjcjlxmc;
	private String iscjzw;
	private String iscjzwmc;
	private String flwsbh;
	private String flwsmc;
	private String qfjg;
	private String qfsj;
	private String gllb;
	private String gllbmc;
	private String glff;
	private String glffmc;
	private String lgrq;
	private String lgly;
	private String lgyy;
	private String cgrq;
	private String cgly;
	private String lgzt;
	private String isqgqlzdry;
	private String nrbjzdryksj;
	private String zdrylbbj;
	private String zdrylbbjmc;
	private String zdryxl;
	private String zdryxlmc;
	private String yxx;
	private String xzsj;
	private String bjsj;
	private String cxsj;
	private String cxdw;
	private String cxr;
	private String djrxm;
	private String djdwdm;
	private String djdwmc;
	private String djsj;
	private String sfrl;
	private String sszrdwdm;
	private String sszrdwmc;
	private String sszrmjjh;
	private String sszrmjxm;
	private String sszrmjlxdh;
	
	private String gxdwdm;
	private String gxdwmc;
	private String zxlasj;
	private String cz;
	
	private String ssgajgjgdm;
	/**
	 * 户籍地所属派出所代码
	 */
	private String sspcsdm;
	/**
	 * 现住地责任区代码
	 */
	private String xzzzrq;
	/**
	 * 在控登记统计详情
	 */
	private String zkdjtjcz;
	
	//精神病人
	private  ZdryJsbxBean jsbrBean=new ZdryJsbxBean();
	
	//精神病人肇事信息
	private  ZdryJsbrzsxxBean jsbrzsBean= new ZdryJsbrzsxxBean();
	
	//涉稳人员
	private ZdrySwryBean  swryBean=new ZdrySwryBean();
	private ZdrySwrysfjlBean    swrysfjlBean = new ZdrySwrysfjlBean();
	
	//吸毒人员
	private ZdryXdryxxBean xdryBean=new ZdryXdryxxBean();
	private ZdryXdchNjxxBean xdchNjxxBean = new ZdryXdchNjxxBean();
	
	//关注人员
	private ZdryGzryxxBean  gzryBean=new ZdryGzryxxBean();
	
	//社区矫正对象
	private ZdryJzdxxxBean  jzdxBean= new ZdryJzdxxxBean();
	
	/**
	 * 重点人员派发信息
	 */
	private ZdryPfxxBean zdryPfxxBean = new ZdryPfxxBean();
	
	/**
	 * 重点人员托管信息
	 */
	private ZdryTgxxBean tgxx = new ZdryTgxxBean();
	
	/**
	 * 委托单位代码
	 */
	private String wtdwdm;
	
	/**
	 * 接管单位代码
	 */
	private String jgdwdm;
	
	/**
	 * 重点人员退回信息
	 */
	private ZdryThBean thxx = new ZdryThBean();
	
	/**
	 * 托管信息ID
	 */
	private String tgxxId;
	
	/**
	 * 委托时间
	 */
	private String wtsj;
	
	public String getWtsj() {
		return wtsj;
	}
	public void setWtsj(String wtsj) {
		this.wtsj = wtsj;
	}
	/**
	 * 接管状态
	 */
	private String jgzt;
	
	/**
	 * 是否托管
	 */
	private String sftg;
	
	/**
	 * 是否派发
	 */
	private String sfpf;
	
	/**
	 * 是否退回
	 */
	private String sfth;
	
	/**
	 * 重点人员被退回到单位 的代码
	 */
	private String thdwdm;
	
	/**
	 * 重点人员派发单位 的代码
	 */
	private String pfdwdm;
	
	/**
	 * 所属行政社区名称
	 */
	private String ssxzsqmc;
	
	/**
	 * 所属行政社区代码
	 */
	private String ssxzsq;
	
	/**
	 * 数据核查 办理期限
	 */
	private String blqx;
	
	public String getGzdxbh() {
		return gzdxbh;
	}
	public void setGzdxbh(String gzdxbh) {
		this.gzdxbh = gzdxbh;
	}
	public String getRybh() {
		return rybh;
	}
	public void setRybh(String rybh) {
		this.rybh = rybh;
	}
	public String getSfzh() {
		return sfzh;
	}
	public void setSfzh(String sfzh) {
		this.sfzh = sfzh;
	}
	public String getRylb() {
		return rylb;
	}
	public void setRylb(String rylb) {
		this.rylb = rylb;
	}
	public String getZdrybh() {
		return zdrybh;
	}
	public void setZdrybh(String zdrybh) {
		this.zdrybh = zdrybh;
	}
	public String getDxlb() {
		return dxlb;
	}
	public void setDxlb(String dxlb) {
		this.dxlb = dxlb;
	}
	public String getSalb() {
		return salb;
	}
	public void setSalb(String salb) {
		this.salb = salb;
	}
	public String getLadw() {
		return ladw;
	}
	public void setLadw(String ladw) {
		this.ladw = ladw;
	}
	public String getLadwjgdm() {
		return ladwjgdm;
	}
	public void setLadwjgdm(String ladwjgdm) {
		this.ladwjgdm = ladwjgdm;
	}
	public String getCyzk() {
		return cyzk;
	}
	public void setCyzk(String cyzk) {
		this.cyzk = cyzk;
	}
	public String getCbclqk() {
		return cbclqk;
	}
	public void setCbclqk(String cbclqk) {
		this.cbclqk = cbclqk;
	}
	public String getSsyj() {
		return ssyj;
	}
	public void setSsyj(String ssyj) {
		this.ssyj = ssyj;
	}
	public String getYwda() {
		return ywda;
	}
	public void setYwda(String ywda) {
		this.ywda = ywda;
	}
	public String getDabh() {
		return dabh;
	}
	public void setDabh(String dabh) {
		this.dabh = dabh;
	}
	public String getZtlx() {
		return ztlx;
	}
	public void setZtlx(String ztlx) {
		this.ztlx = ztlx;
	}
	public String getXmjjzs() {
		return xmjjzs;
	}
	public void setXmjjzs(String xmjjzs) {
		this.xmjjzs = xmjjzs;
	}
	public String getIscjbj() {
		return iscjbj;
	}
	public void setIscjbj(String iscjbj) {
		this.iscjbj = iscjbj;
	}
	public String getBjcjlx() {
		return bjcjlx;
	}
	public void setBjcjlx(String bjcjlx) {
		this.bjcjlx = bjcjlx;
	}
	public String getIscjzw() {
		return iscjzw;
	}
	public void setIscjzw(String iscjzw) {
		this.iscjzw = iscjzw;
	}
	public String getFlwsbh() {
		return flwsbh;
	}
	public void setFlwsbh(String flwsbh) {
		this.flwsbh = flwsbh;
	}
	public String getFlwsmc() {
		return flwsmc;
	}
	public void setFlwsmc(String flwsmc) {
		this.flwsmc = flwsmc;
	}
	public String getQfjg() {
		return qfjg;
	}
	public void setQfjg(String qfjg) {
		this.qfjg = qfjg;
	}
	public String getQfsj() {
		return qfsj;
	}
	public void setQfsj(String qfsj) {
		this.qfsj = qfsj;
	}
	public String getGllb() {
		return gllb;
	}
	public void setGllb(String gllb) {
		this.gllb = gllb;
	}
	public String getGlff() {
		return glff;
	}
	public void setGlff(String glff) {
		this.glff = glff;
	}
	public String getLgrq() {
		return lgrq;
	}
	public void setLgrq(String lgrq) {
		this.lgrq = lgrq;
	}
	public String getLgly() {
		return lgly;
	}
	public void setLgly(String lgly) {
		this.lgly = lgly;
	}
	public String getLgyy() {
		return lgyy;
	}
	public void setLgyy(String lgyy) {
		this.lgyy = lgyy;
	}
	public String getCgrq() {
		return cgrq;
	}
	public void setCgrq(String cgrq) {
		this.cgrq = cgrq;
	}
	public String getCgly() {
		return cgly;
	}
	public void setCgly(String cgly) {
		this.cgly = cgly;
	}
	public String getLgzt() {
		return lgzt;
	}
	public void setLgzt(String lgzt) {
		this.lgzt = lgzt;
	}
	public String getIsqgqlzdry() {
		return isqgqlzdry;
	}
	public void setIsqgqlzdry(String isqgqlzdry) {
		this.isqgqlzdry = isqgqlzdry;
	}
	public String getNrbjzdryksj() {
		return nrbjzdryksj;
	}
	public void setNrbjzdryksj(String nrbjzdryksj) {
		this.nrbjzdryksj = nrbjzdryksj;
	}
	public String getZdrylbbj() {
		return zdrylbbj;
	}
	public void setZdrylbbj(String zdrylbbj) {
		this.zdrylbbj = zdrylbbj;
	}
	public String getZdryxl() {
		return zdryxl;
	}
	public void setZdryxl(String zdryxl) {
		this.zdryxl = zdryxl;
	}
	public String getYxx() {
		return yxx;
	}
	public void setYxx(String yxx) {
		this.yxx = yxx;
	}
	public String getXzsj() {
		return xzsj;
	}
	public void setXzsj(String xzsj) {
		this.xzsj = xzsj;
	}
	public String getBjsj() {
		return bjsj;
	}
	public void setBjsj(String bjsj) {
		this.bjsj = bjsj;
	}
	public String getCxsj() {
		return cxsj;
	}
	public void setCxsj(String cxsj) {
		this.cxsj = cxsj;
	}
	public String getCxdw() {
		return cxdw;
	}
	public void setCxdw(String cxdw) {
		this.cxdw = cxdw;
	}
	public String getCxr() {
		return cxr;
	}
	public void setCxr(String cxr) {
		this.cxr = cxr;
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
	public String getSfrl() {
		return sfrl;
	}
	public void setSfrl(String sfrl) {
		this.sfrl = sfrl;
	}
	public String getDxlbmc() {
		if(ValidateHelper.isNotEmptyString(this.dxlb)){
			dxlbmc = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("ZDDXLB", dxlb);
		}
		return dxlbmc;
	}
	public void setDxlbmc(String dxlbmc) {
		this.dxlbmc = dxlbmc;
	}
	public ZdryJsbxBean getJsbrBean() {
		return jsbrBean;
	}
	public void setJsbrBean(ZdryJsbxBean jsbrBean) {
		this.jsbrBean = jsbrBean;
	}
	public ZdrySwryBean getSwryBean() {
		return swryBean;
	}
	public void setSwryBean(ZdrySwryBean swryBean) {
		this.swryBean = swryBean;
	}
	public ZdryXdryxxBean getXdryBean() {
		return xdryBean;
	}
	public void setXdryBean(ZdryXdryxxBean xdryBean) {
		this.xdryBean = xdryBean;
	}
	public ZdryGzryxxBean getGzryBean() {
		return gzryBean;
	}
	public void setGzryBean(ZdryGzryxxBean gzryBean) {
		this.gzryBean = gzryBean;
	}
	public ZdryJzdxxxBean getJzdxBean() {
		return jzdxBean;
	}
	public void setJzdxBean(ZdryJzdxxxBean jzdxBean) {
		this.jzdxBean = jzdxBean;
	}
	public ZdryXdchNjxxBean getXdchNjxxBean() {
		return xdchNjxxBean;
	}
	public void setXdchNjxxBean(ZdryXdchNjxxBean xdchNjxxBean) {
		this.xdchNjxxBean = xdchNjxxBean;
	}
	
	public ZdryJsbrzsxxBean getJsbrzsBean() {
		return jsbrzsBean;
	}
	public void setJsbrzsBean(ZdryJsbrzsxxBean jsbrzsBean) {
		this.jsbrzsBean = jsbrzsBean;
	}
	public ZdrySwrysfjlBean getSwrysfjlBean() {
		return swrysfjlBean;
	}
	public void setSwrysfjlBean(ZdrySwrysfjlBean swrysfjlBean) {
		this.swrysfjlBean = swrysfjlBean;
	}
	public String getSszrdwdm() {
		return sszrdwdm;
	}
	public void setSszrdwdm(String sszrdwdm) {
		this.sszrdwdm = sszrdwdm;
	}
	public String getSszrdwmc() {
		return sszrdwmc;
	}
	public void setSszrdwmc(String sszrdwmc) {
		this.sszrdwmc = sszrdwmc;
	}
	public String getSszrmjjh() {
		return sszrmjjh;
	}
	public void setSszrmjjh(String sszrmjjh) {
		this.sszrmjjh = sszrmjjh;
	}
	public String getSszrmjxm() {
		return sszrmjxm;
	}
	public void setSszrmjxm(String sszrmjxm) {
		this.sszrmjxm = sszrmjxm;
	}
	public String getSszrmjlxdh() {
		return sszrmjlxdh;
	}
	public void setSszrmjlxdh(String sszrmjlxdh) {
		this.sszrmjlxdh = sszrmjlxdh;
	}
	
	public String getZdrylbbjmc()
	{
		zdrylbbjmc = CommonSequenceHelper.getZdrylbmc(this.zdrylbbj);
		return zdrylbbjmc;
	}
	public void setZdrylbbjmc(String zdrylbbjmc)
	{
		this.zdrylbbjmc = zdrylbbjmc;
	}
	public String getZdryxlmc()
	{
		zdryxlmc = CommonSequenceHelper.getZdryxlmcs(zdryxl);
		return zdryxlmc;
	}
	public void setZdryxlmc(String zdryxlmc)
	{
		this.zdryxlmc = zdryxlmc;
	}
	
	public String getGxdwdm()
	{
		return gxdwdm;
	}
	public void setGxdwdm(String gxdwdm)
	{
		this.gxdwdm = gxdwdm;
	}
	public String getGxdwmc()
	{
		return gxdwmc;
	}
	public void setGxdwmc(String gxdwmc)
	{
		this.gxdwmc = gxdwmc;
	}
	
	public String getZxlasj()
	{
		return zxlasj;
	}
	public void setZxlasj(String zxlasj)
	{
		this.zxlasj = zxlasj;
	}
	public String getCz() {
		StringBuffer sb = new StringBuffer();
		LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
		String userCode = "";
		if(2 == loginInfo.getLeve()){
			userCode = loginInfo.getOrgcode().substring(0,4) + "00000000";
		}else if(3 == loginInfo.getLeve()){
			userCode = loginInfo.getOrgcode().substring(0,6) + "000000";
		}else if(4 == loginInfo.getLeve()){
			userCode = loginInfo.getOrgcode().substring(0,8) + "0000";
		}else if(5 == loginInfo.getLeve()){
			userCode = loginInfo.getOrgcode();
		}
		
		sb.append("<span onclick=\"openZdryInfoPage('detail','" + sfzh +"','"+rybh+"')\" style=\"color:green\" class=\"cps_span_href\">详情</span>&nbsp;");
		if(userCode.equals(this.sszrdwdm) || (ValidateHelper.isNotEmptyString(loginInfo.getSqdm()) && loginInfo.getSqdm().equals(ssxzsq)))
		{
			//社区民警不能派发重点人员
			if(5 != loginInfo.getLeve()){
				sb.append("<span onclick=\"openZdryPf('" + this.rybh + "','add')\" style=\"color:green\" class=\"cps_span_href\">派发</span>&nbsp;");
			}
			
			//托管后不能退回 (即接管状态为1)
			if(jgzt == null || "2".equals(jgzt)){
				sb.append("<span onclick=\"openZdryth('" + this.rybh + "','add')\" style=\"color:green\" class=\"cps_span_href\">退回</span>&nbsp;");
			}else{
				if(wtdwdm == null){
					if(!(5 == loginInfo.getLeve())){
						sb.append("<span onclick=\"openZdryth('" + this.rybh + "','add')\" style=\"color:green\" class=\"cps_span_href\">退回</span>&nbsp;");
					}
				}else{
					if(!(sszrdwdm != null && sszrdwdm.equals(wtdwdm))){
						sb.append("<span onclick=\"openZdryth('" + this.rybh + "','add')\" style=\"color:green\" class=\"cps_span_href\">退回</span>&nbsp;");
					}
				}
			}
			
			//只有社区民警才能对重点人员进行在控登记和托管
			if(5 == loginInfo.getLeve()){
				//sb.append("<span onclick=\"openZdryInfoPage('update','" + sfzh +"','"+ rybh +"','showMenu','"+zdrybh+"')\" style=\"color:green\" class=\"cps_span_href\">在控登记</span>&nbsp;");
				//接管后不能托管
				if("2".equals(this.jgzt) || this.jgzt == null){ //没有委托和退回委托的才能托管
					sb.append("<span onclick=\"openTgxxPage('" + this.rybh + "','" + this.sfzh + "','add')\" style=\"color:green\" class=\"cps_span_href\">托管</span>&nbsp;");
//					只有户籍地单位才能托管
//					if(loginInfo.getPcsdm().equals(sspcsdm)){
//						//只有人户分离才能托管
//						if(ValidateHelper.isNotEmptyString(sspcsdm)){
//							if(ValidateHelper.isEmptyString(xzzzrq)){
//								sb.append("<span onclick=\"openTgxxPage('" + this.rybh + "','" + this.sfzh + "','add')\" style=\"color:green\" class=\"cps_span_href\">托管</span>&nbsp;");
//							}else{
//								if(sspcsdm.equals(xzzzrq.substring(0,8) + "0000")){
//									sb.append("<span onclick=\"openTgxxPage('" + this.rybh + "','" + this.sfzh + "','add')\" style=\"color:green\" class=\"cps_span_href\">托管</span>&nbsp;");
//								}
//							}
//						}
//					}
				}
			}
		}else{
			//委托后接管单位也能在控登记
			if(loginInfo.getOrgcode().equals(this.jgdwdm) && 5 == loginInfo.getLeve()){
				sb.append("<span onclick=\"openZdryInfoPage('update','" + sfzh +"','"+ rybh +"','showMenu','"+zdrybh+"')\" style=\"color:green\" class=\"cps_span_href\">在控登记</span>&nbsp;");
			}
			if("1".equals(this.jgzt) && 5 == loginInfo.getLeve()){
				sb.append("<span onclick=\"openRyjgWin('" + this.rybh + "','" + this.tgxxId + "','thhjd')\" style=\"color:green\" class=\"cps_span_href\">退回户籍地</span>&nbsp;");
			}
		}
		cz = sb.toString();	
		return cz;
	}
	
	public void setCz(String cz) {
		this.cz = cz;
	}
	public ZdryPfxxBean getZdryPfxxBean() {
		return zdryPfxxBean;
	}
	public void setZdryPfxxBean(ZdryPfxxBean zdryPfxxBean) {
		this.zdryPfxxBean = zdryPfxxBean;
	}
	public String getSalbmc() {
		if(ValidateHelper.isNotEmptyString(this.salb)){
			salbmc = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("SALB", this.salb);
		}
		return salbmc;
	}
	public void setSalbmc(String salbmc) {
		this.salbmc = salbmc;
	}
	public String getCyzkmc() {
		if(ValidateHelper.isNotEmptyString(this.cyzk)){
			cyzkmc = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("GB_CYZK", this.cyzk);
		}
		return cyzkmc;
	}
	public void setCyzkmc(String cyzkmc) {
		this.cyzkmc = cyzkmc;
	}
	public String getZtlxmc() {
		if(ValidateHelper.isNotEmptyString(this.ztlx)){
			ztlxmc = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("ZDY_ZTLX", this.ztlx);
		}
		return ztlxmc;
	}
	public void setZtlxmc(String ztlxmc) {
		this.ztlxmc = ztlxmc;
	}
	public String getGlffmc() {
		if(ValidateHelper.isNotEmptyString(this.glff)){
			glffmc = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("ZDRYGLFF", this.glff);
		}
		return glffmc;
	}
	public void setGlffmc(String glffmc) {
		this.glffmc = glffmc;
	}
	public String getGllbmc() {
		if(ValidateHelper.isNotEmptyString(this.gllb)){
			gllbmc = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("ZDRY_GLLB", this.gllb);
		}
		return gllbmc;
	}
	public void setGllbmc(String gllbmc) {
		this.gllbmc = gllbmc;
	}
	public String getYwdamc() {
		if(ValidateHelper.isNotEmptyString(this.ywda)){
			ywdamc = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("ZDY_ZDSF", this.ywda);
		}
		return ywdamc;
	}
	public void setYwdamc(String ywdamc) {
		this.ywdamc = ywdamc;
	}
	public String getIscjzwmc() {
		if(ValidateHelper.isNotEmptyString(this.iscjzw)){
			iscjzwmc = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("ZDY_ZDSF", this.iscjzw);
		}
		return iscjzwmc;
	}
	public void setIscjzwmc(String iscjzwmc) {
		this.iscjzwmc = iscjzwmc;
	}
	public String getIscjbjmc() {
		if(ValidateHelper.isNotEmptyString(this.iscjbj)){
			iscjbjmc = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("ZDY_ZDSF", this.iscjbj);
		}
		return iscjbjmc;
	}
	public void setIscjbjmc(String iscjbjmc) {
		this.iscjbjmc = iscjbjmc;
	}
	public String getBjcjlxmc() {
		if(ValidateHelper.isNotEmptyString(this.bjcjlx)){
			bjcjlxmc = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("ZDY_BJZL", this.bjcjlx);
		}
		return bjcjlxmc;
	}
	public void setBjcjlxmc(String bjcjlxmc) {
		this.bjcjlxmc = bjcjlxmc;
	}
	public ZdryTgxxBean getTgxx() {
		return tgxx;
	}
	public void setTgxx(ZdryTgxxBean tgxx) {
		this.tgxx = tgxx;
	}
	public String getTgxxId() {
		return tgxxId;
	}
	public void setTgxxId(String tgxxId) {
		this.tgxxId = tgxxId;
	}
	public String getJgzt() {
		return jgzt;
	}
	public void setJgzt(String jgzt) {
		this.jgzt = jgzt;
	}
	public String getSftg() {
		LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
		if("0".equals(this.jgzt)){
			sftg = "<span onclick=\"openTgxxPage('" + this.rybh + "','" + this.sfzh + "','detail')\" style=\"color:red\" class=\"cps_span_href\">未接管</span>";
			return sftg;
		}else if("1".equals(this.jgzt)){
			if((loginInfo.getOrgcode().equals(this.wtdwdm)) || loginInfo.getOrgcode().equals(this.sszrdwdm) ){
				sftg = "<span onclick=\"openRyjgWin('" + this.rybh + "','" + this.tgxxId + "','detail')\" style=\"color:green\" class=\"cps_span_href\">已托管</span>";
				return sftg;
			}else{
				if(("".equals(this.wtdwdm) || this.wtdwdm == null) && (loginInfo.getOrgcode().equals(this.jgdwdm))){
					sftg = "<font color='blue'>系统自动托管</font>";
					return sftg;
				}
				if(loginInfo.getOrgcode().equals(this.jgdwdm)){
					sftg = "<span onclick=\"openRyjgWin('" + this.rybh + "','" + this.tgxxId + "','detail')\"" +
					     " style=\"color:green\" class=\"cps_span_href\">已接管</span>";
					return sftg;
				}
			}
		}else if("2".equals(this.jgzt)){
			sftg = "<span onclick=\"openRyjgWin('" + this.rybh + "','" + this.tgxxId + "','detail')\" style=\"color:green\" class=\"cps_span_href\">退回托管</span>";
			return sftg;
		}else{
			sftg = "未托管";
			return sftg;
		}
		return sftg;
	}
	public void setSftg(String sftg) {
		this.sftg = sftg;
	}
	public ZdryThBean getThxx() {
		return thxx;
	}
	public void setThxx(ZdryThBean thxx) {
		this.thxx = thxx;
	}
	public String getWtdwdm() {
		return wtdwdm;
	}
	public void setWtdwdm(String wtdwdm) {
		this.wtdwdm = wtdwdm;
	}
	public String getSfpf() {
		LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
		if("1".equals(this.sfpf) && CommonDBBaseHelper.getOrgLeve(this.pfdwdm) == loginInfo.getLeve()){
			sfpf = "<span onclick=\"openZdryPf('" + this.rybh + "','detail')\" style=\"color:green\" class=\"cps_span_href\">已派发</span>";
		}else{
			if(ValidateHelper.isNotEmptyString(this.sszrdwdm)){
				int orgLeve = CommonDBBaseHelper.getOrgLeve(this.sszrdwdm);
				int userLeve = loginInfo.getLeve();
				if(orgLeve > userLeve){
					sfpf = "已派发";
				}else{
					sfpf = "<font color='red'>未派发</font>";
				}
			}
		}
		return sfpf;
	}
	public void setSfpf(String sfpf) {
		this.sfpf = sfpf;
	}
	public String getSfth() {
		LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
		String userCode = "";
		if(2 == loginInfo.getLeve()){
			userCode = loginInfo.getOrgcode().substring(0,4) + "00000000";
		}else if(3 == loginInfo.getLeve()){
			userCode = loginInfo.getOrgcode().substring(0,6) + "000000";
		}else if(4 == loginInfo.getLeve()){
			userCode = loginInfo.getOrgcode().substring(0,8) + "0000";
		}else if(5 == loginInfo.getLeve()){
			userCode = loginInfo.getOrgcode();
		}
		if("1".equals(this.sfth) && userCode.equals(thdwdm)){
			sfth = "<span onclick=\"openZdryth('" + this.rybh + "','detail')\" style=\"color:green\" class=\"cps_span_href\">已退回</span>";
		}else{
			sfth = "未退回";
		}
		return sfth;
	}
	public void setSfth(String sfth) {
		this.sfth = sfth;
	}
	public String getJgdwdm() {
		return jgdwdm;
	}
	public void setJgdwdm(String jgdwdm) {
		this.jgdwdm = jgdwdm;
	}
	public String getSsgajgjgdm() {
		return ssgajgjgdm;
	}
	public void setSsgajgjgdm(String ssgajgjgdm) {
		this.ssgajgjgdm = ssgajgjgdm;
	}
	public String getXzzzrq() {
		return xzzzrq;
	}
	public void setXzzzrq(String xzzzrq) {
		this.xzzzrq = xzzzrq;
	}
	public String getSspcsdm() {
		return sspcsdm;
	}
	public void setSspcsdm(String sspcsdm) {
		this.sspcsdm = sspcsdm;
	}
	public String getSsxzsqmc() {
		return ssxzsqmc;
	}
	public void setSsxzsqmc(String ssxzsqmc) {
		this.ssxzsqmc = ssxzsqmc;
	}
	public String getSsxzsq() {
		return ssxzsq;
	}
	public void setSsxzsq(String ssxzsq) {
		this.ssxzsq = ssxzsq;
	}
	public String getThdwdm() {
		return thdwdm;
	}
	public void setThdwdm(String thdwdm) {
		this.thdwdm = thdwdm;
	}
	public String getBlqx() {
		return blqx;
	}
	public void setBlqx(String blqx) {
		this.blqx = blqx;
	}
	public String getPfdwdm() {
		return pfdwdm;
	}
	public void setPfdwdm(String pfdwdm) {
		this.pfdwdm = pfdwdm;
	}
	public String getZkdjtjcz() {
		StringBuffer sbs = new StringBuffer();
		sbs.append("<span onclick=\"openZdryInfoPage('detail','" + sfzh +"','"+rybh+"')\" style=\"color:green\" class=\"cps_span_href\">详情</span>&nbsp;");
		zkdjtjcz = sbs.toString();	
		
		return zkdjtjcz;
	}
	public void setZkdjtjcz(String zkdjtjcz) {
		this.zkdjtjcz = zkdjtjcz;
	}
}
