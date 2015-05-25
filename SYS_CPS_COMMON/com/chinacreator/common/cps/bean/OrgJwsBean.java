package com.chinacreator.common.cps.bean;

import java.util.List;

import com.chinacreator.common.bean.LoginInfo;
import com.chinacreator.common.bean.SystemDictionaryBean;
import com.chinacreator.common.helper.ActionContextHelper;
import com.chinacreator.common.helper.CommonDBBaseHelper;
import com.chinacreator.common.helper.DictionaryCacheHellper;
import com.chinacreator.common.helper.ValidateHelper;

public class OrgJwsBean 
{
	private String xjjxcjl;	//县级局下沉警力
	private String jdxldys;	//街道巡逻队员数
	private String fjs;	//辅警数
	private String pcsfjs;	//派出所辅警数
	private String jwspbfjs;	//警务室配备辅警数
	private String jb;	//级别
	private String jbms;
	private String jwmss;	//警务模式(室)
	private String zbmsl;	//值班模式（轮）
	private String lb;	//类别
	private String lbms;
	private String dj;	//等级
	private String djms;
	private String szjb;	//所长级别
	private String id;	//主键id
	private String bgddlx;	//办公地点类型
	private String bgddlxmc;
	private String wljrfs;	//网络接入方式
	private String wljrfsmc;
	private String orgcode;	//机构代码
	private String orgname;	//机构名称
	private String orgid;	//机构ID
	private String ispcs;	//是否派出所
	private String ispcsmc;
	private String pcsszxm;	//派出所所长姓名
	private String pcsszsfzh;	//派出所所长身份证号
	private String pcsszjh;	//派出所所长警号
	private String pcsfszxm;	//派出所副所长姓名
	private String pcsfszsfzh;	//派出所副所长身份证号
	private String pcsfszjh;	//派出所副所长警号
	private String czrxm;	//操作人姓名
	private String czrdwdm;	//操作人单位代码
	private String czrdwmc;	//操作人单位名称
	private String czsj;	//操作时间
	private String jls;	//警力数
	private String szjxcjl;	//市州局下沉警力
	private String jjjl;	//交警警力
	private String jgjl;	//监管警力
	private String xjjl;	//巡警警力
	private String tjjl;	//特警警力
	private String bzs;	//编制数
	private String jwmsd;	//警务模式(队)
	private String dsmc1;	//队室名称(一队)
	private String dsmc2;	//队室名称(二队)
	private String dsmc3;	//队室名称(三队)
	private String dsmc4;	//队室名称(室)
	private String zbmsb;	//值班模式（班）
	private String zbjc;	//值班警车
	private String zbrsjl;	//值班人数（警力）
	private String zbrslds;	//值班人数（领导数）
	private String zbrsfjs;	//值班人数（辅警数）
	private String xzjd;	//乡镇（街道）
	private String szsfjrxzbz;	//所长是否进乡镇（街道）班子	
	
	private String sfstpz;    //是否经省厅批准
	
	private String sqs;	//社区数
	private String xzcs;	//行政村数
	private String sqjwss;	//社区警务室数	
	private String sqmjs;	//社区民警数	
	private String zzsqmjs;	//专职社区民警数	
	private String sqmjzjlb;	//社区民警占警力比		
	private String sqmjrjpbfjs;	//社区民警人均配备辅警数			
	private String xqmj;	//辖区面积
	private String hjrks;	//户籍人口数
	private String zzrks;	//暂住人口数
	private String zddxs;	//重点对象数
	private String zddws;	//重点单位数
	private String zdcss;	//重点场所数
	
	private String djsj;
	
	private String sqmjpbfjs;
	
	private String szzj;//			所长职级
	private String drsznx;	//		担任所长年限
	private String ncjwss;//			农村警务室数
	private String rjgyjfbz;//人均公用经费保障
    private String sjbfdw;//		实际拨付到位
	private String fhzb;//		防护装备
	private String hjsj;//			获奖时间
	private String hjry;//			获奖荣誉
	private String qtry;//			其他荣誉
	private String jwqs; //警务区数
	
