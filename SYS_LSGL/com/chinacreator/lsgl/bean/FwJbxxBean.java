package com.chinacreator.lsgl.bean;

import java.util.ArrayList;
import java.util.List;

import com.chinacreator.common.bean.BaseValue;
import com.chinacreator.common.bean.LoginInfo;
import com.chinacreator.common.helper.ActionContextHelper;
import com.chinacreator.common.helper.DictionaryCacheHellper;
import com.chinacreator.common.helper.ValidateHelper;
import com.chinacreator.dzgl.bean.DzxxBean;
import com.chinacreator.dzgl.bean.StxxBean;

/**
 * 房屋基本信息对象
 * 
 * @author mingchun.xiong
 * @date 2013-8-6
 */
public class FwJbxxBean extends BaseValue
{

	/**
	 * 
	 */
	private static final long	serialVersionUID	= -6271929472698962885L;
	
	private String fwid;
	private String fwbm;
	private String fwmc;
	private String dzid;
	private String dzmc;
	private String jcnf;
	private String fwly;
	private String sylb;
	private String fwlb;
	private String fwlbms;
	private String fwyt;
	private String fwytmc;
	private String hxjg;
	private String hxjgmc;
	private String fwmj;
	private String dscs;
	private String dxcs;
	private String sydwmc;
	private String fdsyrxm;
	private String fdsyrsfzh;
	private String fdsyrlxdh;
	private String frdbsfzh;    //法人代表身份证号
	private String frdbxm;      //法人代表姓名
	private String frdblxdh;    //法人代表联系电话
	private String cqzhm;
	private String cqlx;
	private String cqlxmc;
	private String czrq;
	private String cqdwmc;
	private String cqrxm;
	private String cqrsfzh;
	private String cqrlxdh;
	private String hzxm;
	private String hzsfzh;
	private String hzlxdh;
	private String fzsx;
	private String sfczw;
	private String sfczwms;
	private String gllb;
	private String sszrdwdm;
	private String sszrdwmc;
	private String sszrmjjh;
	private String sszrmjxm;
	private String sszrmjlxdh;
	private String djrxm;
	private String djdwdm;
	private String djdwmc;
	private String czrxm;
	private String czdwdm;
	private String czdwmc;
	private String czsj;
	private String czbs;
	private String djsj;
	private String zxsj;
	private String zxyy;
	private String zxbs;
	private String zxbsms;
	private String cz;
	
	private String fwxc;                // 操作区域 的房屋巡查
	private String stglcz;
	private String stid;
	private String dyh;
	private String dyhmc;
	private String lch;
	private String lchz;
	private String lchmc;
	private String fjh;
	private String shhz;
	private String fjhmc;
	private String fsdz;
	
	private String ssgajgjgdm;
	private String ssgajgjgmc;
	private String sspcsdm;
	private String sspcsmc;
	private String fwzdgllb;
	private String sssq;
	private String sssqmc;
	private String ssxzqh;
	private String ssxzqhmc;
	
	private String zps;//照片数量
	private String zpid;//第一张照片的id
	private String fzzjlx;
	
	private String bz;
	private String djrsfzh;  //登记人身份证号
	private String czfwbpbm;
	
	private String ssdwmc;
	
	// 房屋注销标识描述
    private String fwzxbsms;
    
	
	//出租房屋注销标识描述
	private String czwzxbsms;
	
	//房屋地址合并迁移操作
	private String fwdzhbqycz;  //房屋地址合并迁移操作 
	
	//是出租房房登记
	private String isczfdj; 
	
	//出租房屋操作
	private String czfwcz;
	
	//房屋人口数
	private int fwrks = 0;
	
