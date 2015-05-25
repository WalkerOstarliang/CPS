package com.chinacreator.rxgl.bean;

import java.io.File;
import java.sql.Blob;

import com.chinacreator.common.bean.BaseValue;

public class PicBean extends BaseValue {

	private static final long serialVersionUID = 2927092072649723948L;

	private String fileId;
	
	private String uploadFileName;
	
	private String uploadContextType;
	
	private File upload;
	
	private Blob fileBlob;

	public String getFileId()
	{
		return fileId;
	}

	public void setFileId(String fileId)
	{
		this.fileId = fileId;
	}

	public File getUpload()
	{
		return upload;
	}

	public void setUpload(File upload)
	{
		this.upload = upload;
	}

	public Blob getFileBlob()
	{
		return fileBlob;
	}

	public void setFileBlob(Blob fileBlob)
	{
		this.fileBlob = fileBlob;
	}

	public String getUploadFileName()
	{
		return uploadFileName;
	}

	public void setUploadFileName(String uploadFileName)
	{
		this.uploadFileName = uploadFileName;
	}

	public String getUploadContextType()
	{
		return uploadContextType;
	}

	public void setUploadContextType(String uploadContextType)
	{
		this.uploadContextType = uploadContextType;
	}

	
}
