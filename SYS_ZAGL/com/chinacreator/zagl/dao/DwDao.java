package com.chinacreator.zagl.dao;

import java.io.Serializable;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.List;

import org.apache.derby.client.am.SqlException;

import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.bean.QueryBean;
import com.chinacreator.zagl.bean.AqyhBean;
import com.chinacreator.zagl.bean.BadysBean;
import com.chinacreator.zagl.bean.BwjgBean;
import com.chinacreator.zagl.bean.BwjysBean;
import com.chinacreator.zagl.bean.BwzdBean;
import com.chinacreator.zagl.bean.CyryPfBean;
import com.chinacreator.zagl.bean.CyryPfListBean;
import com.chinacreator.zagl.bean.CyrytjBean;
import com.chinacreator.zagl.bean.DwAqsbBean;
import com.chinacreator.zagl.bean.DwabryBean;
import com.chinacreator.zagl.bean.DwabssBean;
import com.chinacreator.zagl.bean.DwaqjcBean;
import com.chinacreator.zagl.bean.DwcyryBean;
import com.chinacreator.zagl.bean.DwfwglBean;
import com.chinacreator.zagl.bean.DwjbxxBean;
import com.chinacreator.zagl.bean.DwjcBean;
import com.chinacreator.zagl.bean.DwzpxxBean;
import com.chinacreator.zagl.bean.GgcsBean;
import com.chinacreator.zagl.bean.JfdwBean;
import com.chinacreator.zagl.bean.JfdwNsxxBean;
import com.chinacreator.zagl.bean.NbDwTjBean;
import com.chinacreator.zagl.bean.NbdwBean;
import com.chinacreator.zagl.bean.SwdwBean;
import com.chinacreator.zagl.bean.SwfwcsBean;
import com.chinacreator.zagl.bean.TfsjyaBean;
import com.chinacreator.zagl.bean.ThksyBean;
import com.chinacreator.zagl.bean.ThlgyBean;
import com.chinacreator.zagl.bean.TzhyBean;
import com.chinacreator.zagl.bean.WxwpdwBean;
import com.chinacreator.zagl.bean.YaylBean;
import com.chinacreator.zagl.bean.ZdyhbwBean;
import com.chinacreator.zagl.bean.ZdyhbwZpBean;
import com.chinacreator.zagl.bean.ZhsgBean;
import com.chinacreator.zagl.query.CyryQueryBean;
import com.chinacreator.zagl.query.DwQueryBean;

public interface DwDao extends Serializable {
	/**
	 * 新增单位安保人员
	 * @param bean 安保人员信息
	 * @return
	 * @throws SQLException
	 */
	public DwabryBean insertDwabry(DwabryBean bean) throws SQLException;
	
	/**
	 * 修改单位安保人员
	 * @param bean
	 * @return
	 * @throws SQLException
	 */
	public DwabryBean updateDwabry(DwabryBean bean) throws SQLException;
	
	/**
	 * 删除安保人员
	 * @param bean 安保人员信息
	 * @throws SQLException
	 */
	public void deleteDwabry(DwabryBean bean) throws SQLException;
	
	/**
	 * 根据编号查询安保人员
	 * @param bh 编号
	 * @return
	 * @throws SQLException
	 */
	public DwabryBean queryDwabryByBh(String bh) throws SQLException;
	
	/**
	 * 根据机构编号分页查询安保人员
	 * @param pageInfo 分页信息
	 * @param jgbh 机构编号
	 * @return
	 * @throws SQLException
	 */
	public PageResultInfo<DwabryBean> queryDwabryPageResultInfoByJgbh(PageInfo pageInfo,String jgbh) throws SQLException;

	/**
	 * 根据机构编号查询单位安保人员
	 * @param jgbh 机构编号
	 * @return
	 * @throws SQLException
	 */
	public List<DwabryBean> queryDwabryListByJgbh(String jgbh) throws SQLException;
	
	/**
	 * 新增单位安保设施
	 * @param bean 安保设施信息
	 * @return
	 * @throws SQLException
	 */
	public DwabssBean insertDwabss(DwabssBean bean) throws SQLException;
	
	/**
	 * 修改单位安保设施
	 * @param bean
	 * @return
	 * @throws SQLException
	 */
	public DwabssBean updateDwabss(DwabssBean bean) throws SQLException;
	
	/**
	 * 删除安保设施
	 * @param bean 安保设施信息
	 * @throws SQLException
	 */
	public void deleteDwabss(DwabssBean bean) throws SQLException;
	
	/**
	 * 根据设施编号查询安保设施
	 * @param ssbh 设施编号
	 * @return
	 * @throws SQLException
	 */
	public DwabssBean queryDwabssBySsbh(String ssbh) throws SQLException;
	
	/**
	 * 根据机构编号分页查询安保设施
	 * @param pageInfo 分页信息
	 * @param jgbh 机构编号
	 * @return
	 * @throws SQLException
	 */
	public PageResultInfo<DwabssBean> queryDwabssPageResultInfoByJgbh(PageInfo pageInfo,String jgbh) throws SQLException;

