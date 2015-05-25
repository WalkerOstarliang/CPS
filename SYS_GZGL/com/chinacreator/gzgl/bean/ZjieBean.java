package com.chinacreator.gzgl.bean;

import com.chinacreator.common.bean.LoginInfo;
import com.chinacreator.common.helper.ActionContextHelper;

/**
 * 工作总结bean
 * @author royee
 *
 */
public class ZjieBean extends GzglBaseBean
{

	/**
	 * 
	 */
	private static final long serialVersionUID = 3080279867183114931L;
	
	/**
	 * 总结标题
	 */
	private String zjbh;
	
	/**
	 * 总结类型
	 */
	private String zjlx;
	
	/**
	 * 总结类型描述
	 */
	private String zjlxms;
	
	/**
	 * 标题
	 */
	private String zjbt;
	
	/**
	 * 总结民警警号
	 */
	private String zjmjjh;
	
	/**
	 * 总结民警身份证号
	 */
	private String zjmjsfzh;
	
	/**
	 * 总结民警姓名
	 */
	private String zjmjxm;
	
	/**
	 * 总结民警单位代码
	 */
	private String zjmjdwdm;
	
	/**
	 * 总结民警单位名称
	 */
	private String zjmjdwmc;
	
	/**
	 * 总结内容
	 */
	private String zjnr;
	
	/**
	 * 登记人姓名
	 */
	private String djrxm;
	
	/**
	 * 登记时间
	 */
	private String djsj;
	
	/**
	 * 登记单位代码
	 */
	private String djdwdm;
	
	/**
	 * 登记单位名称
	 */
	private String djdwmc;
	
	/**
	 * 操作标识
	 */
	private String czbz;
	
	/**
	 * 更新时间
	 */
	private String gxsj;
	
	private String op;
	
	private String djmjjh;
	private String cz;
	private String djrsfzh;
	
	public String getDjrsfzh() {
		return djrsfzh;
	}

	public void setDjrsfzh(String djrsfzh) {
		this.djrsfzh = djrsfzh;
	}

	public String getZjbh()
	{
		return zjbh;
	}

	public void setZjbh(String zjbh)
	{
		this.zjbh = zjbh;
	}

	public String getZjlx()
	{
		return zjlx;
	}

	public void setZjlx(String zjlx)
	{
		this.zjlx = zjlx;
	}

	public String getZjbt()
	{
		return zjbt;
	}

	public void setZjbt(String zjbt)
	{
		this.zjbt = zjbt;
	}

	public String getZjmjjh()
	{
		return zjmjjh;
	}

	public void setZjmjjh(String zjmjjh)
	{
		this.zjmjjh = zjmjjh;
	}

	public String getZjmjsfzh()
	{
		return zjmjsfzh;
	}

	public void setZjmjsfzh(String zjmjsfzh)
	{
		this.zjmjsfzh = zjmjsfzh;
	}

	public String getZjmjxm()
	{
		return zjmjxm;
	}

	public void setZjmjxm(String zjmjxm)
	{
		this.zjmjxm = zjmjxm;
	}

	public String getZjmjdwdm()
	{
		return zjmjdwdm;
	}

	public void setZjmjdwdm(String zjmjdwdm)
	{
		this.zjmjdwdm = zjmjdwdm;
	}

	public String getZjmjdwmc()
	{
		return zjmjdwmc;
	}

	public void setZjmjdwmc(String zjmjdwmc)
	{
		this.zjmjdwmc = zjmjdwmc;
	}

	public String getZjnr()
	{
		return zjnr;
	}

	public void setZjnr(String zjnr)
	{
		this.zjnr = zjnr;
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
		return transDate(djsj);
	}

	public void setDjsj(String djsj)
	{
		this.djsj = djsj;
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

	public String getOp()
	{
		return op;
	}

	public void setOp(String op)
	{
		this.op = op;
	}

	public String getDjmjjh()
	{
		return djmjjh;
	}

	public void setDjmjjh(String djmjjh)
	{
		this.djmjjh = djmjjh;
	}

	public String getCzbz() {
		return czbz;
	}

	public void setCzbz(String czbz) {
		this.czbz = czbz;
	}

	public String getGxsj() {
		return gxsj;
	}

	public void setGxsj(String gxsj) {
		this.gxsj = gxsj;
	}

	public String getCz() {
		if(cz==null || cz.trim().equals("")){
			StringBuffer sb = new StringBuffer();
			if(qxpd()){
				sb.append("<span onclick=\"openEditZjie('").append(zjbh).append("')\" style=\"color:green\" class=\"cps_span_href\">修改</span>&nbsp;");
				sb.append("<span onclick=\"delZjie('").append(zjbh).append("')\" style=\"color:green\" class=\"cps_span_href\">删除</span>&nbsp;");
			}
			sb.append("<span onclick=\"openDetailZjie('").append(zjbh).append("')\" style=\"color:green\" class=\"cps_span_href\">详情</span>&nbsp;");
			cz=sb.toString();
		}
		return cz;
	}
	
	private boolean qxpd(){
		LoginInfo log = ActionContextHelper.getLoginInfo();
		if(djmjjh.endsWith(log.getUsername())){
			return true;
		}
		return false;
	}
	public void setCz(String cz) {
		this.cz = cz;
	}

	public String getZjlxms()
	{
		return zjlxms;
	}

	public void setZjlxms(String zjlxms)
	{
		this.zjlxms = zjlxms;
	}
	
}
