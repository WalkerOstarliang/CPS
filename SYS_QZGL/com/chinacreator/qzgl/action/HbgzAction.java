package com.chinacreator.qzgl.action;


import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.sql.SQLException;
import java.util.List;

import javax.transaction.RollbackException;

import com.chinacreator.common.bean.LoginInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.cps.action.CPSBaseAction;
import com.chinacreator.common.helper.ActionContextHelper;
import com.chinacreator.common.helper.CommonDBBaseHelper;
import com.chinacreator.common.helper.DateTimeHelper;
import com.chinacreator.qzgl.bean.FjBean;
import com.chinacreator.qzgl.bean.HbgzBean;
import com.chinacreator.qzgl.bean.HbgzyhrBean;
import com.chinacreator.qzgl.query.HbgzQueryBean;
import com.chinacreator.qzgl.services.HbgzService;

public class HbgzAction extends CPSBaseAction{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1601179063924360151L;
	/**
	 * 汇报工作信息表的编号
	 */
	private String bh;					
	
	private String filename;
	
	private String filetype;
	
	/**
	 * 参与人表的编号
	 */
	private String cyrbh;
	
	private String operType;
	
	/**
	 * 附件流
	 */
	private File fj;
	
	/**
	 * 保存附件信息
	 */
	private FjBean fjbean;
	
	/**
	 * 自动获取
	 */
	private String fjContentType;
	
	/**
	 * 自动获取
	 */
	private String fjFileName;
	
	private HbgzBean bean;
	
	private HbgzyhrBean yhr;
	
	private HbgzQueryBean querybean;
	
	private HbgzService service;
	
	private String bhs;
	
	public HbgzAction(){
		super();
		service = new HbgzService();
		querybean = new HbgzQueryBean();
		bean = new HbgzBean();
		yhr = new HbgzyhrBean();
	}
	
	public String tohbgzIn() throws Exception
	{
		LoginInfo log = ActionContextHelper.getLoginInfo();
		if(CommonConstant.OPERTYPE_ADD.equals(operType)){
			if(bean == null){
				bean = new HbgzBean();
			}
			bean.setDjrjh(log.getUsername());
			bean.setDjrxm(log.getRealname());
			bean.setDjdwdm(log.getOrgcode());
			bean.setDjdwmc(log.getOrgname());
			bean.setDjsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd"));
			//request.setAttribute("size", 0);
			String bh = CommonDBBaseHelper.getSequence(CommonConstant.DBNAME_SQJW, "SEQ_QZGL_HBGZ");
			bean.setBh(bh);
		}
		else{
			bean = service.getHbgzByBh(bh);
			fjbean = service.getFjxxByBgbh(bh);
			List<HbgzyhrBean> yhr = service.getHbgzcyrListbybh(bh);
			bean.setYhrList(yhr);
			//request.setAttribute("size",bean.getYhrList().size());
		}
		return "tohbgzIn";
	}
	
	public String tohbgzCyr() throws SQLException{
		if(CommonConstant.OPERTYPE_ADD.equals(operType)){
			if(yhr == null){
				yhr = new HbgzyhrBean();
			}
		}else{
			yhr = service.getHbgzcyrbybh(cyrbh);
		}
		return "tohbgzCyr";
	}
	
	public String tohbgzList() throws Exception{
		initQueryBean(querybean);
		return "tohbgzList";
	}
	
	public void queryHbgzList() throws Exception{
		PageResultInfo<HbgzBean> list = service.getHbgzList(querybean, getPageInfo());
		responseWrite(list);
	}
	
   public void queryHbgzcyrList() throws Exception{
	  // System.out.println(bh);
		PageResultInfo<HbgzyhrBean> list = service.getHbgzcyrList(bh, getPageInfo());
		responseWrite(list);
	}

	public void updateHybg()throws Exception{
		service.updateHbgz(bean,operType,fjFileName,fj);
		/*if(fj != null){
			if(fjbean == null){
				fjbean = new FjBean();
			}
			fjbean.setDjbh(bean.getBh());
			fjbean.setFjxx(fj);
			fjbean.setFjlx("1");
			fjbean.setFjmc(fjFileName);
			service.insertFjxx(fjbean);
		}*/
		responseWrite(true);
	}
	
