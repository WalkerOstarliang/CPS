package com.chinacreator.afgl.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.chinacreator.afgl.bean.AfSqwfsszpxxBean;
import com.chinacreator.afgl.bean.XqjfwfssxxBean;
import com.chinacreator.afgl.query.XqjfwfssxxQuery;
import com.chinacreator.afgl.services.XqjfwfssxxService;
import com.chinacreator.common.bean.LoginInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.cps.action.CPSBaseAction;
import com.chinacreator.common.cps.helper.CommonSequenceHelper;
import com.chinacreator.common.helper.ActionContextHelper;
import com.chinacreator.common.helper.CommonDBBaseHelper;
import com.chinacreator.common.helper.ValidateHelper;

/**
 * 小区技防物防设施信息
 */
public class XqjfwfssxxAction extends CPSBaseAction{

	private static final long serialVersionUID = 7309901752134378580L;

	private XqjfwfssxxService xqjfwfssxxService;
	private XqjfwfssxxBean xqjfwfssxxBean;
	private List<AfSqwfsszpxxBean> sqwfsszpxxList;
	private XqjfwfssxxQuery xqjfwfssxxQuery;
	private List<XqjfwfssxxBean> xqjfwfssxxList;

	private String sbbh;  	// 设备编号
	private String fjid;	// 附件ID
	private String ssbh;	//物防设备ID
	private String fileName;	//附件的文件名
	private File[] upload;
	private String[] uploadFileName;
	private String[] zpms;
	
	private InputStream downloadFile;
	
	public XqjfwfssxxAction()
	{
		xqjfwfssxxService = new XqjfwfssxxService();
		xqjfwfssxxBean = new XqjfwfssxxBean();
		xqjfwfssxxQuery = new XqjfwfssxxQuery();
		xqjfwfssxxList = new ArrayList<XqjfwfssxxBean>();
	}
	
	/**
	 * 跳转到小区技防物防设施信息列表
	 */
	public String toXqjfwfssxxList(){
		LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
		xqjfwfssxxQuery.setCitygajgjgdm(loginInfo.getCitygajgdm());
		xqjfwfssxxQuery.setCountrygajgjgdm(loginInfo.getCountrygajgdm());
		xqjfwfssxxQuery.setPcsdm(loginInfo.getPcsdm());
		return "toXqjfwfssxxList";
	}
	
	/**
	 * 查询小区技防物防设施信息列表并写到页面
	 */
	public void xqjfwfssxxList() throws Exception
	{
		PageResultInfo<XqjfwfssxxBean> xqjfwfssxxResultInfo= xqjfwfssxxService.xqjfwfssxxList(getPageInfo(), xqjfwfssxxQuery);
		responseWrite(xqjfwfssxxResultInfo);
	}
	
	/**
	 * 跳转到新增小区技防物防设施信息页面
	 * @return
	 */
	public String toAddXqjfwfssxx() throws Exception
	{
 		if (CommonConstant.OPERTYPE_UPDATE.equals(operType) || CommonConstant.OPERTYPE_DETAIL.equals(operType))
		{
			xqjfwfssxxBean = xqjfwfssxxService.queryXqjfwfssxxBySsbh(sbbh);
			sqwfsszpxxList = xqjfwfssxxService.queryAfSqwfsszpxxList(sbbh);
		}
		return "toAddXqjfwfssxx";
	}
	
	/**
	 * 提交小区技防物防设施表单
	 * @return
	 */
	public void saveXqjfwfssxx() throws Exception
	{
		// 新增生成设备编号
		if (CommonConstant.OPERTYPE_ADD.equals(operType))
		{
			String ssbh = CommonSequenceHelper.getSbbh(xqjfwfssxxBean.getSqbh());
			xqjfwfssxxBean.setSsbh(ssbh);
		}
		List<AfSqwfsszpxxBean> sqwffjBeanList = new ArrayList<AfSqwfsszpxxBean>();
		if (ValidateHelper.isNotEmptyArray(upload))
		{
			AfSqwfsszpxxBean bean = null;
			for (int i = 0; i < upload.length; i++)
			{
				bean = new AfSqwfsszpxxBean();
				bean.setId(CommonDBBaseHelper.getSequence(CommonConstant.DBNAME_SQJW, "seq_af_sqjwwfsszpxx"));
				bean.setSbbh(xqjfwfssxxBean.getSsbh());
				bean.setZp(upload[i]);
				bean.setZpmc(uploadFileName[i]);
				bean.setZpms(zpms[i]);
				sqwffjBeanList.add(bean);
			}
		}
		xqjfwfssxxService.saveXqjfwfssxx(xqjfwfssxxBean, sqwffjBeanList, operType);
		responseWrite(true);
	}

