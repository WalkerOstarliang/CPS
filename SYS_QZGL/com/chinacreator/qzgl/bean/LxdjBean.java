package com.chinacreator.qzgl.bean;

import com.chinacreator.common.bean.BaseValue;
import com.chinacreator.common.bean.LoginInfo;
import com.chinacreator.common.helper.ActionContextHelper;
import com.chinacreator.common.helper.DictionaryCacheHellper;

public class LxdjBean extends BaseValue
{

	/**
	 * 
	 */
	private static final long serialVersionUID = 6519954291589207313L;

	/*******************************************************************************
	 *                             T_FWQZ_LFLXDJXX                                 *
	 *******************************************************************************/
	private String bh;						//编号
	private String xjzt;					//信件主题==>来访主题
	private String fwfs;					//访问方式==>属性：1-来访、2-来信    数据字典FWQZ_LFLXSX
	private String nfwfs;					//访问方式的显示字段(不保存在数据库的字段)
	private String nrlx;					//来访类型(投诉-1、建议-2、咨询-3) 数据字典FWQZ_NRLX
	private String nnrlx;
	private String lflxrxm;					//来访来信人姓名
	private String lflxsj;					//来访来信时间（年月日）
	private String lflxrsfzh;				//来访来信人身份证号
	private String lflxrlxdh;				//来访来信人联系电话
	private String lflxrjtzz;				//来访来信人家庭住址
	private String sjjdmjjh;				//收件/接待民警警号
	private String sjjdmjxm;				//收件/接待民警姓名
	private String sjjdmjdwdm;				//收件/接待民警单位代码
	private String sjjdmjdwmc;				//收件/接待民警单位名称
	private String sjjdmjlxdh;				//收件/接待民警联系电话
	private String lfxjnr;					//来访信件内容
	private String cllx;					//处理类型：0 未处理 1已处理
	private String ncllx;
	private String clrxm;					//处理人姓名
	private String clrjh;					//处理人警号
	private String cldwdm;					//处理单位代码
	private String cldwmc;					//处理单位名称
	private String cljgms;					//处理结果描述
	private String clsj;					//处理时间（年月日）
	private String jsdwdm;					//接收单位代码
	private String jsdwmc;					//接收单位名称
	private String djrxm;					//登记人姓名
	private String djrjh;					//登记人警号
	private String djsj;					//登记时间（年月日）
	private String djdwdm;					//登记单位代码
	private String djdwmc;					//登记单位名称
	private String cz;						//来信来访登记列表的操作
	private String clcz;					//来信来访处理列表的操作
	
	/*******************************************************************************
	 *                             T_FWQZ_LFXJZFLZXX                               *
	 *******************************************************************************/
	private String czrxm;					//登录人姓名（操作人姓名）
	private String czrlxdh;					//登录人名称（操作人名称）
	private String czrdwdm;					//登录人单位代码（操作人单位代码）
	private String czrdwmc;					//登录人单位名称（操作人单位名称）
	private String czlx;                    //1 登记 2转发 3 处理
	private String zfdwdm;                  //转发单位代码
	private String zfdwmc;					//转发单位名称
	private String zfbh;					//转发表编号（T_FWQZ_LFXJZFLZXX主键）
	private String czrjh;
	
	
	
	/*******************************************************************************
	 *                        Getter & Setter                                      *
	 *******************************************************************************/
	
	
	public String getBh() {
		return bh;
	}
	public String getDjrjh() {
		return djrjh;
	}
	public void setDjrjh(String djrjh) {
		this.djrjh = djrjh;
	}
	/**
	 * 获得操作的html语言
	 * @return
	 */
	public String getCz() {
		if(cz==null || cz.trim().equals("")){
			StringBuffer sb = new StringBuffer();
			LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
			if(djrjh.equals(loginInfo.getUsername())&&!cllx.equals("3")){
				sb.append("<a href=\"javascript:openInfoWin('update','");
				sb.append(bh);
				sb.append("')\">修改</a>&nbsp;");
				sb.append("<a href=\"javascript:deleteInfoByBh('");
				sb.append(bh);
				sb.append("')\">删除</a>&nbsp;");
			}
			sb.append("<a href=\"javascript:openInfoWin('detail','");
			sb.append(bh);
			sb.append("')\">详情</a>&nbsp;");
		/*	if(qxpd('k')=='2'){
				sb.append("<a href=\"javascript:deleteInfoByBh('");
				sb.append(bh);
				sb.append("')\">删除</a>&nbsp;");
			}*/
			cz=sb.toString();
		}
		return cz;
	}
	
