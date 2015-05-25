package com.chinacreator.gzgl.service;

import java.io.File;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.transaction.RollbackException;

import com.chinacreator.common.bean.LoginInfo;
import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.helper.ActionContextHelper;
import com.chinacreator.common.helper.CommonDBBaseHelper;
import com.chinacreator.common.helper.DateTimeHelper;
import com.chinacreator.common.helper.ValidateHelper;
import com.chinacreator.gzgl.bean.MinjChuliBean;
import com.chinacreator.gzgl.bean.MinjingBean;
import com.chinacreator.gzgl.bean.RenwuBean;
import com.chinacreator.gzgl.bean.RenwuJiegBean;
import com.chinacreator.gzgl.bean.RwfjBean;
import com.chinacreator.gzgl.dao.RenwuDao;
import com.chinacreator.gzgl.query.RenwuQuery;
import com.chinacreator.gzgl.util.GZGLCommonStatuts;
import com.frameworkset.orm.transaction.TransactionManager;

/**
 * 任务派发服务
 * @author royee
 *
 */
public class RenwuService extends GzglBaseService
{
	/**
	 * 提交任务bean
	 * @param renwu
	 * @param rwUploadsFileName 
	 * @param rwUploads 
	 * @param fjBean 
	 * @param fkUploadsFileName 
	 * @param fkUploads 
	 */
	public boolean submitRenwuBean(RenwuBean renwu, RwfjBean fjBean, File rwUploads, String rwUploadsFileName, File fkUploads, String fkUploadsFileName)
	{
		boolean flag = false;
		if (ValidateHelper.isEmptyCollection(renwu.getMjins()))
		{
			flag = false;
		}
		
		String gxsj = DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss");
		renwu.setGxsj(gxsj);
		
		TransactionManager tm = new TransactionManager();
		try
		{
			tm.begin();
			//保存任务数据
			if(CommonConstant.OPERTYPE_ADD.equals(renwu.getOp())){           //新增任务
				String bh = CommonDBBaseHelper.getSequence(CommonConstant.DBNAME_SQJW, "SEQ_GZGL_RWPF");
				renwu.setBh(bh);
				String fjbh = CommonDBBaseHelper.getSequence(CommonConstant.DBNAME_SQJW, "SEQ_GZGL_RWFJ");
				fjBean = new RwfjBean();
				fjBean.setId(fjbh);
				fjBean.setFjlx("1");//派发任务附件
				fjBean.setTitle(rwUploadsFileName);
				fjBean.setFj(rwUploads);
				
				LoginInfo loginUser = ActionContextHelper.getLoginInfo();
				renwu.setDjrjh(loginUser.getUsername());
				
				renwu.setSfqs(GZGLCommonStatuts.SFQS_WQS);
				
				renwu.setCzbz(GZGLCommonStatuts.CZBZ_ADD);
				renwu.setRwwcqk(GZGLCommonStatuts.RWWCQK_WWC);
				renwu.setRwfjid(fjbh);
				String rwmjBh = null;
				List<MinjingBean> minjs = new ArrayList<MinjingBean>();
				
				for (MinjingBean minj : renwu.getMjins())
				{
					rwmjBh = CommonDBBaseHelper.getSequence(CommonConstant.DBNAME_SQJW, "SEQ_GZGL_RWPFMJ");
					minj.setId(rwmjBh);
					minj.setRwbh(bh);
					//minjs.add(minj);
					if(CommonConstant.OPERTYPE_ADD.equals(minj.getOp())){	
						minjs.add(minj);
					}
				}
				
				//新增附件
				RenwuDao.insertRenwuFj(fjBean);
				//新增任务
				RenwuDao.insertRenwuBean(renwu);
				//批量新增任务责任民警
				RenwuDao.batchInsertMinjs(minjs);
			}else if(CommonConstant.OPERTYPE_UPDATE.equals(renwu.getOp())){     //修改任务
				renwu.setCzbz(GZGLCommonStatuts.CZBZ_UPDATE);
				RenwuDao.updateRenwu(renwu);        //修改任务
				if(fjBean!=null&&rwUploadsFileName!=null){
					//fjBean = RenwuDao.getRwfjBeanById(renwu.getRwfjid());
					fjBean.setFj(rwUploads);
					fjBean.setTitle(rwUploadsFileName);
					RenwuDao.updateRwfj(fjBean);
				}else if(fjBean==null){
					String fjbh = CommonDBBaseHelper.getSequence(CommonConstant.DBNAME_SQJW, "SEQ_GZGL_RWFJ");
					fjBean = new RwfjBean();
					renwu.setRwfjid(fjbh);
					fjBean.setId(fjbh);
					fjBean.setFjlx("1");//派发任务附件
					fjBean.setTitle(rwUploadsFileName);
					fjBean.setFj(rwUploads);
					RenwuDao.insertRenwuFj(fjBean);
				}
				
				//修改执行民警
				List<MinjingBean> addList = new ArrayList<MinjingBean>();
				List<MinjingBean> delList = new ArrayList<MinjingBean>();
				for(MinjingBean mj : renwu.getMjins()){
					if(CommonConstant.OPERTYPE_ADD.equals(mj.getOp())){
						String rwmjBh = CommonDBBaseHelper.getSequence(CommonConstant.DBNAME_SQJW, "SEQ_GZGL_RWPFMJ");
						mj.setId(rwmjBh);
						mj.setRwbh(renwu.getBh());
						addList.add(mj);
					}else if(CommonConstant.OPERTYPE_DELETE.equals(mj.getOp())){
						delList.add(mj);
					}
				}
				RenwuDao.batchInsertMinjs(addList);
				RenwuDao.batchDelmj(delList);
			}else if(CommonConstant.OPERTYPE_FK.equals(renwu.getOp())){               //反馈任务
				RenwuJiegBean cljg = null;
				if(renwu.getRwCljg().size()>0){
					cljg = renwu.getRwCljg().get(renwu.getRwCljg().size()-1);
				}
				
				renwu.setRwfkzt(GZGLCommonStatuts.FKZT_YFK);
				renwu.setRwwcqk(cljg.getCljg());
				renwu.setSjwcsj(cljg.getWcsj());
				renwu.setCljgms(cljg.getWcqkms());
				renwu.setSjclmjxm(ActionContextHelper.getLoginInfo().getRealname());
				
				
				fkRenwu(renwu);
				String fjbh = CommonDBBaseHelper.getSequence(CommonConstant.DBNAME_SQJW, "SEQ_GZGL_RWFJ");
				fjBean = new RwfjBean();
				fjBean.setId(fjbh);
				fjBean.setFjlx("2");//派发反馈附件
				fjBean.setTitle(fkUploadsFileName);
				fjBean.setFj(fkUploads);
				RenwuDao.insertRenwuFj(fjBean);
				
				String rwmjclBh = CommonDBBaseHelper.getSequence(CommonConstant.DBNAME_SQJW, "SEQ_GZGL_RWPFMJCL");
				cljg.setId(rwmjclBh);
				cljg.setFjid(fjbh);
				cljg.setRwbh(renwu.getBh());
				RenwuDao.addRenwuCljg(cljg);
				
				
			}
			
			tm.commit();
			flag = true;
		}
		catch (Exception e)
		{
			flag = false;
			try
			{
				tm.rollback();
			}
			catch (RollbackException e1)
			{
				e1.printStackTrace();
			}
			e.printStackTrace();
		}
		return flag;
	}
	
