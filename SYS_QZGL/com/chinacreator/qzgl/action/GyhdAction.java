package com.chinacreator.qzgl.action;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.transaction.RollbackException;

import com.chinacreator.common.bean.LoginInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.cps.action.CPSBaseAction;
import com.chinacreator.common.helper.ActionContextHelper;
import com.chinacreator.common.helper.CommonDBBaseHelper;
import com.chinacreator.common.helper.DateTimeHelper;
import com.chinacreator.common.helper.ValidateHelper;
import com.chinacreator.qzgl.bean.FjBean;
import com.chinacreator.qzgl.bean.GyhdBean;
import com.chinacreator.qzgl.dao.GyhdDao;
import com.chinacreator.qzgl.query.GyhdQueryBean;
import com.chinacreator.qzgl.services.GyhdService;

public class GyhdAction extends CPSBaseAction {

	/**
	 * 
	 */
	private static final long serialVersionUID = 8549827901725358119L;

	private GyhdService service;
	private GyhdBean bean;
	private GyhdQueryBean querybean;
	private FjBean fjBean;
	private String operType;
	private String bh;
	private File fileInput;
	private String fileInputFileName;
	List<FjBean> fjList;
	private String bhs;
	private String fileName;	//附件的文件名
	private File[] upload;
	private String[] uploadFileName;

	public GyhdAction() {
		super();
		service = new GyhdService();
		querybean = new GyhdQueryBean();
		bean = new GyhdBean();
	}

	public void queryList() throws Exception {
		PageResultInfo<GyhdBean> list = service.getGyhdList(querybean,getPageInfo());
		responseWrite(list);
	}

	public void queryFjlist() throws Exception {
		PageResultInfo<FjBean> list = service.getGyhdFjList(bh, getPageInfo());
		responseWrite(list);
	}

	public String togyhdInfo() throws Exception {
		LoginInfo log = ActionContextHelper.getLoginInfo();
		if (CommonConstant.OPERTYPE_ADD.equals(operType)) {
			if (bean == null) {
				bean = new GyhdBean();
			}
			bean.setDjrjh(log.getUsername());
			bean.setDjrxm(log.getRealname());
			bean.setDjdwdm(log.getOrgcode());
			bean.setDjdwmc(log.getOrgname());
			bean.setDjsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss"));
			String bh = CommonDBBaseHelper.getSequence(
					CommonConstant.DBNAME_SQJW, "SEQ_QZGL_GYHD");
			bean.setBh(bh);
		} else {
			bean = service.getGyhdByBh(bh);
			fjList = service.getFjxxByGyhd(bh);
		}
		return "togyhdInfo";
	}

	public String toGyhdList() {
		initQueryBean(querybean);
		return "toGyhdList";
	}

	public void deleteGyhd() throws Exception {
		service.deleteGyhbxx(bh);
		responseWrite(true);
	}

	public void deleteFjxx() throws Exception {
		service.deleteFjxxByBh(bh);
		responseWrite(true);
	}

	public void updateGyhd() throws Exception {
		List<FjBean> sqwffjBeanList = new ArrayList<FjBean>();
		if (ValidateHelper.isNotEmptyArray(upload))
		{
			FjBean fjbean = null;
			for (int i = 0; i < upload.length; i++)
			{
				fjbean = new FjBean();
				fjbean.setBh(CommonDBBaseHelper.getSequence(CommonConstant.DBNAME_SQJW, "SEQ_QZGL_HBGZFJXX"));
				fjbean.setDjbh(bean.getBh());
				fjbean.setFj(upload[i]);
				fjbean.setFjmc(uploadFileName[i]);
				fjbean.setFjlx("2");
				sqwffjBeanList.add(fjbean);
			}
		}
		service.updateGyhdxx(bean, operType,sqwffjBeanList);
		responseWrite(true);
	}

