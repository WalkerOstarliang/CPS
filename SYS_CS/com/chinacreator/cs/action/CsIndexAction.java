package com.chinacreator.cs.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.chinacreator.common.bean.LoginInfo;
import com.chinacreator.common.cps.action.CPSBaseAction;
import com.chinacreator.common.helper.ActionContextHelper;
import com.chinacreator.common.helper.DictionaryCacheHellper;
import com.chinacreator.common.helper.ValidateHelper;
import com.chinacreator.cs.bean.MenuFunctionBean;
import com.chinacreator.cs.business.MenuQueryBusiness;

public class CsIndexAction extends CPSBaseAction 
{

	/**
	 * 
	 */
	private static final long serialVersionUID = 6287220954814958728L;
	
	/**
	 * xqgk ：县区概况
	 * dzgl ：地址管理
	 * lsgl : 两室管理
	 * zagl ： 治安管理
	 * aqff : 安全防范
	 */
	private String modename;
	private String showindex;
	private String functionid;
	private List<MenuFunctionBean> menubeans;
	private Map<String,String> menuMap = null;
	
	public CsIndexAction()
	{
		super();
		menuMap = new HashMap<String, String>();
		menuMap.put("dzgl", "1000001107");
		menuMap.put("lsgl", "1000001108");
		menuMap.put("zagl", "1000001109");
		menuMap.put("nbgl", "1000001381");
		menuMap.put("aqff", "1000001110");
		menuMap.put("gzgl", "1000001240");
		menuMap.put("zdry", "1000001241");
		menuMap.put("khkp", "1000001420");
		menuMap.put("qbxs", "1000001560");
		menuMap.put("pcsgl","1000001641");
		menuMap.put("dztz","1000002746");
	}
	
	public String toCsPage()
	{
		String uselocalmenu = DictionaryCacheHellper.getSystemParamenterValueByKey("use.local.menu");
		if ("true".equals(uselocalmenu))
		{
			return modename;
		}
		else
		{
			if (ValidateHelper.isEmptyString(functionid) && ValidateHelper.isNotEmptyString(modename))
			{
				functionid = menuMap.get(modename);
			}
			LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
			menubeans = MenuQueryBusiness.queryMenuFunctionBeanByMenuid(functionid,loginInfo.getUserid(),true);
			return "toCsPage";
		}
	}

	public String getModename() {
		return modename;
	}

	public void setModename(String modename) {
		this.modename = modename;
	}

	public String getFunctionid()
	{
		return functionid;
	}

	public void setFunctionid(String functionid)
	{
		this.functionid = functionid;
	}

	public List<MenuFunctionBean> getMenubeans()
	{
		return menubeans;
	}

	public void setMenubeans(List<MenuFunctionBean> menubeans)
	{
		this.menubeans = menubeans;
	}

	public String getShowindex() {
		return showindex;
	}

	public void setShowindex(String showindex) {
		this.showindex = showindex;
	}
}
