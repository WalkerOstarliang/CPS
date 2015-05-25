package com.chinacreator.zagl.bean;

import com.chinacreator.common.bean.LoginInfo;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.helper.ActionContextHelper;
import com.chinacreator.common.helper.DictionaryCacheHellper;
import com.chinacreator.common.helper.ValidateHelper;


/**
 *  机构基本信息bean 
 */

public class DwjbxxBean extends OperateBean {
	private static final long serialVersionUID = 8923811930691167493L;

	/**
	 * 机构编号 主键
	 */
	private String jgbh;
	
	/**
	 * 单位名称
	 */
	private String dwmc;
	
	/**
	 * 行业类别
	 */
	private String hylb;
	private String oldhylb;
	private String hylb_old;
	private String [] hylbs;
	
	/**
	 * 危爆单位分类
	 */
	private String wbdwfl;
	
	/**
	 * 危爆单位货物类别
	 */
	private String wbdwhwlb;
	
	/**
	 * 行业类别名称
	 */
	private String hylbmc;
	
	
	private String dwlb;
	
	/**
	 * 单位类别名称
	 */
	private String dwlbmc;
	
	private String dwlbdl;
	
	private String dwlbdlmc;
	
	private String dwlbxl;
	
	private String dwlbxlmc;
	
	/**
	 * 单位性质
	 */
	private String dwxz;
	
	/**
	 * 单位地址
	 */
	private String dwdz;
	
	/**
	 * 单位性质名称
	 */
	private String dwxzmc;
	
	/**
	 * 从业人数
	 */
	private String cyrs;
	
	/**
	 * 董事长
	 */
	private String dsz;
	
	/**
	 * 单位传真
	 */
	private String dwcz;
	
	/**
	 * 单位电话
	 */
	private String dwdh;
	
	/**
	 * 单位代码(组织机构代码)
	 */
	private String dwdm;
	
	/**
	 * 单位电子邮箱
	 */
	private String dwdzyx;
	
	/**
	 * 消防等级
	 */
	private String fhdj;
	/**
	 * 消防等级名称
	 */
	private String fhdjmc;
	
	/**
	 * 法人代表
	 */
	private String frdb;
	
	/**
	 * 法人身份证号码
	 */
	private String frsfzhm;
	
	/**
	 * 法人联系电话
	 */
	private String frlxdh;
	
	/**
	 * 法人住址
	 */
	private String frzz;
	
	/**
	 * 分支机构
	 */
	private String fzjg;
	
	/**
	 * 发照日期
	 */
	private String fzrq;
	
	/**
	 * 管理部门
	 */
	private String glbm;
	
	/**
	 * 管理部门名称
	 */
	private String glbmmc;
	
	/**
	 * 管理级别
	 */
	private String gljb;
	
	/**
	 * 管理级别名称
	 */
	private String gljbmc;
	
	/**
	 * 地址ID
	 */
	private String dzid;
	
	/**
	 * 房屋编码
	 */
	private String fwbh;
	
	/**
	 * 经营范围
	 */
	private String jyfw;
	
	/**
	 * 开业日期
	 */
	private String kyrq;
	
	/**
	 * 税务登记号
	 */
	private String swdjh;
	
	/**
	 * 有效期限
	 */
	private String yxqx;
	
	/**
	 * 营业执照号
	 */
	private String yyzzbh;
	
	/**
	 * 邮政编码
	 */
	private String yzbm;
	
	/**
	 * 治安负责人
	 */
	private String zafzr;
	
	/**
	 * 注册地址
	 */
	private String zcdz;
	
	/**
	 * 注册区划
	 */
	private String zcqh;
	
	/**
	 * 注册日期
	 */
	private String zcrq;
	
	/**
	 * 注册资本
	 */
	private String zczb;
	
	/**
	 * 重点单位标识
	 */
	private String zddwbs;
	private String zddwbsmc;
	
	/**
	 * 主管部门
	 */
	private String zgbm;
	
	/**
	 * 各个股东出资情况
	 */
	private String gggdczqk;
	
