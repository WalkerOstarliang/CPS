package com.chinacreator.sso.helper;

import java.security.cert.X509Certificate;

import javax.servlet.http.HttpServletRequest;

import com.chinacreator.sso.bean.SSOContentBean;

public class SSOContentHelper
{
	public static SSOContentBean getSSOContentBean(HttpServletRequest request)
	{
		SSOContentBean bean = new SSOContentBean();
		X509Certificate[] certs=(X509Certificate[])request.getAttribute("javax.servlet.request.X509Certificate");
		if(certs!=null)
        {
			 X509Certificate gaX509Cert=certs[0];
			 //版本
			 String version = String.valueOf(gaX509Cert.getVersion());
			 bean.setVersion(version);
			 
			 //获取序列号
			 String sn = gaX509Cert.getSerialNumber().toString(16);
			 bean.setSerialNumber(sn);
			 
			 //获取用户信息 姓名 身份证号
			 String subjectdn = gaX509Cert.getSubjectDN().getName();
			 bean.setSubjectdn(subjectdn);
        }
		return bean;
	}
}
