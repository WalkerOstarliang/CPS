package com.chinacreator.khkp.services.impl;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.khkp.bean.LssjTjBean;
import com.chinacreator.khkp.dao.LssjTjDao;
import com.chinacreator.khkp.dao.impl.LssjTjDaoImpl;
import com.chinacreator.khkp.query.LssjTjQueryBean;
import com.chinacreator.khkp.services.LssjTjService;

public class LssjTjServiceImpl implements LssjTjService {

	private static final long serialVersionUID = -248559797633608632L;

	private LssjTjDao dao = new LssjTjDaoImpl();

	@Override
	public PageResultInfo<LssjTjBean> queryLssj(LssjTjQueryBean query,
			PageInfo pageInfo) {
		try {
			query.setTjsj_start(query.getTjsj_start() + " 00:00:00");
			query.setTjsj_end(query.getTjsj_end() + " 23:59:59");
			
			// 实有人口
			if ("001".equals(query.getTjlx())) {
				return dao.querySyrk(query, pageInfo);
			}
			// 常驻人口
			else if ("002".equals(query.getTjlx())) {
				return dao.queryCzrk(query, pageInfo);
			}
			// 流动人口
			else if ("003".equals(query.getTjlx())) {
				return dao.queryLdrk(query, pageInfo);
			}
			// 寄住人口
			else if ("004".equals(query.getTjlx())) {
				return dao.queryJzrk(query, pageInfo);
			}
			// 未落户人口
			else if ("005".equals(query.getTjlx())) {
				return dao.queryWlhrk(query, pageInfo);
			}
			// 境外人口
			else if ("006".equals(query.getTjlx())) {
				return dao.queryJwrk(query, pageInfo);
			}
			// 实体
			else if ("007".equals(query.getTjlx())) {
				return dao.querySt(query, pageInfo);
			}
			// 房屋
			else if ("008".equals(query.getTjlx())) {
				return dao.queryFw(query, pageInfo);
			}
			// 出租房屋
			else if ("009".equals(query.getTjlx())) {
				return dao.queryCzfw(query, pageInfo);
			}
			// 从业人员
			else if ("010".equals(query.getTjlx())) {
				return dao.queryCyry(query, pageInfo);
			}
			// 单位
			else if ("011".equals(query.getTjlx())) {
				return dao.queryDw(query, pageInfo);
			}
			// 出租房屋巡查
			else if ("012".equals(query.getTjlx())) {
				return dao.queryCzfwxc(query, pageInfo);
			}
			// 流动人口延期
			else if ("013".equals(query.getTjlx())) {
				return dao.queryLdrkyq(query, pageInfo);
			}
			else{
				return null;
			}
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public List<Map<String, String>> queryRsdfxList(LssjTjQueryBean queryBean)
	{
		try
		{
			return dao.queryRsdfxList(queryBean);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return null;
	}

}
