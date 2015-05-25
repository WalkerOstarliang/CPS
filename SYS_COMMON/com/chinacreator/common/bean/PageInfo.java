package com.chinacreator.common.bean;

/**
 * 
 * @author 分页查询条件
 *
 */
public class PageInfo extends BaseValue{
	
	/**
	 * 
	 */
	private static final long	serialVersionUID	= 1902801916351153706L;

	// 当前页
	private int currentPage;
	
	private int offset = 0;
	
	//每页显示多少记录
	private int pageSize;
	
	
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
	public int getOffset() {
		offset = (currentPage-1) * pageSize;
		return offset;
	}
	public void setOffset(int offset) {
		this.offset = offset;
	}
	
	
}