	/**
	 * 保密级别
	 */
	private String bmjb;
	
	/**
	 * 保密级别名称
	 */
	private String bmjbmc;
	
	/**
	 * 备注
	 */
	private String bz;
	
	/**
	 * 注销标识
	 */
	private String zxbs;
	
	/**
	 * 注销标识名称
	 */
	private String zxbsmc;
	
	/**
	 * 注销日期
	 */
	private String zxrq;
	
	/**
	 * 注销原因
	 */
	private String zxyy;
	
	/**
	 * 责任民警姓名
	 */
	private String zrmjxm;
	
	
	/**
	 * 责任民警警号
	 */
	private String zrmjjh;
	
	/**
	 * 责任民警电话
	 */
	private String zrmjdh;
	
	/**
	 * 责任单位代码
	 */
	private String zrdwpcsdm;
	
	/**
	 * 责任单位名称
	 */
	private String zrdwpcsmc;
	
	private String dwcxcz;
	
	/**
	 * 所属社区代码
	 */
	private String sssqdm;
	
	/**
	 * 外文名
	 */
	private String wwm;
	
	/**
	 * 是否内保管理
	 */
	private String sfnbgl;
	private String sfnbglms;
	
	/**
	 * 是否治安管理
	 */
	private String sfzagl;
	
	/**
	 * 是否网监管理
	 */
	private String sfwjgl;
	
	/**
	 * 是否消防管理
	 */
	private String sfxfgl;
	
	/**
	 * 单位管理部门核实操作
	 */
	private String dwhscz;
	
	/**
	 * 单位分类
	 */
	private String dwfl;
	private String dwflmc;
	
	/**
	 * 预警颜色
	 */
	private String yjys;
	
	/**
	 * 原业务系统主键
	 */
	private String yxtzj;
	
	
	/**
	 * 业务系统类型
	 */
	private String ywxtlx;
	
	public String getJgbh() {
		return jgbh;
	}

	public void setJgbh(String jgbh) {
		this.jgbh = jgbh;
	}

	public String getDwmc() {
		return dwmc;
	}

	public void setDwmc(String dwmc) {
		this.dwmc = dwmc;
	}
	
	public String getHylb() {
		if(this.hylbs != null)
		{
			hylb = "";
			for(int i=0; i<hylbs.length; i++)
			{
				if(i < hylbs.length-1)
				{
					hylb += hylbs[i] + ",";
				}
				else
				{
					hylb += hylbs[i];
				}
			}
		}
		return hylb;
	}

	public void setHylb(String hylb) {
		this.hylb = hylb;
	}

	public String getHylb_old() {
		if(ValidateHelper.isEmptyString(this.hylb_old)){
			hylb_old = hylb;
		}
		return hylb_old;
	}

	public void setHylb_old(String hylb_old) {
		this.hylb_old = hylb_old;
	}

	public String getHylbmc() {
		hylbmc = "";
		if(hylb != null){
			String [] str = hylb.split(",");
			for(int i=0; i<str.length; i++){
				if(i<str.length -1){
					hylbmc += DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("ZDY_HYLB", str[i]) + ",";
				}else{
					hylbmc += DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("ZDY_HYLB", str[i]);
				}
			}
		}
		return hylbmc;
	}

	public void setHylbmc(String hylbmc) {
		this.hylbmc = hylbmc;
	}

	public String[] getHylbs() {
		if(this.hylb != null){
			hylbs = hylb.split(",");
		}
		return hylbs;
	}

	public void setHylbs(String[] hylbs) {
		this.hylbs = hylbs;
	}

	public String getDwxz() {
		return dwxz;
	}

	public void setDwxz(String dwxz) {
		this.dwxz = dwxz;
	}

	public String getDwdz() {
		return dwdz;
	}

	public void setDwdz(String dwdz) {
		this.dwdz = dwdz;
	}

	public String getDwxzmc() {
		if(ValidateHelper.isNotEmptyString(this.dwxz)){
			dwxzmc = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("ZAGL_DWXZ", this.dwxz);
		}
		return dwxzmc;
	}

