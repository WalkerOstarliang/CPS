package com.chinacreator.zagl.services;

import java.io.File;
import java.io.Serializable;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.List;

import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.bean.QueryBean;
import com.chinacreator.common.cps.bean.DzxxBean;
import com.chinacreator.lsgl.bean.RkxxBean;
import com.chinacreator.zagl.bean.AqyhBean;
import com.chinacreator.zagl.bean.BadysBean;
import com.chinacreator.zagl.bean.BwjgBean;
import com.chinacreator.zagl.bean.BwjysBean;
import com.chinacreator.zagl.bean.BwzdBean;
import com.chinacreator.zagl.bean.CyryPfBean;
import com.chinacreator.zagl.bean.CyryPfListBean;
import com.chinacreator.zagl.bean.CyrytjBean;
import com.chinacreator.zagl.bean.DwAqsbBean;
import com.chinacreator.zagl.bean.DwBean;
import com.chinacreator.zagl.bean.DwabryBean;
import com.chinacreator.zagl.bean.DwabssBean;
import com.chinacreator.zagl.bean.DwaqjcBean;
import com.chinacreator.zagl.bean.DwcyryBean;
import com.chinacreator.zagl.bean.DwjbxxBean;
import com.chinacreator.zagl.bean.DwjcBean;
import com.chinacreator.zagl.bean.DwzpxxBean;
import com.chinacreator.zagl.bean.JfdwNsxxBean;
import com.chinacreator.zagl.bean.NbDwTjBean;
import com.chinacreator.zagl.bean.TfsjyaBean;
import com.chinacreator.zagl.bean.YaylBean;
import com.chinacreator.zagl.bean.ZdyhbwBean;
import com.chinacreator.zagl.bean.ZdyhbwZpBean;
import com.chinacreator.zagl.bean.ZhsgBean;
import com.chinacreator.zagl.query.CyryQueryBean;
import com.chinacreator.zagl.query.DwQueryBean;

public interface DwService extends Serializable{
	/**
	 * 保存单位信息
	 * @param bean 单位信息
	 * @return
	 * @throws Exception
	 */
	public DwBean saveDw(DwBean bean) throws Exception;
	
	/**
	 * 根据机构编号查询单位
	 * @param jgbh 机构编号
	 * @return
	 * @throws Exception
	 */
	public DwBean queryDwByJgbh(String jgbh) throws Exception;
	
	/**
	 * 查询单位基本信息
	 * @param jgbh
	 * @return
	 * @throws Exception
	 * @date 2013-10-12 下午06:56:14
	 */
	public DwBean queryDwJbxxByJgbh(String jgbh) throws Exception;
	
	/**
	 * 根据条件分页查询单位基本信息
	 * @param pageInfo 分页信息
	 * @param bean 查询条件
	 * @return
	 * @throws Exception
	 */
	public PageResultInfo<DwjbxxBean> queryDwjbxxPageResultInfo(PageInfo pageInfo , DwQueryBean bean) throws SQLException;
	
	/**
	 * 分页查询内保单位
	 * @param pageInfo
	 * @param bean
	 * @return
	 * @throws SQLException
	 */
	public PageResultInfo<DwjbxxBean> queryNbdwPageResultInfo (PageInfo pageInfo , DwQueryBean bean) throws SQLException;
	
	/**
	 * 根据编号查询安保人员
	 * @param bh 编号
	 * @return
	 * @throws Exception
	 */
	public DwabryBean queryAbryByBh(String bh) throws Exception;
	
	/**
	 * 根据机构编号查询单位安保人员
	 * @param jgbh 机构编号
	 * @return
	 * @throws Exception
	 */
	public List<DwabryBean> queryAbryListByJgbh(String jgbh) throws Exception;
	
	/**
	 * 根据设施编号查询安保设施
	 * @param ssbh 设施编号
	 * @return
	 * @throws Exception
	 */
	public DwabssBean queryAbssBySsbh(String ssbh) throws Exception;
	
	/**
	 * 根据机构编号查询单位安保设施
	 * @param jgbh
	 * @return
	 * @throws Exception
	 */
	public List<DwabssBean> queryAbssListByjgbh(String jgbh) throws Exception;
	
	/**
	 * 根据编号查询单位安全检查
	 * @param jlbh
	 * @return
	 * @throws Exception
	 */
	public DwaqjcBean queryAqjcByJlbh(String jlbh) throws Exception;
	
	/**
	 * 根据机构编号查询单位安全检查信息
	 * @param jgbh
	 * @return
	 * @throws Exception
	 */
	public List<DwaqjcBean> queryAqjcListByJgbh(String jgbh) throws Exception;
	
