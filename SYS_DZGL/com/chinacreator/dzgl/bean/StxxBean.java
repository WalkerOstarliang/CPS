package com.chinacreator.dzgl.bean;

import com.chinacreator.common.bean.BaseValue;
import com.chinacreator.common.bean.LoginInfo;
import com.chinacreator.common.helper.ActionContextHelper;
import com.chinacreator.common.helper.DictionaryCacheHellper;
import com.chinacreator.common.helper.ValidateHelper;

public class StxxBean extends BaseValue
{

	/**
	 * 
	 */
	private static final long	serialVersionUID	= 2356667365065340854L;
	
	private String id;
	private String stbm;
	private String stmc;
	private String sjxzqh;
	private String sjxzqhmc;
	private String xzqh;
	private String xzqhmc;
	private String jdxzdm;
	private String jdxzmc;
	private String jlxdm;
	private String jlxmc;
	private String sqdm;
	private String sqmc;
	private String mph;
	private String xqz;
	private String ldxz;
	private String stfl;
	private String dmcs;
	private String dxcs;
	private String jzjg;
	private String kfs;
	private String wygldw;
	private String zbdw;
	private String xfdj;
	private String pcsmc;
	private String x;
	private String y;
	private String pcsdm;
	private String isvalid;
	private String gxsj;
	private String ystbm;
	
	private String ssjwqdm;
	
	private String dzmc;
	
	private String djdwdm;
	private String djdwmc;
	private String djrjh;
	private String djrxm;
	private String djsj;
	private String djrsfzh;
	
	private String czrjh;
	private String czrxm;
	private String czdwdm;
	private String czdwmc;
	private String zxbs;
	private String zxbsms;
	private String czsj;
	private String czrsfzh;
	private String cz;
	
	/**
	 * 数据核查  办理期限
	 */
	private String blqx;
	
