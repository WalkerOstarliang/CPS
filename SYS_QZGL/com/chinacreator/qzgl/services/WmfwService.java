package com.chinacreator.qzgl.services;

import java.io.File;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.ArrayList;

import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.bean.QueryBean;
import com.chinacreator.qzgl.dao.WmfwDao;
import com.frameworkset.orm.transaction.TransactionManager;

public class WmfwService {

	/**
	 * 分页查询为民服务（提供证明、迷途人员、弃婴信息、流浪乞讨人员 、其他服务）
	 * @param <T>
	 * @param queryBean
	 * @param pageInfo
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public <T> PageResultInfo<T>  queryPageList(Class cls,QueryBean queryBean,String sqlName, PageInfo pageInfo) throws Exception{
		return	WmfwDao.queryWmfwList(cls, queryBean, sqlName, pageInfo);
	}
	
	public <T> ArrayList<T> queryList(Class<T> cls,QueryBean queryBean,String sqlName) throws Exception
	{
		return  WmfwDao.queryList(cls,queryBean,sqlName);
	}
	
	/**
	 * 根据ID查询为民服务详情（提供证明、迷途人员、弃婴信息、流浪乞讨人员 、其他服务）
	 * @param <T>
	 * @param cls
	 * @param id
	 * @param sqlName
	 * @return
	 * @throws Exception
	 */
	public <T> T queryBeanById(Class<T> cls,String id,String sqlName) throws Exception{
		return WmfwDao.queryBeanById(cls,id,sqlName);
	}
	/**
	 * 保存为民服务（提供证明、迷途人员、弃婴信息、流浪乞讨人员 、其他服务）
	 * @param <T>
	 * @param bean
	 * @param sqlName
	 * @param type
	 * @throws Exception
	 */
	public <T> boolean saveBean(T bean,String sqlName,String type) throws Exception{
		if ("add".equals(type)){
			// 新增
			TransactionManager tm = new TransactionManager();
			try{
				tm.begin();
				WmfwDao.insertBean(bean, sqlName);
				tm.commit();
				return true;
			}catch (Exception e) {
				tm.rollback();
				e.printStackTrace();
				return false;
			}
		}else if("update".equals(type) || "delete".equals(type)){
			//更新或删除
			WmfwDao.updateBean(bean, sqlName);
			return true;
		}else {
			return false;
		}
	}
	/**
	 * 显示照片
	 * @param id
	 * @param tabname 表名(小写)
	 * @param column 返回照片字段（小写）
	 * @return
	 */
	public Blob queryZpxxById(String id,String tabname,String column){
		return WmfwDao.getZpxxByid(id,tabname,column);
	}
	
	/**
	 * 插入照片信息
	 * @param id
	 * @param filezp
	 */
	public void updateZpxxbyId(String id,File filezp,String sql){
		try {
			WmfwDao.updateZpxxByid(id,filezp,sql);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	/**
	 * 删除照片
	 * @param id
	 * @throws SQLException 
	 */
	public void deleteZpxxbyId(String id,String sqlname) throws SQLException{
		WmfwDao.deleteZpxxByid(id,sqlname);
	}
}
