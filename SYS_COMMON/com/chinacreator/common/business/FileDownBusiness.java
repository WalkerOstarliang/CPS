package com.chinacreator.common.business;

import java.sql.Blob;

import com.frameworkset.common.poolman.DBUtil;

/**
 * 文件下载数据库查询business
 * 
 * @filename FileDownBusiness.java
 * @author mingchun.xiong
 * @date 2013-11-7
 *
 */
public class FileDownBusiness
{
	
	public Blob queryFileBlob(String tableName, String blobField, String pkfield, String pid)
	{
		Blob blob = null;
		try
		{
			String sql = "select " + blobField +" from " + tableName +" where " + pkfield + "= '" + pid + "'";
			DBUtil db = new DBUtil();
			db.executeSelect(sql);
			if (db.size() > 0) 
			{
				blob = db.getBlob(0, blobField);
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return blob;
	}
	
}