	public void setDwxzmc(String dwxzmc) {
		this.dwxzmc = dwxzmc;
	}

	public String getCyrs() {
		return cyrs;
	}

	public void setCyrs(String cyrs) {
		this.cyrs = cyrs;
	}

	public String getDsz() {
		return dsz;
	}

	public void setDsz(String dsz) {
		this.dsz = dsz;
	}

	public String getDwcz() {
		return dwcz;
	}

	public void setDwcz(String dwcz) {
		this.dwcz = dwcz;
	}

	public String getDwdh() {
		return dwdh;
	}

	public void setDwdh(String dwdh) {
		this.dwdh = dwdh;
	}

	public String getDwdm() {
		return dwdm;
	}

	public void setDwdm(String dwdm) {
		this.dwdm = dwdm;
	}

	public String getDwdzyx() {
		return dwdzyx;
	}

	public void setDwdzyx(String dwdzyx) {
		this.dwdzyx = dwdzyx;
	}

	public String getFhdj() {
		return fhdj;
	}

	public void setFhdj(String fhdj) {
		this.fhdj = fhdj;
	}

	public String getFhdjmc() {
		if(ValidateHelper.isNotEmptyString(this.fhdj)){
			fhdjmc = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("ZAGL_XFDJ", this.fhdj);
		}
		return fhdjmc;
	}

	public void setFhdjmc(String fhdjmc) {
		this.fhdjmc = fhdjmc;
	}

	public String getFrdb() {
		return frdb;
	}

	public void setFrdb(String frdb) {
		this.frdb = frdb;
	}

	public String getFrsfzhm() {
		return frsfzhm;
	}

	public void setFrsfzhm(String frsfzhm) {
		this.frsfzhm = frsfzhm;
	}

	public String getFrlxdh() {
		return frlxdh;
	}

	public void setFrlxdh(String frlxdh) {
		this.frlxdh = frlxdh;
	}

	public String getFrzz() {
		return frzz;
	}

	public void setFrzz(String frzz) {
		this.frzz = frzz;
	}

	public String getFzjg() {
		return fzjg;
	}

	public void setFzjg(String fzjg) {
		this.fzjg = fzjg;
	}

	public String getFzrq() {
		return fzrq;
	}

	public void setFzrq(String fzrq) {
		this.fzrq = fzrq;
	}

	public String getGlbm() {
		return glbm;
	}

	public void setGlbm(String glbm) {
		this.glbm = glbm;
	}

	public String getGlbmmc() {
		if(ValidateHelper.isNotEmptyString(this.glbm)){
			glbmmc = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("ZAGL_GLBM", this.glbm);
		}
		return glbmmc;
	}

	public void setGlbmmc(String glbmmc) {
		this.glbmmc = glbmmc;
	}

	public String getGljb() {
		return gljb;
	}

	public void setGljb(String gljb) {
		this.gljb = gljb;
	}

	public String getGljbmc() {
		if(ValidateHelper.isNotEmptyString(this.gljb)){
			gljbmc = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("ZAGL_GLJB", this.gljb);
		}
		return gljbmc;
	}

	public void setGljbmc(String gljbmc) {
		this.gljbmc = gljbmc;
	}

	public String getDzid() {
		return dzid;
	}

	public void setDzid(String dzid) {
		this.dzid = dzid;
	}

	public String getFwbh() {
		return fwbh;
	}

	public void setFwbh(String fwbh) {
		this.fwbh = fwbh;
	}

	public String getJyfw() {
		return jyfw;
	}

	public void setJyfw(String jyfw) {
		this.jyfw = jyfw;
	}

	public String getKyrq() {
		return kyrq;
	}

	public void setKyrq(String kyrq) {
		this.kyrq = kyrq;
	}

	public String getSwdjh() {
		return swdjh;
	}

	public void setSwdjh(String swdjh) {
		this.swdjh = swdjh;
	}

	public String getYxqx() {
		return yxqx;
	}

	public void setYxqx(String yxqx) {
		this.yxqx = yxqx;
	}

