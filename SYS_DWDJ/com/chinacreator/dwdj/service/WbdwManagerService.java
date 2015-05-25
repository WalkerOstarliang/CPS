package com.chinacreator.dwdj.service;

import java.io.Serializable;
import java.util.List;

import com.chinacreator.common.bean.LoginInfo;
import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.bean.QueryBean;
import com.chinacreator.common.helper.ActionContextHelper;
import com.chinacreator.dwdj.bean.WbdwJdhxBean;
import com.chinacreator.dwdj.bean.WbdwQzjcBean;
import com.chinacreator.dwdj.bean.WbdwShBean;
import com.chinacreator.dwdj.bean.WbdwWxhxBean;

public interface WbdwManagerService extends Serializable {

		LoginInfo login = ActionContextHelper.getLoginInfo();
		/**
		 * 危爆单位枪支检查新增或修改
		 * @param qzjcBean
		 * @return
		 */
		public boolean insertQzjcBean(WbdwQzjcBean qzjcBean);
		/**
		 * 危爆单位枪支检查历史查询
		 * @param pageInfo
		 * @param queryBean
		 * @return
		 */
		public PageResultInfo<WbdwQzjcBean> queryWbdwQzjcResultInfoByJgbh(PageInfo pageInfo, WbdwQzjcBean queryBean);
		public PageResultInfo<WbdwQzjcBean> queryWbdwQzjcResultInfoById(PageInfo pageInfo, WbdwQzjcBean queryBean);
		
		/**
		 * 危爆单位枪支检查历史查询
		 * @param pageInfo
		 * @param queryBean
		 * @return
		 */
		public PageResultInfo<WbdwQzjcBean> queryWbdwQzjcPageResultInfoByJgbh(PageInfo pageInfo, WbdwQzjcBean queryBean);
		
		
		
		/**
		 * 危爆单位剧毒化学新增或修改
		 * @param jdhxBean
		 * @return
		 */
		public boolean insertJdhxBean(WbdwJdhxBean jdhxBean);
		/**
		 * 危爆单位剧毒化学历史查询通过机构编号
		 * @param pageInfo
		 * @param queryBean
		 * @return
		 */
		public PageResultInfo<WbdwJdhxBean> queryWbdwJdhxPageResultInfoByJgbh(PageInfo pageInfo, WbdwJdhxBean queryBean);
		/**
		 * 危爆单位剧毒化学历史查询通过id
		 * @param pageInfo
		 * @param queryBean
		 * @return
		 */
		public PageResultInfo<WbdwJdhxBean> queryWbdwJdhxPageResultInfoById(PageInfo pageInfo, WbdwJdhxBean queryBean);
		
		/**
		 * 危爆单位危险化学新增或修改
		 * @param wxhxBean
		 * @return
		 */
		public boolean insertWxhxBean(WbdwWxhxBean wxhxBean);
		/**
		 * 危爆单位危险化学历史查询通过机构编号
		 * @param pageInfo
		 * @param queryBean
		 * @return
		 */
		public PageResultInfo<WbdwWxhxBean> queryWbdwWxhxPageResultInfoByJgbh(PageInfo pageInfo, WbdwWxhxBean queryBean);
		/**
		 * 危爆单位危险化学历史查询通过id
		 * @param pageInfo
		 * @param queryBean
		 * @return
		 */
		public PageResultInfo<WbdwWxhxBean> queryWbdwWxhxPageResultInfoById(PageInfo pageInfo, WbdwWxhxBean queryBean);

		/**
		 * 新增危爆单位审核
		 * @param bean
		 * @return
		 */
		public boolean insertWbdwsh(WbdwShBean bean) throws Exception;
		
		/**
		 * 根据机构编号查询危爆单位审核
		 * @param jgbh
		 * @return
		 */
		public List<WbdwShBean> queryWbdwShByJgbh(String jgbh); 
		
		/**
		 * 查询危爆单位列表
		 * @param pageInfo
		 * @param query
		 * @return
		 */
		public PageResultInfo<WbdwShBean> queryWbDwShList(PageInfo pageInfo,QueryBean query);
		
		/**
		 * 根据id查询危爆单位审核
		 * @param shid
		 * @return
		 */
		public WbdwShBean queryWbdwShById(String shid);
		
		/**
		 * 危爆单位审核
		 * @param bean 审核状态 0：未审核  1：审核通过  2：审核未通过   操作状态 1：新增  4：注销  5：恢复
		 */
		public boolean WbdwSh(WbdwShBean bean) throws Exception;
}
