package com.chinacreator.common.action;

import java.io.FileInputStream;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.sql.Blob;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.chinacreator.common.business.FileDownBusiness;
import com.chinacreator.common.helper.ValidateHelper;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;


public class FileDownLoadAction extends ActionSupport 
{
	/**
	 * 
	 */
	private static final long serialVersionUID = -17353244570621795L;

	private String fileName;
	private String filePath;
	private String tableName;
	private String pid;
	private String pkfield;
	private String blobfield;
	
	private InputStream downloadFile;
	
	private FileDownBusiness business;
	
	public FileDownLoadAction()
	{
		super();
		business = new FileDownBusiness();
	}
	
	public InputStream getDownloadFile() 
	{
		try 
		{
			// 系统路径文件下载
			if (ValidateHelper.isNotEmptyString(filePath))
			{
				ActionContext context = ActionContext.getContext();
				HttpServletRequest request = (HttpServletRequest) context
						.get(ServletActionContext.HTTP_REQUEST);
				// 获取网站路径
				ServletContext sc = request.getSession().getServletContext();
				// 绝对路径
				String filePath = sc.getRealPath("/");
				this.downloadFile = new FileInputStream(filePath + this.filePath);
			}
			// 数据库文件下载
			else if (ValidateHelper.isNotEmptyString(tableName) 
						&& ValidateHelper.isNotEmptyString(pid) 
						&& ValidateHelper.isNotEmptyString(blobfield))
			{
				Blob blob = business.queryFileBlob(tableName, blobfield, pkfield, pid);
				if (blob != null)
				{
					this.downloadFile = blob.getBinaryStream();
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return this.downloadFile;
	}

	public String getDownloadChineseFileName() 
	{
		String downloadChineseFileName = this.fileName;
		try 
		{
			downloadChineseFileName = java.net.URLEncoder.encode(downloadChineseFileName, "UTF-8");
			downloadChineseFileName = new String(downloadChineseFileName
					.getBytes("UTF-8"), "UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return downloadChineseFileName;
	}

	public String execute() {
		return SUCCESS;
	}

	public void setDownloadFile(InputStream downloadFile) {
		this.downloadFile = downloadFile;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public String getPid() {
		return pid;
	}

	public void setPid(String pid) {
		this.pid = pid;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}



	public String getTableName()
	{
		return tableName;
	}



	public void setTableName(String tableName)
	{
		this.tableName = tableName;
	}



	public String getPkfield()
	{
		return pkfield;
	}



	public void setPkfield(String pkfield)
	{
		this.pkfield = pkfield;
	}



	public String getBlobfield()
	{
		return blobfield;
	}



	public void setBlobfield(String blobfield)
	{
		this.blobfield = blobfield;
	}



	public FileDownBusiness getBusiness()
	{
		return business;
	}



	public void setBusiness(FileDownBusiness business)
	{
		this.business = business;
	}
	
}
