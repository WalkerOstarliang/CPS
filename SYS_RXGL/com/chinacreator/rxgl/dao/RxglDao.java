package com.chinacreator.rxgl.dao;

import java.io.Serializable;

import com.chinacreator.rxgl.bean.PicBean;

public interface RxglDao extends Serializable {

	/**
	 * 新增图片
	 * @return
	 */
	public PicBean insertImg(PicBean bean) throws Exception ;
	
	/**
	 * 修改图片
	 * @return
	 */
	public PicBean updateImg(PicBean bean) throws Exception ;
	
	/**
	 * 根据图片ID查询图片
	 * @param pic_id
	 * @return
	 */
	public PicBean queryPicByPicid(String pic_id) throws Exception ;
}