	public String getYyzzbh() {
		return yyzzbh;
	}

	public void setYyzzbh(String yyzzbh) {
		this.yyzzbh = yyzzbh;
	}

	public String getYzbm() {
		return yzbm;
	}

	public void setYzbm(String yzbm) {
		this.yzbm = yzbm;
	}

	public String getZafzr() {
		return zafzr;
	}

	public void setZafzr(String zafzr) {
		this.zafzr = zafzr;
	}

	public String getZcdz() {
		return zcdz;
	}

	public void setZcdz(String zcdz) {
		this.zcdz = zcdz;
	}

	public String getZcqh() {
		return zcqh;
	}

	public void setZcqh(String zcqh) {
		this.zcqh = zcqh;
	}

	public String getZcrq() {
		return zcrq;
	}

	public void setZcrq(String zcrq) {
		this.zcrq = zcrq;
	}

	public String getZczb() {
		return zczb;
	}

	public void setZczb(String zczb) {
		this.zczb = zczb;
	}

	public String getZddwbs() {
		return zddwbs;
	}

	public void setZddwbs(String zddwbs) {
		this.zddwbs = zddwbs;
	}
	
	public String getZddwbsmc() {
		if(ValidateHelper.isNotEmptyString(this.zddwbs)){
			zddwbsmc = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("ZAGL_ZDDJ", this.zddwbs);
		}
		return zddwbsmc;
	}

	public void setZddwbsmc(String zddwbsmc) {
		this.zddwbsmc = zddwbsmc;
	}

	public String getZgbm() {
		return zgbm;
	}

	public void setZgbm(String zgbm) {
		this.zgbm = zgbm;
	}

	public String getGggdczqk() {
		return gggdczqk;
	}

	public void setGggdczqk(String gggdczqk) {
		this.gggdczqk = gggdczqk;
	}

	public String getBmjb() {
		return bmjb;
	}

	public void setBmjb(String bmjb) {
		this.bmjb = bmjb;
	}

	public String getBmjbmc() {
		if(ValidateHelper.isNotEmptyString(getBmjb())){
			bmjbmc = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("ZAGL_BMJB", getBmjb());
		}
		return bmjbmc;
	}

	public void setBmjbmc(String bmjbmc) {
		this.bmjbmc = bmjbmc;
	}

	public String getBz() {
		return bz;
	}

