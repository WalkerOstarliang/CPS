package com.chinacreator.xtgl.service.impl;

import java.sql.SQLException;

import com.chinacreator.afgl.bean.AflmpcBean;
import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.dzgl.bean.StxxBean;
import com.chinacreator.lsgl.bean.FwJbxxBean;
import com.chinacreator.lsgl.bean.LdrkxxBean;
import com.chinacreator.lsgl.bean.ZdryGzdxBean;
import com.chinacreator.xtgl.dao.SjhcDao;
import com.chinacreator.xtgl.dao.impl.SjhcDaoImpl;
import com.chinacreator.xtgl.query.SjhcQueryBean;
import com.chinacreator.xtgl.service.SjhcService;
import com.chinacreator.zagl.bean.DwcyryBean;

public class SjhcServiceImpl implements SjhcService {

	private static final long serialVersionUID = -5208741249682486275L;
	
	private SjhcDao dao = new SjhcDaoImpl();

	@Override
	public PageResultInfo<DwcyryBean> queryCyry(SjhcQueryBean bean,
			PageInfo pageInfo) {
		try {
			return dao.queryCyry(bean, pageInfo);
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public PageResultInfo<FwJbxxBean> queryCzfw(SjhcQueryBean bean,
			PageInfo pageInfo) {
		try {
			return dao.queryCzfwxcdj(bean, pageInfo);
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public PageResultInfo<LdrkxxBean> queryLdrk(SjhcQueryBean bean,
			PageInfo pageInfo) {
		try {
			return dao.queryLdrk(bean, pageInfo);
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public PageResultInfo<StxxBean> querySt(SjhcQueryBean bean,
			PageInfo pageInfo) {
		try {
			return dao.querySt(bean, pageInfo);
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public PageResultInfo<ZdryGzdxBean> queryZdry(SjhcQueryBean bean,
			PageInfo pageInfo) {
		try {
			if("201".equals(bean.getKhlx())){
				return dao.queryXfsjwh(bean, pageInfo);
			}else if("202".equals(bean.getKhlx())){
				return dao.queryZdryTgxx(bean, pageInfo);
			}else if("203".equals(bean.getKhlx())){
				return dao.queryZdryGxrqs(bean, pageInfo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
		return null;
	}

	@Override
	public PageResultInfo<FwJbxxBean> queryFw(SjhcQueryBean bean,
			PageInfo pageInfo) {
		try {
			return dao.queryFw(bean, pageInfo);
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public PageResultInfo<AflmpcBean> queryLmpc(SjhcQueryBean bean,
			PageInfo pageInfo) {
		try {
			return dao.queryLmpc(bean, pageInfo);
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}

}