	private String sfjljws; //是否建有警务室 
	
	private String ywjws;
	private String dnts;
	private String jtgj;
	private String bgdd;
	private String jrganw;
	private String jrww;
	
	/**
	 * 派出所等级评定时间
	 */
	private String pcsdjpdsj;
	
	
	boolean showSaveButton = false;
	
	/**
	 * 是否农村警务室
	 */
	private String sfncjws;
	
	/**
	 * 队室名称（二室）
	 */
	private String dsmc5;
	
	/**
	 * 汽车数
	 */
	private String qcs;
	
	/**
	 * 单警装备数
	 */
	private String djzbs;
	
	/**
	 * 防弹头盔数
	 */
	private String fdtks;
	
	/**
	 * 防弹背心数
	 */
	private String fdbxs;
	
	/**
	 * 防刺背心数
	 */
	private String fcbxs;
	
	/**
	 * 实有警力数
	 */
	private String syjls;
	
	/**
	 * 驻村民警数
	 */
	private String zcmjs;
	
	
	private String pcsjwqdj;

	private String cz;
	private String[] fhzbs;
	private String[] hjrys;
	private String[] jtgjs;
	private List<SystemDictionaryBean> fhzbList;
	private List<SystemDictionaryBean> hjryList;
	private List<SystemDictionaryBean> jtgjList;
	
	private String dwleve;
	
	/**
	 * 警务室所辖社区村
	 */
	private String sxsqcmc;
	/**
	 * 警务室地址
	 */
	private String dzid;
	private String dzmc;
	