	/**
	 * 分页查询单位安全检查信息
	 * @param pageInfo
	 * @param queryBean
	 * @return
	 * @date 2013-10-17 上午10:10:07
	 */
	public PageResultInfo<DwaqjcBean> queryDwAqjcPageResultInfoByJgbh(PageInfo pageInfo,DwQueryBean queryBean);
	
	/**
	 * 根据查询条件分页查询从业人员
	 * @param pageIngo
	 * @param bean
	 * @return
	 */
	public PageResultInfo<DwcyryBean> queryCyryPageResultInfo(PageInfo pageInfo,QueryBean bean) throws Exception;
	
	/**
	 * 根据从业人员编号查询从业人员
	 * @param cyrybh 从业人员编号
	 * @return
	 */
	public DwcyryBean queryCyryByCyrybh(String cyrybh) throws Exception;
	
	/**
	 * 根据编号查询单位奖惩信息
	 * @param bh
	 * @return
	 * @throws Exception
	 */
	public DwjcBean queryDwjcByBh(String bh) throws Exception;
	
	/**
	 * 根据机构编号查询单位奖惩信息
	 * @param jgbh
	 * @return
	 * @throws Exception
	 */
	public List<DwjcBean> queryDwjcListByJgbh(String jgbh) throws Exception;
	
	/**
	 * 根据要害部位编号查询重点要害部位信息
	 * @param yhbwbh
	 * @return
	 * @throws Exception
	 */
	public ZdyhbwBean queryZdthByYhbwbh(String yhbwbh) throws Exception;
	
	/**
	 * 根据机构编号查询单位重点要害部位
	 * @param jgbh
	 * @return
	 * @throws Exception
	 */
	public List<ZdyhbwBean> queryZdyhbwListByJgbh(String jgbh) throws Exception;
	
	/**
	 * 根据机构编号查询单位照片
	 * @param jgbh
	 * @return
	 * @throws Exception
	 */
	public List<DwzpxxBean> queryDwzpByJgbh(String jgbh) throws Exception;
	
	/**
	 * 根据照片ID查询照片
	 * @param zpid
	 * @return
	 * @throws Exception
	 */
	public Blob queryDwzpById(String zpid) throws Exception;
	
	/**
	 * 删除单位照片
	 * @param zpid
	 * @throws Exception
	 */
	public void deleteDwzp(String zpid) throws Exception;
	
	/**
	 * 根据地址id查询地址信息
	 * @param dzid
	 * @throws Exception
	 */
	public DzxxBean queryDzxxByDzid(String dzid) throws Exception;
	
	/**
	 * 保存单位基本信息
	 * @param dwBean
	 * @return
	 * @throws Exception
	 * @date 2013-10-14 上午11:31:12
	 */
	public DwBean saveDwJbxxBean(DwBean dwBean) throws Exception;
	
	/**
	 * 保存特种行业对象
	 * @param dwBean
	 * @return
	 * @throws Exception
	 * @date 2013-10-14 上午11:30:56
	 */
	public DwBean saveTzhyBean(DwBean dwBean) throws Exception;
	
	/**
	 * 保存公共场所信息
	 * @param dwBean
	 * @return
	 * @throws Exception
	 * @date 2013-10-15 下午01:45:07
	 */
	public DwBean saveGGCSBean(DwBean dwBean) throws Exception;
	
	/**
	 * 保存内保单位
	 * @param dwBean
	 * @return
	 * @throws Exception
	 * @date 2013-10-15 下午04:30:10
	 */
	public DwBean saveNbdwBean(DwBean dwBean) throws Exception;
	
	/**
	 * 保存上网服务场所
	 * @param dwBean
	 * @return
	 * @throws Exception
	 * @date 2013-10-15 下午05:57:59
	 */
	public DwBean saveSwfwcsBean(DwBean dwBean) throws Exception;
	
	/**
	 * 通过机构编号查询行业信息
	 * @param jghb
	 * @param hylb
	 * @return
	 * @throws Exception
	 * @date 2013-10-14 下午03:24:06
	 */
	public DwBean queryDwHyInfo(String jghb, String hylb) throws Exception;
	
	/**
	 * 保存涉外单位
	 * @param dwBean
	 * @return
	 * @throws Exception
	 * @date 2013-10-16 上午09:13:45
	 */
	public DwBean saveSwdwBean(DwBean dwBean) throws Exception;
	