	public String getCzfwcz() {
		
		StringBuffer sb = new StringBuffer("&nbsp;");
		LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
		if ("1".equals(sfczw))
		{
			sb.append("<span onclick=\"openNewFwInfo('detail','" + fwid +"','1')\" style=\"color:green\" class=\"cps_span_href\">详情</span>&nbsp;");
		}
		else
		{
			sb.append("<span onclick=\"openNewFwInfo('detail','" + fwid +"','0')\" style=\"color:green\" class=\"cps_span_href\">详情</span>&nbsp;");
		}
		if (loginInfo.getOrgcode().equals(djdwdm) 
				|| loginInfo.getOrgcode().equals(czdwdm)
				|| loginInfo.getOrgcode().equals(sszrdwdm))
		{
			if ("1".equals(sfczw))
			{
				if("0".equals(zxbs) || zxbs ==null)
				{
					sb.append("<span onclick=\"openNewFwInfo('update','" + fwid +"','1')\" style=\"color:green\" class=\"cps_span_href\">修改</span>&nbsp;");
					sb.append("<span onclick=\"deleteCzFwInfo('delete','" + fwid +"','1')\" style=\"color:red\" class=\"cps_span_href\">停租</span>&nbsp;");
					//sb.append("<span onclick=\"openFwxcInfo('update','" + fwid +"')\" style=\"color:green\" class=\"cps_span_href\">巡查登记</span>&nbsp;");
				}
			}
			else
			{
				if(("0".equals(zxbs) || zxbs ==null)&& "正常".equals(czwzxbsms)){
					sb.append("<span onclick=\"openNewFwInfo('update','" + fwid +"','0')\" style=\"color:green\" class=\"cps_span_href\">修改</span>&nbsp;");
					sb.append("<span onclick=\"deleteFwInfo('delete','" + fwid +"','0')\" style=\"color:green\" class=\"cps_span_href\">注销</span>&nbsp;");
				}
			}
		}
		
		czfwcz = sb.toString();
		
		return czfwcz;
	}
	public void setCzfwcz(String czfwcz) {
		this.czfwcz = czfwcz;
	}
	public String getFwdzhbqycz() 
	{
		fwdzhbqycz="<span onclick=\"dzfwqyupdate('update','" + fwid +"')\" style=\"color:green\" class=\"cps_span_href\">合并迁移</span>&nbsp;";
		return fwdzhbqycz;
	}
	public void setFwdzhbqycz(String fwdzhbqycz) {
		this.fwdzhbqycz = fwdzhbqycz;
	}
	public String getCzfwbpbm() {
		return czfwbpbm;
	}
	public void setCzfwbpbm(String czfwbpbm) {
		this.czfwbpbm = czfwbpbm;
	}
	private StxxBean stxxBean = new StxxBean();
	
	private DzxxBean dzxxBean = new DzxxBean(); 
	
	//出租房屋基本信息
	private CzfwJbxxBean czfwBean= new CzfwJbxxBean();
	
	private CzwxcdjxxBean xcdjBean = new CzwxcdjxxBean();;
	
	private List<FwzpxxBean> fwzpxxList = new ArrayList<FwzpxxBean>();
	
	private List<CzwxcdjxxBean> czwxcdjxxBeans = new ArrayList<CzwxcdjxxBean>();
	
	private List<FwrkxxBean> fwrkxxBeans = new ArrayList<FwrkxxBean>();
	/**
	 * 数据核查 办理期限
	 */
	private String blqx;
	public String getFwmc()
	{
		return fwmc;
	}
	public void setFwmc(String fwmc)
	{
		this.fwmc = fwmc;
	}
	
	public String getDzid()
	{
		return dzid;
	}
	public void setDzid(String dzid)
	{
		this.dzid = dzid;
	}
	public String getJcnf()
	{
		return jcnf;
	}
	public void setJcnf(String jcnf)
	{
		this.jcnf = jcnf;
	}
	public String getFwly()
	{
		return fwly;
	}
	public void setFwly(String fwly)
	{
		this.fwly = fwly;
	}
	public String getSylb()
	{
		return sylb;
	}
	public void setSylb(String sylb)
	{
		this.sylb = sylb;
	}
	
