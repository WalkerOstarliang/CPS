package com.chinacreator.lsgl.services;

import java.sql.SQLException;
import java.util.List;

import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.lsgl.bean.QGQLZdryInfoBean;
import com.chinacreator.lsgl.bean.ZdryGzdxBean;
import com.chinacreator.lsgl.bean.ZdryGzryxxBean;
import com.chinacreator.lsgl.bean.ZdryJsbrzsxxBean;
import com.chinacreator.lsgl.bean.ZdryJsbxBean;
import com.chinacreator.lsgl.bean.ZdryJzdxxxBean;
import com.chinacreator.lsgl.bean.ZdryPfxxBean;
import com.chinacreator.lsgl.bean.ZdrySwryBean;
import com.chinacreator.lsgl.bean.ZdrySwrysfjlBean;
import com.chinacreator.lsgl.bean.ZdryTgxxBean;
import com.chinacreator.lsgl.bean.ZdryThBean;
import com.chinacreator.lsgl.bean.ZdryWffzjlBean;
import com.chinacreator.lsgl.bean.ZdryXdchNjxxBean;
import com.chinacreator.lsgl.bean.ZdryXdryxxBean;
import com.chinacreator.lsgl.bean.ZdryXsbxBean;
import com.chinacreator.lsgl.query.RkQueryBean;

public interface  LsglZdryService {
	/**
	 * 分页查询重点对象
	 * @param queryBean
	 * @param pageInfo
	 * @return
	 * @throws Exception
	 */
	public PageResultInfo<ZdryGzdxBean> queryZdryGzdxPageResult(RkQueryBean queryBean, PageInfo pageInfo);
	
	public PageResultInfo<ZdryGzdxBean> queryWrlZdryGzdxPageResult(RkQueryBean queryBean, PageInfo pageInfo) throws Exception;
	
	public boolean  isExistSfzhm(String sfzhm) throws Exception;
	
	/**
	 * 插入重点人员对象
	 * @param zdryBean
	 * @throws Exception
	 */
	public ZdryGzdxBean insertZdryGzdxInfo(ZdryGzdxBean zdryBean) throws Exception;
	
	/**
	 * 通过身份证号查询重大人员工作对象信息
	 * @param sfzh
	 * @return
	 * @throws SQLException 
	 * @throws Exception 
	 */
	public ZdryGzdxBean queryGzdxBeanBySfzh(String sfzh) throws  Exception;

	public ZdryGzdxBean queryZdryGzdxDetailInfoBySfzh(String sfzh)throws Exception;

	public ZdryGzdxBean updateZdryGzdxInfo(ZdryGzdxBean zdryBean)throws Exception;

	public PageResultInfo<ZdryWffzjlBean> queryZdryWffzjlPageResult(
			String rybh, PageInfo pageInfo)throws Exception;

	public ZdryWffzjlBean insertZdryWffzjlInfo(ZdryWffzjlBean wffzjlBean)throws Exception;

	public ZdryWffzjlBean updateZdryWffzjlInfo(ZdryWffzjlBean wffzjlBean)throws Exception;

	/**
	 * 判断身份证是否存在工作对象表
	 */
	public ZdryGzdxBean getExistSfzhInZdryGzdx(String sfzh) throws Exception ;

	public ZdryJzdxxxBean queryJzdxBeanByGzdxbh(String gzdxbh) throws SQLException;

	public ZdryGzryxxBean queryGzryBeanByGzdxbh(String gzdxbh) throws SQLException;
	public ZdryGzdxBean saveZdryGzdx(ZdryGzdxBean zdryBean, String dxlb) throws Exception;

	/**
	 * 根据工作对象编号查询精神病人
	 * @param gzdxbh
	 * @return
	 */
	public ZdryJsbxBean queryJsbrBeanByGzdxbh(String gzdxbh) throws Exception;
	
	public ZdrySwryBean querySwryBeanBySfzh(String sfzh) throws Exception;
   
