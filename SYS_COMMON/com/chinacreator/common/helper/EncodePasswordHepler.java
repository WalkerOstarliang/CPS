package com.chinacreator.common.helper;

import java.io.IOException;

import sun.misc.BASE64Decoder;
import sun.misc.BASE64Encoder;

public class EncodePasswordHepler
{
	/**
	 * 将密码转换成Base64位码加密
	 */
	public static String getEncodePassword(String password) 
	{
		String securityEncoded = null;
		if (password != null && !password.equals(""))
		{
			BASE64Encoder enc = new BASE64Encoder();
			securityEncoded = enc.encode(password.getBytes());
		}
		return securityEncoded;
	}
	
	/**
	 * 解密
	 * @param password
	 * @return
	 * @date May 4, 2014 8:25:18 AM
	 */
	public static String decodePassword(String password)
	{
		String securityEncoded = null;
		try
		{
			
			if (password != null && !password.equals(""))
			{
				BASE64Decoder dcoder = new BASE64Decoder();
				securityEncoded = new String(dcoder.decodeBuffer(password));
			}
		}
		catch (IOException e)
		{
			e.printStackTrace();
		}
		return securityEncoded;
	}
	
	public static void main(String[] args)
	{
		//System.out.println(getEncodePassword("111111"));
		System.out.println(decodePassword("MDgwMDM4"));
	}
}