	public String getFwlb()
	{
		return fwlb;
	}
	public void setFwlb(String fwlb)
	{
		this.fwlb = fwlb;
	}
	public String getFwyt()
	{
		return fwyt;
	}
	public void setFwyt(String fwyt)
	{
		this.fwyt = fwyt;
	}
	public String getHxjg()
	{
		return hxjg;
	}
	public void setHxjg(String hxjg)
	{
		this.hxjg = hxjg;
	}
	public String getFwmj()
	{
		return fwmj;
	}
	public void setFwmj(String fwmj)
	{
		this.fwmj = fwmj;
	}
	public String getDscs()
	{
		return dscs;
	}
	public void setDscs(String dscs)
	{
		this.dscs = dscs;
	}
	public String getDxcs()
	{
		return dxcs;
	}
	public void setDxcs(String dxcs)
	{
		this.dxcs = dxcs;
	}
	public String getSydwmc()
	{
		return sydwmc;
	}
	public void setSydwmc(String sydwmc)
	{
		this.sydwmc = sydwmc;
	}
	public String getFdsyrxm()
	{
		return fdsyrxm;
	}
	public void setFdsyrxm(String fdsyrxm)
	{
		this.fdsyrxm = fdsyrxm;
	}
	public String getFdsyrsfzh()
	{
		return fdsyrsfzh;
	}
	public void setFdsyrsfzh(String fdsyrsfzh)
	{
		this.fdsyrsfzh = fdsyrsfzh;
	}
	public String getFdsyrlxdh()
	{
		return fdsyrlxdh;
	}
	public void setFdsyrlxdh(String fdsyrlxdh)
	{
		this.fdsyrlxdh = fdsyrlxdh;
	}
	public String getCqzhm()
	{
		return cqzhm;
	}
	public void setCqzhm(String cqzhm)
	{
		this.cqzhm = cqzhm;
	}
	public String getCqlx()
	{
		return cqlx;
	}
	public void setCqlx(String cqlx)
	{
		this.cqlx = cqlx;
	}
	public String getCzrq()
	{
		return czrq;
	}
	public void setCzrq(String czrq)
	{
		this.czrq = czrq;
	}
	public String getCqdwmc()
	{
		return cqdwmc;
	}
	public void setCqdwmc(String cqdwmc)
	{
		this.cqdwmc = cqdwmc;
	}
	public String getCqrxm()
	{
		return cqrxm;
	}
	public void setCqrxm(String cqrxm)
	{
		this.cqrxm = cqrxm;
	}
	public String getCqrsfzh()
	{
		return cqrsfzh;
	}
	public void setCqrsfzh(String cqrsfzh)
	{
		this.cqrsfzh = cqrsfzh;
	}
	public String getCqrlxdh()
	{
		return cqrlxdh;
	}
	public void setCqrlxdh(String cqrlxdh)
	{
		this.cqrlxdh = cqrlxdh;
	}
	public String getHzxm()
	{
		return hzxm;
	}
	public void setHzxm(String hzxm)
	{
		this.hzxm = hzxm;
	}
	public String getHzsfzh()
	{
		return hzsfzh;
	}
	public void setHzsfzh(String hzsfzh)
	{
		this.hzsfzh = hzsfzh;
	}
	public String getHzlxdh()
	{
		return hzlxdh;
	}
	public void setHzlxdh(String hzlxdh)
	{
		this.hzlxdh = hzlxdh;
	}
	public String getFzsx()
	{
		return fzsx;
	}
	public void setFzsx(String fzsx)
	{
		this.fzsx = fzsx;
	}
	public String getSfczw()
	{
		return sfczw;
	}
	public void setSfczw(String sfczw)
	{
		this.sfczw = sfczw;
	}
	public String getGllb()
	{
		return gllb;
	}
	public void setGllb(String gllb)
	{
		this.gllb = gllb;
	}
	public String getSszrdwdm()
	{
		return sszrdwdm;
	}
	public void setSszrdwdm(String sszrdwdm)
	{
		this.sszrdwdm = sszrdwdm;
	}
	public String getSszrdwmc()
	{
		return sszrdwmc;
	}
	public void setSszrdwmc(String sszrdwmc)
	{
		this.sszrdwmc = sszrdwmc;
	}
	public String getSszrmjjh()
	{
		return sszrmjjh;
	}
	public void setSszrmjjh(String sszrmjjh)
	{
		this.sszrmjjh = sszrmjjh;
	}
	public String getSszrmjxm()
	{
		return sszrmjxm;
	}
	public void setSszrmjxm(String sszrmjxm)
	{
		this.sszrmjxm = sszrmjxm;
	}
	public String getDjrxm()
	{
		return djrxm;
	}
	public void setDjrxm(String djrxm)
	{
		this.djrxm = djrxm;
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
	public String getCzrxm()
	{
		return czrxm;
	}
	public void setCzrxm(String czrxm)
	{
		this.czrxm = czrxm;
	}
	public String getCzdwdm()
	{
		return czdwdm;
	}
	public void setCzdwdm(String czdwdm)
	{
		this.czdwdm = czdwdm;
	}
	public String getCzdwmc()
	{
		return czdwmc;
	}
	public void setCzdwmc(String czdwmc)
	{
		this.czdwmc = czdwmc;
	}
	public String getCzbs()
	{
		return czbs;
	}
	public void setCzbs(String czbs)
	{
		this.czbs = czbs;
	}
	public DzxxBean getDzxxBean()
	{
		return dzxxBean;
	}
	public void setDzxxBean(DzxxBean dzxxBean)
	{
		this.dzxxBean = dzxxBean;
	}
	public String getSszrmjlxdh()
	{
		return sszrmjlxdh;
	}
	public void setSszrmjlxdh(String sszrmjlxdh)
	{
		this.sszrmjlxdh = sszrmjlxdh;
	}
	public String getFwid()
	{
		return fwid;
	}
	public void setFwid(String fwid)
	{
		this.fwid = fwid;
	}
	public String getFwbm()
	{
		return fwbm;
	}
	public void setFwbm(String fwbm)
	{
		this.fwbm = fwbm;
	}
	public String getCzsj()
	{
		return czsj;
	}
	public void setCzsj(String czsj)
	{
		this.czsj = czsj;
	}
	public String getDjsj()
	{
		return djsj;
	}
	public void setDjsj(String djsj)
	{
		this.djsj = djsj;
	}
	public String getFwytmc()
	{
		fwytmc = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("ZDY_FWYT", fwyt);
		return fwytmc;
	}
	public void setFwytmc(String fwytmc)
	{
		this.fwytmc = fwytmc;
	}
	public String getHxjgmc()
	{
		hxjgmc = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("ZDY_HXJG", hxjg);
		return hxjgmc;
	}
	public void setHxjgmc(String hxjgmc)
	{
		this.hxjgmc = hxjgmc;
	}
	public List<FwzpxxBean> getFwzpxxList()
	{
		return fwzpxxList;
	}
	public void setFwzpxxList(List<FwzpxxBean> fwzpxxList)
	{
		this.fwzpxxList = fwzpxxList;
	}
	public String getZxsj()
	{
		return zxsj;
	}
	public void setZxsj(String zxsj)
	{
		this.zxsj = zxsj;
	}
	public String getZxyy()
	{
		return zxyy;
	}
	public void setZxyy(String zxyy)
	{
		this.zxyy = zxyy;
	}
	public String getZxbs()
	{
		return zxbs;
	}
	public void setZxbs(String zxbs)
	{
		this.zxbs = zxbs;
	}
	
	public String getSsgajgjgdm()
	{
		return ssgajgjgdm;
	}
	public void setSsgajgjgdm(String ssgajgjgdm)
	{
		this.ssgajgjgdm = ssgajgjgdm;
	}
	public String getSsgajgjgmc()
	{
		return ssgajgjgmc;
	}
	public void setSsgajgjgmc(String ssgajgjgmc)
	{
		this.ssgajgjgmc = ssgajgjgmc;
	}
	public String getSspcsdm()
	{
		return sspcsdm;
	}
	public void setSspcsdm(String sspcsdm)
	{
		this.sspcsdm = sspcsdm;
	}
	public String getSspcsmc()
	{
		return sspcsmc;
	}
	public void setSspcsmc(String sspcsmc)
	{
		this.sspcsmc = sspcsmc;
	}
	
	public String getSfczwms()
	{
		if ("1".equals(sfczw))
		{
			sfczwms = "是";
		}
		else
		{
			sfczwms = "否";
		}
		return sfczwms;
	}
	public void setSfczwms(String sfczwms)
	{
		this.sfczwms = sfczwms;
	}
	
	public CzwxcdjxxBean getXcdjBean()
	{
		return xcdjBean;
	}
	public void setXcdjBean(CzwxcdjxxBean xcdjBean)
	{
		this.xcdjBean = xcdjBean;
	}
	public List<CzwxcdjxxBean> getCzwxcdjxxBeans()
	{
		return czwxcdjxxBeans;
	}
	public void setCzwxcdjxxBeans(List<CzwxcdjxxBean> czwxcdjxxBeans)
	{
		this.czwxcdjxxBeans = czwxcdjxxBeans;
	}
	
	public List<FwrkxxBean> getFwrkxxBeans()
	{
		return fwrkxxBeans;
	}
	public void setFwrkxxBeans(List<FwrkxxBean> fwrkxxBeans)
	{
		this.fwrkxxBeans = fwrkxxBeans;
	}
	public String getCz()
	{
		
		StringBuffer sb = new StringBuffer("&nbsp;");
		LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
		if ("1".equals(sfczw)){
			sb.append("<span onclick=\"openNewFwInfo('detail','" + fwid +"','1')\" style=\"color:green\" class=\"cps_span_href\">详情</span>&nbsp;");

		}else{
			sb.append("<span onclick=\"openNewFwInfo('detail','" + fwid +"','0')\" style=\"color:green\" class=\"cps_span_href\">详情</span>&nbsp;");

		}
		if (loginInfo.getOrgcode().equals(djdwdm) 
				|| loginInfo.getOrgcode().equals(czdwdm)
				|| loginInfo.getOrgcode().equals(sszrdwdm))
		{
			if ("1".equals(sfczw))
			{
				if("0".equals(zxbs) || zxbs ==null)
				{
					sb.append("<span onclick=\"openNewFwInfo('update','" + fwid +"','1')\" style=\"color:green\" class=\"cps_span_href\">修改</span>&nbsp;");
					sb.append("<span onclick=\"deleteCzFwInfo('delete','" + fwid +"','1')\" style=\"color:red\" class=\"cps_span_href\">停租</span>&nbsp;");
					//sb.append("<span onclick=\"openFwxcInfo('update','" + fwid +"')\" style=\"color:green\" class=\"cps_span_href\">巡查登记</span>&nbsp;");
				}
			}
			else
			{
				if("0".equals(zxbs) || zxbs ==null){
					sb.append("<span onclick=\"openNewFwInfo('update','" + fwid +"','0')\" style=\"color:green\" class=\"cps_span_href\">修改</span>&nbsp;");
					sb.append("<span onclick=\"deleteFwInfo('delete','" + fwid +"','0')\" style=\"color:green\" class=\"cps_span_href\">注销</span>&nbsp;");
				}
			}
		}
		cz = sb.toString();
		return cz;
	}
	
	public String getFwxc() 
	{
		StringBuffer sb = new StringBuffer();
		//LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
		if("1".equals(sfczw)){
			sb.append("<span onclick=\"openFwInfo('detail','" + fwid +"','1')\" style=\"color:green\" class=\"cps_span_href\">详情</span>&nbsp;");
		}else{
			sb.append("<span onclick=\"openFwInfo('detail','" + fwid +"')\" style=\"color:green\" class=\"cps_span_href\">详情</span>&nbsp;");
		}
//		if ((loginInfo.getOrgcode().equals(djdwdm)|| loginInfo.getOrgcode().equals(czdwdm)
//				|| loginInfo.getOrgcode().equals(sszrdwdm)) && ("1").equals(sfczw))
//		{
//			sb.append("<span onclick=\"openFwxcInfo('update','" + fwid +"')\" style=\"color:green\" class=\"cps_span_href\">检查登记</span>&nbsp;");
//		}
		fwxc = sb.toString();		
		return fwxc;
	}
	public void setFwxc(String fwxc) {
		this.fwxc = fwxc;
	}
	public void setCz(String cz)
	{
		this.cz = cz;
	}
	public String getFwzdgllb()
	{
		return fwzdgllb;
	}
	public void setFwzdgllb(String fwzdgllb)
	{
		this.fwzdgllb = fwzdgllb;
	}
	public String getDzmc()
	{
		return dzmc;
	}
	public void setDzmc(String dzmc)
	{
		this.dzmc = dzmc;
	}
	public String getFrdbsfzh() {
		return frdbsfzh;
	}
	public void setFrdbsfzh(String frdbsfzh) {
		this.frdbsfzh = frdbsfzh;
	}
	public String getFrdbxm() {
		return frdbxm;
	}
	public void setFrdbxm(String frdbxm) {
		this.frdbxm = frdbxm;
	}
	public String getFrdblxdh() {
		return frdblxdh;
	}
	public void setFrdblxdh(String frdblxdh) {
		this.frdblxdh = frdblxdh;
	}
	public String getCqlxmc() {
		cqlxmc=DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("ZDY_CQXZ", cqlx);
		return cqlxmc;
	}
	public void setCqlxmc(String cqlxmc) {
		this.cqlxmc = cqlxmc;
	}
	public CzfwJbxxBean getCzfwBean() {
		return czfwBean;
	}
	public void setCzfwBean(CzfwJbxxBean czfwBean) {
		this.czfwBean = czfwBean;
	}
	public String getSssq()
	{
		return sssq;
	}
	public void setSssq(String sssq)
	{
		this.sssq = sssq;
	}
	public String getSssqmc()
	{
		return sssqmc;
	}
	public void setSssqmc(String sssqmc)
	{
		this.sssqmc = sssqmc;
	}
	public String getSsxzqh()
	{
		return ssxzqh;
	}
	public void setSsxzqh(String ssxzqh)
	{
		this.ssxzqh = ssxzqh;
	}
	public String getSsxzqhmc()
	{
		ssxzqhmc = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("GB_XZQH", ssxzqh);
		return ssxzqhmc;
	}
	public void setSsxzqhmc(String ssxzqhmc)
	{
		this.ssxzqhmc = ssxzqhmc;
	}
	public StxxBean getStxxBean()
	{
		return stxxBean;
	}
	public void setStxxBean(StxxBean stxxBean)
	{
		this.stxxBean = stxxBean;
	}
	public String getStglcz() {
		StringBuffer sb = new StringBuffer();
		LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
		
		if (loginInfo.getOrgcode().equals(djdwdm) 
				|| loginInfo.getOrgcode().equals(czdwdm)
				|| loginInfo.getOrgcode().equals(sszrdwdm))
		{
			sb.append("<span onclick=\"openStxxDetailInfoPage('update','" + stid +"')\" style=\"color:green\" class=\"cps_span_href\">房屋关联实体</span>&nbsp;");
		}
		sb.append("<span onclick=\"openStxxDetailInfoPage('detail','" + stid +"')\" style=\"color:green\" class=\"cps_span_href\">详情</span>&nbsp;");
		stglcz=sb.toString();
		return stglcz;
	}
	public void setStglcz(String stglcz) {
		this.stglcz = stglcz;
	}
	public String getStid() {
		return stid;
	}
	public void setStid(String stid) {
		this.stid = stid;
	}
	public String getDyh() {
		return dyh;
	}
	public void setDyh(String dyh) {
		this.dyh = dyh;
	}
	public String getLch() {
		return lch;
	}
	public void setLch(String lch) {
		this.lch = lch;
	}
	public String getFjh() {
		return fjh;
	}
	public void setFjh(String fjh) {
		this.fjh = fjh;
	}
	public String getFsdz() {
		return fsdz;
	}
	public void setFsdz(String fsdz) {
		this.fsdz = fsdz;
	}
	public String getDyhmc() {
		dyhmc = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("ZDY_DYH", dyh);
		return dyhmc;
	}
	public void setDyhmc(String dyhmc) {
		this.dyhmc = dyhmc;
	}
	public String getLchmc() {
		lchmc = "";
		if (ValidateHelper.isNotEmptyString(lch))
		{
			lchmc = lch + DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("ZDY_LCHZ", lchz);
		}
		return lchmc;
	}
	public void setLchmc(String lchmc) {
		this.lchmc = lchmc;
	}
	public String getFjhmc() {
		fjhmc = "";
		if(ValidateHelper.isNotEmptyString(fjh))
		{
			fjhmc = fjh + DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("ZDY_SHHZ", shhz);
		}
		return fjhmc;
	}
	public void setFjhmc(String fjhmc) {
		this.fjhmc = fjhmc;
	}
	public String getLchz() {
		return lchz;
	}
	public void setLchz(String lchz) {
		this.lchz = lchz;
	}
	public String getShhz() {
		return shhz;
	}
	public void setShhz(String shhz) {
		this.shhz = shhz;
	}
	public String getZxbsms() {
		zxbsms = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("ZDY_ZXBS", zxbs);
		if(zxbs == null){
			zxbsms="正常";
		}
		return zxbsms;
	}
	public void setZxbsms(String zxbsms) {
		this.zxbsms = zxbsms;
	}
	public String getFwlbms() {
		fwlbms = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("ZDY_FWLB", fwlb);
		return fwlbms;
	}
	public void setFwlbms(String fwlbms) {
		this.fwlbms = fwlbms;
	}
	public String getFzzjlx()
	{
		return fzzjlx;
	}
	public void setFzzjlx(String fzzjlx)
	{
		this.fzzjlx = fzzjlx;
	}
	public String getBz()
	{
		return bz;
	}
	public void setBz(String bz)
	{
		this.bz = bz;
	}
	public String getDjrsfzh() {
		return djrsfzh;
	}
	public void setDjrsfzh(String djrsfzh) {
		this.djrsfzh = djrsfzh;
	}
	public String getZps() {
		return zps;
	}
	public void setZps(String zps) {
		this.zps = zps;
	}
	public String getZpid() {
		return zpid;
	}
	public void setZpid(String zpid) {
		this.zpid = zpid;
	}
	public String getBlqx() {
		return blqx;
	}
	public void setBlqx(String blqx) {
		this.blqx = blqx;
	}
	public String getSsdwmc()
	{
		return ssdwmc;
	}
	public void setSsdwmc(String ssdwmc)
	{
		this.ssdwmc = ssdwmc;
	}
	public String getCzwzxbsms() {
		return czwzxbsms;
	}
	public void setCzwzxbsms(String czwzxbsms) {
		this.czwzxbsms = czwzxbsms;
	}
	public String getFwzxbsms() {
		return fwzxbsms;
	}
	public void setFwzxbsms(String fwzxbsms) {
		this.fwzxbsms = fwzxbsms;
	}
	public String getIsczfdj()
	{
		return isczfdj;
	}
	public void setIsczfdj(String isczfdj)
	{
		this.isczfdj = isczfdj;
	}
	public int getFwrks()
	{
		return fwrks;
	}
	public void setFwrks(int fwrks)
	{
		this.fwrks = fwrks;
	}

	
}
