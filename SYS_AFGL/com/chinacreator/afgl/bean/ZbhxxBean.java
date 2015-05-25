package com.chinacreator.afgl.bean;

/**
 * 治保会信息
 *
 */
public class ZbhxxBean 
{
	private String zbhbh;				//治保会编号
	private String zbhmc; 				//治保会名称
	private String sssqjwdm; 			//所属社区警务代码
	private String sspcsdm; 			//所属派出所代码
	private String zbhfzrxm; 			//治保会责任人姓名
	private String zbhfzrlxdh; 			//治保会负责人联系电话
	private String cjsj; 				//创建时间
	private String zxsj; 				//注销时间
	private String zxyy; 				//注销原因
	private String djrxm; 				//登记人姓名
	private String djrjh;				//登记人警号
	private String djdwdm; 				//登记单位代码
	private String djdwmc; 				//登记单位名称
	private String djsj;				//登记时间
	private String sssqjwmc; 			//所属社区警务名称
	private String sspcsmc; 			//所属派出所名称
	private String zxbs; 				//注消标识
	private String zxbsmc; 				//注消标识
	private String cz;
	private String czbs;
	private String djrsfzh;
	private String sssqdm;
	private String sssqmc;
	
	public String getDjrsfzh() {
		return djrsfzh;
	}
	public void setDjrsfzh(String djrsfzh) {
		this.djrsfzh = djrsfzh;
	}
	public String getZbhbh() {
		return zbhbh;
	}
	public void setZbhbh(String zbhbh) {
		this.zbhbh = zbhbh;
	}
	public String getZbhmc() {
		return zbhmc;
	}
	public void setZbhmc(String zbhmc) {
		this.zbhmc = zbhmc;
	}
	public String getSssqjwdm() {
		return sssqjwdm;
	}
	public void setSssqjwdm(String sssqjwdm) {
		this.sssqjwdm = sssqjwdm;
	}
	public String getSspcsdm() {
		return sspcsdm;
	}
	public void setSspcsdm(String sspcsdm) {
		this.sspcsdm = sspcsdm;
	}
	public String getZbhfzrxm() {
		return zbhfzrxm;
	}
	public void setZbhfzrxm(String zbhfzrxm) {
		this.zbhfzrxm = zbhfzrxm;
	}
	public String getZbhfzrlxdh() {
		return zbhfzrlxdh;
	}
	public void setZbhfzrlxdh(String zbhfzrlxdh) {
		this.zbhfzrlxdh = zbhfzrlxdh;
	}
	public String getCjsj() {
		return cjsj;
	}
	public void setCjsj(String cjsj) {
		this.cjsj = cjsj;
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
	public String getDjrxm() {
		return djrxm;
	}
	public void setDjrxm(String djrxm) {
		this.djrxm = djrxm;
	}
	public String getDjrjh() {
		return djrjh;
	}
	public void setDjrjh(String djrjh) {
		this.djrjh = djrjh;
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
	public String getSssqjwmc() {
		return sssqjwmc;
	}
	public void setSssqjwmc(String sssqjwmc) {
		this.sssqjwmc = sssqjwmc;
	}
	public String getSspcsmc() {
		return sspcsmc;
	}
	public void setSspcsmc(String sspcsmc) {
		this.sspcsmc = sspcsmc;
	}
	public String getCz() {
		return cz;
	}
	public void setCz(String cz) {
		this.cz = cz;
	}
	public String getCzbs() {
		return czbs;
	}
	public void setCzbs(String czbs) {
		this.czbs = czbs;
	}
	public String getZxbs() {
		return zxbs;
	}
	public void setZxbs(String zxbs) {
		this.zxbs = zxbs;
	}
	public String getZxbsmc() {
		if("1".equals(zxbs)){
			zxbsmc = "已注销";
		}else{
			zxbsmc = "使用中";
		}
		return zxbsmc;
	}
	public void setZxbsmc(String zxbsmc) {
		this.zxbsmc = zxbsmc;
	}
	public String getSssqdm()
	{
		return sssqdm;
	}
	public void setSssqdm(String sssqdm)
	{
		this.sssqdm = sssqdm;
	}
	public String getSssqmc()
	{
		return sssqmc;
	}
	public void setSssqmc(String sssqmc)
	{
		this.sssqmc = sssqmc;
	}
	
}
