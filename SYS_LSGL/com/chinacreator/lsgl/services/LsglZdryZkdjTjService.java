package com.chinacreator.lsgl.services;

import java.util.List;

import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.lsgl.bean.ZdryGzdxBean;
import com.chinacreator.lsgl.bean.ZdryZkDjTjBean;
import com.chinacreator.lsgl.bean.ZdryZkDjTjQueryBean;

public interface LsglZdryZkdjTjService {
	/**
	 * 统计重点人员在控登记情况
	 */
	public PageResultInfo<ZdryZkDjTjBean> queryZdryGzdxPageResult(ZdryZkDjTjQueryBean queryBean,PageInfo pageinfo) throws Exception;
	public PageResultInfo<ZdryGzdxBean> queryZdryPageResult(ZdryZkDjTjQueryBean queryBean,PageInfo pageinfo) throws Exception;
	public List<ZdryZkDjTjBean> queryZdryZkDjTjListDown(ZdryZkDjTjQueryBean queryBean) throws Exception;
	public PageResultInfo<ZdryGzdxBean> queryZdryZKDJSPageResult(ZdryZkDjTjQueryBean queryBean,PageInfo pageinfo) throws Exception;
	public PageResultInfo<ZdryGzdxBean> queryZdryZKZKSPageResult(ZdryZkDjTjQueryBean queryBean,PageInfo pageinfo) throws Exception;
	public PageResultInfo<ZdryGzdxBean> queryZdryZKSKSPageResult(ZdryZkDjTjQueryBean queryBean,PageInfo pageinfo) throws Exception;

	
	
}
  