	/**
	 * 根据机构编号查询单位安保设施
	 * @param jgbh 机构编号
	 * @return
	 * @throws SQLException
	 */
	public List<DwabssBean> queryAbssListByJgbh(String jgbh) throws SQLException;
	
	/**
	 * 新增单位安全检查
	 * @param bean 安全检查信息
	 * @return
	 * @throws SQLException
	 */
	public DwaqjcBean insertDwaqjc(DwaqjcBean bean) throws SQLException;
	
	/**
	 * 修改单位安全检查
	 * @param bean
	 * @return
	 * @throws SQLException
	 */
	public DwaqjcBean updateDwaqjc(DwaqjcBean bean) throws SQLException;
	
	/**
	 * 删除安全检查
	 * @param bean 安全检查信息
	 * @throws SQLException
	 */
	public void deleteDwaqjc(DwaqjcBean bean) throws SQLException;
	
	/**
	 * 根据编号查询安全检查
	 * @param jlbh 编号
	 * @return
	 * @throws SQLException
	 */
	public DwaqjcBean queryDwaqjcByJlbh(String jlbh) throws SQLException;
	
	/**
	 * 根据机构编号分页查询安全检查
	 * @param pageInfo 分页信息
	 * @param jgbh 机构编号
	 * @return
	 * @throws SQLException
	 */
	public PageResultInfo<DwaqjcBean> queryDwaqjcPageResultInfoByJgbh(PageInfo pageInfo,String jgbh) throws SQLException;

	/**
	 * 根据机构编号查询单位安全检查
	 * @param jgbh 机构编号
	 * @return
	 * @throws SQLException
	 */
	public List<DwaqjcBean> queryAqjcListByJgbh(String jgbh) throws SQLException;
	
	/**
	 * 新增单位从业人员
	 * @param bean 从业人员信息
	 * @return
	 * @throws SQLException
	 */
	public DwcyryBean insertDwcyry(DwcyryBean bean) throws SQLException;
	
	/**
	 * 修改单位从业人员
	 * @param bean
	 * @return
	 * @throws SQLException
	 */
	public DwcyryBean updateDwcyry(DwcyryBean bean) throws SQLException;
	
	/**
	 * 删除从业人员
	 * @param bean 从业人员信息
	 * @throws SQLException
	 */
	public void deleteDwcyry(DwcyryBean bean) throws SQLException;
	
	/**
	 * 根据从业人员编号查询从业人员
	 * @param cyrybh 从业人员编号
	 * @return
	 * @throws SQLException
	 */
	public DwcyryBean queryDwcyryByCyrybh(String cyrybh) throws SQLException;
	
	/**
	 * 根据机构编号分页查询从业人员
	 * @param pageInfo 分页信息
	 * @param jgbh 机构编号
	 * @return
	 * @throws SQLException
	 */
	public PageResultInfo<DwcyryBean> queryDwcyryPageResultInfoByJgbh(PageInfo pageInfo,String jgbh) throws SQLException;
	
	/**
	 * 分页查询所有从业人员
	 * @param pageInfo 分页信息
	 * @param bean 查询条件
	 * @return
	 * @throws SQLException
	 */
	public PageResultInfo<DwcyryBean> queryDwCyryPageResultInfo(PageInfo pageInfo,QueryBean bean) throws SQLException;
	
	/**
	 * 根据机构编号查询单位从业人员
	 * @param jgbh 机构编号
	 * @return
	 * @throws SQLException
	 */
	public List<DwcyryBean> queryCyryListByJgbh(String jgbh) throws SQLException;
	
	/**
	 * 新增单位基本信息
	 * @param dwjbxx
	 * @return
	 * @throws SQLException
	 */
	public DwjbxxBean insertDwjbxx(DwjbxxBean dwjbxx) throws SQLException ;
	
	/**
	 * 插入单位房屋管理对象
	 * @param dwfwglBean
	 * @throws Exception
	 * @date 2013-10-12 下午04:37:54
	 */
	public void insertDwFwglBean(DwfwglBean dwfwglBean) throws Exception;
	
	/**
	 * 注销单位房屋管理地址
	 * @param dwfwglid
	 * @throws Exception
	 * @date 2013-10-12 下午04:52:29
	 */
	public void zxDwfwglBean(String dwfwglid) throws Exception;
	
	/**
	 * 修改单位基本信息
	 * @param dwjbxx
	 * @return
	 * @throws SQLException
	 */
	public DwjbxxBean updateDwjbxx(DwjbxxBean dwjbxx) throws SQLException ;
	
	/**
	 * 注销单位
	 * @param dwjbxx
	 * @return
	 * @throws SQLSQLException
	 */
	public DwjbxxBean deleteDwjbxx(DwjbxxBean dwjbxx) throws SQLException;
	
	/**
	 * 恢复注销单位
	 * @param dwjbxx
	 * @throws SQLException
	 */
	public void resetDw(DwjbxxBean dwjbxx) throws SQLException;
	
	/**
	 * 根据机构编号查询单位基本信息
	 * @param jgbh
	 * @return
	 * @throws SQLSQLException
	 */
	public DwjbxxBean queryDwjbxxByJgbh(String jgbh) throws SQLException;
	