	/**
	 * 保存重点人员工作对象的活动信息  如：精神病人的精神病人肇事信息
	 * 								  涉稳人员的上访记录
	 * 								  吸毒人员的尿检信息
	 * 									.....
	 * @param zdryBean
	 * @param dxlb
	 * @throws Exception
	 */
	public void saveZdryGzdxActivityInfo(ZdryGzdxBean zdryBean, String dxlb) throws Exception;
	
	
	/**
	 * 根据精神病人编号分页查询肇事信息
	 */
	public PageResultInfo<ZdryJsbrzsxxBean> queryZdryJsbrzsxxPageResult(String jsbrbh,PageInfo pageInfo) throws Exception;
	
	/**
	 * 根据涉稳人员编号分页查询上访记录
	 * 
	 */
	public PageResultInfo<ZdrySwrysfjlBean> queryZdrySwrysfjlPageResult(String swrybh,PageInfo pageInfo) throws Exception;
	
	public ZdryXdryxxBean queryXdryBeanByGzdxbh(String gzdxbh) throws SQLException;

	public PageResultInfo<ZdryXdchNjxxBean> queryZdryXdryhdPageResult(
			String rybh, PageInfo pageInfo) throws SQLException;
	
	/**
	 * 根据对象类别查询重点人员关注对象
	 */
	public ZdryGzdxBean queryZdryGzdxBeanByGzdx(ZdryGzdxBean zdryBean) throws Exception;
	
	/**
	 * 更新重点人员工作对象表的bjsj  变更时间
	 */
	public void updateZdryGzdxBgsj(String  sfzh) throws SQLException;
	
	/**
	 * 重点人员认领
	 * @param bh
	 * @throws Exception
	 */
	public void zdryRl(String bh) throws Exception;
	
	/**
	 * 重点人员派发
	 * @param zdrypfxx 重点人员派发信息
	 */
	public void zdryPf(ZdryGzdxBean bean);
	
	//重点人员退回
	public void zdryth(ZdryGzdxBean bean); 
	
	//重点人员托管
	public ZdryTgxxBean zdryTg(ZdryGzdxBean bean);
	
	//重点人员接管
	public ZdryTgxxBean zdryJg(ZdryGzdxBean bean);
	
	//分页查询委托信息
	public PageResultInfo<ZdryTgxxBean> queryTgxxList(RkQueryBean bean,PageInfo pageInfo); 
	
	//根据ID查询重点人员托管信息
	public ZdryTgxxBean queryTgxxById(String id);
	
	//根据身份证号查询托管信息
	public ZdryTgxxBean queryTgxxBySfzh(String sfzh);
	
	/**
	 * 查询最新的退回信息
	 * @param sfzh 身份证号
	 * @param mbdwdm 目标单位代码
	 */
	public ZdryThBean queryThxx(String sfzh, String mbdwdm);
	
	/**
	 * 查询最新的托管信息
	 * @param sfzh 重点人员身份证号码
	 * @param tgdwdm 托管单位代码
	 * @return
	 */
	public ZdryTgxxBean queryTgxx(String sfzh,String tgdwdm);
	
	/**
	 * 查询最新的派发信息
	 * @param sfzh
	 * @return
	 */
	public ZdryPfxxBean queryPfxx(String sfzh);
	
	//分页查询现实表现
	public PageResultInfo<ZdryXsbxBean> queryXsbxPageResultInfo(String sfzh,PageInfo pageInfo);
	
	public QGQLZdryInfoBean queryQGQLZdryInfoBeanByZdrybh(String zdrybh);
	
	/**
	 * 根据ID查询现实表现
	 * @param id
	 * @return
	 */
	public ZdryXsbxBean queryXsbxById(String id);
	
	/**
	 * 查询重点人员
	 * @param bean
	 * @return
	 */
	public List<ZdryGzdxBean> queryZdryList(RkQueryBean bean);
}

