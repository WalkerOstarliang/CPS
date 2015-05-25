package com.chinacreator.gzgl.action;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.helper.DateTimeHelper;
import com.chinacreator.common.helper.ValidateHelper;
import com.chinacreator.gzgl.bean.GzglBaseBean;
import com.chinacreator.gzgl.bean.ZjieBean;
import com.chinacreator.gzgl.query.ZjieQuery;
import com.chinacreator.gzgl.service.ZjieService;
import com.chinacreator.gzgl.util.GZGLCommonStatuts;

/**
 * 工作总结前台控制action
 * @author royee
 *
 */
public class ZjieAction extends GzglBaseAction
{

	private ZjieBean zjieBean;
	
	private ZjieQuery zjieQuery;
	
	private List<ZjieBean> zjieList;
	
	private ZjieService zjieService;
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 339324703426903464L;
	
	public ZjieAction()
	{
		zjieBean = new ZjieBean();
		zjieList = new ArrayList<ZjieBean>();
		zjieService = new ZjieService();
		zjieQuery = new ZjieQuery();
	}
	
	
	public ZjieBean getZjieBean()
	{
		return zjieBean;
	}

	public void setZjieBean(ZjieBean zjieBean)
	{
		this.zjieBean = zjieBean;
	}

	public ZjieQuery getZjieQuery()
	{
		return zjieQuery;
	}

	public void setZjieQuery(ZjieQuery zjieQuery)
	{
		this.zjieQuery = zjieQuery;
	}

	public List<ZjieBean> getZjieList()
	{
		return zjieList;
	}

	public void setZjieList(List<ZjieBean> zjieList)
	{
		this.zjieList = zjieList;
	}

	public ZjieService getZjieService()
	{
		return zjieService;
	}

	public void setZjieService(ZjieService zjieService)
	{
		this.zjieService = zjieService;
	}


	/**
	 * 进入模块初始化
	 * @return
	 */
	public String init()
	{
		initQueryBean(zjieQuery);
		return "init";
	}
	
	/**
	 * 查询总结列表
	 */
	public void queryZongjieList()
	{
		load();
	}
	
	protected void load()
	{
		PageResultInfo<ZjieBean> zjieResult = zjieService.getZjieListPage(zjieQuery, getPageInfo());
		responseWrite(zjieResult);
	}
	
	public String toAddZjie()
	{
		zjieBean.setOp(GzglBaseBean.NEW);
		return "toAddZjie";
	}
	
	/**
	 * 单个总结bean操作函数
	 */
	public void saveZongjieBean()
	{
		String op = zjieBean.getOp();
		String tip = "";
		String gxsj = DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss");
		zjieBean.setGxsj(gxsj);
		if ("new".equals(op))
		{
			zjieBean.setCzbz(GZGLCommonStatuts.CZBZ_ADD);
			if(zjieService.submitZjieBean(zjieBean, ZjieService.OP_ADD)){
				tip = "操作成功!";
			}else{
				tip = "操作失败!";
			}
		}
		else if ("edit".equals(op))
		{
			zjieBean.setCzbz(GZGLCommonStatuts.CZBZ_UPDATE);
			if(zjieService.submitZjieBean(zjieBean, ZjieService.OP_UPDATE)){
				tip = "操作成功!";
			}else{
				tip = "操作失败!";
			}
		}
		else if ("delete".equals(op))
		{
			if(zjieService.submitZjieBean(zjieBean, ZjieService.OP_DEL)){
				tip = "操作成功!";
			}else{
				tip = "操作失败!";
			}
		}
		responseWrite(tip);
	}
	
	/**
	 * 批量总结bean操作函数
	 */
	public void batchSaveZongjieBeans()
	{
		String zjBhaos = zjieQuery.getZjbh();
		
		String op = zjieQuery.getOp();
		
		if (zjBhaos == null || ValidateHelper.isEmptyString(zjBhaos))
		{
			responseWrite("data is error");
			return;
		}
		String[] zjBhaoArr = new String[] {zjBhaos};
		if (zjBhaos.contains(","))
		{
			zjBhaoArr = zjBhaos.split(",");
		}
		
		ZjieBean zjieBean = null;
		List<ZjieBean> zjieList = new ArrayList<ZjieBean>();
		for (String zjbh : zjBhaoArr)
		{
			zjieBean = new ZjieBean();
			zjieBean.setZjbh(zjbh);
			zjieList.add(zjieBean);
		}
		
		if ("delete".equals(op))
		{
			zjieService.submitBatchZjieBeans(zjieList, ZjieService.OP_DEL);
		}
	}
	
	public String toEditZjie() throws SQLException
	{
		/*if (ValidateHelper.isEmptyString(zjieQuery.getZjbh()))
		{
			//抛异常
			return ERROR;
		}
		List<ZjieBean> zjieList = zjieService.getZjieList(zjieQuery);
		
		if (ValidateHelper.isEmptyCollection(zjieList))
		{
			//返回异常提示信息
			return ERROR;
		}
		
		setZjieBean(zjieList.get(0));//注入结果
		getZjieBean().setOp(GzglBaseBean.EDIT);*/
		zjieBean =zjieService.getzjieBeanByZjbh(zjieQuery.getZjbh());
		zjieBean.setOp(GzglBaseBean.EDIT);
		return "toEditZjie";
	}
	
	public String toViewZjie() throws SQLException
	{
		/*if (ValidateHelper.isEmptyString(zjieQuery.getZjbh()))
		{
			//抛异常
			return ERROR;
		}
		List<ZjieBean> zjieList = zjieService.getZjieList(zjieQuery);
		
		if (ValidateHelper.isEmptyCollection(zjieList))
		{
			//返回异常提示信息
			return ERROR;
		}
		
		setZjieBean(zjieList.get(0));//注入结果
		getZjieBean().setOp(GzglBaseBean.VIEW);*/
		zjieBean =zjieService.getzjieBeanByZjbh(zjieQuery.getZjbh());
		zjieBean.setOp(GzglBaseBean.VIEW);
		return "toViewZjie";
	}
}
