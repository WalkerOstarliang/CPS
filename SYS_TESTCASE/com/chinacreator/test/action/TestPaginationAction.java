package com.chinacreator.test.action;


import java.util.ArrayList;
import java.util.List;

import com.chinacreator.common.action.PaginationAction;
import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.helper.PaginationHelper;
import com.chinacreator.test.bean.User;
import com.chinacreator.test.dao.Dao;

public class TestPaginationAction extends PaginationAction
{

	/**
	 * serialVersionUID
	 */
	private static final long	serialVersionUID	= 5924746714486839784L;
	private User user;
	private String username = "xmc";
	
	public void mysubmit()
	{
		System.out.println(username);
	}
	
	public void executeUpdateRk()
	{
		Dao.testUpdateRy();
	}
	
	public void queryTestData()
	{
		PageInfo pageInfo = getPageInfo();
		int start = (pageInfo.getCurrentPage() -1) * pageInfo.getPageSize();
		int end = (pageInfo.getCurrentPage() -1) * pageInfo.getPageSize() + pageInfo.getPageSize();
		List<User> list = new ArrayList<User>();
		User u = null;
		for (int i=start;i<end;i++)
		{
			u = new User();
			u.setUsername(username +"_"+ i);
			u.setRealname("xiongmingchun_" + i);
			u.setAge(26);
			u.setJg("湖南省凤凰县官庄乡龙潭村四组" + i);
			u.setSex("1");
			list.add(u);
		}
		PageResultInfo<User> pageResultInfo = PaginationHelper.wrapPageResultInfo(pageInfo, 200L, list);
		responseWrite(pageResultInfo);
	}
	
	
	public String getContent()
	{
		return "getContent";
	}

	public void rowDataCallback()
	{
		responseWrite("我是中国人");
	}
	
	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	
	public static void main(String[] args)
	{
		try
		{
			Dao.testUpdateRy();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}

	}
	
	public static byte[] toByteArray(long number) 
	{ 
		long temp = number; 
		byte[] b=new byte[4]; 
		for (int i = b.length - 1; i > -1; i--) 
		{ 
			b[i] = new Long(temp & 0xff).byteValue(); 
			temp = temp >> 8; 
		} 
		return b; 
	} 

	
}
