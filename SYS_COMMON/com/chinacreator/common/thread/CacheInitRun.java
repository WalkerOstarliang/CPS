package com.chinacreator.common.thread;

import com.chinacreator.common.helper.DictionaryCacheHellper;

/**
 * 后台线程初始化缓存
 * @author mingchun.xiong
 *
 */
public class CacheInitRun implements Runnable
{
	
	public void run()
	{
		try
		{
			Thread.sleep(1000);
			DictionaryCacheHellper.initCache();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	
}
