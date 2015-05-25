package com.chinacreator.zagl.dwjc.action;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Blob;
import java.sql.SQLException;

import com.chinacreator.common.bean.LoginInfo;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.cps.action.CPSBaseAction;
import com.chinacreator.common.helper.ActionContextHelper;
import com.chinacreator.common.helper.DateTimeHelper;
import com.chinacreator.common.helper.DictionaryCacheHellper;
import com.chinacreator.common.helper.ValidateHelper;
import com.chinacreator.zagl.dwjc.bean.NbAqJcZpBean;
import com.chinacreator.zagl.dwjc.bean.NbaqjcBean;
import com.chinacreator.zagl.dwjc.bean.NbaqjcZpquerybean;
import com.chinacreator.zagl.dwjc.service.NbaqjcService;
import com.chinacreator.zagl.dwjc.service.impl.NbAqjcServiceImpl;

public class NbAqjcAction extends CPSBaseAction {

	private static final long serialVersionUID = -8274379244747338120L;
	private NbaqjcBean aqjc = null;
	private NbaqjcService service;
	private LoginInfo loginUser;
	
	//照片查询
	private NbaqjcZpquerybean queryBean;
	
	//照片
	private NbAqJcZpBean nbAjZpBean;
	private File[] zpUploads;
	private String yhdd;
	
	//单位类别
	private String dwlb = "";
	
	//机构编号
	private String jgbh = "";
	
	//单位名称
	private String dwmc = "";
	
	//是否内保民警
	private String isNbmj = "";
	public NbAqjcAction(){
		super();
		service = new NbAqjcServiceImpl();
		loginUser = ActionContextHelper.getLoginInfo();
		aqjc = new NbaqjcBean();
	}
	
