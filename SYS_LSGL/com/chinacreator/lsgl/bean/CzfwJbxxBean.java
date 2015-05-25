package com.chinacreator.lsgl.bean;

import com.chinacreator.common.bean.BaseValue;
import com.chinacreator.common.bean.LoginInfo;
import com.chinacreator.common.helper.ActionContextHelper;
import com.chinacreator.common.helper.DictionaryCacheHellper;

public class CzfwJbxxBean extends BaseValue 
{

	/**
	 * 
	 */
	private static final long serialVersionUID = 8213262407184586166L;
	private String bz;	//备注
	private String fwzt;	//房屋状态
	private String gllb;	//管理类别
	private String djsj;	//登记时间
	private String djrxm;	//登记人
	private String djdwmc;	//登记单位名称
	private String djdwdm;	//登记单位代码
	private String id;	//主键id
	private String czfwbh;	//出租房屋编号
	private String zzbh;	//住址编号
	private String fzxm;	//房主姓名（私有，关联人员）
	private String fzsfzh;	//房主身份证号（私有，关联人员）
	private String fzxb;	//房主性别（私有，关联人员）
	private String jgdwdm;	//机构单位代码（公有，关联机构）
	private String jgdwmc;	//机构单位名称（公有，关联机构）
	private String ryjgbh;	//房主编号
	private String djbh;	//租赁备案证号
	private String cqdw;	//房屋产权单位
	private String lxdh;	//房主联系电话
	private String gljb;	//管理级别
	private String zzlx;	//租住类型
	private String sfxxy;	//是否信息员
	private String czyt;	//承租用途
	private String czytms;
	private String fwlx;	//房屋类型
	private String czjs;	//出租间数
	private String czmj;	//出租面积
	private String czsj;	//出租时间
	private String czyz;	//月租金
	private String sjzzrs;	//实际租住人数
	private String hx;	//户型
	private String czzzsj;	//出租终止时间
	private String zxyy;	//注销原因
	private String dlr;	//治安责任人
	private String dlrsfzh;	//治安责任人身份证
	private String dlrlxfs;	//治安责任人电话
	private String sfqdzrz;	//是否签订责任状
	private String sfqdzrzms;
	private String fwbh;    //房屋编号
	private String czfwbpbm;//出租房屋标牌编码
	private String zxhqsj;
	
	private String cz;
	private String djrsfzh;
	
