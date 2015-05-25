package com.chinacreator.common.helper;

import java.util.List;

import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.frameworkset.util.ListInfo;

public class PaginationHelper
{
	
	/**
	 * 自动包装返回结果
	 * @param pageInfo
	 * @param list
	 * @return
	 */
	
	public static <T> PageResultInfo<T> wrapPageResultInfo(PageInfo pageInfo,Long totalSize, List<T> list)
	{
		PageResultInfo<T> pageResultInfo = new PageResultInfo<T>();
		if (pageInfo != null)
		{
			pageResultInfo.setCurrentPage(pageInfo.getCurrentPage());
			pageResultInfo.setPageSize(pageInfo.getPageSize());
		}
		pageResultInfo.setTotalCount(totalSize);
		pageResultInfo.setDatas(list);
		return pageResultInfo;
	}
	
	/**
	 * 包装listinfo
	 * @param <T>
	 * @param pageInfo
	 * @param listInfo
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public static <T> PageResultInfo<T> wrapPageResultInfo(PageInfo pageInfo,ListInfo listInfo)
	{
		PageResultInfo<T> pageResultInfo = new PageResultInfo<T>();
		pageResultInfo.setCurrentPage(pageInfo.getCurrentPage());
		pageResultInfo.setPageSize(pageInfo.getPageSize());
		if (listInfo != null)
		{
			pageResultInfo.setTotalCount(listInfo.getTotalSize());
			if (ValidateHelper.isNotEmptyCollection(listInfo.getDatas()))
			{
				pageResultInfo.setDatas(listInfo.getDatas());
			}
		}
		else
		{
			pageResultInfo.setTotalCount(0);
		}
		return pageResultInfo;
	}
	
	
}
