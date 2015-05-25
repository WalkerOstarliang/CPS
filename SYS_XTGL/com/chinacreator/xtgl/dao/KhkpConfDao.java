package com.chinacreator.xtgl.dao;

import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.helper.ValidateHelper;
import com.chinacreator.xtgl.bean.KfpzBean;
import com.chinacreator.xtgl.bean.PageTableBean;
import com.chinacreator.xtgl.bean.PageTableHeadBean;
import com.frameworkset.common.poolman.ConfigSQLExecutor;

/**
 * 考核考评配置
 * @author sytx
 */
public class KhkpConfDao {
	private ConfigSQLExecutor executor = new ConfigSQLExecutor("com/chinacreator/xtgl/dao/khkpconf-sql.xml");
	
	/**
	 * 新增扣分配置
	 * @param bean
	 * @throws Exception
	 */
	public void insertKhkpPz(KfpzBean bean) throws Exception{
		executor.insertBean(CommonConstant.DBNAME_SQJW, "insertKhkpPz", bean);
	}
	
	/**
	 * 新增需要显示的表格
	 * @param bean
	 * @throws Exception
	 */
	public void insertShowTable(PageTableBean bean) throws Exception{
		executor.insertBean(CommonConstant.DBNAME_SQJW, "insertShowTable", bean);
	}
	
	/**
	 * 表头
	 * @param bean
	 * @throws Exception
	 */
	public void insertShowTableHead(PageTableHeadBean bean) throws Exception{
		executor.insertBean(CommonConstant.DBNAME_SQJW, "insertShowTableHead", bean);
	}
	
	public void updateKhkpPz(KfpzBean bean) throws Exception{
		executor.updateBean(CommonConstant.DBNAME_SQJW, "updateKhkpPz", bean);
	}
	
	public void updateShowTable(PageTableBean bean) throws Exception{
		executor.updateBean(CommonConstant.DBNAME_SQJW, "updateShowTable", bean);
	}
	
	public void updateShowTableHead(PageTableHeadBean bean) throws Exception{
		executor.updateBean(CommonConstant.DBNAME_SQJW, "updateShowTableHead", bean);
	}
	
	/**
	 * 根据考核类型和级别删除考核
	 * @param khlx
	 * @throws Exception
	 */
	public void deleteKhkpPz(String khlx,String leve) throws Exception{
		executor.deleteWithDBName(CommonConstant.DBNAME_SQJW, "deleteKhkpPz", khlx,leve);
	}
	
	public void deleteShowTable(String khlx,String leve) throws Exception{
		executor.deleteWithDBName(CommonConstant.DBNAME_SQJW, "deleteShowTable", khlx,leve);
	}
	
	public void deleteShowTableHead(String tabname,String xh) throws Exception{
		if(ValidateHelper.isNotEmptyString(xh)){
			executor.deleteWithDBName(CommonConstant.DBNAME_SQJW, "deleteShowTableHead", tabname,xh);
		}else{
			executor.deleteWithDBName(CommonConstant.DBNAME_SQJW, "deleteShowTableHead", tabname);
		}
	} 
}