	/**
	 * 查询任务派发列表
	 * @param renwuQuery	查询条件
	 * @param page	分页条件
	 * @return 	结果集
	 */
	public PageResultInfo<RenwuBean> getRenwuListPage(RenwuQuery renwuQuery, PageInfo page)
	{
		try
		{
			return RenwuDao.queryRenwuListPage(renwuQuery, page);
		}
		catch (SQLException e)
		{
			e.printStackTrace();
		}
		return null;
	}
	
	public List<RenwuBean> getRenwuList(RenwuQuery renwuQuery)
	{
		try
		{
			return RenwuDao.queryRenwuList(renwuQuery);
		}
		catch (SQLException e)
		{
			e.printStackTrace();
		}
		return null;
	}
	
	public List<MinjingBean> getMinjingList(Map<String, String> params)
	{
		if (params == null || params.size() < 1)
		{
			return null;
		}
		try
		{
			return RenwuDao.queryMinjList(new Object[] {params.get("rwbh")});
		}
		catch (SQLException e)
		{
			e.printStackTrace();
		}
		return null;
	}
	
	public PageResultInfo<RenwuJiegBean> getMinjChuliListPage(RenwuQuery renwuQuery, PageInfo page)
	{
		try
		{
			return RenwuDao.queryMinjChuliListPage(renwuQuery, page);
		}
		catch (SQLException e)
		{
			e.printStackTrace();
		}
		return null;
	}
	