	/**
	 * 保存危险物品单位
	 * @param dwBean
	 * @return
	 * @throws Exception
	 * @date 2013-10-16 上午10:41:53
	 */
	public DwBean saveWxwpdwBean(DwBean dwBean) throws Exception;

	/**
	 * 保存单位照片
	 * @param zps
	 * @param zpsFileName
	 * @return
	 * @date 2013-10-16 下午02:45:33
	 */
	public DwBean saveDwzpBean(DwBean dwBean) throws Exception;
	
	/**
	 * 保存从业人员
	 * @param dwBean
	 * @return
	 * @throws Exception
	 * @date 2013-10-16 下午04:12:23
	 */
	public DwBean saveCyryBean(DwBean dwBean,RkxxBean rkBean) throws Exception;
	
	/**
	 * 保存单位安全检查信息
	 * @param dwBean
	 * @return
	 * @throws Exception
	 * @date 2013-10-17 上午09:28:41
	 */
	public DwBean saveDwAqjcBean(DwBean dwBean) throws Exception;
	
	/**
	 * 保存单奖惩信息
	 * @param dwBean
	 * @return
	 * @throws Exception
	 * @date 2013-10-17 上午11:15:41
	 */
	public DwBean saveDwJcxxBean(DwBean dwBean) throws Exception;
	
	/**
	 * 保存重点要害部位
	 * @param dwBean
	 * @return
	 * @throws Exception
	 * @date 2013-10-17 下午02:59:36
	 */
	public DwBean saveZdyhbwBean(DwBean dwBean) throws Exception;
	
	/**
	 * 通过机构编号分页查询
	 * @param pageInfo
	 * @param jgbh
	 * @return
	 * @date 2013-10-17 上午11:20:41
	 */
	public PageResultInfo<DwjcBean> queryDwjcPageResultInfo(PageInfo pageInfo, String jgbh);
	
	/**
	 * 查询重点要害部位分页
	 * @param pageInfo
	 * @param jgbh
	 * @return
	 * @date 2013-10-17 下午03:07:55
	 */
	public PageResultInfo<ZdyhbwBean> queryZdyhbwPageResultInfoByJgbh(PageInfo pageInfo, String jgbh);
	
	/**
	 * 注销单位 可批量注销，多个机构编号用逗号隔开
	 * @param jgbh 机构编号
	 */
	public void delDwByJgbh(String jgbh) throws Exception;
	
	/**
	 * 注销单位
	 * @param dw
	 * @throws Exception
	 */
	public void delDw(DwjbxxBean dw) throws Exception;
	
	/**
	 * 恢复注销单位 可批量恢复 ，多个机构编号用逗号隔开
	 * @param jgbh 机构编号
	 * @throws Exception
	 */
	public void resetDwByJgbh(String jgbh) throws Exception;
	
	/**
	 * 恢复单位
	 * @param dw
	 * @throws Exception
	 */
	public void resetDw(DwjbxxBean dw) throws Exception;
	
	/**
	 * 保存单位安全设备
	 * @param dw
	 * @return
	 * @throws Exception
	 */
	public DwBean saveDwAqsb(DwBean dw) throws Exception;
	
	/**
	 * 根据机构编号查询单位安全设备信息
	 * @param jgbh
	 * @return
	 * @throws Exception
	 */
	public DwAqsbBean queryDwAqsbByJgbh(String jgbh) throws Exception;
	
	/**
	 * 注销 从业人人员 可批量操作 多个从业人员编号用逗号隔开
	 * @param cyrybh
	 * @throws Exception
	 */
	public void delCyryByCyryBh(String cyrybh) throws Exception;
	
	/**
	 * 恢复 从业人人员 可批量操作 多个从业人员编号用逗号隔开
	 * @param cyrybh
	 * @throws Exception
	 */
	public void resetCyryByCyryBh(String cyrybh) throws Exception;
	
	
	/**
	 * 保存保卫机构
	 * @param dw
	 * @return
	 * @throws Exception
	 */
	public DwBean saveBwjgBean(DwBean dw) throws Exception;
	
	/**
	 * 删除保卫机构
	 * @param bwjgbh
	 * @throws Exception
	 */
	public void delBwjg(String bwjgbh)throws Exception;
	
	/**
	 * 根据保卫机构编号查询保卫机构
	 * @param bwjgbh 保卫机构编号
	 * @return
	 * @throws Exception
	 */
	public BwjgBean queryBwjgByBwjgbh(String bwjgbh) throws Exception;
	