	public void deleteWfxxById() throws Exception
	{
		xqjfwfssxxService.deleteWfxxbyId(ssbh);
		responseWrite(true);
	}
	
	public void deleteWffjByFjid() throws Exception
	{
		xqjfwfssxxService.deleteWfzpByFjId(fjid);
		responseWrite(true);
	}

	/**
	 * 跳转到高级查询小区技防物防设施信息列表
	 * @return
	 */
	public String toGjQueryXqjfwfssxx(){
		initQueryBean(xqjfwfssxxQuery);
		return "toGjQueryXqjfwfssxx";
	}

	public void downloadFjxx() throws UnsupportedEncodingException, SQLException
	{
		AfSqwfsszpxxBean xpBean = xqjfwfssxxService.getWfzpFileByid(fjid);
		File b = xpBean.getZp();
		String filename = null;
		if(request.getHeader("User-Agent").toLowerCase().indexOf("firefox")>0){
			filename = new String(xpBean.getZpmc().getBytes("utf-8"),"ISO8859-1");
		}else if(request.getHeader("User-Agent").toUpperCase().indexOf("MSIE")>0){
			filename = URLEncoder.encode(xpBean.getZpmc(), "UTF-8");//IE浏览器
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
		
	/*	try
		{
		
			response.reset();
			response.setContentType("application/octet-stream;charset=utf-8");
			response.setHeader("Content-Disposition", "attachment;filename="+filename);
			is = getDownloadFile();
			byte[] b = new byte[1024];
			System.out.println(is.read(b));
			while(is.read(b) > 0)
			{
				response.getOutputStream().write(b);
				response.getOutputStream().flush();
			}
			response.getOutputStream().close();
			is.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}*/
	}
	
	public InputStream getDownloadFile()
	{
		try
		{
			Blob blob = xqjfwfssxxService.getWfzpFile(fjid);
			if (blob != null)
			{
				this.downloadFile = blob.getBinaryStream();
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return downloadFile;
	}
	
	public String getDownloadChineseFileName() 
	{
		String downloadChineseFileName = this.fileName;
		return downloadChineseFileName;
	}
	
	public XqjfwfssxxBean getXqjfwfssxxBean() {
		return xqjfwfssxxBean;
	}

	public void setXqjfwfssxxBean(XqjfwfssxxBean xqjfwfssxxBean) {
		this.xqjfwfssxxBean = xqjfwfssxxBean;
	}

	public XqjfwfssxxQuery getXqjfwfssxxQuery() {
		return xqjfwfssxxQuery;
	}

	public void setXqjfwfssxxQuery(XqjfwfssxxQuery xqjfwfssxxQuery) {
		this.xqjfwfssxxQuery = xqjfwfssxxQuery;
	}

	public List<XqjfwfssxxBean> getXqjfwfssxxList() {
		return xqjfwfssxxList;
	}

	public void setXqjfwfssxxList(List<XqjfwfssxxBean> xqjfwfssxxList) {
		this.xqjfwfssxxList = xqjfwfssxxList;
	}

	public File[] getUpload()
	{
		return upload;
	}

	public void setUpload(File[] upload)
	{
		this.upload = upload;
	}

	public String[] getUploadFileName()
	{
		return uploadFileName;
	}

	public void setUploadFileName(String[] uploadFileName)
	{
		this.uploadFileName = uploadFileName;
	}

	public String[] getZpms()
	{
		return zpms;
	}

	public void setZpms(String[] zpms)
	{
		this.zpms = zpms;
	}

	public String getSbbh()
	{
		return sbbh;
	}

	public void setSbbh(String sbbh)
	{
		this.sbbh = sbbh;
	}

	public List<AfSqwfsszpxxBean> getSqwfsszpxxList()
	{
		return sqwfsszpxxList;
	}

	public void setSqwfsszpxxList(List<AfSqwfsszpxxBean> sqwfsszpxxList)
	{
		this.sqwfsszpxxList = sqwfsszpxxList;
	}

	public String getFjid()
	{
		return fjid;
	}

	public void setFjid(String fjid)
	{
		this.fjid = fjid;
	}

	public String getFileName()
	{
		return fileName;
	}

	public void setFileName(String fileName)
	{
		this.fileName = fileName;
	}

	public void setDownloadFile(InputStream downloadFile)
	{
		this.downloadFile = downloadFile;
	}

	public String getSsbh()
	{
		return ssbh;
	}

	public void setSsbh(String ssbh)
	{
		this.ssbh = ssbh;
	}

	
	
}
