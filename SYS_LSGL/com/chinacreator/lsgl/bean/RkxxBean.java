package com.chinacreator.lsgl.bean;

import java.util.ArrayList;
import java.util.List;

import com.chinacreator.common.bean.BaseValue;
import com.chinacreator.common.cps.bean.RkJbxxBean;

/**
 * 人口信息综合对象
 * 
 * @filename RkxxBean.java
 * @author mingchun.xiong
 * @date 2013-8-20
 *
 */
public class RkxxBean extends BaseValue
{
	
	/**
	 * 
	 */
	private static final long	serialVersionUID	= 7786539756761996382L;
	private String zpStr;
	/**
	 * 人员类别
	 */
	private String rylb;
	
	private String djfwid;
	
	/**
	 * 人口基本信息对象
	 */
	private RkJbxxBean jbxxBean = new RkJbxxBean();
	
	/**
	 * 常住人口对象
	 */
	private CzrkxxBean czrkBean = new CzrkxxBean();
	
	/**
	 * 流动人口对象
	 */
	private LdrkxxBean ldrkBean = new LdrkxxBean();
	
	/**
	 * 未落户人口
	 */
	private RkwlczhkBean wlhrkBean = new RkwlczhkBean();
	
	/**
	 * 境外人口对象
	 */
	private JwrkxxBean jwrkBean = new JwrkxxBean();
	
	/**
	 * 寄住人口对象
	 */
	private JzrkxxBean jzrkBean = new JzrkxxBean();
	
	/**
	 * 关系人对象
	 */
	private RkgxrxxBean gxrBean = new RkgxrxxBean();
	
	/**
	 * 联系方式对象
	 */
	private List<RklxfsxxBean> lxfsBean = new ArrayList<RklxfsxxBean>();
	
	/**
	 * 体貌特种对象
	 */
	private RktmtzxxBean tmtzBean = new RktmtzxxBean();
	
	/**
	 * 现实表现对象
	 */
	private RkxsbxxxBean xsbsBean = new RkxsbxxxBean();
	
	/**
	 * 房屋信息对象
	 */
	private FwJbxxBean fwxxBean = new FwJbxxBean();
	
	/**
	 * 人口房屋关联对象
	 */
	private RkfwglBean rkfwglBean = new RkfwglBean();
	
	/**
	 * 常住人口对象集合
	 */
	private List<CzrkxxBean> czrkBeans = new ArrayList<CzrkxxBean>();
	
	/**
	 * 照片信息对象集合
	 */
	private List<RkzpxxBean> zpxxBeans = new ArrayList<RkzpxxBean>();
	
	/**
	 * 关系人对象集合
	 */
	private List<RkgxrxxBean> gxrBeans = new ArrayList<RkgxrxxBean>();
	
	/**
	 * 联系方式对象集合
	 */
	private List<RklxfsxxBean> lxfsBeans = new ArrayList<RklxfsxxBean>();
	
	/**
	 * 流动人口暂住信息
	 */
	private List<LdrkxxBean> ldrkzzxxBeans = new ArrayList<LdrkxxBean>();
	
	/**
	 * 寄住人口寄住信息
	 */
	private List<JzrkxxBean> jzrkjzxxBeans = new ArrayList<JzrkxxBean>();
	
	/**
	 * 未落户人口信息
	 */
	private List<RkwlczhkBean> wlhrkBeans = new ArrayList<RkwlczhkBean>();
	
	/**
	 * 境外人口居住信息
	 */
	private List<JwrkxxBean> jwrkjzxxBeans = new ArrayList<JwrkxxBean>();
	
	/**
	 * 房屋信息
	 */
	private List<FwJbxxBean> rkfwglBeans = new ArrayList<FwJbxxBean>();
	
	/**
	 * 重点人员现实表现对象
	 */
	private ZdryXsbxBean zdryXsbxBean = new ZdryXsbxBean();
	
	/**
	 * 工作对象对象
	 */
	private ZdryGzdxBean zdryGzdxBean = new ZdryGzdxBean();
	
	/**
	 * 计划生育对象
	 * @return
	 */
	private RkJhsyBean jhsyBean = new RkJhsyBean();
	

	public CzrkxxBean getCzrkBean()
	{
		return czrkBean;
	}

	public void setCzrkBean(CzrkxxBean czrkBean)
	{
		this.czrkBean = czrkBean;
	}

	public LdrkxxBean getLdrkBean()
	{
		return ldrkBean;
	}

	public void setLdrkBean(LdrkxxBean ldrkBean)
	{
		this.ldrkBean = ldrkBean;
	}

	public JzrkxxBean getJzrkBean()
	{
		return jzrkBean;
	}

	public void setJzrkBean(JzrkxxBean jzrkBean)
	{
		this.jzrkBean = jzrkBean;
	}

	public JwrkxxBean getJwrkBean()
	{
		return jwrkBean;
	}

	public void setJwrkBean(JwrkxxBean jwrkBean)
	{
		this.jwrkBean = jwrkBean;
	}

	public RkgxrxxBean getGxrBean()
	{
		return gxrBean;
	}

	public void setGxrBean(RkgxrxxBean gxrBean)
	{
		this.gxrBean = gxrBean;
	}