	public String getId()
	{
		return id;
	}
	public void setId(String id)
	{
		this.id = id;
	}
	public String getStbm()
	{
		return stbm;
	}
	public void setStbm(String stbm)
	{
		this.stbm = stbm;
	}
	public String getStmc()
	{
		return stmc;
	}
	public void setStmc(String stmc)
	{
		this.stmc = stmc;
	}
	public String getXzqh()
	{
		return xzqh;
	}
	public void setXzqh(String xzqh)
	{
		this.xzqh = xzqh;
	}
	public String getXzqhmc()
	{
		return xzqhmc;
	}
	public void setXzqhmc(String xzqhmc)
	{
		this.xzqhmc = xzqhmc;
	}
	public String getJdxzdm()
	{
		return jdxzdm;
	}
	public void setJdxzdm(String jdxzdm)
	{
		this.jdxzdm = jdxzdm;
	}
	public String getJdxzmc()
	{
		return jdxzmc;
	}
	public void setJdxzmc(String jdxzmc)
	{
		this.jdxzmc = jdxzmc;
	}
	public String getJlxdm()
	{
		return jlxdm;
	}
	public void setJlxdm(String jlxdm)
	{
		this.jlxdm = jlxdm;
	}
	public String getJlxmc()
	{
		return jlxmc;
	}
	public void setJlxmc(String jlxmc)
	{
		this.jlxmc = jlxmc;
	}
	public String getSqdm()
	{
		return sqdm;
	}
	public void setSqdm(String sqdm)
	{
		this.sqdm = sqdm;
	}
	public String getSqmc()
	{
		return sqmc;
	}
	public void setSqmc(String sqmc)
	{
		this.sqmc = sqmc;
	}
	public String getMph()
	{
		return mph;
	}
	public void setMph(String mph)
	{
		this.mph = mph;
	}
	public String getXqz()
	{
		return xqz;
	}
	public void setXqz(String xqz)
	{
		this.xqz = xqz;
	}
	public String getLdxz()
	{
		return ldxz;
	}
	public void setLdxz(String ldxz)
	{
		this.ldxz = ldxz;
	}
	public String getStfl()
	{
		return stfl;
	}
	public void setStfl(String stfl)
	{
		this.stfl = stfl;
	}
	public String getDmcs()
	{
		return dmcs;
	}
	public void setDmcs(String dmcs)
	{
		this.dmcs = dmcs;
	}
	public String getDxcs()
	{
		return dxcs;
	}
	public void setDxcs(String dxcs)
	{
		this.dxcs = dxcs;
	}
	public String getJzjg()
	{
		return jzjg;
	}
	public void setJzjg(String jzjg)
	{
		this.jzjg = jzjg;
	}
	public String getKfs()
	{
		return kfs;
	}
	public void setKfs(String kfs)
	{
		this.kfs = kfs;
	}
	public String getWygldw()
	{
		return wygldw;
	}
	public void setWygldw(String wygldw)
	{
		this.wygldw = wygldw;
	}
	public String getZbdw()
	{
		return zbdw;
	}
	public void setZbdw(String zbdw)
	{
		this.zbdw = zbdw;
	}
	public String getXfdj()
	{
		return xfdj;
	}
	public void setXfdj(String xfdj)
	{
		this.xfdj = xfdj;
	}
	public String getPcsmc()
	{
		return pcsmc;
	}
	public void setPcsmc(String pcsmc)
	{
		this.pcsmc = pcsmc;
	}
	public String getX()
	{
		return x;
	}
	public void setX(String x)
	{
		this.x = x;
	}
	public String getY()
	{
		return y;
	}
	public void setY(String y)
	{
		this.y = y;
	}
	public String getPcsdm()
	{
		return pcsdm;
	}
	public void setPcsdm(String pcsdm)
	{
		this.pcsdm = pcsdm;
	}
	public String getIsvalid()
	{
		return isvalid;
	}
	public void setIsvalid(String isvalid)
	{
		this.isvalid = isvalid;
	}
	public String getGxsj()
	{
		return gxsj;
	}
	public void setGxsj(String gxsj)
	{
		this.gxsj = gxsj;
	}
	public String getYstbm()
	{
		return ystbm;
	}
	public void setYstbm(String ystbm)
	{
		this.ystbm = ystbm;
	}
	public String getDjdwdm()
	{
		return djdwdm;
	}
	public void setDjdwdm(String djdwdm)
	{
		this.djdwdm = djdwdm;
	}
	public String getDjdwmc()
	{
		return djdwmc;
	}
	public void setDjdwmc(String djdwmc)
	{
		this.djdwmc = djdwmc;
	}
	public String getDjrjh()
	{
		return djrjh;
	}
	public void setDjrjh(String djrjh)
	{
		this.djrjh = djrjh;
	}
	public String getDjrxm()
	{
		return djrxm;
	}
	public void setDjrxm(String djrxm)
	{
		this.djrxm = djrxm;
	}
	public String getDjsj()
	{
		return djsj;
	}
	public void setDjsj(String djsj)
	{
		this.djsj = djsj;
	}
	public String getDzmc()
	{
		dzmc = "";
		if (ValidateHelper.isNotEmptyString(xzqhmc))
		{
			dzmc += xzqhmc;
		}
		if (ValidateHelper.isNotEmptyString(jdxzmc))
		{
			dzmc += jdxzmc;
		}
		if (ValidateHelper.isNotEmptyString(sqmc))
		{
			dzmc += sqmc;
		}
		if (ValidateHelper.isNotEmptyString(jlxmc))
		{
			dzmc += jlxmc;
		}
		if (ValidateHelper.isNotEmptyString(mph))
		{
			dzmc += mph + "号";
		}
		if (ValidateHelper.isNotEmptyString(xqz))
		{
			dzmc += xqz;
		}
		if (ValidateHelper.isNotEmptyString(ldxz))
		{
			dzmc += ldxz;
		}
		return dzmc;
	}
	public void setDzmc(String dzmc)
	{
		this.dzmc = dzmc;
	}
	public String getSjxzqh()
	{
		return sjxzqh;
	}
	public void setSjxzqh(String sjxzqh)
	{
		this.sjxzqh = sjxzqh;
	}
	public String getSjxzqhmc()
	{
		sjxzqhmc = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("HN_XZQH", sjxzqh);
		return sjxzqhmc;
	}
	public void setSjxzqhmc(String sjxzqhmc)
	{
		this.sjxzqhmc = sjxzqhmc;
	}
	public String getCz()
	{
		LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
		StringBuffer sb = new StringBuffer();
		sb.append("<span class=\"cps_span_href\" onclick=\"openStxxDetailInfoPage('detail','" + id + "')\">详情</span>&nbsp;");
		if (loginInfo.getOrgcode().equals(djdwdm) 
				|| loginInfo.getOrgcode().equals(czdwdm)
				)
		{
			
			if("1".equals(zxbs) || zxbs ==null){
				sb.append("<span class=\"cps_span_href\" onclick=\"openStxxDetailInfoPage('update','" + id + "')\">修改</span>&nbsp;");
				sb.append("<span class=\"cps_span_href\" onclick=\"deleteStxx('" + id + "')\">注销</span>&nbsp;");
				//sb.append("<span class=\"cps_span_href\" onclick=\"deleteStxxBean('" + id + "')\">删除</span>");
			}else{
				sb.append("<span onclick=\"recoveryStxx('" + id + "')\" style=\"color:green\" class=\"cps_span_href\">恢复</span>&nbsp;");
			}
		}
		cz = sb.toString();
		return cz;
	}
	public void setCz(String cz)
	{
		this.cz = cz;
	}
	public String getCzrjh() {
		return czrjh;
	}
	public void setCzrjh(String czrjh) {
		this.czrjh = czrjh;
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
	public String getCzdwmc() {
		return czdwmc;
	}
	public void setCzdwmc(String czdwmc) {
		this.czdwmc = czdwmc;
	}
	public String getZxbs() {
		return zxbs;
	}
	public void setZxbs(String zxbs) {
		this.zxbs = zxbs;
	}
	public String getCzsj() {
		return czsj;
	}
	public void setCzsj(String czsj) {
		this.czsj = czsj;
	}
	public String getZxbsms() {
		zxbsms = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("ZDY_STXX_ZXBS", zxbs);
		if(zxbs == null){
			zxbsms="正常";
		}
		return zxbsms;
	}
	public void setZxbsms(String zxbsms) {
		this.zxbsms = zxbsms;
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
	public String getSsjwqdm()
	{
		return ssjwqdm;
	}
	public void setSsjwqdm(String ssjwqdm)
	{
		this.ssjwqdm = ssjwqdm;
	}
	public String getBlqx() {
		return blqx;
	}
	public void setBlqx(String blqx) {
		this.blqx = blqx;
	}
	
}
