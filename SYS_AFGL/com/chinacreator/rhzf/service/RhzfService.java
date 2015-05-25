package com.chinacreator.rhzf.service;

import java.io.Serializable;
import java.util.List;

import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.bean.QueryBean;
import com.chinacreator.rhzf.bean.ExpRhzfBean;
import com.chinacreator.rhzf.bean.RhzfBean;
import com.chinacreator.rhzf.bean.ZfryBean;

public interface RhzfService extends Serializable {
	
	/**
	 * 保存走访信息
	 * @param bean
	 * @return
	 */
	public RhzfBean saveZfxx(RhzfBean bean,String operType);
	
	/**
	 * 根据走访id查询走访信息
	 * @param zfid
	 * @return
	 */
	public RhzfBean queryZfxxBeanByZfid(String zfid);
	
	/**
	 * 分页查询入户走访列表
	 * @param query
	 * @param pageinfo
	 * @return
	 */
	public PageResultInfo<RhzfBean> queryRhzfList(QueryBean query ,PageInfo pageinfo);
	
	/**
	 * 根据地址id查询走访人员
	 * @param dzid
	 * @return
	 */
	public List<ZfryBean> queryZfryListByDzid(String dzid);
	
	/**
	 * 根据走访id查询走访人员
	 * @param zfid
	 * @return
	 */
	public List<ZfryBean> queryZfryListByZfid(String zfid);
	
	/**
	 * 导出入户走访
	 * @param query
	 * @return
	 */
	public List<ExpRhzfBean> excRhzf(QueryBean query);
}