	/**
	 * 分页查询单位基本信息
	 * @param pageInfo
	 * @param bean
	 * @return
	 * @throws SQLSQLException
	 */
	public PageResultInfo<DwjbxxBean> queryDwjbxxPageResInfo(PageInfo pageInfo,QueryBean bean) throws SQLException;
	
	/**
	 * 新增单位重点要害部位
	 * @param bean 重点要害部位信息
	 * @return
	 * @throws SQLException
	 */
	public ZdyhbwBean insertZdyhbw(ZdyhbwBean bean) throws SQLException;
	
	/**
	 * 修改单位重点要害部位
	 * @param bean
	 * @return
	 * @throws SQLException
	 */
	public ZdyhbwBean updateZdyhbw(ZdyhbwBean bean) throws SQLException;
	
	/**
	 * 删除重点要害部位
	 * @param bean 重点要害部位信息
	 * @throws SQLException
	 */
	public void deleteZdyhbw(ZdyhbwBean bean) throws SQLException;
	
	/**
	 * 根据要害部位编号查询重点要害部位
	 * @param yhbwbh 编号
	 * @return
	 * @throws SQLException
	 */
	public ZdyhbwBean queryZdyhbwByYhbwbh(String yhbwbh) throws SQLException;
	
	/**
	 * 根据机构编号分页查询重点要害部位
	 * @param pageInfo 分页信息
	 * @param jgbh 机构编号
	 * @return
	 * @throws SQLException
	 */
	public PageResultInfo<ZdyhbwBean> queryZdyhbwPageResultInfoByJgbh(PageInfo pageInfo,String jgbh) throws SQLException;

	/**
	 * 根据机构编号查询单位重点要害部位
	 * @param jgbh 机构编号
	 * @return
	 * @throws SQLException
	 */
	public List<ZdyhbwBean> queryZdyhbwListByJgbh(String jgbh) throws SQLException;
	
	/**
	 * 新增公共场所
	 * @param ggcs
	 * @return
	 * @throws SQLException
	 */
	public GgcsBean insertGgcs(GgcsBean ggcs) throws SQLException ;
	
	/**
	 * 修改公共场所
	 * @param ggcs
	 * @return
	 * @throws SQLException
	 */
	public GgcsBean updateGgcs(GgcsBean ggcs) throws SQLException ;
	
	/**
	 * 根据机构编号查询公共场所
	 * @param jgbh
	 * @return
	 * @throws SQLSQLException
	 */
	public GgcsBean queryGgcsByJgbh(String jgbh) throws SQLException;
	
	/**
	 * 新增内保单位
	 * @param nbdw
	 * @return
	 * @throws SQLException
	 */
	public NbdwBean insertNbdw(NbdwBean nbdw) throws SQLException ;
	
	/**
	 * 修改内保单位
	 * @param nbdw
	 * @return
	 * @throws SQLException
	 */
	public NbdwBean updateNbdw(NbdwBean nbdw) throws SQLException ;
	
	/**
	 * 根据机构编号查询内保单位
	 * @param jgbh
	 * @return
	 * @throws SQLSQLException
	 */
	public NbdwBean queryNbdwByJgbh(String jgbh) throws SQLException;
	
	/**
	 * 新增特行信息
	 * @param tzhy
	 * @return
	 * @throws SQLException
	 */
	public TzhyBean insertTzhy(TzhyBean tzhy) throws SQLException ;
	
	/**
	 * 修改特行信息
	 * @param tzhy 特种行业
	 * @return
	 * @throws SQLException
	 */
	public TzhyBean updateTzhy(TzhyBean tzhy) throws SQLException ;
	
	/**
	 * 根据特行编号查询特行信息
	 * @param thbh
	 * @return
	 * @throws SQLSQLException
	 */
	public TzhyBean queryTzhyByThbh(String thbh) throws SQLException;
	
	/**
	 * 新增特行旅馆业
	 * @param thlgy 特行旅馆
	 * @return
	 * @throws SQLException
	 */
	public ThlgyBean inserThlgy(ThlgyBean thlgy) throws SQLException;
	
	/**
	 * 修改特行旅馆业
	 * @param thlgy 特行旅馆
	 * @return
	 * @throws SQLException
	 */
	public ThlgyBean updateThlgy(ThlgyBean thlgy) throws SQLException;
	
	/**
	 * 根据机构编号查询特行旅馆
	 * @param jgbh 机构编号
	 * @return
	 * @throws SQLException
	 */
	public ThlgyBean queryThlgyByJgbh(String jgbh) throws SQLException;
	
	/**
	 * 根据机构编号查询特行信息
	 * @param jgbh
	 * @return
	 * @throws SQLSQLException
	 */
	public TzhyBean queryTzhyByJgbh(String jgbh) throws SQLException;
	
	/**
	 * 新增单位奖惩
	 * @param bean 奖惩信息
	 * @return
	 * @throws Exception
	 */
	public DwjcBean insertDwjc(DwjcBean bean) throws SQLException;
	
	/**
	 * 修改单位奖惩
	 * @param bean
	 * @return
	 * @throws Exception
	 */
	public DwjcBean updateDwjc(DwjcBean bean) throws SQLException;
	