	public void setBz(String bz) {
		this.bz = bz;
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

	public String getZrmjxm() {
		return zrmjxm;
	}

	public void setZrmjxm(String zrmjxm) {
		this.zrmjxm = zrmjxm;
	}

	public String getZrmjjh() {
		return zrmjjh;
	}

	public void setZrmjjh(String zrmjjh) {
		this.zrmjjh = zrmjjh;
	}

	public String getZrmjdh() {
		return zrmjdh;
	}

	public void setZrmjdh(String zrmjdh) {
		this.zrmjdh = zrmjdh;
	}

	public String getZrdwpcsdm() {
		return zrdwpcsdm;
	}

	public void setZrdwpcsdm(String zrdwpcsdm) {
		this.zrdwpcsdm = zrdwpcsdm;
	}

	public String getZrdwpcsmc() {
		return zrdwpcsmc;
	}

	public void setZrdwpcsmc(String zrdwpcsmc) {
		this.zrdwpcsmc = zrdwpcsmc;
	}

	public String getZxbsmc() {
		if("0".equals(this.zxbs)){
			zxbsmc = "正常";
		}else if("1".equals(this.zxbs)){
			zxbsmc = "<font color='red'>已注销</font>";
		}
		return zxbsmc;
	}

	public void setZxbsmc(String zxbsmc) {
		this.zxbsmc = zxbsmc;
	}

	public String getDwlb()
	{
		return dwlb;
	}

	public void setDwlb(String dwlb)
	{
		this.dwlb = dwlb;
	}

	public String getDwlbdl()
	{
		if (ValidateHelper.isNotEmptyString(dwlb) && ValidateHelper.isEmptyString(dwlbdl))
		{
			dwlbdl = dwlb.substring(0, 2) + "00";
		}
		return dwlbdl;
	}

	public void setDwlbdl(String dwlbdl)
	{
		this.dwlbdl = dwlbdl;
	}

	public String getDwlbxl()
	{
		if (ValidateHelper.isNotEmptyString(dwlb) && ValidateHelper.isEmptyString(dwlbxl))
		{
			dwlbxl = dwlb;
		}
		return dwlbxl;
	}

	public void setDwlbxl(String dwlbxl)
	{
		this.dwlbxl = dwlbxl;
	}

	public String getDwcxcz()
	{
		LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
		String userOrg = loginInfo.getOrgcode();
		if("09".equals(this.hylb)){
			dwcxcz = "<span class=\"cps_span_href\" onclick=\"openJfdwInfo('" + CommonConstant.OPERTYPE_DETAIL + "','" + jgbh + "')\" style=\"color:green\">详情</span>&nbsp;";
			dwcxcz += "<span class=\"cps_span_href\" onclick=\"openJfdwInfo('" + CommonConstant.OPERTYPE_UPDATE + "','" + jgbh + "')\" style=\"color:green\">修改</span>&nbsp;";
			dwcxcz += "<span class=\"cps_span_href\" onclick=\"openNsxx('" + jgbh + "')\" style=\"color:green\">年审</span>&nbsp;";
			if("0".equals(this.zxbs)){
				dwcxcz += "<span class=\"cps_span_href\" onclick=\"delDw('" + jgbh + "')\" style=\"color:green\">注销</span>&nbsp;";
			}
			else if("1".equals(this.zxbs) && ValidateHelper.isEmptyString(yxtzj)){
				dwcxcz += "<span class=\"cps_span_href\" onclick=\"resetDw('" + jgbh + "')\" style=\"color:green\">恢复</span>&nbsp;";
				
			}
		}else{
			dwcxcz = "<span class=\"cps_span_href\" onclick=\"openDwDetail('" + jgbh + "','" + hylb + "')\" style=\"color:green\">详情</span>&nbsp;";
			if ((userOrg != null) && 
					(userOrg.equals(getDjdwdm()) || loginInfo.getOrgcode().equals(getCzdwdm()) 
							|| loginInfo.getOrgcode().equals(zrdwpcsdm)))
				
			{
				if("0".equals(this.zxbs)){
					dwcxcz += "<span class=\"cps_span_href\" onclick=\"openUpldateDwInfo('" + jgbh + "')\" style=\"color:green\">修改</span>&nbsp;";
					if(ValidateHelper.isEmptyString(yxtzj) || ("04".equals(hylb) && loginInfo.getLeve() <= 3)){
						dwcxcz += "<span class=\"cps_span_href\" onclick=\"delDw('" + jgbh + "')\" style=\"color:green\">注销</span>&nbsp;";
					}
				}
				else if("1".equals(this.zxbs) && ValidateHelper.isEmptyString(yxtzj)){
					dwcxcz += "<span class=\"cps_span_href\" onclick=\"resetDw('" + jgbh + "')\" style=\"color:green\">恢复</span>&nbsp;";
					
				}
			}
		}
		
		return dwcxcz;
	}

	public void setDwcxcz(String dwcxcz)
	{
		this.dwcxcz = dwcxcz;
	}

	public String getDwlbmc() {
		if(ValidateHelper.isNotEmptyString(this.dwlb)){
			dwlbmc = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("JG_DWLB", this.dwlb);
		}
		return dwlbmc;
	}

	public void setDwlbmc(String dwlbmc) {
		this.dwlbmc = dwlbmc;
	}

	public String getDwlbdlmc() {
		if(ValidateHelper.isNotEmptyString(getDwlbdl())){
			dwlbdlmc = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("JG_DWLB", getDwlbdl());
		}
		return dwlbdlmc;
	}

	public void setDwlbdlmc(String dwlbdlmc) {
		this.dwlbdlmc = dwlbdlmc;
	}

	public String getDwlbxlmc() {
		if(ValidateHelper.isNotEmptyString(getDwlbxl())){
			dwlbxlmc = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("JG_DWLB", getDwlbxl());
		}
		return dwlbxlmc;
	}

	public void setDwlbxlmc(String dwlbxlmc) {
		this.dwlbxlmc = dwlbxlmc;
	}

	public String getSssqdm() {
		return sssqdm;
	}

	public void setSssqdm(String sssqdm) {
		this.sssqdm = sssqdm;
	}

	public String getWwm() {
		return wwm;
	}

	public void setWwm(String wwm) {
		this.wwm = wwm;
	}

	public String getOldhylb()
	{
		return oldhylb;
	}

	public void setOldhylb(String oldhylb)
	{
		this.oldhylb = oldhylb;
	}

	public String getSfnbgl() {
		return sfnbgl;
	}

	public void setSfnbgl(String sfnbgl) {
		this.sfnbgl = sfnbgl;
	}

	public String getSfzagl() {
		return sfzagl;
	}

	public void setSfzagl(String sfzagl) {
		this.sfzagl = sfzagl;
	}

	public String getSfwjgl() {
		return sfwjgl;
	}

	public void setSfwjgl(String sfwjgl) {
		this.sfwjgl = sfwjgl;
	}

	public String getSfxfgl() {
		return sfxfgl;
	}

	public void setSfxfgl(String sfxfgl) {
		this.sfxfgl = sfxfgl;
	}

	public String getDwhscz() {
		return dwhscz;
	}

	public void setDwhscz(String dwhscz) {
		this.dwhscz = dwhscz;
	}

	public String getDwfl() {
		return dwfl;
	}

	public void setDwfl(String dwfl) {
		this.dwfl = dwfl;
	}

	public String getYjys() {
		if("red".equals(yjys)){
			yjys = "<span class=\"cps_span_href\" onclick=\"openYjysWin('" + jgbh + "')\" style=\"color:red\">红色</span>";
			//yjys = "<font color='red'></font>";
		}else if("yellow".equals(yjys)){
			yjys = "<span class=\"cps_span_href\" onclick=\"openYjysWin('" + jgbh + "')\" style=\"color:orange\">黄色</span>";
			//yjys = "<font color='orange'>黄色</font>";
		}else if("green".equals(yjys)){
			yjys = "<span class=\"cps_span_href\" onclick=\"openYjysWin('" + jgbh + "')\" style=\"color:green\">绿色</span>";
			//yjys = "<font color='green'>绿色</font>";
		}
		return yjys;
	}

	public void setYjys(String yjys) {
		this.yjys = yjys;
	}

	public String getDwflmc() {
		if(ValidateHelper.isNotEmptyString(dwfl)){
			dwflmc = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("ZDY_NBDWLB", dwfl);
		}
		return dwflmc;
	}

	public void setDwflmc(String dwflmc) {
		this.dwflmc = dwflmc;
	}

	public String getSfnbglms() {
		if("1".equals(sfnbgl)){
			sfnbglms = "是";
		}else if("0".equals(sfnbgl)){
			sfnbglms = "否";
		}else if(null == sfnbgl){
			sfnbglms = "未核签";
		}
		return sfnbglms;
	}

	public void setSfnbglms(String sfnbglms) {
		this.sfnbglms = sfnbglms;
	}

	public String getYxtzj() {
		return yxtzj;
	}

	public void setYxtzj(String yxtzj) {
		this.yxtzj = yxtzj;
	}

	public String getYwxtlx() {
		return ywxtlx;
	}

	public void setYwxtlx(String ywxtlx) {
		this.ywxtlx = ywxtlx;
	}

	public String getWbdwhwlb() {
		return wbdwhwlb;
	}

	public void setWbdwhwlb(String wbdwhwlb) {
		this.wbdwhwlb = wbdwhwlb;
	}

	public String getWbdwfl() {
		return wbdwfl;
	}

	public void setWbdwfl(String wbdwfl) {
		this.wbdwfl = wbdwfl;
	}
}
