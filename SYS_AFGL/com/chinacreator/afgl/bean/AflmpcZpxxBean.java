package com.chinacreator.afgl.bean;

import java.sql.Blob;

import com.chinacreator.common.bean.BaseValue;
import com.chinacreator.common.constant.CommonConstant;
import com.frameworkset.common.poolman.DBUtil;

public class AflmpcZpxxBean extends BaseValue{
	/**
	 * 
	 */
	private static final long serialVersionUID = -3743254800184134343L;
	//以下字段是路面盘查照片表字段
	private String zapc_xxbh;  //关联 t_af_lmpcxx 表中的jlbh
	@SuppressWarnings("unused")
	private Blob  zapc_bcrxp;  // 警务通照片表t_af_jwt_lmpcxx 中的照片字段
	public String getZapc_xxbh() {
		return zapc_xxbh;
	}
	public void setZapc_xxbh(String zapc_xxbh) {
		this.zapc_xxbh = zapc_xxbh;
	}
	public Blob getZapc_bcrxp() {
		try
		{
			String sql = " select zapc_bcrxp from t_af_jwt_lmpcxx where zapc_bcrxp is not null and zapc_xxbh=" + zapc_xxbh;
			DBUtil util = new DBUtil();
			util.executeSelect(CommonConstant.DBNAME_SQJW, sql);
			if (util.size() > 0)
			{
				Blob blob = util.getBlob(0, "zapc_bcrxp");
				return blob;
			}
			else
			{
				return null;
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
			return null;
		}
	}
	public void setZapc_bcrxp(Blob zapc_bcrxp) {
		this.zapc_bcrxp = zapc_bcrxp;
	}
}
