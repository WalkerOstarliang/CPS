package com.chinacreator.qzgl.services;
/**
 * @author zhun.liu
 */
import java.util.List;

import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.helper.CommonDBBaseHelper;
import com.chinacreator.qzgl.bean.ZfdwdjBean;
import com.chinacreator.qzgl.dao.ZfdjDao;
import com.chinacreator.qzgl.query.ZfdwdjQueryBean;

public class ZfdjService {
	/**
	 * 查询走访单位登记信息
	 * @param queryBean
	 * @param pageInfo
	 * @return
	 * @throws Exception
	 */
	public  PageResultInfo<ZfdwdjBean> queryZfdwdjxxList(ZfdwdjQueryBean queryBean,PageInfo pageInfo) throws Exception{
		return ZfdjDao.queryZfdwdjxxList(queryBean, pageInfo);
	}
	/**
	 * 通过编号  查询走访登记单位信息 
	 * @param bh
	 * @return
	 */
	public ZfdwdjBean getZfdwdjInfoByBh(String bh) throws Exception {
		// TODO Auto-generated method stub
		return ZfdjDao.getZfdwdjInfoByBh(bh);
	}
	/**
	 * 插入走访单位登记信息
	 * @param bean
	 * @throws Exception
	 */
	public void insertZfdwdjInfo(ZfdwdjBean bean)  throws Exception{
		String bh = CommonDBBaseHelper.getSequence(CommonConstant.DBNAME_SQJW, "SEQ_QZGL_ZFDWDJBH");
		bean.setBh(bh);
		ZfdjDao.insertZfdwdjInfo(bean);
	}
	/**
	 * 修改走访单位登记信息
	 * @param bean
	 * @throws Exception
	 */
	public void updateZfdwdjInfo(ZfdwdjBean bean ) throws  Exception{
		ZfdjDao.updateZfdwdjInfo(bean);
	}
	/**
	 * 修改 调查状态   改变成已调查   1
	 * @param bean
	 * @throws Exception
	 */
	public void updateZfdwdcInfo(ZfdwdjBean bean ) throws  Exception{
		ZfdjDao.updateZfdwdcInfo(bean);
	}
	
	
	/**
	 * 根据 bh 删除走访单位登记信息
	 * @param bh
	 * @throws Exception
	 */
	public void deleteZfdwdjInfo(String bh) throws Exception {
		ZfdjDao.deleteZfdwdjInfo(bh);
	}
	/**
	 * 根据 bh批量删除走访单位登记信息
	 * @param bhList
	 * @throws Exception
	 */
	public boolean batchDeleteZfdwdjInfo(List<String > bhList) throws Exception{
		if(bhList.size() > 0){
			return ZfdjDao.batchDeleteZfdwdjInfo(bhList);
		}else{
			return false;
		}
	}
}
