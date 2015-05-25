package com.chinacreator.test.dao;

import java.util.List;

import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.helper.ValidateHelper;
import com.chinacreator.remote.bean.CzrkInfoBean;
import com.chinacreator.remote.business.RemoteRequestService;
import com.frameworkset.common.poolman.SQLExecutor;

public class Dao
{
	public static void testUpdateRy()
	{
		try
		{
			String updatesql = " update t_test_czrk " +
			   " set xm = #[xm]," + 
			      " cym = #[cym]," +
			      " xb = #[xb]," +
			      " mz = #[mz]," +
			      "  csrq = #[csrq]," +
			      " zzssxq = #[zzssxq]," +
			      " zzssxqmc = #[zzssxqmc]," +
			      " zzxz = #[zzxz]," +
			      " qtzzxq = #[qtzzxq]," +
			      " qtzzxz = #[qtzzxz]," +
			      " csd = #[csd]," +
			      " whcd = #[whcd]," +
			      " hyzk = #[hyzk]," +
			      " sg = #[sg]," +
			      " zy = #[zy]," +
			      " fwcs = #[fwcs]," +
			      " bdrq = #[bdrq]," +
			      " bdyy = #[bdyy]," +
			      " hsqr = #[hsqr]," +
			      " hdqr = #[hdqr]," +
			      " xp = #[xp]," +
			      " sspcsjgdm = #[sspcsjgdm]," +
			      " sspcsmc = #[sspcsmc]," +
			      " ssgajgjgdm = #[ssgajgjgdm]," +
			      " ssgajgmc = #[ssgajgmc]," +
			      " hlx = #[hlx]," +
			      " hh = #[hh]," +
			      " yhzgx = #[yhzgx]" +
			      " where sfzh=#[sfzh]";

			String sql = " select a.sfzh from ( select s.sfzh,rownum as ss from t_test_czrk s  ) a where a.ss > 2400";
			
			List<CzrkInfoBean> czrklists = SQLExecutor.queryListWithDBName(CzrkInfoBean.class, CommonConstant.DBNAME_SQJW, sql);
			System.out.println("-----加载数据完成----");
			if (ValidateHelper.isNotEmptyCollection(czrklists))
			{
				RemoteRequestService rrs = new RemoteRequestService();
				for (CzrkInfoBean czrkBean : czrklists)
				{
					List<CzrkInfoBean> list = rrs.queryCzrkInfoBySfzh(czrkBean.getSfzh().toUpperCase());
					
					if (ValidateHelper.isNotEmptyCollection(list))
					{
						System.out.println("-----查询完成人员" + list.get(0).getSfzh() +"的加载-----");
						list.get(0).setSfzh(list.get(0).getSfzh().toLowerCase());
						SQLExecutor.updateBean(CommonConstant.DBNAME_SQJW, updatesql, list.get(0));
						System.out.println("-----完成人员" + list.get(0).getSfzh() +"的更新-----");
					}
				}
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
}
