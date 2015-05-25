package com.chinacreator.common.business;

import javax.transaction.RollbackException;

import com.chinacreator.common.bean.CommonLogBean;
import com.chinacreator.common.constant.CommonConstant;
import com.frameworkset.common.poolman.SQLExecutor;
import com.frameworkset.orm.transaction.TransactionManager;

/**
 * 日志操作方法
 * 
 * @author mingchun.xiong
 * @date 2013-8-6
 */
public class LogBusiness
{
	/**
	 * 插入日志
	 * @param logBean
	 */
	public static void insertLogBean(CommonLogBean logBean)
	{
		TransactionManager tm = null;
		try
		{
			tm = new TransactionManager();
			tm.begin();
			StringBuffer sql = new StringBuffer();
			sql.append(" insert into t_common_log ");
			sql.append(" (rzid, czrxm, czrjh, czdwdm, czdwmc, czsj, modename, opertype, parameter) ");
			sql.append(" values " );
			sql.append(" (to_char(sysdate,'yyyymmdd')||seq_common_log.nextval, #[czrxm], #[czrjh], #[czdwdm], #[czdwmc], sysdate, #[modename], #[opertype], #[parameter]) ");
			SQLExecutor.insertBean(CommonConstant.DBNAME_SQJW, sql.toString(), logBean);
			tm.commit();
		}
		catch(Exception e)
		{
			e.printStackTrace();
			try
			{
				tm.rollback();
			}
			catch (RollbackException e1)
			{
			}
		}
	}
	
}
