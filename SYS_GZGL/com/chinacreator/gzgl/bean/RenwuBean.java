package com.chinacreator.gzgl.bean;

import java.util.List;

import com.chinacreator.common.bean.LoginInfo;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.helper.ActionContextHelper;
import com.chinacreator.gzgl.util.GZGLCommonStatuts;

/**
 * 任务管理bean
 * @author royee
 *
 */
public class RenwuBean extends GzglBaseBean
{
	private static final long serialVersionUID = 109117707789412316L;

	/**
	 * 编号
	 */
	private String bh;
	
	/**
	 * 任务标题
	 */
	private String rwbt;
	
	/**
	 * 要求处理完成日期
	 */
	private String yqclwcrq;
	
	/**
	 * 任务描述
	 */
	private String rwms;
	
	/**
	 * 任务反馈状态
	 * 0：未反馈
	 * 1：已反馈
	 */
	private String rwfkzt;
	private String rwfkztmc;
	
	
	/**
	 * 任务完成情况
	 * 0：未完成
	 * 1：已完成
	 * 2：部分完成
	 * 3：其他
	 */
	private String rwwcqk;
	
	/**
	 * 任务完成情况名称
	 */
	private String rwwcqkmc;
	
	/**
	 * 实际完成时间
	 */
	private String sjwcsj;
	
	/**
	 * 实际处理民警姓名
	 */
	private String sjclmjxm;
	
	/**
	 * 处理结果描述
	 */
	private String cljgms;
	
	/**
	 * 附件编号
	 */
	private String rwfjid;
	
	/**
	 * 登记人姓名
	 */
	private String djrxm;
	
	/**
	 * 实际处理民警警号
	 */
	private String sjclmjjh;
	
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
	 * 登记人警号
	 */
	private String djrjh;
	
	/**
	 * 操作模式
	 */
	private String op;
	
	/**
	 * 更新时间
	 */
	private String gxsj;
	
	/**
	 * 登记的任务是否签收
	 * 0：未签收
	 * 1：已签收
	 * 
	 * 登记的任务在签收之前可以修改删除
	 */
	private String sfqs;
	private String sfqsmc;
	
	/**
	 * 操作标识
	 */
	private String czbz;
	private String clmjxm;
	private String clmjjh;
	
	/**
	 * 处理民警
	 */
	private List<MinjingBean> mjins;
	
	private List<RenwuJiegBean> rwCljg;
	
	/**
	 * 操作
	 */
	private String cz;
	
	/**
	 * 任务处理时操作
	 * @return
	 */
	private String rwclcz;
	
	private String qsrxm;
	
	private String qsrsfzh;
	
	private String qsdwdm;
	
	private String qsdwmc;
	
	private String qssj;
	
	public String getBh()
	{
		return bh;
	}

	public void setBh(String bh)
	{
		this.bh = bh;
	}

	public String getRwbt()
	{
		return rwbt;
	}

	public void setRwbt(String rwbt)
	{
		this.rwbt = rwbt;
	}

	public String getYqclwcrq()
	{
		return transDate(yqclwcrq);
	}

	public void setYqclwcrq(String yqclwcrq)
	{
		this.yqclwcrq = yqclwcrq;
	}

	public String getRwms()
	{
		return rwms;
	}

	public void setRwms(String rwms)
	{
		this.rwms = rwms;
	}

	public String getRwwcqk()
	{
		return rwwcqk;
	}

	public void setRwwcqk(String rwwcqk)
	{
		this.rwwcqk = rwwcqk;
	}

	public String getSjwcsj()
	{
		return sjwcsj;
	}

	public void setSjwcsj(String sjwcsj)
	{
		this.sjwcsj = sjwcsj;
	}

	public String getSjclmjxm()
	{
		return sjclmjxm;
	}

	public void setSjclmjxm(String sjclmjxm)
	{
		this.sjclmjxm = sjclmjxm;
	}

	public String getCljgms()
	{
		return cljgms;
	}

	public void setCljgms(String cljgms)
	{
		this.cljgms = cljgms;
	}

	public String getDjrxm()
	{
		return djrxm;
	}

	public void setDjrxm(String djrxm)
	{
		this.djrxm = djrxm;
	}


	public String getSjclmjjh() {
		return sjclmjjh;
	}

