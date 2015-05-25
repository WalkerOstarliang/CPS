package com.chinacreator.qzgl.services;

import java.util.List;

import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.helper.CommonDBBaseHelper;
import com.chinacreator.qzgl.bean.ZfqzdjBean;
import com.chinacreator.qzgl.dao.ZfqzdjDao;
import com.chinacreator.qzgl.query.ZfqzdjQueryBean;

public class ZfqzdjService {
	/**
	 * 查询走访群众登记信息
	 * @param queryBean
	 * @param pageInfo
	 * @return
	 * @throws Exception
	 */
	public  PageResultInfo<ZfqzdjBean> queryZfqzdjListInfo(ZfqzdjQueryBean queryBean,PageInfo pageInfo) throws Exception{
		return ZfqzdjDao.queryZfqzdjListInfo(queryBean, pageInfo);
	}
	/**
	 * 通过编号  查询走访登记群众信息 
	 * @param bh
	 * @return
	 */
	public ZfqzdjBean queryZfqzdjInfoByBh(String bh) throws Exception {
		// TODO Auto-generated method stub
		return ZfqzdjDao.queryZfqzdjInfoByBh(bh);
	}
	/**
	 * 插入走访群众登记信息
	 * @param bean
	 * @throws Exception
	 */
	public void insertZfdwdjInfo(ZfqzdjBean bean)  throws Exception{
		String bh = CommonDBBaseHelper.getSequence(CommonConstant.DBNAME_SQJW, "SEQ_QZGL_ZFQZDJBH");
		bean.setBh(bh);
		ZfqzdjDao.insertZfqzdjInfo(bean);
	}
	/**
	 * 修改走访群众登记信息
	 * @param bean
	 * @throws Exception
	 */
	public void updateZfqzdjInfo(ZfqzdjBean bean ) throws  Exception{
		ZfqzdjDao.updateZfqzdjInfo(bean);
	}
	
	/**
	 * 修改走访群众登记信息-->  修改调查状态 ： 将调查状态修改成已调查  信息是否属实
	 * @param bean
	 * @throws Exception
	 */
	public void updateZfqzdcInfo(ZfqzdjBean bean ) throws Exception{
		ZfqzdjDao.updateZfqzdcInfo(bean);
	}
	/**
	 * 根据 bh 删除走访群众登记信息
	 * @param bh
	 * @throws Exception
	 */
	public void deleteZfdwdjInfo(String bh) throws Exception {
		ZfqzdjDao.deleteZfqzdjInfo(bh);
	}
	
	/**
	 * 根据 bh批量删除走访单位登记信息
	 * @param bhList
	 * @throws Exception
	 */
	public boolean batchDeleteZfqzdjInfo(List<String > bhList) throws Exception{
		if(bhList.size() > 0){
			return ZfqzdjDao.batchDeleteZfqzdjInfo(bhList);
		}else{
			return false;
		}
	}
}