	/**
	 * 删除奖惩
	 * @param bean 奖惩信息
	 * @throws Exception
	 */
	public void deleteDwjc(DwjcBean bean) throws SQLException;
	
	/**
	 * 根据编号查询奖惩
	 * @param bh 编号
	 * @return
	 * @throws Exception
	 */
	public DwjcBean queryDwjcByBh(String bh) throws SQLException;
	
	/**
	 * 根据机构编号分页查询奖惩
	 * @param pageInfo 分页信息
	 * @param jgbh 机构编号
	 * @return
	 * @throws Exception
	 */
	public PageResultInfo<DwjcBean> queryDwjcPageResultInfoByJgbh(PageInfo pageInfo,String jgbh) throws SQLException;

	/**
	 * 根据机构编号查询单位奖惩信息
	 * @param jgbh 机构编号
	 * @return
	 * @throws SQLException
	 */
	public List<DwjcBean> queryDwJcListByJgbh(String jgbh) throws SQLException;
	
	/**
	 * 新增上网服务场所
	 * @param swfwcs 上网服务场所
	 * @return
	 * @throws SQLException
	 */
	public SwfwcsBean insertSwfwcs(SwfwcsBean swfwcs) throws SQLException;
	
	/**
	 * 修改上网服务场所
	 * @param swfwcs 上网服务场所
	 * @return
	 * @throws SQLException
	 */
	public SwfwcsBean updateSwfwcs(SwfwcsBean swfwcs) throws SQLException;

	/**
	 * 根据机构编号查询上网服务场所
	 * @param jgbh 机构编号
	 * @return
	 * @throws SQLException
	 */
	public SwfwcsBean querySwfwcsByJgbh(String jgbh) throws SQLException;
	
	/**
	 * 根据机构编号查询单位照片
	 * @param jgbh 机构编号
	 * @return
	 * @throws Exception
	 */
	public List<DwzpxxBean> queryDwzpByJgbh(String jgbh) throws Exception;
	
	/**
	 * 新增单位照片
	 * @param zpList 需要新增的照片
	 * @throws Exception
	 */
	public void insertDwzp(List<DwzpxxBean> zpList) throws Exception;
	
	/**
	 * 删除单位照片
	 * @param zpid 照片id
	 * @throws Exception
	 */
	public void deleteDwzpByZpid(String zpid) throws Exception;
	
	/**
	 * 根据照片Id查询单位照片信息
	 * @param zpId 照片ID
	 * @return 二进制流
	 */
	public Blob queryDwzpByZpid(String zpId) throws SQLException;
	
	/**
	 * 根据照片ID查询重点要害部位照片
	 * @param zpId
	 * @return
	 */
	public Blob queryYhbwzpByZpId(String zpId) throws SQLException;
	
	/**
	 * 
	 * 查询单位房屋关联对象
	 * @param jgbh
	 * @return
	 * @throws SQLException
	 * @date 2013-10-12 下午06:59:20
	 */
	public DwfwglBean queryDwfwglBean(String jgbh) throws  SQLException;
	
	/**
	 * 更新单位的操作时间及标示
	 * @param czlx
	 * @param czrxm
	 * @param czdwdm
	 * @param czdwmc
	 * @date 2013-10-14 下午01:33:13
	 */
	public void updateDwczlx(String jgbh,String czlx, String czrxm, String czdwdm, String czdwmc);
	
	/**
	 * 插入特行开锁业对象
	 * @param thksyBean
	 * @throws Exception
	 * @date 2013-10-15 上午09:04:47
	 */
	public void insertThksyBean(ThksyBean thksyBean) throws Exception;
	
	/**
	 * 更新特行开锁业信息
	 * @param thksyBean
	 * @throws Exception
	 * @date 2013-10-15 上午09:05:36
	 */
	public void updateThksyBean(ThksyBean thksyBean) throws Exception;
	
	/**
	 * 查询开锁业信息
	 * @param jgbh
	 * @return
	 * @throws Exception
	 * @date 2013-10-15 上午09:39:22
	 */
	public ThksyBean queryThksyBean(String jgbh)throws Exception;
	
	/**
	 * 通过机构编号查询涉外单位
	 * @param jgbh
	 * @return
	 * @throws Exception
	 * @date 2013-10-16 上午09:09:09
	 */
	public SwdwBean querySwdwBeanByJgbh(String jgbh) throws Exception;
	
	/**
	 * 插入涉外单位
	 * @param swdwBean
	 * @throws Exception
	 * @date 2013-10-16 上午09:09:43
	 */
	public void insertSwdwBean(SwdwBean swdwBean) throws Exception;
	
	/**
	 * 更新涉外单位
	 * @param swdwBean
	 * @throws Exception
	 * @date 2013-10-16 上午09:10:02
	 */
	public void updateSwdwBean(SwdwBean swdwBean) throws Exception;
	
	/**
	 * 通过机构编号查询危险物品单位
	 * @param jgbh
	 * @return
	 * @throws Exception
	 * @date 2013-10-16 上午10:32:02
	 */
	public WxwpdwBean queryWxwpdwBean(String jgbh) throws Exception;
	