	public void setSjclmjjh(String sjclmjjh) {
		this.sjclmjjh = sjclmjjh;
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

	public List<MinjingBean> getMjins()
	{
		return mjins;
	}

	public String getRwfkzt() {
		return rwfkzt;
	}

	public void setRwfkzt(String rwfkzt) {
		this.rwfkzt = rwfkzt;
	}

	public void setMjins(List<MinjingBean> mjins)
	{
		this.mjins = mjins;
	}

	public String getDjrjh() {
		return djrjh;
	}

	public void setDjrjh(String djrjh) {
		this.djrjh = djrjh;
	}

	public String getCz() {
		LoginInfo loginUser = ActionContextHelper.getLoginInfo();
		StringBuffer str = new StringBuffer();
		str.append("<span onclick= \"openDetailRenwu('").append(bh).append("','").append(CommonConstant.OPERTYPE_DETAIL).append("')\"  style=\"color:green\" class=\"cps_span_href\">详情</span>&nbsp;");
		//是自己登记的 且任务还没被签收 可以修改删除
		if(loginUser.getUsername().equals(this.djrjh) && GZGLCommonStatuts.SFQS_WQS.equals(this.sfqs)){
			str.append("&nbsp;&nbsp;");
			str.append("<span onclick=\"openDetailRenwu('").append(bh).append("','").append(CommonConstant.OPERTYPE_UPDATE).append("')\" style=\"color:green\" class=\"cps_span_href\">修改</span>&nbsp;");
			str.append("&nbsp;&nbsp;");
			str.append("<span onclick=\"delRenwu('").append(bh).append("')\" style=\"color:green\" class=\"cps_span_href\">删除</span>&nbsp;");
		}
		cz = str.toString();
		return cz;
		
	}

	public void setCz(String cz) {
		this.cz = cz;
	}

	public String getGxsj() {
		return gxsj;
	}

	public void setGxsj(String gxsj) {
		this.gxsj = gxsj;
	}

	public String getSfqs() {
		return sfqs;
	}

	public void setSfqs(String sfqs) {
		this.sfqs = sfqs;
	}

	public String getCzbz() {
		return czbz;
	}

	public void setCzbz(String czbz) {
		this.czbz = czbz;
	}

	public String getRwwcqkmc() {
		if(rwwcqk.equals("0")){
			rwwcqkmc ="<font color='red'>未完成</font>";
		}else if(rwwcqk.equals("1")){
			rwwcqkmc ="<font color='black'>已完成</font>";
		}else if (rwwcqk.equals("2")) {
			rwwcqkmc ="<font color='red'>部分完成</font>";
		}
		return rwwcqkmc;
	}

	public void setRwwcqkmc(String rwwcqkmc) {
		this.rwwcqkmc = rwwcqkmc;
	}

	public List<RenwuJiegBean> getRwCljg() {
		return rwCljg;
	}

	public void setRwCljg(List<RenwuJiegBean> rwCljg) {
		this.rwCljg = rwCljg;
	}

	public String getSfqsmc() {
		if("1".equals(sfqs)){
			sfqsmc = "<font color='black'>已签收</font>";
		}else if("0".equals(sfqs)){
			sfqsmc ="<font color='red'>未签收</font>";
		}
		return sfqsmc;
	}

	public void setSfqsmc(String sfqsmc) {
		this.sfqsmc = sfqsmc;
	}

	public String getRwclcz() {
		LoginInfo loginUser = ActionContextHelper.getLoginInfo();
		StringBuffer str = new StringBuffer();
		
		//任务不是自己登记的、 执行民警中有、任务已经签收且任务的完成情况还没有完成  则可以进行任务反馈
		// 执行民警中有自己、任务还没有签收且任务登记人不是自己则可以签收
		
		boolean sfkqs = false;
		if(this.clmjjh == null || "".equals(this.clmjjh)){
			sfkqs = false;
		}else{
			for(String jh : this.clmjjh.split(",")){
				if(loginUser.getUsername().equals(jh)){
					sfkqs = true;
					break;
				}
			}
		}
		if(sfkqs && GZGLCommonStatuts.SFQS_WQS.equals(this.sfqs) ){
			str.append("<span onclick=\"qsRenwu('").append(bh).append("')\" style=\"color:green\" class=\"cps_span_href\">签收</span>&nbsp;");
		}
		if(sfkqs && GZGLCommonStatuts.SFQS_YQS.equals(this.sfqs) && !GZGLCommonStatuts.RWWCQK_YWC.equals(this.rwwcqk)){
			str.append("<span onclick=\"fkRenwu('").append(bh).append("')\" style=\"color:green\" class=\"cps_span_href\">反馈</span>&nbsp;");
		}
		
		str.append("<span onclick=\"openDetailRenwucl('").append(bh).append("','").append(CommonConstant.OPERTYPE_UPDATE).append("')\" style=\"color:green\" class=\"cps_span_href\">详情</span>&nbsp;");
		rwclcz = str.toString();
		return rwclcz;
	}

	public void setRwclcz(String rwclcz) {
		this.rwclcz = rwclcz;
	}

	public String getClmjxm() {
		return clmjxm;
	}

	public void setClmjxm(String clmjxm) {
		this.clmjxm = clmjxm;
	}

	public String getRwfjid() {
		return rwfjid;
	}

	public void setRwfjid(String rwfjid) {
		this.rwfjid = rwfjid;
	}

	public String getClmjjh() {
		return clmjjh;
	}

	public void setClmjjh(String clmjjh) {
		this.clmjjh = clmjjh;
	}

	public String getRwfkztmc() {
		if(rwfkzt.equals(GZGLCommonStatuts. FKZT_WFK)){
			rwfkztmc ="<font color='red'>未反馈</font>";
		}else if (rwfkzt.equals(GZGLCommonStatuts.FKZT_YFK)) {
			rwfkztmc ="<font color='black'>已反馈</font>";
		}
		return rwfkztmc;
	}

	public void setRwfkztmc(String rwfkztmc) {
		this.rwfkztmc = rwfkztmc;
	}

	public String getQsrxm()
	{
		return qsrxm;
	}

	public void setQsrxm(String qsrxm)
	{
		this.qsrxm = qsrxm;
	}

	public String getQsrsfzh()
	{
		return qsrsfzh;
	}

	public void setQsrsfzh(String qsrsfzh)
	{
		this.qsrsfzh = qsrsfzh;
	}

	public String getQsdwdm()
	{
		return qsdwdm;
	}

	public void setQsdwdm(String qsdwdm)
	{
		this.qsdwdm = qsdwdm;
	}

	public String getQsdwmc()
	{
		return qsdwmc;
	}

	public void setQsdwmc(String qsdwmc)
	{
		this.qsdwmc = qsdwmc;
	}

	public String getQssj()
	{
		return qssj;
	}

	public void setQssj(String qssj)
	{
		this.qssj = qssj;
	}
	
}
