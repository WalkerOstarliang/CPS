package com.chinacreator.zdry.services;

import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.zdry.bean.Keypersonnel;
import com.chinacreator.zdry.dao.ControlDao;
import com.chinacreator.zdry.query.KeypersonnelQueryBean;

/**   
 * @author 禹文超
 * @mail wenchao.yu@chinacreator.com
 * @Description: TODO(在控管理逻辑层类)
 * @date Mar 6, 2013 2:53:48 PM
 */
public class ControlService implements java.io.Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -4999271354173184743L;
	
	public PageResultInfo<Keypersonnel> queryKeyPersonnel(KeypersonnelQueryBean personnel,PageInfo pageInfo) throws Exception{
		return ControlDao.queryKeyPersonnelList(personnel, pageInfo);
	}

}
