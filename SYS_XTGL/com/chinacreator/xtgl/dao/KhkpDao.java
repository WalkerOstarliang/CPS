package com.chinacreator.xtgl.dao;

import java.io.Serializable;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.bean.QueryBean;
import com.chinacreator.xtgl.bean.BywclBean;
import com.chinacreator.xtgl.bean.JwtBean;
import com.chinacreator.xtgl.bean.KhpmBean;
import com.chinacreator.xtgl.bean.SjcjslBean;
import com.chinacreator.xtgl.bean.SqkhtjBean;
import com.chinacreator.xtgl.bean.WtsjtjfxBean;
import com.chinacreator.xtgl.bean.WtsjtjfxpzBean;
import com.chinacreator.xtgl.query.JwtQueryBean;
import com.chinacreator.xtgl.query.KhkpQueryBean;
import com.chinacreator.xtgl.query.WtsjtjfxQueryBean;

public interface KhkpDao extends Serializable {
	/**
	 * 查询考核数据
	 * @param bean
	 * @return
	 */
	public List<KhpmBean> queryKhkp(QueryBean bean) throws SQLException;
	
	/**
	 * 查询考核考评大类
	 * @param bean
	 * @return
	 */
	public List<KhpmBean> queryKhkpDl(QueryBean bean) throws SQLException;
	
	/**
	 * 查询考核考评细类
	 * @param bean
	 * @return
	 */
	public List<KhpmBean> queryKhkpXl(QueryBean bean) throws SQLException;
	
	/**
	 * 查询社区考核统计
	 * @param bean
	 * @return
	 */
	public List<SqkhtjBean> querySqkhtj(QueryBean bean) throws SQLException;
	
	/**
	 * 分页查询数据采集量
	 * @param bean
	 * @param pageInfo
	 * @return
	 * @throws SQLException
	 */
	public PageResultInfo<SjcjslBean> querySjcjList(QueryBean bean,PageInfo pageInfo) throws SQLException;
	
	/**
	 * 查询所有数据采集
	 * @param bean
	 * @return
	 */
	public List<SjcjslBean> querySjcsslList(QueryBean bean) throws SQLException;
	
	/**
	 * 查询警务通类别
	 * @param queryBean
	 * @param pageInfo
	 * @return
	 * @date Apr 17, 2014 10:30:34 AM
	 */
	public PageResultInfo<JwtBean> queryJwtBeansPageResult(JwtQueryBean queryBean, PageInfo pageInfo) throws Exception;
	
	public JwtBean queryJwtBeanById(JwtQueryBean queryBean) throws Exception;
	
	public void inserJwtBean(JwtBean jwtBean) throws Exception;
	
	public void updateJwtBean(JwtBean jwtBean) throws Exception;
	
	/**
	 * 注销恢复警务通配置
	 * @param queryBean
	 * @throws Exception
	 * @date Apr 17, 2014 4:05:27 PM
	 */
	public void zxhfJwtBean(JwtQueryBean queryBean) throws Exception;
	
	public String getExistJwtPz(JwtQueryBean queryBean);
	
	public PageResultInfo<WtsjtjfxBean> queryWtsjtjfxBeanList(WtsjtjfxQueryBean queryBean, PageInfo pageInfo);
	
	public WtsjtjfxpzBean queryWtsjtjfxpzBean(String sjtype);
	
	public Map<String,Object> executeQueryWtDataByPzBean(WtsjtjfxpzBean pzBean);
	
	public List<WtsjtjfxBean> queryMjDetailInfoList(WtsjtjfxQueryBean queryBean);
	
	public PageResultInfo<WtsjtjfxBean> queryWtsjtjfxBakBeanList(WtsjtjfxQueryBean queryBean, PageInfo pageInfo);
	
	public WtsjtjfxBean queryWtsjtjfxBeanByOrgcodeAndTjrq(String orgcode, String tjrq);
	
	/**
	 * 查询本月未处理
	 * @param bean
	 * @param pageinfo
	 * @return
	 */
	public PageResultInfo<BywclBean> queryBywcltj(KhkpQueryBean bean, PageInfo pageinfo) throws SQLException;
	
	public List<BywclBean> downlaodBywcltj(KhkpQueryBean bean) throws SQLException;
	
}
