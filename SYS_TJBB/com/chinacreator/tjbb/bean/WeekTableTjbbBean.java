package com.chinacreator.tjbb.bean;

import com.chinacreator.common.bean.BaseValue;

public class WeekTableTjbbBean extends BaseValue
{

	/**
	 * 
	 */
	private static final long	serialVersionUID	= -8998476882214959195L;
	
	private String orgcode;    //机构代码
	private String orgname;    //机构名称
	private String parent_code;    //父类代码
	private String leve;    //层级
	private String tjyf;    //统计月份
	private String tjsj;    //统计时间
	private long zcjs;    //总采集数
	private long onezs;    //第一周基础数据采集总数
	private long onesqs;    //第一周基础数据社区采集数
	private long onencs;    //第一周基础数据农村采集数
	private long onerhzfzs;    //第一周入户走访采集总数
	private long onerhzfsqs;    //第一周入户走访社区采集总数
	private long onerhzfncs;    //第一周入户走访农村采集总数
	private long onezaxlzs;    //第一周治安巡逻采集总数
	private long onezaxlsqs;    //第一周治安巡逻社区采集总数
	private long onezaxlncs;    //第一周治安巡逻农村采集总数
	private long twozs;    //第二周基础数据采集总数
	private long twosqs;    //第二周基础数据社区采集数
	private long twoncs;    //第二周基础数据农村采集数
	private long tworhzfzs;    //第二周入户走访采集总数
	private long tworhzfsqs;    //第二周入户走访社区采集总数
	private long tworhzfncs;    //第二周入户走访农村采集总数
	private long twozaxlzs;    //第二周治安巡逻采集总数
	private long twozaxlsqs;    //第二周治安巡逻社区采集总数
	private long twozaxlncs;    //第二周治安巡逻农村采集总数
	private long threezs;    //第三周基础数据采集总数
	private long threesqs;    //第三周基础数据社区采集数
	private long threencs;    //第三周基础数据农村采集数
	private long threerhzfzs;    //第三周入户走访采集总数
	private long threerhzfsqs;    //第三周入户走访社区采集总数
	private long threerhzfncs;    //第三周入户走访农村采集总数
	private long threezaxlzs;    //第三周治安巡逻采集总数
	private long threezaxlsqs;    //第三周治安巡逻社区采集总数
	private long threezaxlncs;    //第三周治安巡逻农村采集总数
	private long fourzs;    //第四周基础数据采集总数
	private long foursqs;    //第四周基础数据社区采集数
	private long fourncs;    //第四周基础数据农村采集数
	private long fourrhzfzs;    //第四周入户走访采集总数
	private long fourrhzfsqs;    //第四周入户走访社区采集总数
	private long fourrhzfncs;    //第四周入户走访农村采集总数
	private long fourzaxlzs;    //第四周治安巡逻采集总数
	private long fourzaxlsqs;    //第四周治安巡逻社区采集总数
	private long fourzaxlncs;    //第四周治安巡逻农村采集总数
	private long fivezs;    //第五周基础数据采集总数
	private long fivesqs;    //第五周基础数据社区采集数
	private long fivencs;    //第五周基础数据农村采集数
	private long fiverhzfzs;    //第五周入户走访采集总数
	private long fiverhzfsqs;    //第五周入户走访社区采集总数
	private long fiverhzfncs;    //第五周入户走访农村采集总数
	private long fivezaxlzs;    //第五周治安巡逻采集总数
	private long fivezaxlsqs;    //第五周治安巡逻社区采集总数
	private long fivezaxlncs;    //第五周治安巡逻农村采集总数
	private long sixzs;    //第六周基础数据采集总数
	private long sixsqs;    //第六周基础数据社区采集数
	private long sixncs;    //第六周基础数据农村采集数
	private long sixrhzfzs;    //第六周入户走访采集总数
	private long sixrhzfsqs;    //第六周入户走访社区采集总数
	private long sixrhzfncs;    //第六周入户走访农村采集总数
	private long sixzaxlzs;    //第六周治安巡逻采集总数
	private long sixzaxlsqs;    //第六周治安巡逻社区采集总数
	private long sixzaxlncs;    //第六周治安巡逻农村采集总数
	private long jwqzs;    //警务区总数
	private long wwcrwjwqs;    //未完成任务警务区数
	private long wwczcjrwcs;    //未完成总采集任务次数
	private long onecjzs;    //第一周采集总数
	private long twocjzs;    //第二周采集总数
	private long threecjzs;    //第三周采集总数
	private long fourcjzs;    //第四周采集总数
	private long fivecjzs;    //第五周采集总数
	private long sixcjzs;    //第六周采集总数
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
	public String getParent_code()
	{
		return parent_code;
	}
	public void setParent_code(String parent_code)
	{
		this.parent_code = parent_code;
	}
	public String getLeve()
	{
		return leve;
	}
	public void setLeve(String leve)
	{
		this.leve = leve;
	}
	public String getTjyf()
	{
		return tjyf;
	}
	public void setTjyf(String tjyf)
	{
		this.tjyf = tjyf;
	}
	public String getTjsj()
	{
		return tjsj;
	}
	public void setTjsj(String tjsj)
	{
		this.tjsj = tjsj;
	}
	public long getZcjs()
	{
		return zcjs;
	}
	public void setZcjs(long zcjs)
	{
		this.zcjs = zcjs;
	}
	public long getOnezs()
	{
		return onezs;
	}
	public void setOnezs(long onezs)
	{
		this.onezs = onezs;
	}
	public long getOnesqs()
	{
		return onesqs;
	}
	public void setOnesqs(long onesqs)
	{
		this.onesqs = onesqs;
	}
	public long getOnencs()
	{
		return onencs;
	}
	public void setOnencs(long onencs)
	{
		this.onencs = onencs;
	}
	public long getOnerhzfzs()
	{
		return onerhzfzs;
	}
	public void setOnerhzfzs(long onerhzfzs)
	{
		this.onerhzfzs = onerhzfzs;
	}
	public long getOnerhzfsqs()
	{
		return onerhzfsqs;
	}
	public void setOnerhzfsqs(long onerhzfsqs)
	{
		this.onerhzfsqs = onerhzfsqs;
	}
	public long getOnerhzfncs()
	{
		return onerhzfncs;
	}
	public void setOnerhzfncs(long onerhzfncs)
	{
		this.onerhzfncs = onerhzfncs;
	}
	public long getOnezaxlzs()
	{
		return onezaxlzs;
	}
	public void setOnezaxlzs(long onezaxlzs)
	{
		this.onezaxlzs = onezaxlzs;
	}
	public long getOnezaxlsqs()
	{
		return onezaxlsqs;
	}
	public void setOnezaxlsqs(long onezaxlsqs)
	{
		this.onezaxlsqs = onezaxlsqs;
	}
	public long getOnezaxlncs()
	{
		return onezaxlncs;
	}
	public void setOnezaxlncs(long onezaxlncs)
	{
		this.onezaxlncs = onezaxlncs;
	}
	public long getTwozs()
	{
		return twozs;
	}
	public void setTwozs(long twozs)
	{
		this.twozs = twozs;
	}
	public long getTwosqs()
	{
		return twosqs;
	}
	public void setTwosqs(long twosqs)
	{
		this.twosqs = twosqs;
	}
	public long getTwoncs()
	{
		return twoncs;
	}
	public void setTwoncs(long twoncs)
	{
		this.twoncs = twoncs;
	}
	public long getTworhzfzs()
	{
		return tworhzfzs;
	}
	public void setTworhzfzs(long tworhzfzs)
	{
		this.tworhzfzs = tworhzfzs;
	}
	public long getTworhzfsqs()
	{
		return tworhzfsqs;
	}
	public void setTworhzfsqs(long tworhzfsqs)
	{
		this.tworhzfsqs = tworhzfsqs;
	}
	public long getTworhzfncs()
	{
		return tworhzfncs;
	}
	public void setTworhzfncs(long tworhzfncs)
	{
		this.tworhzfncs = tworhzfncs;
	}
	public long getTwozaxlzs()
	{
		return twozaxlzs;
	}
	public void setTwozaxlzs(long twozaxlzs)
	{
		this.twozaxlzs = twozaxlzs;
	}
	public long getTwozaxlsqs()
	{
		return twozaxlsqs;
	}
	public void setTwozaxlsqs(long twozaxlsqs)
	{
		this.twozaxlsqs = twozaxlsqs;
	}
	public long getTwozaxlncs()
	{
		return twozaxlncs;
	}
	public void setTwozaxlncs(long twozaxlncs)
	{
		this.twozaxlncs = twozaxlncs;
	}
	public long getThreezs()
	{
		return threezs;
	}
	public void setThreezs(long threezs)
	{
		this.threezs = threezs;
	}
	public long getThreesqs()
	{
		return threesqs;
	}
	public void setThreesqs(long threesqs)
	{
		this.threesqs = threesqs;
	}
	public long getThreencs()
	{
		return threencs;
	}
	public void setThreencs(long threencs)
	{
		this.threencs = threencs;
	}
	public long getThreerhzfzs()
	{
		return threerhzfzs;
	}
	public void setThreerhzfzs(long threerhzfzs)
	{
		this.threerhzfzs = threerhzfzs;
	}
	public long getThreerhzfsqs()
	{
		return threerhzfsqs;
	}
	public void setThreerhzfsqs(long threerhzfsqs)
	{
		this.threerhzfsqs = threerhzfsqs;
	}
	public long getThreerhzfncs()
	{
		return threerhzfncs;
	}
	public void setThreerhzfncs(long threerhzfncs)
	{
		this.threerhzfncs = threerhzfncs;
	}
	public long getThreezaxlzs()
	{
		return threezaxlzs;
	}
	public void setThreezaxlzs(long threezaxlzs)
	{
		this.threezaxlzs = threezaxlzs;
	}
	public long getThreezaxlsqs()
	{
		return threezaxlsqs;
	}
	public void setThreezaxlsqs(long threezaxlsqs)
	{
		this.threezaxlsqs = threezaxlsqs;
	}
	public long getThreezaxlncs()
	{
		return threezaxlncs;
	}
	public void setThreezaxlncs(long threezaxlncs)
	{
		this.threezaxlncs = threezaxlncs;
	}
	public long getFourzs()
	{
		return fourzs;
	}
	public void setFourzs(long fourzs)
	{
		this.fourzs = fourzs;
	}
	public long getFoursqs()
	{
		return foursqs;
	}
	public void setFoursqs(long foursqs)
	{
		this.foursqs = foursqs;
	}
	public long getFourncs()
	{
		return fourncs;
	}
	public void setFourncs(long fourncs)
	{
		this.fourncs = fourncs;
	}
	public long getFourrhzfzs()
	{
		return fourrhzfzs;
	}
	public void setFourrhzfzs(long fourrhzfzs)
	{
		this.fourrhzfzs = fourrhzfzs;
	}
	public long getFourrhzfsqs()
	{
		return fourrhzfsqs;
	}
	public void setFourrhzfsqs(long fourrhzfsqs)
	{
		this.fourrhzfsqs = fourrhzfsqs;
	}
	public long getFourrhzfncs()
	{
		return fourrhzfncs;
	}
	public void setFourrhzfncs(long fourrhzfncs)
	{
		this.fourrhzfncs = fourrhzfncs;
	}
	public long getFourzaxlzs()
	{
		return fourzaxlzs;
	}
	public void setFourzaxlzs(long fourzaxlzs)
	{
		this.fourzaxlzs = fourzaxlzs;
	}
	public long getFourzaxlsqs()
	{
		return fourzaxlsqs;
	}
	public void setFourzaxlsqs(long fourzaxlsqs)
	{
		this.fourzaxlsqs = fourzaxlsqs;
	}
	public long getFourzaxlncs()
	{
		return fourzaxlncs;
	}
	public void setFourzaxlncs(long fourzaxlncs)
	{
		this.fourzaxlncs = fourzaxlncs;
	}
	public long getFivezs()
	{
		return fivezs;
	}
	public void setFivezs(long fivezs)
	{
		this.fivezs = fivezs;
	}
	public long getFivesqs()
	{
		return fivesqs;
	}
	public void setFivesqs(long fivesqs)
	{
		this.fivesqs = fivesqs;
	}
	public long getFivencs()
	{
		return fivencs;
	}
	public void setFivencs(long fivencs)
	{
		this.fivencs = fivencs;
	}
	public long getFiverhzfzs()
	{
		return fiverhzfzs;
	}
	public void setFiverhzfzs(long fiverhzfzs)
	{
		this.fiverhzfzs = fiverhzfzs;
	}
	public long getFiverhzfsqs()
	{
		return fiverhzfsqs;
	}
	public void setFiverhzfsqs(long fiverhzfsqs)
	{
		this.fiverhzfsqs = fiverhzfsqs;
	}
	public long getFiverhzfncs()
	{
		return fiverhzfncs;
	}
	public void setFiverhzfncs(long fiverhzfncs)
	{
		this.fiverhzfncs = fiverhzfncs;
	}
	public long getFivezaxlzs()
	{
		return fivezaxlzs;
	}
	public void setFivezaxlzs(long fivezaxlzs)
	{
		this.fivezaxlzs = fivezaxlzs;
	}
	public long getFivezaxlsqs()
	{
		return fivezaxlsqs;
	}
	public void setFivezaxlsqs(long fivezaxlsqs)
	{
		this.fivezaxlsqs = fivezaxlsqs;
	}
	public long getFivezaxlncs()
	{
		return fivezaxlncs;
	}
	public void setFivezaxlncs(long fivezaxlncs)
	{
		this.fivezaxlncs = fivezaxlncs;
	}
	public long getSixzs()
	{
		return sixzs;
	}
	public void setSixzs(long sixzs)
	{
		this.sixzs = sixzs;
	}
	public long getSixsqs()
	{
		return sixsqs;
	}
	public void setSixsqs(long sixsqs)
	{
		this.sixsqs = sixsqs;
	}
	public long getSixncs()
	{
		return sixncs;
	}
	public void setSixncs(long sixncs)
	{
		this.sixncs = sixncs;
	}
	public long getSixrhzfzs()
	{
		return sixrhzfzs;
	}
	public void setSixrhzfzs(long sixrhzfzs)
	{
		this.sixrhzfzs = sixrhzfzs;
	}
	public long getSixrhzfsqs()
	{
		return sixrhzfsqs;
	}
	public void setSixrhzfsqs(long sixrhzfsqs)
	{
		this.sixrhzfsqs = sixrhzfsqs;
	}
	public long getSixrhzfncs()
	{
		return sixrhzfncs;
	}
	public void setSixrhzfncs(long sixrhzfncs)
	{
		this.sixrhzfncs = sixrhzfncs;
	}
	public long getSixzaxlzs()
	{
		return sixzaxlzs;
	}
	public void setSixzaxlzs(long sixzaxlzs)
	{
		this.sixzaxlzs = sixzaxlzs;
	}
	public long getSixzaxlsqs()
	{
		return sixzaxlsqs;
	}
	public void setSixzaxlsqs(long sixzaxlsqs)
	{
		this.sixzaxlsqs = sixzaxlsqs;
	}
	public long getSixzaxlncs()
	{
		return sixzaxlncs;
	}
	public void setSixzaxlncs(long sixzaxlncs)
	{
		this.sixzaxlncs = sixzaxlncs;
	}
	public long getJwqzs()
	{
		return jwqzs;
	}
	public void setJwqzs(long jwqzs)
	{
		this.jwqzs = jwqzs;
	}
	public long getWwcrwjwqs()
	{
		return wwcrwjwqs;
	}
	public void setWwcrwjwqs(long wwcrwjwqs)
	{
		this.wwcrwjwqs = wwcrwjwqs;
	}
	public long getWwczcjrwcs()
	{
		return wwczcjrwcs;
	}
	public void setWwczcjrwcs(long wwczcjrwcs)
	{
		this.wwczcjrwcs = wwczcjrwcs;
	}
	public long getOnecjzs()
	{
		return onecjzs;
	}
	public void setOnecjzs(long onecjzs)
	{
		this.onecjzs = onecjzs;
	}
	public long getTwocjzs()
	{
		return twocjzs;
	}
	public void setTwocjzs(long twocjzs)
	{
		this.twocjzs = twocjzs;
	}
	public long getThreecjzs()
	{
		return threecjzs;
	}
	public void setThreecjzs(long threecjzs)
	{
		this.threecjzs = threecjzs;
	}
	public long getFourcjzs()
	{
		return fourcjzs;
	}
	public void setFourcjzs(long fourcjzs)
	{
		this.fourcjzs = fourcjzs;
	}
	public long getFivecjzs()
	{
		return fivecjzs;
	}
	public void setFivecjzs(long fivecjzs)
	{
		this.fivecjzs = fivecjzs;
	}
	public long getSixcjzs()
	{
		return sixcjzs;
	}
	public void setSixcjzs(long sixcjzs)
	{
		this.sixcjzs = sixcjzs;
	}
	
}
