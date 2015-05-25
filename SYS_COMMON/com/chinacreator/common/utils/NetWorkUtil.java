package com.chinacreator.common.utils;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import com.chinacreator.common.helper.DictionaryCacheHellper;

public class NetWorkUtil
{
	public static boolean requestServerConnect()
	{
		String requestIp = DictionaryCacheHellper.getSystemParamenterValueByKey("request.ip");
		String requestPort = DictionaryCacheHellper.getSystemParamenterValueByKey("request.port");
		String url = "http://" + requestIp + ":" + requestPort + "/piee";
		return openConnection(url);
	}
	
	public static boolean pingConnect(String ip)
	{
		Runtime runtime = Runtime.getRuntime();
		try
		{
			Process pocess = runtime.exec("ping " + ip);
			InputStream is = pocess.getInputStream();
			InputStreamReader isr = new InputStreamReader(is);
			BufferedReader br = new BufferedReader(isr);
			String line = null;
			StringBuffer sb = new StringBuffer();
			while((line = br.readLine()) != null)
			{
				System.out.println(line);
				sb.append(line);
			}
			is.close();
			isr.close();
			br.close();
			if (null != sb && !sb.toString().equals(""))
			{
				if (sb.toString().indexOf("TTL") > 0)
				{
					return true;
				}
			}
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return false;
	}
	
	public static boolean openConnection(String url)
	{
		try
		{
			URL u = new URL(url);
			HttpURLConnection conn = (HttpURLConnection)u.openConnection();
			conn.setConnectTimeout(8000);
			int code = conn.getResponseCode();
			if (code == 200)
			{
				return true;
			}
		}
		catch(Exception e)
		{
		}
		return false;
	}
	
	
	public static void main(String[] args)
	{
		//System.out.println(connectSuccess("10.142.1.117"));"http://10.142.55.67"
		System.out.println(requestServerConnect());
	}
}