	/**
	 * 根据机构编号查询保卫机构
	 * @param jgbh
	 * @return
	 * @throws Exception
	 */
	public List<BwjgBean> queryBwjgByJgbh(String jgbh) throws Exception;
	
	/**
	 * 保存保卫制度
	 * @param dw
	 * @return
	 * @throws Exception
	 */
	public DwBean saveBwzdBean(DwBean dw) throws Exception;
	
	/**
	 * 删除保卫制度
	 * @param zdbh
	 * @throws Exception
	 */
	public void delBwzd(String zdbh)throws Exception;
	
	/**
	 * 根据保卫制度编号查询保卫制度
	 * @param zdbh 保卫制度编号
	 * @return
	 * @throws Exception
	 */
	public BwzdBean queryBwzdByBwzdbh(String zdbh) throws Exception;
	
	/**
	 * 根据机构编号查询保卫制度
	 * @param jgbh
	 * @return
	 * @throws Exception
	 */
	public List<BwzdBean> queryBwzdByJgbh(String jgbh) throws Exception;
	
	/**
	 * 保存保卫建议书
	 * @param dw
	 * @return
	 * @throws Exception
	 */
	public DwBean saveBwjys(DwBean dw) throws Exception;
	
	/**
	 * 删除保卫建议书
	 * @param jysbh
	 * @throws Exception
	 */
	public void delBwjys(String jysbh) throws Exception;
	
	/**
	 * 根据建议书编号查询保卫建议书
	 * @param jysbh
	 * @return
	 * @throws Exception
	 */
	public BwjysBean queryBwjysByJysbh(String jysbh) throws Exception;
	 
	/**
	 * 根据机构编号查询建议书
	 * @param jgbh
	 * @return
	 * @throws Exception
	 */
	public List<BwjysBean> queryBwjysByJgbh(String jgbh) throws Exception;
	
	/**
	 * 保存突发事件预案
	 * @param dw
	 * @return
	 * @throws Exception
	 */
	public DwBean saveTfsjya(DwBean dw) throws Exception;
	
	/**
	 * 删除突发事件预案
	 * @param yabh
	 * @throws Exception
	 */
	public void delTfsjya(String yabh) throws Exception;
	
	/**
	 * 根据预案编号查询突发事件预案
	 * @param yabh
	 * @return
	 * @throws Exception
	 */
	public TfsjyaBean queryTfsjyaByYabh(String yabh) throws Exception;
	
	/**
	 * 根据机构编号查询突发事件预案
	 * @param jgbh
	 * @return
	 * @throws Exception
	 */
	public List<TfsjyaBean> queryTfsjyaByJgbh(String jgbh) throws Exception;
	
	/**
	 * 保存预案演练
	 * @param dw
	 * @return
	 * @throws Exception
	 */
	public DwBean saveYayl(DwBean dw) throws Exception;
	
	/**
	 * 删除预案演练
	 * @param bh
	 * @throws Exception
	 */
	public void delYayl(String bh) throws Exception;
	
	/**
	 * 根据编号查询预案演练
	 * @param bh
	 * @return
	 * @throws Exception
	 */
	public YaylBean queryYaylByBh(String bh) throws Exception;
	
	/**
	 * 根据预案编号查询预案演练
	 * @param yabh
	 * @throws Exception
	 */
	public List<YaylBean> queryYaylByYabh(String yabh) throws Exception;
	
	/**
	 * 保存不安定因素
	 * @param dw
	 * @return
	 * @throws Exception
	 */
	public DwBean saveBadys(DwBean dw) throws Exception;
	
	/**
	 * 删除不安定因素
	 * @param bh
	 * @throws Exception
	 */
	public void delBadys(String bh) throws Exception;
	
	/**
	 * 根据编号查询不安定因素
	 * @param bh
	 * @return
	 * @throws Exception
	 */
	public BadysBean queryBadysByBh(String bh) throws Exception;
	
	/**
	 * 根据机构编号查询不安定因素
	 * @param jgbh
	 * @return
	 * @throws Exception
	 */
	public List<BadysBean> queryBadysByJgbh(String jgbh) throws Exception;
	
	/**
	 * 保存灾害事故
	 * @param dw
	 * @return
	 * @throws Exception
	 */
	public DwBean saveZhsg(DwBean dw) throws Exception;
	
	/**
	 * 删除灾害事故
	 * @param bh
	 * @throws Exception
	 */
	public void delZhsg(String bh) throws Exception;
	
	/**
	 * 根据编号查询灾害事故
	 * @param bh
	 * @return
	 * @throws Exception
	 */
	public ZhsgBean queryZhsgByBh(String bh) throws Exception;
	
