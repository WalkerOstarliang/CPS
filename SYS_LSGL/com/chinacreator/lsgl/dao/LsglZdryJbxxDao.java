package com.chinacreator.lsgl.dao;

import java.sql.SQLException;
import java.util.List;

import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.lsgl.bean.QGQLZdryInfoBean;
import com.chinacreator.lsgl.bean.ZdryGzdxBean;
import com.chinacreator.lsgl.bean.ZdryGzryxxBean;
import com.chinacreator.lsgl.bean.ZdryJzdxxxBean;
import com.chinacreator.lsgl.bean.ZdryPfxxBean;
import com.chinacreator.lsgl.bean.ZdryTgxxBean;
import com.chinacreator.lsgl.bean.ZdryThBean;
import com.chinacreator.lsgl.bean.ZdryWffzjlBean;
import com.chinacreator.lsgl.bean.ZdryXdryxxBean;
import com.chinacreator.lsgl.bean.ZdryXsbxBean;
import com.chinacreator.lsgl.query.RkQueryBean;

public interface LsglZdryJbxxDao {
	/**
	 * 分页查询重点人员信息
	 * @param queryBean
	 * @param pageInfo
	 * @return
	 * @throws Exception
	 */
	public PageResultInfo<ZdryGzdxBean> queryZdryGzdxPageResult(RkQueryBean queryBean,PageInfo pageInfo) throws Exception;
	
	/**
	 * 分页查询为认领重点人员
	 * @param queryBean
	 * @param pageInfo
	 * @return
	 * @throws Exception
	 */
	public PageResultInfo<ZdryGzdxBean> queryWrlZdryGzdxPageResult(RkQueryBean queryBean,PageInfo pageInfo) throws Exception;
	
	/**
	 * 插入重点人员对象
	 * @param zdryBean
	 * @throws Exception
	 */
	public ZdryGzdxBean insertZdryGzdxInfo(ZdryGzdxBean zdryBean) throws Exception;
	
	/**
	 * 更新重点人员对象
	 * @param zdryBean
	 * @throws Exception
	 */
	public ZdryGzdxBean updateZdryGzdxInfo(ZdryGzdxBean zdryBean) throws Exception;
	
	/**
	 * 根据 关注对象编号 查询重点人员
	 * @param gzdxbh
	 * @return
	 * @throws Exception
	 */
	public ZdryGzdxBean queryZdryGzdxByGzdxbh(String gzdxbh) throws Exception;
	
	/**
	 * 分页查询  重点人员违法犯罪信息
	 * @param rybh
	 * @param pageInfo
	 * @return
	 * @throws Exception
	 */
	public PageResultInfo<ZdryWffzjlBean> queryZdryWffzjbPageInfo(String rybh,PageInfo pageInfo) throws Exception;
	
	/**
	 * 插入 重点人员违法犯罪信息
	 * @param wffzjlBean
	 * @throws Exception
	 */
	public ZdryWffzjlBean insertZdryWffzjlBean(ZdryWffzjlBean wffzjlBean) throws Exception;
	
	/**
	 * 更新 重点人员违法犯罪信息
	 * @param wffzjlBean
	 * @throws Exception
	 */
	public ZdryWffzjlBean updateZdryWffzjlBean(ZdryWffzjlBean wffzjlBean) throws Exception;
	
	/**
	 * 判断人口基本信息是否包含某身份证号码
	 */
	public boolean isExistSfzh(String sfzh) throws Exception;
	
	/**
	 * 判断身份证号码 是否存在工作对象表里
	 * 
	 */
	public ZdryGzdxBean queryZdryGzdxBysfzh(String sfzh) throws Exception;
    
	public ZdryGzdxBean getZdryGzdxBySfzh(String sfzh) throws Exception;
	
	/**
	 * 根据关注对象查找矫正对象
	 * @param gzdxbh
	 * @return
	 * @throws SQLException
	 */
	public ZdryJzdxxxBean queryJzdxBeanByGzdxbh(String gzdxbh) throws SQLException;
   
	/**
	 * 根据工作对象编号查询关注对象
	 * @param gzdxbh
	 * @return
	 * @throws SQLException
	 */
	public ZdryGzryxxBean queryGzryBeanByGzdxbh(String gzdxbh)throws SQLException;

	/**
	 * 根据工作对象编号查询吸毒人员
	 * @param gzdxbh
	 * @return
	 * @throws SQLException
	 */
	public ZdryXdryxxBean queryXdryBeanByGzdxbh(String gzdxbh) throws SQLException;

	/**
	 * 更新重点人员工作对象表的bjsj  变更时间
	 */
	public void updateZdryGzdxBgsj(String  sfzh) throws SQLException;
	
	/**
	 * 重点人员认领
	 * @param bean
	 * @throws Exception
	 */
	public void zdryRlUpdate(ZdryGzdxBean bean) throws Exception;
	
	/**
	 * 新增重点人员派发信息
	 * @param bean
	 */
	public void insertZdryPfxx(ZdryPfxxBean bean) throws SQLException;
	
	/**
	 * 重点人员派发
	 * @param bean
	 * @throws SQLException
	 */
	public void zdryPf(ZdryGzdxBean bean) throws SQLException;
	
	/**
	 * 新增重点人员委托信息
	 * @param 
	 * @throws SQLException
	 */
	public void insertZdryWtxx(ZdryTgxxBean bean) throws SQLException;
	
	/**
	 * 修改重点人员委托信息
	 * @param bean
	 * @throws SQLException
	 */
	public void updateZdryWtxx(ZdryTgxxBean bean) throws SQLException;
	
	//分页查询委托信息
	public PageResultInfo<ZdryTgxxBean> queryWtxxList(RkQueryBean bean,PageInfo pageInfo) throws SQLException;
	
	//查询重点人员委托信息
	public ZdryTgxxBean queryZdryWtxxById(String id) throws SQLException;
	
	//查询重点人员委托信息
	public ZdryTgxxBean queryTgxxBySfzh(String sfzh) throws SQLException;
	
	//重点人员退回
	public void zdryTh(ZdryGzdxBean bean) throws SQLException;
	
	//新增重点人员退回信息
	public void insertZdryThxx(ZdryThBean bean) throws SQLException;
	
	//查询最新的退回信息
	public ZdryThBean queryThxx(String sfzh, String mbdwdm) throws SQLException;
	
	//查询最新的托管信息
	public ZdryTgxxBean queryTgxx(String sfzh,String jgdwdm) throws SQLException;
	
	//查询最新的派发信息
	public ZdryPfxxBean queryPfxx(String sfzh) throws SQLException;
	
	//市局退回
	public void sjth(ZdryThBean bean) throws SQLException; 
	
	//分页查询现实表现
	public PageResultInfo<ZdryXsbxBean> queryXsbxPageResultInfo(String sfzh,PageInfo pageInfo) throws SQLException;
	
	//查询全国七类重点人员
	public QGQLZdryInfoBean queryQGQLZdryInfoBeanByZdrybh(String zdrybh) throws Exception;
	
	/**
	 * 根据ID查询现实表现
	 * @param id
	 * @return
	 * @throws Exception
	 */
	public ZdryXsbxBean queryXsbxById(String id) throws SQLException;
	
	public List<ZdryGzdxBean> queryZdryList(RkQueryBean bean) throws SQLException;
}