	/**
	 * 插入危险品单位
	 * @param wxwpdwBean
	 * @throws Exception
	 * @date 2013-10-16 上午10:32:22
	 */
	public void insertWxwpdwBean(WxwpdwBean wxwpdwBean) throws Exception;
	
	/**
	 * 更新危险品单位
	 * @param wxwpdwBean
	 * @throws Exception
	 * @date 2013-10-16 上午10:34:30
	 */
	public void updateWxwpdwBean(WxwpdwBean wxwpdwBean) throws Exception;
	
	/**
	 * 分页查询单位安全检查信息
	 * @param pageInfo
	 * @param queryBean
	 * @return
	 * @date 2013-10-17 上午10:11:12
	 */
	public PageResultInfo<DwaqjcBean> queryDwAqjcPageResultInfoByJgbh(PageInfo pageInfo, DwQueryBean queryBean);

	/**
	 * 新增单位安全设备
	 * @param bean
	 * @return
	 * @throws Exception
	 */
	public DwAqsbBean insertDwAqsb(DwAqsbBean bean)throws Exception;
	
	/**
	 * 修改单位安全设备
	 * @param bean
	 * @return
	 * @throws Exception
	 */
	public DwAqsbBean updateDwAqsb(DwAqsbBean bean) throws Exception;
	
	/**
	 * 根据机构编号查询单位安全设备
	 * @param jgbh
	 * @return
	 * @throws Exception
	 */
	public DwAqsbBean queryDwAqsbByJgbh(String jgbh) throws Exception;
	
	/***************************2013-12-06************************************/
	
	/**
	 * 新增保卫机构
	 * @param bwjg
	 * @return
	 * @throws SQLException
	 */
	public BwjgBean insertBwjg(BwjgBean bwjg) throws SQLException;
	
	/**
	 * 修改保卫机构
	 * @param bwjg
	 * @return
	 * @throws SQLException
	 */
	public BwjgBean updateBwjg(BwjgBean bwjg) throws SQLException;
	
	/**
	 * 删除保卫机构
	 * @param bwjg
	 * @throws SQLException
	 */
	public void delBwjg(BwjgBean bwjg) throws SQLException;
	
	/**
	 * 根据保卫机构编号查询保卫机构
	 * @param bwjgbh 保卫机构编号
	 * @return
	 * @throws SQLException
	 */
	public BwjgBean queryBwjgByBwjgbh(String bwjgbh) throws SQLException;
	
	/**
	 * 根据机构编号查询保卫机构
	 * @param jgbh
	 * @return
	 * @throws SQLException
	 */
	public List<BwjgBean> queryBwjgByJgbh(String jgbh) throws SQLException;
	
	/**
	 * 新增保卫制度
	 * @param Bwzd
	 * @return
	 * @throws SQLException
	 */
	public BwzdBean insertBwzd(BwzdBean bwzd) throws SQLException;
	
	/**
	 * 修改保卫制度
	 * @param bwzd
	 * @return
	 * @throws SQLException
	 */
	public BwzdBean updateBwzd(BwzdBean bwzd) throws SQLException;
	
	/**
	 * 删除保卫制度
	 * @param bwzd
	 * @throws SQLException
	 */
	public void delBwzd(BwzdBean bwzd) throws SQLException;
	
	/**
	 * 根据保卫制度编号查询保卫制度
	 * @param zdbh 制度编号
	 * @return
	 * @throws SQLException
	 */
	public BwzdBean queryBwzdByBwzdbh(String zdbh) throws SQLException;
	
	/**
	 * 根据机构编号查询保卫制度
	 * @param jgbh
	 * @return
	 * @throws SQLException
	 */
	public List<BwzdBean> queryBwzdByJgbh(String jgbh) throws SQLException;
	
	/**
	 * 新增保卫建议书
	 * @param Bwjys
	 * @return
	 * @throws SQLException
	 */
	public BwjysBean insertBwjys(BwjysBean bwjys) throws SQLException;
	
	/**
	 * 修改保卫建议书
	 * @param bwjys
	 * @return
	 * @throws SQLException
	 */
	public BwjysBean updateBwjys(BwjysBean bwjys) throws SQLException;
	
	/**
	 * 删除保卫建议书
	 * @param bwjys
	 * @throws SQLException
	 */
	public void delBwjys(BwjysBean bwjys) throws SQLException;
	
	/**
	 * 根据保卫建议书编号查询保卫建议书
	 * @param jysbh 建议书编号
	 * @return
	 * @throws SQLException
	 */
	public BwjysBean queryBwjysByBwjysbh(String jysbh) throws SQLException;
	
	/**
	 * 根据机构编号查询保卫建议书
	 * @param jgbh
	 * @return
	 * @throws SQLException
	 */
	public List<BwjysBean> queryBwjysByJgbh(String jgbh) throws SQLException;
	
	/**
	 * 新增突发事件预案
	 * @param Tfsjya
	 * @return
	 * @throws SQLException
	 */
	public TfsjyaBean insertTfsjya(TfsjyaBean tfsjya) throws SQLException;
	
	/**
	 * 修改突发事件预案
	 * @param tfsjya
	 * @return
	 * @throws SQLException
	 */
	public TfsjyaBean updateTfsjya(TfsjyaBean tfsjya) throws SQLException;
	