	/**
	 * 根据机构编号查询灾害事故
	 * @param jgbh
	 * @return
	 * @throws Exception
	 */
	public List<ZhsgBean> queryZhsgByJgbh(String jgbh) throws Exception;
	
	/**
	 * 保存安全隐患
	 * @param dw
	 * @return
	 * @throws Exception
	 */
	public DwBean saveAqyh(DwBean dw) throws Exception;
	
	/**
	 * 删除安全隐患
	 * @param bh
	 * @throws Exception
	 */
	public void delAqyh(String bh) throws Exception;
	
	/**
	 * 根据编号查询安全隐患
	 * @param bh
	 * @return
	 * @throws Exception
	 */
	public AqyhBean queryAqyhByBh(String bh) throws Exception;
	
	/**
	 * 根据机构编号查询安全隐患
	 * @param jgbh
	 * @return
	 * @throws Exception
	 */
	public List<AqyhBean> queryAqyhByJgbh(String jgbh) throws Exception;
	
	/**
	 * 根据预案编号查询预案演练
	 * @param yabh
	 * @param pageinfo
	 * @return
	 * @throws Exception
	 */
	public PageResultInfo<YaylBean> queryYaylByYabh(String yabh,PageInfo pageinfo) throws Exception;
	
	/**
	 * 保存安保设施
	 * @param dw
	 * @return
	 * @throws Exception
	 */
	public DwBean saveAbssBean(DwBean dw) throws Exception;
	
	/**
	 * 删除安保设施
	 * @param ssbh
	 * @throws Exception
	 */
	public void delAbss(String ssbh) throws Exception;
	
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
	public int queryCyryByJgbhAndSfzh(String jgbh, String sfzh);
	
	/**
	 * 保存重点要害部位照片信息
	 * @param yhbwbh
	 * @param uploads
	 * @param uploadsFileName
	 * @return
	 * @date Feb 25, 2014 11:40:29 AM
	 */
	public List<ZdyhbwZpBean> saveZdyhbwZpBean(String yhbwbh, File[] uploads, String[] uploadsFileName);
	
	/**
	 * 查询要害部位照片
	 * @param bh
	 * @return
	 * @date Feb 25, 2014 2:35:54 PM
	 */
	public Blob queryYhbwzp(String bh);
	
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
	 * @param cyrybh
	 */
	public void delteCyryByCyrybh(String cyrybh);
	
	/**
	 * 根据机构编号查询单位下所有从业人员
	 * @param jgbh
	 * @return
	 */
	public List<DwcyryBean> queryDwcyryList(String jgbh);
	
	
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
	 * 从业人员派发
	 * @param bean
	 */
	public void cyrypf(CyryPfBean bean);
	
	/**
	 * 保存技防单位年审信息
	 * @param bean
	 * @return
	 */
	public JfdwNsxxBean saveJfwdwNsxx(JfdwNsxxBean bean);
	
	/**
	 * 根据机构编号查询技防单位年审信息
	 * @param jgbh
	 * @return
	 */
	public PageResultInfo<JfdwNsxxBean> queryJfdwNsxxByJgbh(String jgbh,PageInfo page);
	
	/**
	 * 查询技防单位年审信息
	 * @param queryBean
	 * @return
	 */
	public List<JfdwNsxxBean> queryJfdwNsxx(DwQueryBean queryBean);
	
	/**
	 * 内保单位统计，按各类别统计
	 */
	public PageResultInfo<NbDwTjBean> queryNbdwlbtjPageResultInfo(PageInfo page,DwQueryBean dwcx,String dwtjjb);
	
	/**
	 * 查询从业人员派发列表
	 * @param pageinfo
	 * @param bean
	 * @return
	 */
	public PageResultInfo<CyryPfListBean> queryCyryPfList(PageInfo pageinfo,CyryQueryBean bean);
	
	/**
	 * 查询安全检查列表
	 * @param query
	 * @param pageinfo
	 * @return
	 */
	public PageResultInfo<DwaqjcBean> queryAqjcList(QueryBean query,PageInfo pageinfo);
	
	/**
	 * 导出安全检查
	 * @param query
	 * @return
	 */
	public List<DwaqjcBean> queryAqjcList(QueryBean query);
	
	/**
	 * 检查单位
	 * @param jgbh 
	 * @return 检查代码 0：存在从业人员   1：已提交审核
	 */
	public String checkDw(String jgbh);
	
	public List<CyrytjBean> queryCyryTjList(CyryQueryBean cyrycx);
}
