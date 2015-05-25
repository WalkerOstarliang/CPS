package com.chinacreator.rhzf.service.impl;

import java.io.Serializable;
import java.sql.SQLException;
import java.util.List;

import com.chinacreator.rhzf.bean.RhzfTjBean;
import com.chinacreator.rhzf.bean.RhzfTjQueryBean;
import com.chinacreator.rhzf.dao.impl.RhzfTjDao;

public class RhzfTjService implements Serializable {
	private static final long serialVersionUID = 8123581508108721683L;

	private RhzfTjDao dao = new RhzfTjDao();
	
	/**
	 * 查询入户走访统计
	 * @param query
	 * @return
	 */
	public List<RhzfTjBean> queryRhzfTj(RhzfTjQueryBean query){
		try {
			if("6".equals(query.getOrgleve())){
				return dao.queryRhzfTjsq(query);
			}else{
				return dao.queryRhzfTj(query);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}
}