	/**
	 * 删除突发事件预案
	 * @param tfsjya
	 * @throws SQLException
	 */
	public void delTfsjya(TfsjyaBean tfsjya) throws SQLException;
	
	/**
	 * 根据突发事件预案编号查询突发事件预案
	 * @param yabh 预案编号
	 * @return
	 * @throws SQLException
	 */
	public TfsjyaBean queryTfsjyaByYabh(String yabh) throws SQLException;
	
	/**
	 * 根据机构编号查询突发事件预案
	 * @param jgbh
	 * @return
	 * @throws SQLException
	 */
	public List<TfsjyaBean> queryTfsjyaByJgbh(String jgbh) throws SQLException;
	
	/**
	 * 新增预案演练
	 * @param Yayl
	 * @return
	 * @throws SQLException
	 */
	public YaylBean insertYayl(YaylBean yayl) throws SQLException;
	
	/**
	 * 修改预案演练
	 * @param yayl
	 * @return
	 * @throws SQLException
	 */
	public YaylBean updateYayl(YaylBean yayl) throws SQLException;
	
	/**
	 * 删除预案演练
	 * @param yayl
	 * @throws SQLException
	 */
	public void delYayl(YaylBean yayl) throws SQLException;
	
	/**
	 * 根据编号查询预案演练
	 * @param bh 编号
	 * @return
	 * @throws SQLException
	 */
	public YaylBean queryYaylByBh(String bh) throws SQLException;
	
	/**
	 * 根据机构编号查询预案演练
	 * @param yabh
	 * @return
	 * @throws SQLException
	 */
	public List<YaylBean> queryYaylByYabh(String yabh) throws SQLException;
	
	/**
	 * 新增不安定因素
	 * @param Badys
	 * @return
	 * @throws SQLException
	 */
	public BadysBean insertBadys(BadysBean badys) throws SQLException;
	
	/**
	 * 修改不安定因素
	 * @param badys
	 * @return
	 * @throws SQLException
	 */
	public BadysBean updateBadys(BadysBean badys) throws SQLException;
	
	/**
	 * 删除不安定因素
	 * @param badys
	 * @throws SQLException
	 */
	public void delBadys(BadysBean badys) throws SQLException;
	
	/**
	 * 根据编号查询不安定因素
	 * @param bh 编号
	 * @return
	 * @throws SQLException
	 */
	public BadysBean queryBadysByBh(String bh) throws SQLException;
	
	/**
	 * 根据机构编号查询不安定因素
	 * @param jgbh
	 * @return
	 * @throws SQLException
	 */
	public List<BadysBean> queryBadysByJgbh(String jgbh) throws SQLException;
	
	/**
	 * 新增灾害事故
	 * @param Zhsg
	 * @return
	 * @throws SQLException
	 */
	public ZhsgBean insertZhsg(ZhsgBean zhsg) throws SQLException;
	
	/**
	 * 修改灾害事故
	 * @param zhsg
	 * @return
	 * @throws SQLException
	 */
	public ZhsgBean updateZhsg(ZhsgBean zhsg) throws SQLException;
	
	/**
	 * 删除灾害事故
	 * @param zhsg
	 * @throws SQLException
	 */
	public void delZhsg(ZhsgBean zhsg) throws SQLException;
	
	/**
	 * 根据编号查询灾害事故
	 * @param bh 编号
	 * @return
	 * @throws SQLException
	 */
	public ZhsgBean queryZhsgByBh(String bh) throws SQLException;
	
	/**
	 * 根据机构编号查询灾害事故
	 * @param jgbh
	 * @return
	 * @throws SQLException
	 */
	public List<ZhsgBean> queryZhsgByJgbh(String jgbh) throws SQLException;
	
	/**
	 * 新增安全隐患
	 * @param Aqyh
	 * @return
	 * @throws SQLException
	 */
	public AqyhBean insertAqyh(AqyhBean aqyh) throws SQLException;
	
	/**
	 * 修改安全隐患
	 * @param aqyh
	 * @return
	 * @throws SQLException
	 */
	public AqyhBean updateAqyh(AqyhBean aqyh) throws SQLException;
	
	/**
	 * 删除安全隐患
	 * @param aqyh
	 * @throws SQLException
	 */
	public void delAqyh(AqyhBean aqyh) throws SQLException;
	
	/**
	 * 根据编号查询安全隐患
	 * @param bh 编号
	 * @return
	 * @throws SQLException
	 */
	public AqyhBean queryAqyhByBh(String bh) throws SQLException;
	
	/**
	 * 根据机构编号查询安全隐患
	 * @param jgbh
	 * @return
	 * @throws SQLException
	 */
	public List<AqyhBean> queryAqyhByJgbh(String jgbh) throws SQLException;
	
	/**
	 * 根据预案编号查询预案演练
	 * @param yabh
	 * @param pageinfo
	 * @return
	 * @throws SQLException
	 */
	public PageResultInfo<YaylBean> queryYaylByYabh(String yabh,PageInfo pageinfo) throws SQLException;

	/**
	 * 根据机构编号删除特种行业
	 * @param jgbh
	 */
	public void deleteTzhy(String jgbh) throws SQLException;
	