	/**
	 * 其他防护装备
	 */
	private String qtfhzb;
	
	
	public String getJwqs() {
		return jwqs;
	}
	public void setJwqs(String jwqs) {
		this.jwqs = jwqs;
	}
	public String getSqmjpbfjs() {
		return sqmjpbfjs;
	}
	public void setSqmjpbfjs(String sqmjpbfjs) {
		this.sqmjpbfjs = sqmjpbfjs;
	}
	public String getJwmss() {
		return jwmss;
	}
	public void setJwmss(String jwmss) {
		this.jwmss = jwmss;
	}
	public String getZbmsl() {
		return zbmsl;
	}
	public void setZbmsl(String zbmsl) {
		this.zbmsl = zbmsl;
	}
	public String getBzs() {
		return bzs;
	}
	public void setBzs(String bzs) {
		this.bzs = bzs;
	}
	public String getJwmsd() {
		return jwmsd;
	}
	public void setJwmsd(String jwmsd) {
		this.jwmsd = jwmsd;
	}
	public String getDsmc1() {
		return dsmc1;
	}
	public void setDsmc1(String dsmc1) {
		this.dsmc1 = dsmc1;
	}
	public String getDsmc2() {
		return dsmc2;
	}
	public void setDsmc2(String dsmc2) {
		this.dsmc2 = dsmc2;
	}
	public String getDsmc3() {
		return dsmc3;
	}
	public void setDsmc3(String dsmc3) {
		this.dsmc3 = dsmc3;
	}
	public String getDsmc4() {
		return dsmc4;
	}
	public void setDsmc4(String dsmc4) {
		this.dsmc4 = dsmc4;
	}
	public String getZbmsb() {
		return zbmsb;
	}
	public void setZbmsb(String zbmsb) {
		this.zbmsb = zbmsb;
	}
	public String getZbjc() {
		return zbjc;
	}
	public void setZbjc(String zbjc) {
		this.zbjc = zbjc;
	}
	public String getZbrsjl() {
		return zbrsjl;
	}
	public void setZbrsjl(String zbrsjl) {
		this.zbrsjl = zbrsjl;
	}
	public String getZbrslds() {
		return zbrslds;
	}
	public void setZbrslds(String zbrslds) {
		this.zbrslds = zbrslds;
	}
	public String getZbrsfjs() {
		return zbrsfjs;
	}
	public void setZbrsfjs(String zbrsfjs) {
		this.zbrsfjs = zbrsfjs;
	}
	public String getXzjd() {
		return xzjd;
	}
	public void setXzjd(String xzjd) {
		this.xzjd = xzjd;
	}
	public String getSzsfjrxzbz() {
		return szsfjrxzbz;
	}
	public void setSzsfjrxzbz(String szsfjrxzbz) {
		this.szsfjrxzbz = szsfjrxzbz;
	}
	public String getSqs() {
		return sqs;
	}
	public void setSqs(String sqs) {
		this.sqs = sqs;
	}
	public String getXzcs() {
		return xzcs;
	}
	public void setXzcs(String xzcs) {
		this.xzcs = xzcs;
	}
	public String getSqjwss() {
		return sqjwss;
	}
	public void setSqjwss(String sqjwss) {
		this.sqjwss = sqjwss;
	}
	public String getSqmjs() {
		return sqmjs;
	}
	public void setSqmjs(String sqmjs) {
		this.sqmjs = sqmjs;
	}
	public String getZzsqmjs() {
		return zzsqmjs;
	}
	public void setZzsqmjs(String zzsqmjs) {
		this.zzsqmjs = zzsqmjs;
	}
	public String getSqmjzjlb() {
		if(ValidateHelper.isNotEmptyString(sqmjs) && ValidateHelper.isNotEmptyString(jls)){
			sqmjzjlb = String.format("%.2f", (Double.parseDouble(sqmjs)/Double.parseDouble(jls))*100);
		}
		return sqmjzjlb;
	}
	public void setSqmjzjlb(String sqmjzjlb) {
		this.sqmjzjlb = sqmjzjlb;
	}
	public String getSqmjrjpbfjs() {
		if(ValidateHelper.isNotEmptyString(sqmjs) && ValidateHelper.isNotEmptyString(sqmjpbfjs)){
			this.sqmjrjpbfjs = (int)Math.rint(Double.parseDouble(sqmjpbfjs)/Double.parseDouble(sqmjs)) + "";
		}
		return sqmjrjpbfjs;
	}
	public void setSqmjrjpbfjs(String sqmjrjpbfjs) {
		this.sqmjrjpbfjs = sqmjrjpbfjs;
	}
	public String getXqmj() {
		return xqmj;
	}
	public void setXqmj(String xqmj) {
		this.xqmj = xqmj;
	}
	public String getHjrks() {
		return hjrks;
	}
	public void setHjrks(String hjrks) {
		this.hjrks = hjrks;
	}
	public String getZzrks() {
		return zzrks;
	}
	public void setZzrks(String zzrks) {
		this.zzrks = zzrks;
	}
	public String getZddxs() {
		return zddxs;
	}
	public void setZddxs(String zddxs) {
		this.zddxs = zddxs;
	}
	public String getZddws() {
		return zddws;
	}
	public void setZddws(String zddws) {
		this.zddws = zddws;
	}
	public String getZdcss() {
		return zdcss;
	}
	public void setZdcss(String zdcss) {
		this.zdcss = zdcss;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getBgddlx() {
		return bgddlx;
	}
	public void setBgddlx(String bgddlx) {
		this.bgddlx = bgddlx;
	}
	public String getWljrfs() {
		return wljrfs;
	}
	public void setWljrfs(String wljrfs) {
		this.wljrfs = wljrfs;
	}
	public String getOrgcode() {
		return orgcode;
	}
	public void setOrgcode(String orgcode) {
		this.orgcode = orgcode;
	}
	public String getOrgname() {
		return orgname;
	}
	public void setOrgname(String orgname) {
		this.orgname = orgname;
	}
	public String getBgddlxmc() {
		bgddlxmc = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("ZDY_BGDDLX", bgddlx);
		return bgddlxmc;
	}
	public void setBgddlxmc(String bgddlxmc) {
		this.bgddlxmc = bgddlxmc;
	}
	public String getWljrfsmc() {
		wljrfsmc = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("ZDY_WLJRFS", wljrfs);
		return wljrfsmc;
	}
	public void setWljrfsmc(String wljrfsmc) {
		this.wljrfsmc = wljrfsmc;
	}
	public String getOrgid() {
		return orgid;
	}
	public void setOrgid(String orgid) {
		this.orgid = orgid;
	}
	public String getIspcs() {
		return ispcs;
	}
	public void setIspcs(String ispcs) {
		this.ispcs = ispcs;
	}
	public String getPcsszxm() {
		return pcsszxm;
	}
	public void setPcsszxm(String pcsszxm) {
		this.pcsszxm = pcsszxm;
	}
	public String getPcsszsfzh() {
		return pcsszsfzh;
	}
	public void setPcsszsfzh(String pcsszsfzh) {
		this.pcsszsfzh = pcsszsfzh;
	}
	public String getPcsszjh() {
		return pcsszjh;
	}
	public void setPcsszjh(String pcsszjh) {
		this.pcsszjh = pcsszjh;
	}
	public String getPcsfszxm() {
		return pcsfszxm;
	}
	public void setPcsfszxm(String pcsfszxm) {
		this.pcsfszxm = pcsfszxm;
	}
	public String getPcsfszsfzh() {
		return pcsfszsfzh;
	}
	public void setPcsfszsfzh(String pcsfszsfzh) {
		this.pcsfszsfzh = pcsfszsfzh;
	}
	public String getPcsfszjh() {
		return pcsfszjh;
	}
	public void setPcsfszjh(String pcsfszjh) {
		this.pcsfszjh = pcsfszjh;
	}
	public String getCzrxm() {
		return czrxm;
	}
	public void setCzrxm(String czrxm) {
		this.czrxm = czrxm;
	}
	public String getCzrdwdm() {
		return czrdwdm;
	}
	public void setCzrdwdm(String czrdwdm) {
		this.czrdwdm = czrdwdm;
	}
	public String getCzrdwmc() {
		return czrdwmc;
	}
	public void setCzrdwmc(String czrdwmc) {
		this.czrdwmc = czrdwmc;
	}
	public String getCzsj() {
		return czsj;
	}
	public void setCzsj(String czsj) {
		this.czsj = czsj;
	}
	public String getCz() {
		return cz;
	}
	public void setCz(String cz) {
		this.cz = cz;
	}
	public String getJls() {
		return jls;
	}
	public void setJls(String jls) {
		this.jls = jls;
	}
	public String getSzjxcjl() {
		return szjxcjl;
	}
	public void setSzjxcjl(String szjxcjl) {
		this.szjxcjl = szjxcjl;
	}
	public String getJjjl() {
		return jjjl;
	}
	public void setJjjl(String jjjl) {
		this.jjjl = jjjl;
	}
	public String getJgjl() {
		return jgjl;
	}
	public void setJgjl(String jgjl) {
		this.jgjl = jgjl;
	}
	public String getXjjl() {
		return xjjl;
	}
	public void setXjjl(String xjjl) {
		this.xjjl = xjjl;
	}
	public String getTjjl() {
		return tjjl;
	}
	public void setTjjl(String tjjl) {
		this.tjjl = tjjl;
	}
	public String getXjjxcjl() {
		return xjjxcjl;
	}
	public void setXjjxcjl(String xjjxcjl) {
		this.xjjxcjl = xjjxcjl;
	}
	public String getJdxldys() {
		return jdxldys;
	}
	public void setJdxldys(String jdxldys) {
		this.jdxldys = jdxldys;
	}
	public String getFjs() {
		return fjs;
	}
	public void setFjs(String fjs) {
		this.fjs = fjs;
	}
	public String getPcsfjs() {
		return pcsfjs;
	}
	public void setPcsfjs(String pcsfjs) {
		this.pcsfjs = pcsfjs;
	}
	public String getJwspbfjs() {
		return jwspbfjs;
	}
	public void setJwspbfjs(String jwspbfjs) {
		this.jwspbfjs = jwspbfjs;
	}
	public String getJb() {
		return jb;
	}
	public void setJb(String jb) {
		this.jb = jb;
	}
	public String getLb() {
		return lb;
	}
	public void setLb(String lb) {
		this.lb = lb;
	}
	public String getDj() {
		if(ValidateHelper.isNotEmptyString(pcsjwqdj)){
			 dj = pcsjwqdj;
		}
		return dj;
	}
	public void setDj(String dj) {
		this.dj = dj;
	}
	public String getSzjb() {
		return szjb;
	}
	public void setSzjb(String szjb) {
		this.szjb = szjb;
	}
	public String getIspcsmc() {
		if("1".equals(ispcs)){
			ispcsmc ="是";
		}else{
			ispcsmc = "否";
		}
		return ispcsmc;
	}
	public void setIspcsmc(String ispcsmc) {
		this.ispcsmc = ispcsmc;
	}
	public String getDjsj() {
		return djsj;
	}
	public void setDjsj(String djsj) {
		this.djsj = djsj;
	}
	public String getSzzj() {
		return szzj;
	}
	public void setSzzj(String szzj) {
		this.szzj = szzj;
	}
	public String getDrsznx() {
		return drsznx;
	}
	public void setDrsznx(String drsznx) {
		this.drsznx = drsznx;
	}
	public String getNcjwss() {
		return ncjwss;
	}
	public void setNcjwss(String ncjwss) {
		this.ncjwss = ncjwss;
	}
	public String getRjgyjfbz() {
		return rjgyjfbz;
	}
	public void setRjgyjfbz(String rjgyjfbz) {
		this.rjgyjfbz = rjgyjfbz;
	}
	public String getSjbfdw() {
		return sjbfdw;
	}
	public void setSjbfdw(String sjbfdw) {
		this.sjbfdw = sjbfdw;
	}
	public String getFhzb() {
		StringBuffer sb = new StringBuffer();
		if (ValidateHelper.isNotEmptyArray(fhzbs))
		{
			for (String fhzb : fhzbs)
			{
				sb.append(fhzb + ",");
			}
		}
		if (sb.toString().endsWith(","))
		{
			fhzb = sb.toString().substring(0, sb.toString().length() - 1);
		}
		return fhzb;
	}
	public void setFhzb(String fhzb) {
		this.fhzb = fhzb;
	}
	public String getHjsj() {
		return hjsj;
	}
	public void setHjsj(String hjsj) {
		this.hjsj = hjsj;
	}
	public String getHjry() {
		StringBuffer sb = new StringBuffer();
		if (ValidateHelper.isNotEmptyArray(hjrys))
		{
			for (String hjry : hjrys)
			{
				sb.append(hjry + ",");
			}
		}
		if (sb.toString().endsWith(","))
		{
			hjry = sb.toString().substring(0, sb.toString().length() - 1);
		}
		return hjry;
	}
	public void setHjry(String hjry) {
		this.hjry = hjry;
	}
	public String getQtry() {
		return qtry;
	}
	public void setQtry(String qtry) {
		this.qtry = qtry;
	}
	public List<SystemDictionaryBean> getFhzbList() {
		fhzbList=DictionaryCacheHellper.getSystemDictionaryListByZdlb("ZDY_FHZB");
		return fhzbList;
	}
	public void setFhzbList(List<SystemDictionaryBean> fhzbList) {
		this.fhzbList = fhzbList;
	}
	public List<SystemDictionaryBean> getHjryList() {
		hjryList = DictionaryCacheHellper.getSystemDictionaryListByZdlb("ZDY_HJRY");
		return hjryList;
	}
	public void setHjryList(List<SystemDictionaryBean> hjryList) {
		this.hjryList = hjryList;
	}
	public String[] getFhzbs() {
		if(ValidateHelper.isNotEmptyString(fhzb)){
			fhzbs = fhzb.split(",");
		}
		return fhzbs;
	}
	public void setFhzbs(String[] fhzbs) {
		this.fhzbs = fhzbs;
	}
	public String[] getHjrys() {
		if(ValidateHelper.isNotEmptyString(hjry)){
			hjrys=hjry.split(",");
		}
		return hjrys;
	}
	public void setHjrys(String[] hjrys) {
		this.hjrys = hjrys;
	}
	public String getPcsjwqdj()
	{
		return pcsjwqdj;
	}
	public void setPcsjwqdj(String pcsjwqdj)
	{
		this.pcsjwqdj = pcsjwqdj;
	}
	public String getDwleve()
	{
		return dwleve;
	}
	public void setDwleve(String dwleve)
	{
		this.dwleve = dwleve;
	}
	public List<SystemDictionaryBean> getJtgjList()
	{
		jtgjList = DictionaryCacheHellper.getSystemDictionaryListByZdlb("ZDY_JTGJ");
		return jtgjList;
	}
	public void setJtgjList(List<SystemDictionaryBean> jtgjList)
	{
		this.jtgjList = jtgjList;
	}
	public String getYwjws()
	{
		return ywjws;
	}
	public void setYwjws(String ywjws)
	{
		this.ywjws = ywjws;
	}
	public String getDnts()
	{
		return dnts;
	}
	public void setDnts(String dnts)
	{
		this.dnts = dnts;
	}
	public String getJtgj()
	{
		StringBuffer sb = new StringBuffer();
		if (ValidateHelper.isNotEmptyArray(jtgjs))
		{
			for (String jtgj : jtgjs)
			{
				sb.append(jtgj + ",");
			}
		}
		if (sb.toString().endsWith(","))
		{
			jtgj = sb.toString().substring(0, sb.toString().length() - 1);
		}
		return jtgj;
	}
	public void setJtgj(String jtgj)
	{
		this.jtgj = jtgj;
	}
	public String getBgdd()
	{
		return bgdd;
	}
	public void setBgdd(String bgdd)
	{
		this.bgdd = bgdd;
	}
	public String[] getJtgjs()
	{
		if (ValidateHelper.isNotEmptyString(jtgj))
		{
			jtgjs = jtgj.split(",");
		}
		return jtgjs;
	}
	public void setJtgjs(String[] jtgjs)
	{
		this.jtgjs = jtgjs;
	}
	public String getJrganw()
	{
		return jrganw;
	}
	public void setJrganw(String jrganw)
	{
		this.jrganw = jrganw;
	}
	public String getJrww()
	{
		return jrww;
	}
	public void setJrww(String jrww)
	{
		this.jrww = jrww;
	}
	public String getSxsqcmc() 
	{
		sxsqcmc = "";
		if(ValidateHelper.isNotEmptyString(orgcode))
		{
			List<SystemDictionaryBean> sq = DictionaryCacheHellper.getSqcByJwsdm(orgcode);
			if(sq != null)
			{
				for(int i = 0 ; i < sq.size() ; i ++)
				{
					SystemDictionaryBean bean = sq.get(i);
					if(i == sq.size()-1)
					{
						sxsqcmc += bean.getJc(); 
					}
					else
					{
						sxsqcmc += bean.getJc() + ","; 
					}
				}
			}
		}
		return sxsqcmc;
	}
	public void setSxsqcmc(String sxsqcmc) {
		this.sxsqcmc = sxsqcmc;
	}
	public String getQtfhzb() {
		return qtfhzb;
	}
	public void setQtfhzb(String qtfhzb) {
		this.qtfhzb = qtfhzb;
	}
	public String getDzid() {
		return dzid;
	}
	public void setDzid(String dzid) {
		this.dzid = dzid;
	}
	public String getDzmc() {
		return dzmc;
	}
	public void setDzmc(String dzmc) {
		this.dzmc = dzmc;
	}
	public String getSfncjws() {
		return sfncjws;
	}
	public void setSfncjws(String sfncjws) {
		this.sfncjws = sfncjws;
	}
	public String getDsmc5() {
		return dsmc5;
	}
	public void setDsmc5(String dsmc5) {
		this.dsmc5 = dsmc5;
	}
	public String getQcs() {
		return qcs;
	}
	public void setQcs(String qcs) {
		this.qcs = qcs;
	}
	public String getDjzbs() {
		return djzbs;
	}
	public void setDjzbs(String djzbs) {
		this.djzbs = djzbs;
	}
	public String getFdtks() {
		return fdtks;
	}
	public void setFdtks(String fdtks) {
		this.fdtks = fdtks;
	}
	public String getFdbxs() {
		return fdbxs;
	}
	public void setFdbxs(String fdbxs) {
		this.fdbxs = fdbxs;
	}
	public String getFcbxs() {
		return fcbxs;
	}
	public void setFcbxs(String fcbxs) {
		this.fcbxs = fcbxs;
	}
	public String getSyjls() {
		return syjls;
	}
	public void setSyjls(String syjls) {
		this.syjls = syjls;
	}
	public String getZcmjs() {
		return zcmjs;
	}
	public void setZcmjs(String zcmjs) {
		this.zcmjs = zcmjs;
	}
	public String getSfstpz() {
		return sfstpz;
	}
	public void setSfstpz(String sfstpz) {
		this.sfstpz = sfstpz;
	}
	public String getSfjljws() {
		return sfjljws;
	}
	public void setSfjljws(String sfjljws) {
		this.sfjljws = sfjljws;
	}
	public boolean isShowSaveButton() {
		LoginInfo login = ActionContextHelper.getLoginInfo();
		int orgLeve = CommonDBBaseHelper.getOrgLeve(orgcode);
		int userLeve = login.getLeve();
		if(userLeve < orgLeve){
			if(userLeve == 1){
				if(login.getOrgcode().substring(0,2).equals(orgcode.subSequence(0, 2))){
					showSaveButton = true;
				}
			}else if(userLeve == 2){
				if(login.getOrgcode().substring(0,4).equals(orgcode.subSequence(0, 4))){
					showSaveButton = true;
				}
			}else if(userLeve == 3){
				if(login.getOrgcode().substring(0,6).equals(orgcode.subSequence(0, 6))){
					showSaveButton = true;
				}
			}else if(userLeve == 4){
				if(login.getOrgcode().substring(0,8).equals(orgcode.subSequence(0, 8))){
					showSaveButton = true;
				}
			}
		}else{
			if(userLeve == orgLeve && orgcode.equals(login.getOrgcode())){
				showSaveButton = true;
			} 
		}
		
		return showSaveButton;
	}
	public void setShowSaveButton(boolean showSaveButton) {
		this.showSaveButton = showSaveButton;
	}
	public String getJbms()
	{
		jbms = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("ZDY_PCSJB", jb);
		return jbms;
	}
	public void setJbms(String jbms)
	{
		this.jbms = jbms;
	}
	public String getLbms()
	{
		lbms = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("ZDY_PCSLB", lb);
		return lbms;
	}
	public void setLbms(String lbms)
	{
		this.lbms = lbms;
	}
	public String getDjms()
	{
		djms = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("ZDY_PCSDJ", dj);
		return djms;
	}
	public void setDjms(String djms)
	{
		this.djms = djms;
	}
	public String getPcsdjpdsj() {
		return pcsdjpdsj;
	}
	public void setPcsdjpdsj(String pcsdjpdsj) {
		this.pcsdjpdsj = pcsdjpdsj;
	}
}