	public String getFwbh() {
		return fwbh;
	}
	public void setFwbh(String fwbh) {
		this.fwbh = fwbh;
	}
	public String getBz() {
		return bz;
	}
	public void setBz(String bz) {
		this.bz = bz;
	}
	public String getFwzt() {
		return fwzt;
	}
	public void setFwzt(String fwzt) {
		this.fwzt = fwzt;
	}
	public String getGllb() {
		return gllb;
	}
	public void setGllb(String gllb) {
		this.gllb = gllb;
	}
	public String getDjsj() {
		return djsj;
	}
	public void setDjsj(String djsj) {
		this.djsj = djsj;
	}
	public String getDjrxm() {
		return djrxm;
	}
	public void setDjrxm(String djrxm) {
		this.djrxm = djrxm;
	}
	public String getDjdwmc() {
		return djdwmc;
	}
	public void setDjdwmc(String djdwmc) {
		this.djdwmc = djdwmc;
	}
	public String getDjdwdm() {
		return djdwdm;
	}
	public void setDjdwdm(String djdwdm) {
		this.djdwdm = djdwdm;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getCzfwbh() {
		return czfwbh;
	}
	public void setCzfwbh(String czfwbh) {
		this.czfwbh = czfwbh;
	}
	public String getZzbh() {
		return zzbh;
	}
	public void setZzbh(String zzbh) {
		this.zzbh = zzbh;
	}
	public String getFzxm() {
		return fzxm;
	}
	public void setFzxm(String fzxm) {
		this.fzxm = fzxm;
	}
	public String getFzsfzh() {
		return fzsfzh;
	}
	public void setFzsfzh(String fzsfzh) {
		this.fzsfzh = fzsfzh;
	}
	public String getFzxb() {
		return fzxb;
	}
	public void setFzxb(String fzxb) {
		this.fzxb = fzxb;
	}
	public String getJgdwdm() {
		return jgdwdm;
	}
	public void setJgdwdm(String jgdwdm) {
		this.jgdwdm = jgdwdm;
	}
	public String getJgdwmc() {
		return jgdwmc;
	}
	public void setJgdwmc(String jgdwmc) {
		this.jgdwmc = jgdwmc;
	}
	public String getRyjgbh() {
		return ryjgbh;
	}
	public void setRyjgbh(String ryjgbh) {
		this.ryjgbh = ryjgbh;
	}
	public String getDjbh() {
		return djbh;
	}
	public void setDjbh(String djbh) {
		this.djbh = djbh;
	}
	public String getCqdw() {
		return cqdw;
	}
	public void setCqdw(String cqdw) {
		this.cqdw = cqdw;
	}
	public String getLxdh() {
		return lxdh;
	}
	public void setLxdh(String lxdh) {
		this.lxdh = lxdh;
	}
	public String getGljb() {
		return gljb;
	}
	public void setGljb(String gljb) {
		this.gljb = gljb;
	}
	public String getZzlx() {
		return zzlx;
	}
	public void setZzlx(String zzlx) {
		this.zzlx = zzlx;
	}
	public String getSfxxy() {
		return sfxxy;
	}
	public void setSfxxy(String sfxxy) {
		this.sfxxy = sfxxy;
	}
	public String getCzyt() {
		return czyt;
	}
	public void setCzyt(String czyt) {
		this.czyt = czyt;
	}
	public String getFwlx() {
		return fwlx;
	}
	public void setFwlx(String fwlx) {
		this.fwlx = fwlx;
	}
	public String getCzjs() {
		return czjs;
	}
	public void setCzjs(String czjs) {
		this.czjs = czjs;
	}
	public String getCzmj() {
		return czmj;
	}
	public void setCzmj(String czmj) {
		this.czmj = czmj;
	}
	public String getCzsj() {
		return czsj;
	}
	public void setCzsj(String czsj) {
		this.czsj = czsj;
	}
	public String getCzyz() {
		return czyz;
	}
	public void setCzyz(String czyz) {
		this.czyz = czyz;
	}
	public String getSjzzrs() {
		return sjzzrs;
	}
	public void setSjzzrs(String sjzzrs) {
		this.sjzzrs = sjzzrs;
	}
	public String getHx() {
		return hx;
	}
	public void setHx(String hx) {
		this.hx = hx;
	}
	public String getCzzzsj() {
		return czzzsj;
	}
	public void setCzzzsj(String czzzsj) {
		this.czzzsj = czzzsj;
	}
	public String getZxyy() {
		return zxyy;
	}
	public void setZxyy(String zxyy) {
		this.zxyy = zxyy;
	}
	public String getDlr() {
		return dlr;
	}
	public void setDlr(String dlr) {
		this.dlr = dlr;
	}
	public String getDlrsfzh() {
		return dlrsfzh;
	}
	public void setDlrsfzh(String dlrsfzh) {
		this.dlrsfzh = dlrsfzh;
	}
	public String getDlrlxfs() {
		return dlrlxfs;
	}
	public void setDlrlxfs(String dlrlxfs) {
		this.dlrlxfs = dlrlxfs;
	}
	public String getSfqdzrz() {
		return sfqdzrz;
	}
	public void setSfqdzrz(String sfqdzrz) {
		this.sfqdzrz = sfqdzrz;
	}
	public String getCz()
	{
		
		StringBuffer sb = new StringBuffer();
		LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
		if (loginInfo.getOrgcode().equals(djdwdm))
		{
				sb.append("<span onclick=\"openCzjlWin('update','" + czfwbh +"','1')\" style=\"color:green\" class=\"cps_span_href\">修改</span>&nbsp;");
		}
//		if ((loginInfo.getOrgcode().equals(djdwdm)))
//		{
//			sb.append("<span onclick=\"openCzjlWin('update','" + czfwbh +"')\" style=\"color:green\" class=\"cps_span_href\">巡查登记</span>&nbsp;");
//		}
		sb.append("<span onclick=\"openCzjlWin('detail','" + czfwbh +"','1')\" style=\"color:green\" class=\"cps_span_href\">详情</span>&nbsp;");
		cz = sb.toString();
		return cz;
	}
	public void setCz(String cz) {
		this.cz = cz;
	}
	public String getCzytms() {
		czytms = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("ZDY_CZYT", czyt);
		return czytms;
	}
	public void setCzytms(String czytms) {
		this.czytms = czytms;
	}
	public String getSfqdzrzms() {
		sfqdzrzms = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("ZDY_ZDSF", sfqdzrz);
		return sfqdzrzms;
	}
	public void setSfqdzrzms(String sfqdzrzms) {
		this.sfqdzrzms = sfqdzrzms;
	}
	public String getCzfwbpbm()
	{
		return czfwbpbm;
	}
	public void setCzfwbpbm(String czfwbpbm)
	{
		this.czfwbpbm = czfwbpbm;
	}
	public String getZxhqsj()
	{
		return zxhqsj;
	}
	public void setZxhqsj(String zxhqsj)
	{
		this.zxhqsj = zxhqsj;
	}
	public String getDjrsfzh() {
		return djrsfzh;
	}
	public void setDjrsfzh(String djrsfzh) {
		this.djrsfzh = djrsfzh;
	}
	
}