	/**
	 * 根据机构编号删除公共场所
	 * @param jgbh
	 */
	public void deleteGgcs(String jgbh) throws SQLException;
	
	/**
	 * 根据机构编号删除企事业单位
	 * @param jgbh
	 */
	public void deleteNbdw(String jgbh) throws SQLException;
	
	/**
	 * 根据机构编号删除危险物品单位
	 * @param jgbh
	 */
	public void deleteWxwpdw(String jgbh) throws SQLException;
	
	/**
	 * 根据机构编号删除上网服务场所
	 * @param jgbh
	 */
	public void deleteSwfwcs(String jgbh) throws SQLException;
	
	/**
	 * 根据机构编号删除涉外单位
	 * @param jgbh
	 */
	public void deleteSwdw(String jgbh) throws SQLException;
	
	/**
	 * 根据机构编号删除特行旅馆业
	 * @param jgbh
	 */
	public void deleteThlg(String jgbh) throws SQLException;
	
	/**
	 * 根据机构编号删除特行开锁业
	 * @param jgbh
	 */
	public void deleteThKs(String jgbh) throws SQLException;
	
	/**
	 * 根据机构编号删除其他特种行业
	 * @param jgbh
	 */
	public void deleteQtth(String jgbh) throws SQLException;
	
	/**
	 * 查询特种行业
	 * @param pageInfo
	 * @param bean
	 * @return
	 * @throws SqlException
	 */
	public PageResultInfo<DwjbxxBean> queryTzhy(PageInfo pageInfo,QueryBean bean) throws SQLException;
	
	/**
	 * 查询公共场所
	 * @param pageInfo
	 * @param bean
	 * @return
	 * @throws SqlException
	 */
	public PageResultInfo<DwjbxxBean> queryGgcs(PageInfo pageInfo,QueryBean bean) throws SQLException;
	
	/**
	 * 查询企事业单位
	 * @param pageInfo
	 * @param bean
	 * @return
	 * @throws SqlException
	 */
	public PageResultInfo<DwjbxxBean> queryNbdw(PageInfo pageInfo,QueryBean bean) throws SQLException;
	
	/**
	 * 查询危险物品单位
	 * @param pageInfo
	 * @param bean
	 * @return
	 * @throws SqlException
	 */
	public PageResultInfo<DwjbxxBean> queryWxwpdw(PageInfo pageInfo,QueryBean bean) throws SQLException;
	
	/**
	 * 查询上网服务场所
	 * @param pageInfo
	 * @param bean
	 * @return
	 * @throws SqlException
	 */
	public PageResultInfo<DwjbxxBean> queryWb(PageInfo pageInfo,QueryBean bean) throws SQLException;
	
	/**
	 * 查询涉外单位
	 * @param pageInfo
	 * @param bean
	 * @return
	 * @throws SqlException
	 */
	public PageResultInfo<DwjbxxBean> querySwdw(PageInfo pageInfo,QueryBean bean) throws SQLException;
	
	/**
	 * 新增技防单位
	 * @param bean
	 * @return
	 * @throws SQLException
	 */
	public JfdwBean insertJfdw(JfdwBean bean) throws SQLException;
	
	/**
	 * 修改技防单位
	 * @param bean
	 * @return
	 */
	public JfdwBean updateJfdw(JfdwBean bean) throws SQLException;
	
	/**
	 * 删除技防单位
	 * @param jgbh
	 * @throws SQLException
	 */
	public void delJfwdw(String jgbh) throws SQLException;
	
	/**
	 * 根据机构编号查询技防单位
	 * @param jgbh
	 * @return
	 * @throws SQLException
	 */
	public JfdwBean queryJfdwByJgbh(String jgbh) throws SQLException;
	
	/**
	 * 根据机构编号删除特行旅馆
	 * @param jgbh
	 * @throws SQLException
	 */
	public void delLgByJgbh(String jgbh) throws SQLException;
	
	/**
	 * 根据机构编号删除开锁业
	 * @param jgbh
	 * @throws SQLException
	 */
	public void delKsyByJgbh(String jgbh) throws SQLException;
	
	/**
	 * 保存从业人员反馈信息
	 * @param cyryBean
	 * @throws Exception
	 */
	public void saveCyryfkxx(DwcyryBean cyryBean) throws Exception;
	
	/**
	 * 查询从业人员信息
	 * @param jgbh
	 * @param sfzh
	 * @return
	 * @date Feb 23, 2014 3:26:06 PM
	 */
	public int queryCyryByJgbhAndSfzh(String jgbh, String sfzh) throws Exception;
	
	/**
	 * 注销从业人员信息
	 * @param sfzh
	 * @throws Exception
	 * @date Feb 23, 2014 3:54:29 PM
	 */
	public void zxDwCyryxx(String sfzh) throws Exception;
	
	/**
	 * 保存要害部位照片信息
	 * @param yhbwbh
	 * @param uploads
	 * @param uploadsFileName
	 * @return
	 * @date Feb 25, 2014 2:00:43 PM
	 */
	public void insertZdyhbwZpBean(List<ZdyhbwZpBean> zpbeans);
	
