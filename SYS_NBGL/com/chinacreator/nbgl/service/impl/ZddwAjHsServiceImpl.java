package com.chinacreator.nbgl.service.impl;

import java.sql.SQLException;
import java.util.List;

import javax.transaction.RollbackException;

import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.bean.QueryBean;
import com.chinacreator.common.bean.SystemDictionaryBean;
import com.chinacreator.nbgl.bean.AjxxBean;
import com.chinacreator.nbgl.dao.ZddwAjHsDao;
import com.chinacreator.nbgl.dao.impl.ZddwAjhsDaoImpl;
import com.chinacreator.nbgl.service.ZddwAjHsService;
import com.frameworkset.orm.transaction.TransactionManager;

public class ZddwAjHsServiceImpl implements ZddwAjHsService{

	private static final long serialVersionUID = -1839506327747283324L;
	private ZddwAjHsDao dao = new ZddwAjhsDaoImpl();

	@Override
	public boolean ajhs(AjxxBean ajxx) {
		boolean flag = false;
		TransactionManager tr = null;
		try{
			tr= new TransactionManager();
			
			tr.begin();
			//更新审核信息
			dao.updateAJxxSfhs(ajxx.getAjbh(), "1");
			//更新是否重点单位
			dao.updateAjxxSfZddwFa(ajxx.getAjbh(), ajxx.getSfzddwfa());
			//更新重点单位代码
			if("1".equals(ajxx.getSfzddwfa())){
				dao.updateAjxxZddwdm(ajxx.getAjbh(), ajxx.getZddwdm());
			}
			//更新操作信息
			ajxx.initCzxx();
			dao.updateCzxx(ajxx);
			tr.commit();
			flag = true;
		}catch (Exception e) {
			flag = false;
			System.out.println("案件核实失败.");
			try {
				tr.rollback();
			} catch (RollbackException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		}
		return flag;
	}

	@Override
	public AjxxBean queryAjxxInfoByAjbh(String ajbh) {
		try {
			return dao.queryAjxxInfoByAjbh(ajbh);
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public PageResultInfo<AjxxBean> queryAjxxList(QueryBean query,
			PageInfo pageinfo) {
		try {
			return dao.queryAjxxList(query, pageinfo);
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public List<AjxxBean> queryAjxxList(QueryBean query){
		try {
			return dao.queryAjxxList(query);
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public List<SystemDictionaryBean> getAjlbDic() {
		try {
			return dao.loadAjlbDic();
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}
}
