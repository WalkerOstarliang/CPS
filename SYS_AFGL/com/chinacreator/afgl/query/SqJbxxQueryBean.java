package com.chinacreator.afgl.query;

import com.chinacreator.common.bean.QueryBean;
import com.chinacreator.common.helper.ActionContextHelper;
import com.chinacreator.common.helper.ValidateHelper;

public class SqJbxxQueryBean extends QueryBean
{
	/**
	 * 
	 */
	private static final long	serialVersionUID	= 813727499403074056L;
	
	private String jwsdm;
	
	private String sqbh;
	
	private String sqmc;
	
	private String jcwhmc;
	
	private String sqlx;

	private String zxbs;
	
	private String sqleve;
	
	//用于辖区基本情况查询
	private String xqParam;
	
	public String getJcwhmc() {
		return jcwhmc;
	}

	public void setJcwhmc(String jcwhmc) {
		this.jcwhmc = jcwhmc;
	}

	public String getSqmc() {
		return sqmc;
	}

	public void setSqmc(String sqmc) {
		this.sqmc = sqmc;
	}

	public String getSqlx() {
		return sqlx;
	}

	public void setSqlx(String sqlx) {
		this.sqlx = sqlx;
	}

	public String getZxbs() {
		return zxbs;
	}

	public void setZxbs(String zxbs) {
		this.zxbs = zxbs;
	}

	public String getJwsdm()
	{
		return jwsdm;
	}

	public void setJwsdm(String jwsdm)
	{
		this.jwsdm = jwsdm;
	}

	public String getSqbh()
	{
		return sqbh;
	}

	public void setSqbh(String sqbh)
	{
		this.sqbh = sqbh;
	}

	public String getXqParam() {
		if(ValidateHelper.isNotEmptyString(getSqdm())){
			xqParam = getSqdm();
		}else if(ValidateHelper.isNotEmptyString(getJwsqdm())){
			xqParam = getJwsqdm();
		}else if(ValidateHelper.isNotEmptyString(getPcsdm())){
			xqParam = getPcsdm();
		}else if(ValidateHelper.isNotEmptyString(getCountrygajgjgdm())){
			xqParam = getCountrygajgjgdm();
		}else if(ValidateHelper.isNotEmptyString(getCitygajgjgdm())){
			xqParam = getCitygajgjgdm();
		}else{
			xqParam = ActionContextHelper.getLoginInfo().getOrgcode();
		}
		
		return xqParam;
	}

	public void setXqParam(String xqParam) {
		this.xqParam = xqParam;
	}

	public String getSqleve() {
		return sqleve;
	}

	public void setSqleve(String sqleve) {
		this.sqleve = sqleve;
	}
}