	/**
	 * 查询要害部位照片信息
	 * @param bh
	 * @return
	 * @date Feb 25, 2014 2:38:18 PM
	 */
	public Blob queryYhbwzpxx(String bh);
	
	/**
	 * 查询重点要害部位照片
	 * @param queryBean
	 * @return
	 * @date Feb 25, 2014 4:11:22 PM
	 */
	public List<ZdyhbwZpBean> queryZdyhbwZpBeans(DwQueryBean queryBean);
	
	/**
	 * 删除重点要好部位照片
	 * @param bh
	 * @date Feb 25, 2014 4:12:06 PM
	 */
	public void deleteZdyhbwzpBean(String bh) throws Exception;
	
	/**
	 * 根据从业人员编号删除从业人员
	 * @param bean
	 * @throws SQLException
	 */
	public void deleteCyryByCyrybh(DwcyryBean bean) throws SQLException;
	
	/**
	 * 查询单位下的所有从业人员
	 * @param jgbh
	 * @return
	 * @throws SQLException
	 */
	public List<DwcyryBean> queryDwcyryList(String jgbh) throws SQLException;
	
	
	/**
	 * 根据从业人员编号s查询从业人员list
	 * @param cyrybhs
	 * @return
	 */
	public List<DwcyryBean> queryDwCyryListByCyrybhs(String cyrybhs);
	
	/**
	 * 根据从业人员queryBean 查询从业人员list
	 */
	public List<DwcyryBean> queryDwCyryListByQueryBean(CyryQueryBean queryBean);
	
	/**
	 * 根据jgbhs 查询单位list
	 * @param jgbhs
	 * @return
	 */
	public List<DwjbxxBean> queryDwListByJgbhs(String jgbhs);
	
	/**
	 * 根据DwQueryBean 查询单位List
	 * @param queryBean
	 * @return
	 */
	public List<DwjbxxBean> queryDwListByDwQueryBean(DwQueryBean queryBean);
	
	/**
	 * 新增从业人员派发信息
	 * @param bean
	 * @throws SQLException
	 */
	public void insertCyryPfxx(CyryPfBean bean) throws SQLException;
	
	/**
	 * 更新从业人员居住地社区
	 * @param cyrybh
	 * @param jzdsqdm
	 * @param jzdsqmc
	 * @throws SQLException
	 */
	public void updateCyryJzdsq(CyryPfBean bean) throws SQLException;
	
	/**
	 * 新增技防单位年审信息
	 * @param bean
	 * @return
	 * @throws SQLException
	 */
	public void insertJfdwNsxx(JfdwNsxxBean bean) throws SQLException;
	
	/**
	 * 修改技防单位年审
	 * @param bean
	 * @return
	 * @throws SQLException
	 */
	public void updateJfdwNsxx(JfdwNsxxBean bean) throws SQLException;
	
	/**
	 * 查询年审列表
	 * @return
	 * @throws SQLException
	 */
	public PageResultInfo<JfdwNsxxBean> queryJfdwNsxxList(String jgbh,PageInfo page) throws SQLException;
	
	/**
	 * 查询技防单位年审信息
	 * @param jgbh
	 * @return
	 * @throws SQLException
	 */
	public List<JfdwNsxxBean> queryJfdwNsxx(DwQueryBean query) throws SQLException;
	
	/**
	 * 内保单位统计， 按各类别统计
	 */
	public PageResultInfo<NbDwTjBean> queryNbdwlbtjPageResultInfo(PageInfo page,DwQueryBean dwcx,String dwtjjb);
	
	/**
	 * 查询从业人员派发列表
	 * @param page
	 * @param queryBean
	 * @return
	 * @throws SQLException
	 */
	public PageResultInfo<CyryPfListBean> queryCyryPfList(PageInfo page,CyryQueryBean queryBean) throws SQLException;
	
	/**
	 * 修改单位基本信息的操作时间
	 * @param jgbh
	 * @throws SQLException
	 */
	public void updateDwjbxxCzsj(String jgbh) throws SQLException;
	
	/**
	 * 查询安全检查列表
	 * @param query
	 * @param pageinfo
	 * @return
	 * @throws SQLException
	 */
	public PageResultInfo<DwaqjcBean> queryAqjcList(QueryBean query,
			PageInfo pageinfo) throws SQLException;
	
	public List<DwaqjcBean> queryAqjcList(QueryBean query) throws SQLException;
	
	/**
	 * 根据机构编号查询单位（以in的方式查询）
	 * @param jgbhs
	 * @return
	 * @throws SQLException
	 */
	public List<DwjbxxBean> queryDwjbxxBYJgbhs(String jgbh) throws SQLException;
	
	/**
	 * 分页查询内保单位
	 * @param query
	 * @param pageinfo
	 * @return
	 */
	public PageResultInfo<DwjbxxBean> queryNbdwPageResultInfo(QueryBean query,PageInfo pageinfo) throws SQLException;

	/**
	 * 从业人员统计分析
	 * @param cyrycx
	 * @return
	 * @throws Exception
	 */
	public  List<CyrytjBean> queryCyryTjList(CyryQueryBean cyrycx) throws Exception ;
}