	/**
	 * 上传安全检查隐患照片
	 */
	public void saveAqjcZp(){
		try
		{
			service.saveNbAqjcZp(nbAjZpBean, zpUploads);
			aqjc =new NbaqjcBean();
			aqjc.setNbaqjczplist(service.querNbAqjczplistbyaqid(nbAjZpBean.getAqjcid(), nbAjZpBean.getYhdd()));
		
		}
		catch(Exception e)
		{
			e.printStackTrace();
			responseWrite(null);
		}
	}
	/**
	 * 显示安全检查隐患照片 showNbAjzpImage
	 */
	public void showNbAjzpImage(){
		InputStream is =null;
		OutputStream os =null;
		try{
			os = response.getOutputStream();
			Blob zpblob = service.getNbaqjcZpxxInputStream(queryBean.getZpid());
			if (zpblob != null)
			{
				is = zpblob.getBinaryStream();
				byte[] b = new byte[1024];
				while(is.read(b) > 0)
				{
					os.write(b);
					os.flush();
				}
			}
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		finally
		{
			try
			{
				is.close();
				os.close();
			}
			catch (IOException e)
			{
				e.printStackTrace();
			}
			
		}
	}
	
	/**
	 * 删除安全检查隐患照片 deleteNbajzpxx
	 * @throws SQLException 
	 */
	public void deleteNbajzpxx() throws SQLException{
		service.deleteNbajZpxxByZpid(queryBean.getZpid());
		responseWrite(true);
	}
	
	/**
	 * 打开预警颜色界面
	 * @return
	 */
	public String toYjysPage(){
		aqjc = service.queryLastCheckByJgbh(jgbh);
		return "toYjysPage";
	}
	
	/**
	 * 保存安全检查
	 */
	public void saveAqjc(){
		responseWrite(service.saveNbAqjc(aqjc));
	}
	
	/**
	 * 跳转到安全检查
	 * @return
	 */
	public String toAqjcPage(){
		if(CommonConstant.OPERTYPE_ADD.equals(operType)){
			aqjc.setJgbh(jgbh);
			aqjc.setDwmc(dwmc);
			aqjc.setDwlbmc(DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("ZDY_NBDWLB", dwlb));
			aqjc.setSspcsdm(loginUser.getPcsdm());
			aqjc.setSspcsmc(loginUser.getPcsmc());
			aqjc.setJcmjxm(loginUser.getRealname());
			aqjc.setJcmjjh(loginUser.getUsername());
			aqjc.setJcrq(DateTimeHelper.getNowDateStr("yyyy-MM-dd"));
			aqjc.setYhtjmjjh(loginUser.getUsername());
			aqjc.setYhtjmjxm(loginUser.getRealname());
			aqjc.setMjclsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd"));
		}else{
			aqjc = service.queryNbAqjcById(aqjc.getId());
		}
		return "toAqjcPage";
	}
	
	/**
	 * 根据不同的单位类别跳转到不同的安全检查页面
	 * 银行、金融机构 内保民警（需要手动设置单位分类为098）
	 * @return
	 */
	public String toAqjcPageByDwlb()
	{	
		if("007".equals(dwlb) && "true".equals(isNbmj)){
			dwlb = "098";
		}
		
		if(ValidateHelper.isNotEmptyString(aqjc.getId()))
		{
			aqjc = service.queryNbAqjcById(aqjc.getId());
		}
		else
		{
			if(ValidateHelper.isNotEmptyString(jgbh) && !CommonConstant.OPERTYPE_ADD.equals(operType))
			{
				aqjc = service.queryLastCheckByJgbh(jgbh);
				dwlb = aqjc.getDwlb();
			}
			
		}
		return "aqjc_" + dwlb;
	}
	
	/**
	 * 根据安全检查ID和安全隐患处字段名查询不同的安全检查隐患照片
	 * @return
	 */
	public String toShowNbAJZpPagebyAjid(){
		aqjc = new NbaqjcBean();
		aqjc.setNbaqjczplist(service.querNbAqjczplistbyaqid(nbAjZpBean.getAqjcid(), nbAjZpBean.getYhdd()));
		return "toShowNbAJZpPagebyAjid";
	}
	
	/**
	 * 查询安全检查列表
	 */
	public void queryAqjcList() {
		responseWrite(service.queryNbAqjcByJgbh(aqjc.getJgbh(), this.getPageInfo()));
	}
	/**
	 * 撤销内保单位核签
	 * @return
	 */
	public void cxhqCheck(){
		if (ValidateHelper.isNotEmptyString(jgbh)){
			try {
				service.cxnbhqCheck(jgbh);
				responseWrite(true);
			} catch (Exception e) {
				responseWrite(false);
				e.printStackTrace();
			}
		}
	}
	///////////////////////////////////////////////
	public NbaqjcBean getAqjc() {
		return aqjc;
	}

	public void setAqjc(NbaqjcBean aqjc) {
		this.aqjc = aqjc;
	}

	public String getDwlb() {
		return dwlb;
	}

	public void setDwlb(String dwlb) {
		this.dwlb = dwlb;
	}


	public NbAqJcZpBean getNbAjZpBean() {
		return nbAjZpBean;
	}
	public void setNbAjZpBean(NbAqJcZpBean nbAjZpBean) {
		this.nbAjZpBean = nbAjZpBean;
	}
	public File[] getZpUploads() {
		return zpUploads;
	}
	public void setZpUploads(File[] zpUploads) {
		this.zpUploads = zpUploads;
	}
	public String getYhdd() {
		return yhdd;
	}
	public void setYhdd(String yhdd) {
		this.yhdd = yhdd;
	}
	public NbaqjcZpquerybean getQueryBean() {
		return queryBean;
	}
	public void setQueryBean(NbaqjcZpquerybean queryBean) {
		this.queryBean = queryBean;
	}
	public String getJgbh() {
		return jgbh;
	}
	public void setJgbh(String jgbh) {
		this.jgbh = jgbh;
	}
	public String getDwmc() {
		return dwmc;
	}
	public void setDwmc(String dwmc) {
		this.dwmc = dwmc;
	}

	public String getIsNbmj() {
		return isNbmj;
	}

	public void setIsNbmj(String isNbmj) {
		this.isNbmj = isNbmj;
	}
}
