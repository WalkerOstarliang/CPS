package com.chinacreator.gzgl.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.sql.SQLException;

import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.gzgl.bean.TzmbBean;
import com.chinacreator.gzgl.query.TzmbQuery;
import com.chinacreator.gzgl.service.TzmbService;

public class GztzAction extends GzglBaseAction{

	/**
	 * 
	 */
	private static final long serialVersionUID = -3980258719911959373L;
	/**
	 * 工作台账管理模块action
	 */
	private TzmbBean tzmbBean;
	private TzmbQuery queryBean;
	private TzmbService tzmbService;
	private String operType;
	private File[] tzmbUploads;
	private String[] tzmbUploadsFileName;
	private String id;
	private String jsppage;
	
	
	
	public GztzAction() {
		tzmbBean = new TzmbBean();
		queryBean = new TzmbQuery();
		tzmbService = new TzmbService();
	}

	/**
	 * 跳转至台账模本下载界面
	 * 
	 */
	public String togztzmbxzPage(){
		return "togztzmbxzPage";
	}
	
	/**
	 * 分页查询台账模本信息
	 * @throws SQLException 
	 */
	public void queryList(){
		if(queryBean==null){
			queryBean = new TzmbQuery();
			initQueryBean(queryBean);
		}
		PageResultInfo<TzmbBean> result = tzmbService.getTzmbxx(queryBean,getPageInfo());
		responseWrite(result);
	}
	
	/**
	 * 跳转到上传台账模本信息
	 * @return
	 * @throws SQLException 
	 */
	public String toScmbPage() throws SQLException{
		if(queryBean==null){
			queryBean = new TzmbQuery();
			initQueryBean(queryBean);
		}
		PageResultInfo<TzmbBean> result = tzmbService.getTzmbxx(queryBean,getPageInfo());
		request.setAttribute("result", result);
		return "toScmbPage";
	}
	
	/**
	 * 保存台账模本信息
	 * @return
	 * @throws SQLException 
	 */
	public void saveTzmbxx() throws SQLException{
	   tzmbService.saveTzmbxxBean(tzmbBean,tzmbUploadsFileName,tzmbUploads);	
	   responseWrite(true);
	}
	
	/**
	 * 下载台账模板
	 * @return
	 * @throws SQLException 
	 * @throws SQLException 
	 * @throws UnsupportedEncodingException 
	 * @throws FileNotFoundException 
	 */
	public void downloadFjxx() throws SQLException, UnsupportedEncodingException {
		tzmbBean = tzmbService.getTzmbxxBeanbyId(id);
		File b = tzmbBean.getTzmb();
		String filename = null;
		if(request.getHeader("User-Agent").toLowerCase().indexOf("firefox")>0){
			filename = new String(tzmbBean.getTzmc().getBytes("utf-8"),"ISO8859-1");
		}else{
			filename = URLEncoder.encode(tzmbBean.getTzmc(), "UTF-8");
		}

		if(b!=null){
			try {
				response.reset();
				response.setContentType("application/octet-stream;charset=utf-8");
				response.setHeader("Content-Disposition", "attachment;filename="+filename);
					FileInputStream fis = new FileInputStream(b);	
					OutputStream out = response.getOutputStream();
					byte[] buff = new byte[1024];
					int d = 0;
					while((d=fis.read(buff,0,1024))!=-1){
						out.write(buff,0,d);
					}
					out.flush();
					fis.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
	}
	
	/**
	 * 根据id删除台账模板信息
	 * @return
	 * @throws SQLException 
	 */
	public void deleteTzmbxx() throws SQLException{
		tzmbService.deleteTzmbxxbyId(id);
		responseWrite(true);
	}
	
	/**
	 * 加载台账模板信息
	 * @return
	 */
	public String loadTzmbInfoPage(){
		if(queryBean==null){
			queryBean = new TzmbQuery();
		}
		initQueryBean(queryBean);
		PageResultInfo<TzmbBean> result = tzmbService.getTzmbxx(queryBean,getPageInfo());
		request.setAttribute("result", result);
		return "toScmbPage";
	}
	public TzmbBean getTzmbBean() {
		return tzmbBean;
	}

	public void setTzmbBean(TzmbBean tzmbBean) {
		this.tzmbBean = tzmbBean;
	}

	public TzmbQuery getQueryBean() {
		return queryBean;
	}

	public void setQueryBean(TzmbQuery queryBean) {
		this.queryBean = queryBean;
	}

	public TzmbService getTzmbService() {
		return tzmbService;
	}

	public void setTzmbService(TzmbService tzmbService) {
		this.tzmbService = tzmbService;
	}

	public String getOperType() {
		return operType;
	}

	public void setOperType(String operType) {
		this.operType = operType;
	}

	public File[] getTzmbUploads() {
		return tzmbUploads;
	}

	public void setTzmbUploads(File[] tzmbUploads) {
		this.tzmbUploads = tzmbUploads;
	}

	public String[] getTzmbUploadsFileName() {
		return tzmbUploadsFileName;
	}

	public void setTzmbUploadsFileName(String[] tzmbUploadsFileName) {
		this.tzmbUploadsFileName = tzmbUploadsFileName;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getJsppage() {
		return jsppage;
	}

	public void setJsppage(String jsppage) {
		this.jsppage = jsppage;
	}
	

}
