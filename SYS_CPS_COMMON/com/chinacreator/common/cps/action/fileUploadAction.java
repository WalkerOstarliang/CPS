package com.chinacreator.common.cps.action;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.chinacreator.common.action.BaseAction;

public class fileUploadAction extends BaseAction {

	private static final long serialVersionUID = 483404504682595442L;
	private File fileInput;
	private String fileInputFileName;
	
	@SuppressWarnings("deprecation")
	public String uploadFile() throws Exception 
	{ 

		String savePath = ServletActionContext.getRequest().getRealPath("");

		savePath = savePath + "/uploadfiles/";

		String extName = "";//扩展名
		String newFileName= "";//新文件名
		System.out.println("原文件名称：" + fileInputFileName);
		//获取扩展名
		if(fileInputFileName.lastIndexOf(".") > -1){
			extName = fileInputFileName.substring(fileInputFileName.lastIndexOf("."));
		}

		String nowTime = new SimpleDateFormat("yyyyMMddHHmmssSSS").format(new Date());//当前时间
		newFileName = nowTime + extName;
		System.out.println("保存的文件名称：" + savePath + newFileName);

		fileInput.renameTo(new File(savePath + newFileName));

		HttpServletResponse response = ServletActionContext.getResponse();
		response.setCharacterEncoding("utf-8");
		response.getWriter().print("成功上传文件《" + fileInputFileName + "》！");

		return null; //这里不需要页面转向，所以返回空就可以了
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
}
