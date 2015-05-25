package com.chinacreator.qzgl.query;

import com.chinacreator.common.bean.QueryBean;
/**
 * 查询乞讨人员
 * @author Administrator
 *
 */
public class QtryQueryBean  extends QueryBean{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String djdwdm; // 登记单位代码
	private String qtryxm; // 乞讨人员姓名
	private String qtryxb; // 乞讨人员性别
	private String qtryjg; // 乞讨人员籍贯
	private String qtrylb; // 乞讨人员类别
	private String startbfxsj; // 被发现开始时间
	private String endbfxsj; // 被发现截至时间
	private String qtrybfxdd; // 乞讨人员被发现地点
	
	public String getDjdwdm() {
		return djdwdm;
	}
	public void setDjdwdm(String djdwdm) {
		this.djdwdm = djdwdm;
	}
	public String getQtryxm() {
		return qtryxm;
	}
	public void setQtryxm(String qtryxm) {
		this.qtryxm = qtryxm;
	}
	public String getQtryxb() {
		return qtryxb;
	}
	public void setQtryxb(String qtryxb) {
		this.qtryxb = qtryxb;
	}
	public String getQtryjg() {
		return qtryjg;
	}
	public void setQtryjg(String qtryjg) {
		String str = qtryjg;
		if(qtryjg.substring(2, 6).equals("0000")){
			str = qtryjg.substring(0, 2);
		}
		if(!qtryjg.substring(2, 4).equals("00") && qtryjg.substring(4, 6).equals("00")){
			str = qtryjg.substring(0, 4);
		}
		this.qtryjg = str;
	}
	public String getQtrylb() {
		return qtrylb;
	}
	public void setQtrylb(String qtrylb) {
		this.qtrylb = qtrylb;
	}
	public String getStartbfxsj() {
		return startbfxsj;
	}
	public void setStartbfxsj(String startbfxsj) {
		this.startbfxsj = startbfxsj;
	}
	public String getEndbfxsj() {
		return endbfxsj;
	}
	public void setEndbfxsj(String endbfxsj) {
		this.endbfxsj = endbfxsj;
	}
	public String getQtrybfxdd() {
		return qtrybfxdd;
	}
	public void setQtrybfxdd(String qtrybfxdd) {
		this.qtrybfxdd = qtrybfxdd;
	}
	
}