	public List<RklxfsxxBean> getLxfsBean() {
		return lxfsBean;
	}

	public void setLxfsBean(List<RklxfsxxBean> lxfsBean) {
		this.lxfsBean = lxfsBean;
	}

	public RktmtzxxBean getTmtzBean()
	{
		return tmtzBean;
	}

	public void setTmtzBean(RktmtzxxBean tmtzBean)
	{
		this.tmtzBean = tmtzBean;
	}

	public RkxsbxxxBean getXsbsBean()
	{
		return xsbsBean;
	}

	public void setXsbsBean(RkxsbxxxBean xsbsBean)
	{
		this.xsbsBean = xsbsBean;
	}

	public List<RkzpxxBean> getZpxxBeans()
	{
		return zpxxBeans;
	}

	public void setZpxxBeans(List<RkzpxxBean> zpxxBeans)
	{
		this.zpxxBeans = zpxxBeans;
	}

	public List<RkgxrxxBean> getGxrBeans()
	{
		return gxrBeans;
	}

	public void setGxrBeans(List<RkgxrxxBean> gxrBeans)
	{
		this.gxrBeans = gxrBeans;
	}

	public List<RklxfsxxBean> getLxfsBeans()
	{
		return lxfsBeans;
	}

	public void setLxfsBeans(List<RklxfsxxBean> lxfsBeans)
	{
		this.lxfsBeans = lxfsBeans;
	}

	public List<LdrkxxBean> getLdrkzzxxBeans()
	{
		return ldrkzzxxBeans;
	}

	public void setLdrkzzxxBeans(List<LdrkxxBean> ldrkzzxxBeans)
	{
		this.ldrkzzxxBeans = ldrkzzxxBeans;
	}

	public List<JzrkxxBean> getJzrkjzxxBeans()
	{
		return jzrkjzxxBeans;
	}

	public void setJzrkjzxxBeans(List<JzrkxxBean> jzrkjzxxBeans)
	{
		this.jzrkjzxxBeans = jzrkjzxxBeans;
	}

	public RkJbxxBean getJbxxBean()
	{
		return jbxxBean;
	}

	public void setJbxxBean(RkJbxxBean jbxxBean)
	{
		this.jbxxBean = jbxxBean;
	}

	public List<JwrkxxBean> getJwrkjzxxBeans()
	{
		return jwrkjzxxBeans;
	}

	public void setJwrkjzxxBeans(List<JwrkxxBean> jwrkjzxxBeans)
	{
		this.jwrkjzxxBeans = jwrkjzxxBeans;
	}

	public RkfwglBean getRkfwglBean()
	{
		return rkfwglBean;
	}

	public void setRkfwglBean(RkfwglBean rkfwglBean)
	{
		this.rkfwglBean = rkfwglBean;
	}

	public List<FwJbxxBean> getRkfwglBeans()
	{
		return rkfwglBeans;
	}

	public void setRkfwglBeans(List<FwJbxxBean> rkfwglBeans)
	{
		this.rkfwglBeans = rkfwglBeans;
	}

	public FwJbxxBean getFwxxBean()
	{
		return fwxxBean;
	}

	public void setFwxxBean(FwJbxxBean fwxxBean)
	{
		this.fwxxBean = fwxxBean;
	}

	public String getRylb()
	{
		return rylb;
	}

	public void setRylb(String rylb)
	{
		this.rylb = rylb;
	}

	public RkwlczhkBean getWlhrkBean()
	{
		return wlhrkBean;
	}

	public void setWlhrkBean(RkwlczhkBean wlhrkBean)
	{
		this.wlhrkBean = wlhrkBean;
	}

	public List<CzrkxxBean> getCzrkBeans()
	{
		return czrkBeans;
	}

	public void setCzrkBeans(List<CzrkxxBean> czrkBeans)
	{
		this.czrkBeans = czrkBeans;
	}

	public List<RkwlczhkBean> getWlhrkBeans()
	{
		return wlhrkBeans;
	}

	public void setWlhrkBeans(List<RkwlczhkBean> wlhrkBeans)
	{
		this.wlhrkBeans = wlhrkBeans;
	}

	public ZdryXsbxBean getZdryXsbxBean() {
		return zdryXsbxBean;
	}

	public void setZdryXsbxBean(ZdryXsbxBean zdryXsbxBean) {
		this.zdryXsbxBean = zdryXsbxBean;
	}

	public ZdryGzdxBean getZdryGzdxBean() {
		return zdryGzdxBean;
	}

	public void setZdryGzdxBean(ZdryGzdxBean zdryGzdxBean) {
		this.zdryGzdxBean = zdryGzdxBean;
	}

	public String getDjfwid()
	{
		return djfwid;
	}

	public void setDjfwid(String djfwid)
	{
		this.djfwid = djfwid;
	}

	public RkJhsyBean getJhsyBean() {
		return jhsyBean;
	}

	public void setJhsyBean(RkJhsyBean jhsyBean) {
		this.jhsyBean = jhsyBean;
	}

	public String getZpStr()
	{
		return zpStr;
	}

	public void setZpStr(String zpStr)
	{
		this.zpStr = zpStr;
	}
	
}
