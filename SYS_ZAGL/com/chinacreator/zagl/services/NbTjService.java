package com.chinacreator.zagl.services;

import java.io.Serializable;
import java.util.List;

import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.bean.QueryBean;
import com.chinacreator.zagl.bean.nbtj.AjxxBean;
import com.chinacreator.zagl.bean.nbtj.NbdwFaTj;
import com.chinacreator.zagl.bean.nbtj.NbtjQuery;
import com.chinacreator.zagl.bean.nbtj.WyxqFaTj;
import com.chinacreator.zagl.bean.nbtj.Wyxqtb;
import com.chinacreator.zagl.bean.nbtj.ZddwFa;

public interface NbTjService extends Serializable {
	
	/**
	 * 查询物业小区通报
	 * @param query
	 * @return
	 */
	public List<Wyxqtb> queryWyxqTb(QueryBean query);
	
	
	/**
	 * 查询物业小区发案
	 */
	public List<WyxqFaTj> queryWyxqFa(QueryBean query);
	
	/**
	 * 查询内保单位发案
	 * @param query
	 * @return
	 */
	public List<NbdwFaTj> queryNbdwFa(QueryBean query);
	
	/**
	 * 查询重点单位发案
	 * @param query
	 * @return
	 */
	public List<ZddwFa> queryZddwFa(QueryBean query);
	
	/**
	 * 查询案件信息
	 * @param query
	 * @param pageinfo
	 * @return
	 */
	public PageResultInfo<AjxxBean> queryAjxx(NbtjQuery query,PageInfo pageinfo);
	
	/**
	 * 查询案件信息
	 * @param query
	 * @return
	 */
	public List<AjxxBean> queryAjxxList(NbtjQuery query);
}
