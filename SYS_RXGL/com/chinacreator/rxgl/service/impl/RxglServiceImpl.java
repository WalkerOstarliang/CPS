package com.chinacreator.rxgl.service.impl;

import com.chinacreator.rxgl.bean.PicBean;
import com.chinacreator.rxgl.dao.RxglDao;
import com.chinacreator.rxgl.dao.impl.RxglDaoImpl;
import com.chinacreator.rxgl.service.RxglService;

public class RxglServiceImpl implements RxglService {

	private static final long serialVersionUID = -2955690286293305008L;
	RxglDao dao = new RxglDaoImpl();
	
	public PicBean queryPicByPicid(String pic_id) {
		 return null;
	}

	public PicBean saveImg(PicBean bean) {
		return null;
	}

}
