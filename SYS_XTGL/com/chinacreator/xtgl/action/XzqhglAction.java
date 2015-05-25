package com.chinacreator.xtgl.action;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import com.chinacreator.afgl.bean.SqJbxxBean;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.cps.action.CPSBaseAction;
import com.chinacreator.common.cps.bean.XzqhMappingBean;
import com.chinacreator.common.cps.business.DictionaryBusiness;
import com.chinacreator.common.helper.CommonDBBaseHelper;
import com.chinacreator.common.helper.PaginationHelper;
import com.chinacreator.common.helper.ValidateHelper;
import com.chinacreator.xtgl.bean.HnXzqhBean;
import com.chinacreator.xtgl.service.XzqhglService;

/**
 * 全国行政区划代码
 * @author mingchun.xiong
 *
 */
public class XzqhglAction extends CPSBaseAction
{

	/**
	 * serialVersionUID
	 */
	private static final long	serialVersionUID	= -2756527838493776266L;
	
	private Map<String, String> jdXzMap = new LinkedHashMap<String, String>();
	
	private XzqhglService service;
	
	private boolean loadChild = false;
	
	private HnXzqhBean xzqhBean;
	
	private SqJbxxBean sqBean;
	
	private String rootParentDm = "0";
	
	//1 ：省 2：市  3:县 4：乡镇街道  5：社区/农村
	private String leve;
	
	private String dm;
	
	private String parent_dm;
	
	// 0 : 表示街道  1：镇  2：表示乡
	private String jdType;
	
	public XzqhglAction()
	{
		super();
		service = new XzqhglService();
	}
	
	public String toXzqhPage()
	{
		return "toXzqhPage";
	}
	
	/**
	 * 调整到行政区划页面
	 * @return
	 */
	public String toXzqhPageInfo() throws Exception
	{
		if (CommonConstant.OPERTYPE_ADD.equals(operType))
		{
			if ("4".equals(xzqhBean.getLeve()))
			{
				xzqhBean.setDm(service.queryMaxXzjddm(xzqhBean.getParent_dm()));
				jdType = "0";
			}
			else if ("5".equals(xzqhBean.getLeve()))
			{
				HnXzqhBean parentXaqh = service.queryHnXzqhBeanByDm(xzqhBean.getParent_dm());
				xzqhBean.setParent_mc(parentXaqh.getMc());
				xzqhBean.setSspcsdm(parentXaqh.getSspcsdm());
				xzqhBean.setDm(service.queryMaxSqdmByParentDm(xzqhBean.getParent_dm()));
			}
		}
		else if (CommonConstant.OPERTYPE_UPDATE.equals(operType))
		{
			xzqhBean = service.queryHnXzqhBeanByDm(dm);
		}
		else if (CommonConstant.OPERTYPE_DETAIL.equals(operType))
		{
			xzqhBean = service.queryHnXzqhBeanByDm(dm);
		}
		return "toXzqhPageInfo";
	}
	
	public void getXzjdDm() throws Exception
	{
		String result = service.queryMaxXzjddmByParentDM(parent_dm, jdType);
		responseWrite(result);
	}
	
	/**
	 *  查询湖南行政区划
	 * @throws Exception
	 */
	public void queryHnxzqhList() throws Exception
	{
		List<HnXzqhBean> list = new ArrayList<HnXzqhBean>();
		if (rootParentDm.equals("0"))
		{
			list = service.queryHnXzqhChildByParentDm(rootParentDm);
		}
		else if (loadChild)
		{
			list = service.queryHnXzqhChildByParentDm(rootParentDm);
		}
		else 
		{
			List<XzqhMappingBean> mapxzqhBenas = null;
			if(CommonDBBaseHelper.getOrgLeve(rootParentDm) == 3)
			{
				DictionaryBusiness business = new DictionaryBusiness();
				mapxzqhBenas = business.getXzqhByPz(rootParentDm.substring(0, 6));
			}
			if (ValidateHelper.isNotEmptyCollection(mapxzqhBenas))
			{
				for (XzqhMappingBean mapBean : mapxzqhBenas)
				{
					String yxzqh = mapBean.getYxzqh() + "000000";
					HnXzqhBean bean = service.queryHnXzqhBeanByDm(yxzqh);
					list.add(bean);
				}
			}
			else
			{
				HnXzqhBean bean = service.queryHnXzqhBeanByDm(rootParentDm);
				list.add(bean);
			}
			
		}
		responseWrite(list);
	}
	
	/**
	 * 查询行政区划
	 * @throws Exception
	 */
	public void queryHnxzqhPageResult() throws Exception
	{
		List<HnXzqhBean> list = service.queryHnXzqhChildByParentDm(rootParentDm);
		PageResultInfo<HnXzqhBean> pageResult = PaginationHelper.wrapPageResultInfo(getPageInfo(), (long)list.size(), list);
		responseWrite(pageResult);
	}

	/**
	 * 保存湖南行政区划
	 * @throws Exception
	 */
	public void saveHnxzqhBean() throws Exception
	{
		xzqhBean.setMc(xzqhBean.getParent_mc() + xzqhBean.getJc());
		service.saveHnxzqhBean(xzqhBean, operType);
		responseWrite(xzqhBean);
	}
	
	public void zxHnxzqhBean() throws Exception
	{
		service.zxHnxzqhBean(dm);
		responseWrite(true);
	}
	
	public String getRootParentDm() {
		return rootParentDm;
	}

	public void setRootParentDm(String rootParentDm) {
		this.rootParentDm = rootParentDm;
	}

	public String getLeve() {
		return leve;
	}

	public void setLeve(String leve) {
		this.leve = leve;
	}

	public HnXzqhBean getXzqhBean() {
		return xzqhBean;
	}

	public void setXzqhBean(HnXzqhBean xzqhBean) {
		this.xzqhBean = xzqhBean;
	}

	public String getDm() {
		return dm;
	}

	public void setDm(String dm) {
		this.dm = dm;
	}

	public String getParent_dm() {
		return parent_dm;
	}

	public void setParent_dm(String parentDm) {
		parent_dm = parentDm;
	}

	public String getJdType() {
		return jdType;
	}

	public void setJdType(String jdType) {
		this.jdType = jdType;
	}

	public Map<String, String> getJdXzMap() {
		jdXzMap.put("0", "街道");
		jdXzMap.put("1", "镇");
		jdXzMap.put("2", "乡");
		jdXzMap.put("4", "其他");
		return jdXzMap;
	}

	public void setJdXzMap(Map<String, String> jdXzMap) {
		this.jdXzMap = jdXzMap;
	}

	public SqJbxxBean getSqBean() {
		return sqBean;
	}

	public void setSqBean(SqJbxxBean sqBean) {
		this.sqBean = sqBean;
	}

	public boolean getLoadChild()
	{
		return loadChild;
	}

	public void setLoadChild(boolean loadChild)
	{
		this.loadChild = loadChild;
	}
	
	
}
