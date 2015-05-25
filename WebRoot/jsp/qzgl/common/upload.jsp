<%@page import="java.io.File"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Random"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.FileItemFactory"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@ page language="java" contentType="text/html; charset=GB18030" pageEncoding="GB18030"%>
<%
String path = request.getContextPath() + "/";
if(ServletFileUpload.isMultipartContent(request)){
	FileItemFactory factory = new DiskFileItemFactory();
	ServletFileUpload servletFileUpload = new ServletFileUpload(factory);
	servletFileUpload.setHeaderEncoding("UTF-8");//解决文件名乱码的问题
	List<FileItem> fileItemsList = servletFileUpload.parseRequest(request);
	Random rnd = new Random();
	System.out.println("fileSize:"+fileItemsList.size());
	for (FileItem item : fileItemsList) {
		if (!item.isFormField()) {
			String fileName = item.getName();
			fileName = "file" + System.currentTimeMillis() +String.valueOf(rnd.nextInt(1000))+ fileName.substring(fileName.lastIndexOf("."));
			//定义文件路径，根据你的文件夹结构，可能需要做修改
			String clientPath = "uploadfiles/"  + fileName;
			System.out.println(clientPath);

			//保存文件到服务器上
			File file = new File(request.getSession().getServletContext().getRealPath(clientPath));
			if (!file.getParentFile().exists()) {
				file.getParentFile().mkdirs();
			}
			item.write(file);
			response.setCharacterEncoding("gbk");
		    response.getWriter().print(clientPath);   
		    //System.out.println(clientPath);
		}
	}
}
 %>
