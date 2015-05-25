package com.chinacreator.rxgl.service;

import java.io.Serializable;

import com.chinacreator.rxgl.bean.PicBean;

public interface RxglService extends Serializable {
	
	/**
	 * 保存图片
	 * @return
	 */
	public PicBean saveImg(PicBean bean);
	
	/**
	 * 根据图片ID查询图片
	 * @param pic_id
	 * @return
	 */
	public PicBean queryPicByPicid(String pic_id);

}
