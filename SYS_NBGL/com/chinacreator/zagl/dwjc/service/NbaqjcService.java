package com.chinacreator.zagl.dwjc.service;

import java.io.File;
import java.io.Serializable;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.List;

import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.zagl.dwjc.bean.NbAqJcZpBean;
import com.chinacreator.zagl.dwjc.bean.NbaqjcBean;

public interface NbaqjcService extends Serializable {
	
	/**
	 * 保存安全检查
	 * @param bean
	 * @return
	 */
	public NbaqjcBean saveNbAqjc(NbaqjcBean bean);
	
	/**
	 * 根据机构编号查询安全检查
	 * @param jgbh
	 * @return
	 */
	public PageResultInfo<NbaqjcBean> queryNbAqjcByJgbh(String jgbh,PageInfo pageinfo);
	
	
	/**
	 * 根据ID查询安全检查
	 * @param id
	 * @return
	 */
	public NbaqjcBean queryNbAqjcById(String id);
	
	/**
	 * 保存安全检查隐患照片
	 */
	public void saveNbAqjcZp(NbAqJcZpBean zpbean,File[] zpUploads); 

	/**
	 * 根据照片id查询照片
	 */
	public Blob  getNbaqjcZpxxInputStream(String zpid) throws Exception;

	/**
	 * 根据安全检查隐患照片id删除照片
	 * @param zpid
	 */
	public void deleteNbajZpxxByZpid(String zpid) throws SQLException;
	
	/**
	 * 根据安全检查id和隐患照片yydd字段查询照片list
	 */
	public List<NbAqJcZpBean> querNbAqjczplistbyaqid(String aqjcid,String yydd);
	/**
	 * 撤销核签
	 */
	public void cxnbhqCheck(String jgbh) throws Exception;
	
	/**
	 * 查询单位的最后一次安全检查
	 * @param jgbh
	 * @return
	 */
	public NbaqjcBean queryLastCheckByJgbh(String jgbh);
}