	/**
	 * 判断权限(接受单位才有修改、处理、转发的权限)
	 * @param c 'k'为修改、删除的权限   'c'为处理转发的权限
	 * @return
	 
	private char qxpd(char c){
		LoginInfo log = ActionContextHelper.getLoginInfo();
		//登录人的单位就是接收单位
		if(log.getOrgcode().equals(zfdwdm) && c=='k'){
			return cllx.equals("3")?'2':'1';
		}
		if(cllx.equals("3")&&log.getUsername().equals(djrjh)){
			return '2';
		}
		if(!cllx.equals("3")&&log.getOrgcode().equals(jsdwdm)){
			return '0';
		}
		return '3';
		
	}*/
	public void setCz(String cz) {
		this.cz = cz;
	}
	
	/**
	 * 获得处理页面的操作的html语言
	 * @return
	 */
	public String getClcz() {
		LoginInfo log = ActionContextHelper.getLoginInfo();
		if(clcz==null || clcz.trim().equals("")){
			StringBuffer sb = new StringBuffer();
			if(!cllx.equals("3")&&log.getOrgcode().equals(jsdwdm)){
				sb.append("<a href=\"javascript:openInfoWin('chuli','");
				sb.append(bh);
				sb.append("')\">处理</a>&nbsp;");
				sb.append("<a href=\"javascript:openInfoWin('zhuanfa','");
				sb.append(bh);
				sb.append("')\">转发</a>&nbsp;");
			}
			sb.append("<a href=\"javascript:openInfoWin('detail','");
			sb.append(bh);
			sb.append("')\">详情</a>&nbsp;");
			clcz=sb.toString();
		}
		return clcz;
	}
	public void setClcz(String clcz) {
		this.clcz = clcz;
	}
	public void setBh(String bh) {
		this.bh = bh;
	}
	public String getXjzt() {
		return xjzt;
	}
	public void setXjzt(String xjzt) {
		this.xjzt = xjzt;
	}
	public String getFwfs() {
		return fwfs;
	}
	public void setFwfs(String fwfs) {
		this.fwfs = fwfs;
	}
	public String getNrlx() {
		return nrlx;
	}
	public void setNrlx(String nrlx) {
		this.nrlx = nrlx;
	}
	public String getLflxrxm() {
		return lflxrxm;
	}
	public void setLflxrxm(String lflxrxm) {
		this.lflxrxm = lflxrxm;
	}
	public String getLflxrsfzh() {
		return lflxrsfzh;
	}
	public void setLflxrsfzh(String lflxrsfzh) {
		this.lflxrsfzh = lflxrsfzh;
	}
	public String getLflxrlxdh() {
		return lflxrlxdh;
	}
	public void setLflxrlxdh(String lflxrlxdh) {
		this.lflxrlxdh = lflxrlxdh;
	}
	public String getLflxrjtzz() {
		return lflxrjtzz;
	}
	public void setLflxrjtzz(String lflxrjtzz) {
		this.lflxrjtzz = lflxrjtzz;
	}
	public String getSjjdmjjh() {
		return sjjdmjjh;
	}
	public void setSjjdmjjh(String sjjdmjjh) {
		this.sjjdmjjh = sjjdmjjh;
	}
	public String getSjjdmjxm() {
		return sjjdmjxm;
	}
	public void setSjjdmjxm(String sjjdmjxm) {
		this.sjjdmjxm = sjjdmjxm;
	}
	public String getSjjdmjdwdm() {
		return sjjdmjdwdm;
	}
	public void setSjjdmjdwdm(String sjjdmjdwdm) {
		this.sjjdmjdwdm = sjjdmjdwdm;
	}
	public String getSjjdmjdwmc() {
		return sjjdmjdwmc;
	}
	public void setSjjdmjdwmc(String sjjdmjdwmc) {
		this.sjjdmjdwmc = sjjdmjdwmc;
	}
	public String getSjjdmjlxdh() {
		return sjjdmjlxdh;
	}
	public void setSjjdmjlxdh(String sjjdmjlxdh) {
		this.sjjdmjlxdh = sjjdmjlxdh;
	}
	public String getLfxjnr() {
		return lfxjnr;
	}
	public void setLfxjnr(String lfxjnr) {
		this.lfxjnr = lfxjnr;
	}
	public String getCllx() {
		return cllx;
	}
	public void setCllx(String cllx) {
		this.cllx = cllx;
	}
	public String getClrxm() {
		return clrxm;
	}
	public void setClrxm(String clrxm) {
		this.clrxm = clrxm;
	}
	public String getCldwdm() {
		return cldwdm;
	}
	public void setCldwdm(String cldwdm) {
		this.cldwdm = cldwdm;
	}
	public String getCldwmc() {
		return cldwmc;
	}
	public void setCldwmc(String cldwmc) {
		this.cldwmc = cldwmc;
	}
	public String getCljgms() {
		return cljgms;
	}
	public void setCljgms(String cljgms) {
		this.cljgms = cljgms;
	}
	public String getJsdwdm() {
		return jsdwdm;
	}
	public void setJsdwdm(String jsdwdm) {
		this.jsdwdm = jsdwdm;
	}
	public String getJsdwmc() {
		return jsdwmc;
	}
	public void setJsdwmc(String jsdwmc) {
		this.jsdwmc = jsdwmc;
	}
	public String getDjrxm() {
		return djrxm;
	}
	public void setDjrxm(String djrxm) {
		this.djrxm = djrxm;
	}
	public String getDjsj() {
		return djsj;
	}
	public void setDjsj(String djsj) {
		this.djsj = djsj;
	}
	public String getDjdwdm() {
		return djdwdm;
	}
	public void setDjdwdm(String djdwdm) {
		this.djdwdm = djdwdm;
	}
	public String getDjdwmc() {
		return djdwmc;
	}
	public void setDjdwmc(String djdwmc) {
		this.djdwmc = djdwmc;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	public String getLflxsj() {
		return lflxsj;
	}
	public void setLflxsj(String lflxsj) {
		this.lflxsj = lflxsj;
	}
	public String getNfwfs() {
		nfwfs = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("FWQZ_LFLXSX", fwfs);
		return nfwfs;
	}
	public String getNnrlx() {
		nnrlx = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("FWQZ_NRLX", nrlx);
		return nnrlx;
	}
	public String getNcllx() {
		ncllx = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("FWQZ_CLLX", cllx);
		return ncllx;
	}
	
	public String getClrjh() {
		return clrjh;
	}
	public void setClrjh(String clrjh) {
		this.clrjh = clrjh;
	}
	public String getClsj() {
		return clsj;
	}
	public void setClsj(String clsj) {
		this.clsj = clsj;
	}
	public String getCzrxm() {
		return czrxm;
	}
	public void setCzrxm(String czrxm) {
		this.czrxm = czrxm;
	}
	public String getCzrlxdh() {
		return czrlxdh;
	}
	public void setCzrlxdh(String czrlxdh) {
		this.czrlxdh = czrlxdh;
	}
	public String getCzrdwdm() {
		return czrdwdm;
	}
	public void setCzrdwdm(String czrdwdm) {
		this.czrdwdm = czrdwdm;
	}
	public String getCzrdwmc() {
		return czrdwmc;
	}
	public void setCzrdwmc(String czrdwmc) {
		this.czrdwmc = czrdwmc;
	}
	public String getCzlx() {
		return czlx;
	}
	public void setCzlx(String czlx) {
		this.czlx = czlx;
	}
	public String getZfdwdm() {
		return zfdwdm;
	}
	public void setZfdwdm(String zfdwdm) {
		this.zfdwdm = zfdwdm;
	}
	
	public String getZfdwmc() {
		return zfdwmc;
	}
	public void setZfdwmc(String zfdwmc) {
		this.zfdwmc = zfdwmc;
	}
	public String getZfbh() {
		return zfbh;
	}
	public void setZfbh(String zfbh) {
		this.zfbh = zfbh;
	}
	public void setNfwfs(String nfwfs) {
		this.nfwfs = nfwfs;
	}
	public void setNnrlx(String nnrlx) {
		this.nnrlx = nnrlx;
	}
	public void setNcllx(String ncllx) {
		this.ncllx = ncllx;
	}
	public String getCzrjh() {
		return czrjh;
	}
	public void setCzrjh(String czrjh) {
		this.czrjh = czrjh;
	}
	
	
}