	public void addCyr() throws Exception{
		service.insertHbgzcyr(yhr,operType);
		responseWrite(true);
	}
	
	public void deleteHbgz() throws Exception{
		service.deleteHbgz(bh);
		responseWrite(true);
	}
	
	public void deleteHbgzYhr() throws Exception{
		HbgzyhrBean b = new HbgzyhrBean();
		b.setBgbh(bh);
		b.setBh(cyrbh);
		service.deleteHbgzcyr(b);
		responseWrite(true);
	}
	

	public void downloadFjxx() throws Exception{
		fjbean = service.getFjxxByBgbh(bh);
		File b = fjbean.getFj();
		String filename = null;
		if(request.getHeader("User-Agent").toLowerCase().indexOf("firefox")>0){
			filename = new String(fjbean.getFjmc().getBytes("utf-8"),"ISO8859-1");
		}else{
			filename = URLEncoder.encode(fjbean.getFjmc(), "UTF-8");//IE浏览器
		}
		if(b != null){
			response.reset();
			response.setContentType("application/octet-stream;charset=utf-8");
			response.setHeader("Content-Disposition", "attachment;filename="+filename);
			FileInputStream buff = new FileInputStream(b);
			byte[] buf = new byte[1024];
			long k=0;
	        OutputStream myout=response.getOutputStream(); 
	        long len = b.length();
	        while(k<len){ 
	            int j=buff.read(buf,0,1024); 
	            k+=j;  
	            myout.write(buf,0,j); 
	        } 
	        myout.flush();
	        myout.close();
	        buff.close();
//	        response.reset();
//			responseWrite(b);
		}
	}
	
	public void deletehbgzyhrxx() throws Exception{
		service.deletehbgzyhrxx(bh);
		responseWrite(true);
	}
	
	/**
	 * 删除与会人信息
	 * @throws SQLException 
	 */
	public void deleteHbgzyhr() throws SQLException{
		service.deletehbgzyhr(bh);
		responseWrite(true);
	}
	
	/**
	 * 批量删除
	 * @throws RollbackException 
	 */
	public void batchdeletehbgzxx() throws RollbackException{
		service.batchdeletehbgzxx(bhs);
		responseWrite(true);
	}
	/*******************************************************************************
	 *                        Getter & Setter                                      *
	 *******************************************************************************/

	public String getBh() {
		return bh;
	}

	
	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public String getFiletype() {
		return filetype;
	}

	public void setFiletype(String filetype) {
		this.filetype = filetype;
	}

	public String getCyrbh() {
		return cyrbh;
	}

	public void setCyrbh(String cyrbh) {
		this.cyrbh = cyrbh;
	}

	public HbgzyhrBean getYhr() {
		return yhr;
	}

	public void setYhr(HbgzyhrBean yhr) {
		this.yhr = yhr;
	}

	public void setBh(String bh) {
		this.bh = bh;
	}

	public String getOperType() {
		return operType;
	}

	public void setOperType(String operType) {
		this.operType = operType;
	}

	public HbgzBean getBean() {
		return bean;
	}

	public void setBean(HbgzBean bean) {
		this.bean = bean;
	}

	public HbgzQueryBean getQuerybean() {
		return querybean;
	}

	public void setQuerybean(HbgzQueryBean querybean) {
		this.querybean = querybean;
	}

	public File getFj() {
		return fj;
	}

	public void setFj(File fj) {
		this.fj = fj;
	}

	public String getFjContentType() {
		return fjContentType;
	}

	public void setFjContentType(String fjContentType) {
		this.fjContentType = fjContentType;
	}

	public String getFjFileName() {
		return fjFileName;
	}

	public void setFjFileName(String fjFileName) {
		this.fjFileName = fjFileName;
	}

	public FjBean getFjbean() {
		return fjbean;
	}

	public void setFjbean(FjBean fjbean) {
		this.fjbean = fjbean;
	}

	public String getBhs() {
		return bhs;
	}

	public void setBhs(String bhs) {
		this.bhs = bhs;
	}


	

}
