package com.chinacreator.xfdw.utils;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.math.BigDecimal;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;

/**
 *
 * @ClassName: UtilTools
 * @author wenchao.yu
 * @mail yuwenchao28@163.com
 * @date Dec 11, 201312:40:18 PM
 * @Description: TODO (用一句话描述这个类的作用)
 * 工具类
 *
 */

public class UtilTools {
	

	/**
	 * 下载文件
	 * 
	 * @param excel
	 */
	public static void downloadFile(String filename, File filePath, HttpServletResponse response) {
		try {
			response.reset(); // 非常重要
			response.setContentType("application/x-msdownload");
			
			// 用来弹出保存窗口 ，设置 为attachment
			filename = java.net.URLEncoder.encode(filename, "UTF-8");
			
			filename = "火灾统计（"+System.currentTimeMillis() + "）.xls";
			
			response.setHeader("Content-Disposition",
					"attachment; filename="
							+ new String(filename.getBytes(),
									"ISO-8859-1"));
			OutputStream out = response.getOutputStream();

			// 以流的形式下载文件。
			InputStream fis = new BufferedInputStream(new FileInputStream(
					filePath));
			
			byte buffer[] = new byte[1024];
			int size;
			while ((size = fis.read(buffer)) != -1) {
				out.write(buffer, 0, size);
			}
			
			fis.close();
			out.flush();
			out.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}
	
	
	/**
	 * 获取客户端IP地址
	 * @param request
	 * @return
	 */
	public static String getIpAddress(HttpServletRequest request) 
	{
		System.out.println("===========================================");
		String ip = request.getHeader("x-forwarded-for");
		System.out.println("获取x-forwarded-for：" + ip);
		System.out.println("===========================================");
		if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("Proxy-Client-IP");
		}
		if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("WL-Proxy-Client-IP");
		}
		if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getRemoteAddr();
		}
		return ip;
	}
	/**
	 * 四舍五入
	 */
	public static String getSSWR(String val){
		String r = "--";
		if(val.matches("[+-]?[0-9]+[\\.]?[0-9]*")){
			BigDecimal big = new BigDecimal(val);
			big = big.setScale(2, BigDecimal.ROUND_HALF_UP);
			r = big.toString();
		}
		return r;
	}
	
	/**
	 * 四舍五入
	 */
	public static String getSSWR(String val, int ws){
		String r = "--";
		
		if(val.matches("[+-]?[0-9]+[\\.]?[0-9]*")){
			BigDecimal big = new BigDecimal(val);
			big = big.setScale(ws, BigDecimal.ROUND_HALF_UP);
			r = big.toString();
		}
		return r;
	}
	
	/**
	 * 计算同比
	 * @param bq 本期
	 * @param tq 同期
	 * @param sq 上期
	 * @return 同比=（本期-同期）/同期 * 100%
	 */
	public static String convetTb(String bq, String tq){
		
		if(StringUtils.isBlank(bq) || StringUtils.isBlank(tq) || tq.equals("0")){
			return "0.00";
		}
		
		String result = UtilTools.getSSWR((Float.parseFloat(bq)-Float.parseFloat(tq))/Float.parseFloat(tq)*100 + "");
		return result;
	}
	
	/**
	 * 计算环比
	 * @param bq 本期
	 * @param sq 上期
	 * @return 环比 = （本期-上期）/上期 * 100%
	 */
	public static String convetHb(String bq, String sq){
		if(StringUtils.isBlank(bq) || StringUtils.isBlank(sq) || sq.equals("0")){
			return "0.00";
		}
		String result = UtilTools.getSSWR((Float.parseFloat(bq)-Float.parseFloat(sq))/Float.parseFloat(sq)*100 + "");
		return result;
	}
	
	public static String convetHb(String bq, String sq, int ws){
		if(StringUtils.isBlank(bq) || StringUtils.isBlank(sq) || sq.equals("0")){
			return "0.0";
		}
		String result = UtilTools.getSSWR((Float.parseFloat(bq)-Float.parseFloat(sq))/Float.parseFloat(sq)*100 + "", ws);
		return result;
	}
	
	/**
	 * 计算比值
	 * @param bq
	 * @param zs
	 * @return
	 */
	public static String convetBl(String bq, String zs){
		if(StringUtils.isBlank(bq) || StringUtils.isBlank(zs) || zs.equals("0")){
			return "0.00";
		}
		
		String result = UtilTools.getSSWR(Float.parseFloat(bq)/Float.parseFloat(zs)*100 + "");
		return result;
	}
	
	/**
	 * 计算同比率
	 * @param bql
	 * @param tql
	 * @return
	 */
	public static String convetTbl(String bql, String tql){
		return UtilTools.getSSWR((Float.parseFloat(bql) - Float.parseFloat(tql))+"");
	}
}


