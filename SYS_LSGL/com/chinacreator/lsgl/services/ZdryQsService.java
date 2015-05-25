package com.chinacreator.lsgl.services;

import java.io.Serializable;

import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.bean.QueryBean;
import com.chinacreator.lsgl.bean.ZdryBean;
import com.chinacreator.lsgl.bean.ZdryJbxxBean;
import com.chinacreator.lsgl.bean.ZdryQsBean;

public interface ZdryQsService extends Serializable {
	
	/**
	 * 查询重点人员签收列表
	 * @param query
	 * @param pageinfo
	 * @return
	 */
	public PageResultInfo<ZdryJbxxBean> queryZdryJsList(QueryBean query,PageInfo pageinfo);
	
	
	/**
	 * 根据人员编号查询重点人员信息
	 * @param rybh
	 * @return
	 */
	public ZdryBean queryZdryxxByRybh(String rybh);
	
	/**
	 * 重点人员签收
	 * @param bean
	 * @return erroe_code 错误代码 （-1：系统错误 0：操作成功  1：根据身份证找不到这个人  2:无法识别的接收状态）
	 */
	public int ZdryQs(ZdryQsBean bean); 
	
	
}