	/*
	 * public void downloadFjxx() throws Exception{ fjbean =
	 * service.getFjxxByBh(bh); BLOB b = fjbean.getFj(); if(b != null){
	 * response.reset();
	 * response.setContentType("application/octet-stream;charset=utf-8");
	 * response.setHeader("Content-Disposition", "attachment;filename="+new
	 * String(fjbean.getFjmc().getBytes("utf-8"),"iso8859-1"));
	 * BufferedInputStream buff = new BufferedInputStream(b.getBinaryStream());
	 * byte[] buf = new byte[1024]; long k=0;
	 * 
	 * OutputStream myout=response.getOutputStream(); long len = b.length();
	 * while(k<len){ int j=buff.read(buf,0,1024); k+=j; myout.write(buf,0,j); }
	 * myout.flush(); myout.close(); buff.close(); } }
	 */

	public void uploadFile() throws Exception {
//		System.out.print(bh);
//		System.out.println(operType);
		if (CommonConstant.OPERTYPE_ADD.equals(operType)) {
			String fjbh = CommonDBBaseHelper.getSequence(
					CommonConstant.DBNAME_SQJW, "SEQ_QZGL_HBGZFJXX");
			fjBean = new FjBean();
//			System.out.println(fjbh);
			fjBean.setBh(fjbh);
			fjBean.setDjbh(bh);
			fjBean.setFjlx("2");
			fjBean.setFjmc(fileInputFileName);
			fjBean.setFjxx(fileInput);
			GyhdDao.insertFjxx(fjBean);
		} else if (CommonConstant.OPERTYPE_UPDATE.equals(operType)) {
			GyhdDao.deleteFjxxByGyhdBh(bh);
			fjBean = new FjBean();
			// System.out.println(fjbh);
			// fjBean.setBh(fjbh);
			fjBean.setDjbh(bh);
			fjBean.setFjlx("2");
			fjBean.setFjmc(fileInputFileName);
			fjBean.setFjxx(fileInput);
			GyhdDao.insertFjxx(fjBean);
		}
		responseWrite(true);
	}

	/**
	 * 批量删除
	 * 
	 * @throws RollbackException
	 */
	public void batchdeleteGyhdxx() throws RollbackException {
		service.batchdeleteGyhdxx(bhs);
		responseWrite(true);
	}

	/***************************************************************************
	 * Getter & Setter *
	 **************************************************************************/

	public GyhdBean getBean() {
		return bean;
	}

	public void setBean(GyhdBean bean) {
		this.bean = bean;
	}

	public GyhdQueryBean getQuerybean() {
		return querybean;
	}

	public void setQuerybean(GyhdQueryBean querybean) {
		this.querybean = querybean;
	}

	public String getOperType() {
		return operType;
	}

	public void setOperType(String operType) {
		this.operType = operType;
	}

	public String getBh() {
		return bh;
	}

	public void setBh(String bh) {
		this.bh = bh;
	}

	public File getFileInput() {
		return fileInput;
	}

	public void setFileInput(File fileInput) {
		this.fileInput = fileInput;
	}

	public String getFileInputFileName() {
		return fileInputFileName;
	}

	public void setFileInputFileName(String fileInputFileName) {
		this.fileInputFileName = fileInputFileName;
	}

	public FjBean getFjBean() {
		return fjBean;
	}

	public void setFjBean(FjBean fjBean) {
		this.fjBean = fjBean;
	}

	public List<FjBean> getFjList() {
		return fjList;
	}

	public void setFjList(List<FjBean> fjList) {
		this.fjList = fjList;
	}

	public String getBhs() {
		return bhs;
	}

	public void setBhs(String bhs) {
		this.bhs = bhs;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public File[] getUpload() {
		return upload;
	}

	public void setUpload(File[] upload) {
		this.upload = upload;
	}

	public String[] getUploadFileName() {
		return uploadFileName;
	}

	public void setUploadFileName(String[] uploadFileName) {
		this.uploadFileName = uploadFileName;
	}
	
	

}
