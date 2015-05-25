package com.chinacreator.dwdj.bean;

import com.chinacreator.common.bean.BaseValue;
import com.chinacreator.common.bean.LoginInfo;
import com.chinacreator.common.helper.ActionContextHelper;
import com.chinacreator.common.helper.DateTimeHelper;
import com.chinacreator.common.helper.ValidateHelper;
/**
 * 危爆单位审核信息
 */
public class WbdwShBean extends BaseValue {

	private static final long serialVersionUID = -6187544160625557906L;
	
	/**
	 * 主键ID
	 */
	private String id;
	
	/**
	 * 机构编号
	 */
	private String jgbh;
	
	/**
	 * 单位名称
	 */
	private String dwmc;
	
	/**
	 * 提交人身份证
	 */
	private String tjrsfzh;
	
	/**
	 * 提交人警号
	 */
	private String tjrjh;
	
	/**
	 * 提交人姓名
	 */
	private String tjrxm;
	
	/**
	 * 提交单位代码
	 */
	private String tjdwdm;
	
	/**
	 * 提交单位名称
	 */
	private String tjdwmc;
	
	/**
	 * 提交时间
	 */
	private String tjsj;
	
	/**
	 * 操作类型（1：新增 4：注销  5:恢复）
	 */
	private String czlx;
	private String czlxmc;
	
	/**
	 * 审核人警号
	 */
	private String shrjh;
	
	/**
	 * 审核人姓名
	 */
	private String shrxm;
	
	/**
	 * 审核人身份证
	 */
	private String shrsfzh;
	
	/**
	 * 审核单位代码
	 */
	private String shdwdm;
	
	/**
	 * 审核单位名称
	 */
	private String shdwmc;
	
	/**
	 * 审核时间
	 */
	private String shsj;
	
	/**
	 * 审核状态（0：未审核 1：通过 2：不通过）
	 */
	private String shzt;
	private String shztmc;
	
	/**
	 * 注销时间
	 */
	private String zxsj;
	
	/**
	 * 注销原因
	 */
	private String zxyy;
	
	/**
	 * 是否有效（0:有效 1：无效）
	 */
	private String sfyx;
	
	/**
	 * 操作
	 */
	private String cz;
	

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getJgbh() {
		return jgbh;
	}

	public void setJgbh(String jgbh) {
		this.jgbh = jgbh;
	}

	public String getTjrsfzh() {
		return tjrsfzh;
	}

	public void setTjrsfzh(String tjrsfzh) {
		this.tjrsfzh = tjrsfzh;
	}

	public String getTjrjh() {
		return tjrjh;
	}

	public void setTjrjh(String tjrjh) {
		this.tjrjh = tjrjh;
	}

	public String getTjrxm() {
		return tjrxm;
	}

	public void setTjrxm(String tjrxm) {
		this.tjrxm = tjrxm;
	}

	public String getTjdwdm() {
		return tjdwdm;
	}

	public void setTjdwdm(String tjdwdm) {
		this.tjdwdm = tjdwdm;
	}

	public String getTjdwmc() {
		return tjdwmc;
	}

	public void setTjdwmc(String tjdwmc) {
		this.tjdwmc = tjdwmc;
	}

	public String getTjsj() {
		return tjsj;
	}

	public void setTjsj(String tjsj) {
		this.tjsj = tjsj;
	}

	public String getCzlx() {
		return czlx;
	}

	public void setCzlx(String czlx) {
		this.czlx = czlx;
	}

	public String getShrjh() {
		return shrjh;
	}

	public void setShrjh(String shrjh) {
		this.shrjh = shrjh;
	}

	public String getShrxm() {
		return shrxm;
	}

	public void setShrxm(String shrxm) {
		this.shrxm = shrxm;
	}

	public String getShrsfzh() {
		return shrsfzh;
	}

	public void setShrsfzh(String shrsfzh) {
		this.shrsfzh = shrsfzh;
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

	public String getShsj() {
		return shsj;
	}

	public void setShsj(String shsj) {
		this.shsj = shsj;
	}

	public String getShzt() {
		return shzt;
	}

	public void setShzt(String shzt) {
		this.shzt = shzt;
	}
	
	public String getZxsj() {
		return zxsj;
	}

	public void setZxsj(String zxsj) {
		this.zxsj = zxsj;
	}

	public String getZxyy() {
		return zxyy;
	}

	public void setZxyy(String zxyy) {
		this.zxyy = zxyy;
	}

	public String getSfyx() {
		return sfyx;
	}

	public void setSfyx(String sfyx) {
		this.sfyx = sfyx;
	}

	public String getDwmc() {
		return dwmc;
	}

	public void setDwmc(String dwmc) {
		this.dwmc = dwmc;
	}

	public String getShztmc() {
		if(ValidateHelper.isNotEmptyString(shzt)){
			if("0".equals(shzt)){
				shztmc = "<font color='red'>未审核</font>";
			}else if("1".equals(shzt)){
				shztmc = "审核通过";
			}else if("2".equals(shzt)){
				shztmc = "审核未通过";
			}
		}
		return shztmc;
	}

	public void setShztmc(String shztmc) {
		this.shztmc = shztmc;
	}
	
	public String getCzlxmc() {
		if(ValidateHelper.isNotEmptyString(czlx)){
			if("1".equals(czlx)){
				czlxmc = "新增";
			}else if("4".equals(czlx)){
				czlxmc = "注销";
			}else if("5".equals(czlx)){
				czlxmc = "恢复";
			}
		}
		return czlxmc;
	}

	public void setCzlxmc(String czlxmc) {
		this.czlxmc = czlxmc;
	}

	public String getCz() {
		//LoginInfo loginUser = ActionContextHelper.getLoginInfo();
		cz ="<span class=\"cps_span_href\" onclick=\"openWbdwShWin('" + id + "')\" style=\"color:green\">" +
				"详情" +
			"</span>&nbsp;";
		
//		if(loginUser.getLeve() == 5 && "0".equals(shzt)){
//			cz += "撤回" + "&nbsp;";
//		}else{
//			if(loginUser.getLeve() <= 3){
//				cz += "审核" + "&nbsp;";
//			}
//		}
		return cz;
	}

	public void setCz(String cz) {
		this.cz = cz;
	}

	/**
	 * 初始化提交人信息
	 */
	public void initTjr(){
		LoginInfo login = ActionContextHelper.getLoginInfo();
		this.setTjrjh(login.getUsername());
		this.setTjrsfzh(login.getSfzh());
		this.setTjrxm(login.getRealname());
		this.setTjdwdm(login.getOrgcode());
		this.setTjdwmc(login.getOrgname());
		this.setTjsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss"));
	}
	
	/**
	 * 初始化审核人
	 */
	public void initShr(){
		LoginInfo login = ActionContextHelper.getLoginInfo();
		this.setShrjh(login.getUsername());
		this.setShrsfzh(login.getSfzh());
		this.setShrxm(login.getRealname());
		this.setShdwdm(login.getOrgcode());
		this.setShdwmc(login.getOrgname());
		this.setShsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss"));
	}
}