	public List<RenwuJiegBean> getMinjChuliList(RenwuQuery renwuQuery)
	{
		try
		{
			return RenwuDao.queryMinjChuliList(renwuQuery);
		}
		catch (SQLException e)
		{
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 保存民警处理任务的结果信息
	 * @param minchlBean	处理结果
	 */
	public void submitMinjChliBean(MinjChuliBean minjchlBean)
	{
		TransactionManager tm = new TransactionManager();
		try
		{
			tm.begin();
			RenwuDao.updateMinjChuli(minjchlBean);
			
			String zt = "0".equals(minjchlBean.getCljg()) ? "0" : "1";
			RenwuDao.updateRenwuBean(minjchlBean.getRwbh(), zt);
			
			tm.commit();
		}
		catch (Exception e)
		{
			try
			{
				tm.rollback();
			}
			catch (RollbackException e1)
			{
				e1.printStackTrace();
			}
			e.printStackTrace();
		}
	}
	
	/**
	 * 删除登记的任务
	 */
	public boolean delRenwu(String bh){
		boolean flag = false;
		try {
			RenwuBean bean = RenwuDao.queryRenwuBean(bh);
			String gxsj = DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss");
			bean.setGxsj(gxsj);
			bean.setCzbz(GZGLCommonStatuts.CZBZ_DEL);
			RenwuDao.delRenwu(bean);
			flag = true;
		} catch (SQLException e) {
			flag = false;
			e.printStackTrace();
		}
		return flag;
	}
	
	/**
	 * 任务签收
	 * @throws Exception 
	 */
	public boolean qsRenwu(String bh) throws Exception{
		boolean flag = false;
		RenwuBean bean = RenwuDao.queryRenwuBean(bh);
		String gxsj = DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss");
		bean.setGxsj(gxsj);
		try{
			bean.setSfqs(GZGLCommonStatuts.SFQS_YQS);
			RenwuDao.qsRenwu(bean);
			flag = true;
		}catch (SQLException e) {
			flag = false;
			e.printStackTrace();
		}
		return flag;
		
	}
	
	/**
	 * 任务反馈
	 * @param bean
	 */
	protected void  fkRenwu(RenwuBean bean) {
		try {
			RenwuDao.fkRenwe(bean);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 查询任务反馈信息
	 */
	public List<RenwuJiegBean> queryRenwuFkxx(RenwuQuery bean){
		try {
			return RenwuDao.queryRenwuFkxx(bean);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	public RwfjBean getRwfjBeanById(String fjbh) throws SQLException {
		return RenwuDao.getRwfjBeanById(fjbh);
	}

	public PageResultInfo<RenwuBean> getRenwuclListPage(RenwuQuery renwuQuery,
			PageInfo pageInfo) throws SQLException {
		return RenwuDao.getRenwuclListPage(renwuQuery,pageInfo);
	}

	public Blob getRwfjById(String id) throws SQLException {
		return RenwuDao.getRwfjById(id);
	}
}
