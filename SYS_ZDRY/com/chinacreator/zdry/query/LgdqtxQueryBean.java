package com.chinacreator.zdry.query;

import com.chinacreator.common.bean.QueryBean;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.helper.DictionaryCacheHellper;

/**
 * @author 禹文超
 * @mail wenchao.yu@chinacreator.com
 * @Description: TODO(首页列管到期提醒查询类)
 * @date Mar 7, 2013 2:34:19 PM
 */
public class LgdqtxQueryBean extends QueryBean {

	/**
	 * 
	 */
	private static final long serialVersionUID = 2222876902270465985L;

	private String id;
	private String sspcsdm;
	private String txlxdm;
	private String xm;
	private String sfzh;
	private String xzdxz;
	private String sckcsj;
	private String kcdqsj;
	private String xxlbdm;
	private String cz;
	private String sqxxbh;
	
	private String txlxmc;
	private String xxlbmc;

	public String getTxlxmc() {
		txlxmc = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm(CommonConstant.ZDRY_ZDLB_TXLB, txlxdm);
		return txlxmc;
	}

	public String getXxlbmc() {
		xxlbmc = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm(CommonConstant.ZDRY_ZDLB_RYLX, xxlbdm);
		return xxlbmc;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getSspcsdm() {
		return sspcsdm;
	}

	public void setSspcsdm(String sspcsdm) {
		this.sspcsdm = sspcsdm;
	}

	public String getTxlxdm() {
		return txlxdm;
	}

	public void setTxlxdm(String txlxdm) {
		this.txlxdm = txlxdm;
	}

	public String getXm() {
		return xm;
	}

	public void setXm(String xm) {
		this.xm = xm;
	}

	public String getSfzh() {
		return sfzh;
	}

	public void setSfzh(String sfzh) {
		this.sfzh = sfzh;
	}

	public String getXzdxz() {
		return xzdxz;
	}

	public void setXzdxz(String xzdxz) {
		this.xzdxz = xzdxz;
	}

	public String getSckcsj() {
		return sckcsj;
	}

	public void setSckcsj(String sckcsj) {
		this.sckcsj = sckcsj;
	}

	public String getKcdqsj() {
		return kcdqsj;
	}

	public void setKcdqsj(String kcdqsj) {
		this.kcdqsj = kcdqsj;
	}

	public String getXxlbdm() {
		return xxlbdm;
	}

	public void setXxlbdm(String xxlbdm) {
		this.xxlbdm = xxlbdm;
	}

	public String getCz() {
		cz = "<a href='#' onclick=\"openStatistics('"+this.getSfzh()+"');\">人员考察</a>&nbsp;";
		cz += "<a href='#' onclick=\"openCkWindow('"+this.getSqxxbh()+"','');\">撤控申请</a>";
		return cz;
	}

	public void setCz(String cz) {
		this.cz = cz;
	}

	public String getSqxxbh() {
		return sqxxbh;
	}

	public void setSqxxbh(String sqxxbh) {
		this.sqxxbh = sqxxbh;
	}

}
