package com.chinacreator.tjbb.bean;

import java.text.NumberFormat;

import com.chinacreator.common.bean.BaseValue;
import com.chinacreator.common.helper.ValidateHelper;

public class PcsJbqkListBean extends BaseValue
{

	/**
	 * 
	 */
	private static final long	serialVersionUID	= -813363475918581163L;
	
	private String id;
	private String orgcode;
	private String orgname;
	private String leve;
	private String zjls;
	private String pcszs;
	private String pcsjls;
	private String pcsjlszzjlsb;
	
	private String pcszfjs;
	private String pcszfbzfjs;
	private String pcsldrkxgys;
	private String pcsxfdys;
	private String sqjwsfjs;
	
	
	private String sqjwss;
	private String sqmjs;
	private String ncjwss;
	private String zcmjs;
	
	private String zcmjzpcsjlb;
	
	private String jwslganws;
	private String stpzs; 
	
	private String sqjwspbzfbzfjs;
	private String sqjwspblkxgys;
	private String sqjwspbxfdys;
	
	private String jsqjwss;
	
	private String sqjwslws;
	private String ncjwslws;
	private String sqzcmjzs;
	private String jwszs;
	
	public String getId()
	{
		return id;
	}
	public void setId(String id)
	{
		this.id = id;
	}
	public String getOrgcode()
	{
		return orgcode;
	}
	public void setOrgcode(String orgcode)
	{
		this.orgcode = orgcode;
	}
	public String getOrgname()
	{
		return orgname;
	}
	public void setOrgname(String orgname)
	{
		this.orgname = orgname;
	}
	public String getLeve()
	{
		return leve;
	}
	public void setLeve(String leve)
	{
		this.leve = leve;
	}
	public String getZjls()
	{
		return zjls;
	}
	public void setZjls(String zjls)
	{
		this.zjls = zjls;
	}
	public String getPcszs()
	{
		return pcszs;
	}
	public void setPcszs(String pcszs)
	{
		this.pcszs = pcszs;
	}
	public String getPcsjls()
	{
		return pcsjls;
	}
	public void setPcsjls(String pcsjls)
	{
		this.pcsjls = pcsjls;
	}
	public String getPcszfjs()
	{
		return pcszfjs;
	}
	public void setPcszfjs(String pcszfjs)
	{
		this.pcszfjs = pcszfjs;
	}
	public String getSqjwsfjs()
	{
		return sqjwsfjs;
	}
	public void setSqjwsfjs(String sqjwsfjs)
	{
		this.sqjwsfjs = sqjwsfjs;
	}
	public String getSqjwss()
	{
		return sqjwss;
	}
	public void setSqjwss(String sqjwss)
	{
		this.sqjwss = sqjwss;
	}
	public String getSqmjs()
	{
		return sqmjs;
	}
	public void setSqmjs(String sqmjs)
	{
		this.sqmjs = sqmjs;
	}
	public String getNcjwss()
	{
		return ncjwss;
	}
	public void setNcjwss(String ncjwss)
	{
		this.ncjwss = ncjwss;
	}
	public String getZcmjs()
	{
		return zcmjs;
	}
	public void setZcmjs(String zcmjs)
	{
		this.zcmjs = zcmjs;
	}
	public String getJwslganws()
	{
		return jwslganws;
	}
	public void setJwslganws(String jwslganws)
	{
		this.jwslganws = jwslganws;
	}
	public String getStpzs() {
		return stpzs;
	}
	public void setStpzs(String stpzs) {
		this.stpzs = stpzs;
	}
	public String getPcsjlszzjlsb()
	{
		if (ValidateHelper.isNotEmptyString(pcsjls) 
				&& ValidateHelper.isNotEmptyString(zjls) 
				&& Double.parseDouble(zjls) != 0)
		{
			double f = Double.parseDouble(pcsjls)/Double.parseDouble(zjls);
			NumberFormat nf = NumberFormat.getPercentInstance();
			nf.setMinimumFractionDigits(1);
			pcsjlszzjlsb = nf.format(f);
		}
		else
		{
			pcsjlszzjlsb="0.00%";
		}
		return pcsjlszzjlsb;
	}
	public void setPcsjlszzjlsb(String pcsjlszzjlsb)
	{
		this.pcsjlszzjlsb = pcsjlszzjlsb;
	}
	public String getPcszfbzfjs()
	{
		return pcszfbzfjs;
	}
	public void setPcszfbzfjs(String pcszfbzfjs)
	{
		this.pcszfbzfjs = pcszfbzfjs;
	}
	public String getPcsldrkxgys()
	{
		return pcsldrkxgys;
	}
	public void setPcsldrkxgys(String pcsldrkxgys)
	{
		this.pcsldrkxgys = pcsldrkxgys;
	}
	public String getPcsxfdys()
	{
		return pcsxfdys;
	}
	public void setPcsxfdys(String pcsxfdys)
	{
		this.pcsxfdys = pcsxfdys;
	}
	public String getZcmjzpcsjlb()
	{
		if (ValidateHelper.isNotEmptyString(sqzcmjzs) 
				&& ValidateHelper.isNotEmptyString(pcsjls) 
				&& Double.parseDouble(pcsjls) != 0)
		{
			double f = Double.parseDouble(sqzcmjzs)/Double.parseDouble(pcsjls);
			NumberFormat nf = NumberFormat.getPercentInstance();
			nf.setMinimumFractionDigits(1);
			zcmjzpcsjlb = nf.format(f);
		}
		else
		{
			zcmjzpcsjlb = "0.00%";
		}
		return zcmjzpcsjlb;
	}
	public void setZcmjzpcsjlb(String zcmjzpcsjlb)
	{
		this.zcmjzpcsjlb = zcmjzpcsjlb;
	}
	public String getSqjwspbzfbzfjs()
	{
		return sqjwspbzfbzfjs;
	}
	public void setSqjwspbzfbzfjs(String sqjwspbzfbzfjs)
	{
		this.sqjwspbzfbzfjs = sqjwspbzfbzfjs;
	}
	public String getSqjwspblkxgys()
	{
		return sqjwspblkxgys;
	}
	public void setSqjwspblkxgys(String sqjwspblkxgys)
	{
		this.sqjwspblkxgys = sqjwspblkxgys;
	}
	public String getSqjwspbxfdys()
	{
		return sqjwspbxfdys;
	}
	public void setSqjwspbxfdys(String sqjwspbxfdys)
	{
		this.sqjwspbxfdys = sqjwspbxfdys;
	}
	public String getJsqjwss()
	{
		return jsqjwss;
	}
	public void setJsqjwss(String jsqjwss)
	{
		this.jsqjwss = jsqjwss;
	}
	public String getSqjwslws()
	{
		return sqjwslws;
	}
	public void setSqjwslws(String sqjwslws)
	{
		this.sqjwslws = sqjwslws;
	}
	public String getNcjwslws()
	{
		return ncjwslws;
	}
	public void setNcjwslws(String ncjwslws)
	{
		this.ncjwslws = ncjwslws;
	}
	public String getSqzcmjzs()
	{
		return sqzcmjzs;
	}
	public void setSqzcmjzs(String sqzcmjzs)
	{
		this.sqzcmjzs = sqzcmjzs;
	}
	public String getJwszs()
	{
		return jwszs;
	}
	public void setJwszs(String jwszs)
	{
		this.jwszs = jwszs;
	}
	
}
