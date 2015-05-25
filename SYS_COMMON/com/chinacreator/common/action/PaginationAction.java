package com.chinacreator.common.action;

import com.chinacreator.common.bean.PageInfo;

/**
 * 
 * 执行分页查询需要继承改action类
 * @author 熊明春
 *
 */
public class PaginationAction extends BaseAction 
{

	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = 543834409862081709L;
	
	private PageInfo pageInfo;
	// 当前页
	private int currentPage = 1;
	
	//每页显示多少记录
	private int pageSize = 10;
	
	public PageInfo getPageInfo() {
		pageInfo = new PageInfo();
		pageInfo.setCurrentPage(currentPage);
		pageInfo.setPageSize(pageSize);
		return pageInfo;
	}
	
	public void setPageInfo(PageInfo pageInfo) {
		this.pageInfo = pageInfo;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	
	
}
