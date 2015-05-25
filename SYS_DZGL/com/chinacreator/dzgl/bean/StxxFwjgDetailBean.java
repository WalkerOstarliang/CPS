package com.chinacreator.dzgl.bean;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import org.apache.commons.lang.StringUtils;

import com.chinacreator.common.bean.SystemDictionaryBean;
import com.chinacreator.common.helper.ValidateHelper;
import com.chinacreator.lsgl.bean.FwJbxxBean;

/**
 * 实体信息房屋机构明细
 * 
 * @filename StxxFwjgDetailBean.java
 * @author mingchun.xiong
 * @date Apr 20, 2015
 *
 */
public class StxxFwjgDetailBean
{
	
	private List<SystemDictionaryBean> dyhList = new ArrayList<SystemDictionaryBean>();
	
	private List<FwJbxxBean> fwjbxxBeans = null;
	
	private Map<String,List<FwJbxxBean>> fwjglinkMap = new LinkedHashMap<String, List<FwJbxxBean>>();
	
	public void sortFwListToLinkedMap()
	{
		Map<String,List<FwJbxxBean>> mapList = new HashMap<String, List<FwJbxxBean>>();
		if (ValidateHelper.isNotEmptyCollection(fwjbxxBeans))
		{
			//按楼层分类房间号
			for (FwJbxxBean jbxxBean : fwjbxxBeans)
			{
				if (ValidateHelper.isEmptyCollection(mapList.get(jbxxBean.getLch())))
				{
					mapList.put(jbxxBean.getLch(), new ArrayList<FwJbxxBean>());
				}
				mapList.get(jbxxBean.getLch()).add(jbxxBean);
			}
			
			//楼层排序
			List<Map.Entry<String, List<FwJbxxBean>>> linkedMapEntryList = new ArrayList<Map.Entry<String, List<FwJbxxBean>>>(mapList.entrySet());
			Collections.sort(linkedMapEntryList, new Comparator<Map.Entry<String, List<FwJbxxBean>>>(){
				@Override
				public int compare(Entry<String, List<FwJbxxBean>> o1,
						Entry<String, List<FwJbxxBean>> o2)
				{
					if (!StringUtils.isNumeric(o1.getKey()))
					{
						return 1;
					}
					else if (!StringUtils.isNumeric(o2.getKey()))
					{
						return -1;
					}
					else
					{
						if (Integer.parseInt(o1.getKey())>Integer.parseInt(o2.getKey()))
						{
							return -1;
						}
						else if(Integer.parseInt(o1.getKey())==Integer.parseInt(o2.getKey()))
						{
							return 0;
						}
						else
						{
							return 1;
						}
					}
				}
			});
			
			//房间号排序
			for (Map.Entry<String, List<FwJbxxBean>> entry : linkedMapEntryList)
			{
				List<FwJbxxBean> fwlist = entry.getValue();
				Collections.sort(fwlist, new Comparator<FwJbxxBean>(){

					@Override
					public int compare(FwJbxxBean o1, FwJbxxBean o2)
					{
						if (!StringUtils.isNumeric(o1.getFjh()))
						{
							return 1;
						}
						else if (!StringUtils.isNumeric(o2.getFjh()))
						{
							return -1;
						}
						else
						{
							if (Integer.parseInt(o1.getFjh())>Integer.parseInt(o2.getFjh()))
							{
								return 1;
							}
							else if(Integer.parseInt(o1.getFjh())==Integer.parseInt(o2.getFjh()))
							{
								return 0;
							}
							else
							{
								return -1;
							}
						}
					}
				});
			}
			for (Map.Entry<String, List<FwJbxxBean>> entry : linkedMapEntryList)
			{
				fwjglinkMap.put(entry.getKey(), entry.getValue());
			}
		}
	}
	
	
	public List<SystemDictionaryBean> getDyhList()
	{
		return dyhList;
	}

	public void setDyhList(List<SystemDictionaryBean> dyhList)
	{
		this.dyhList = dyhList;
	}

	public List<FwJbxxBean> getFwjbxxBeans()
	{
		return fwjbxxBeans;
	}

	public void setFwjbxxBeans(List<FwJbxxBean> fwjbxxBeans)
	{
		this.fwjbxxBeans = fwjbxxBeans;
	}

	public Map<String, List<FwJbxxBean>> getFwjglinkMap()
	{
		
		return fwjglinkMap;
	}

	public void setFwjglinkMap(Map<String, List<FwJbxxBean>> fwjglinkMap)
	{
		this.fwjglinkMap = fwjglinkMap;
	}
	
	
	
}
