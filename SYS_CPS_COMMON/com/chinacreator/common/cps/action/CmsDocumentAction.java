package com.chinacreator.common.cps.action;

import java.util.ArrayList;
import java.util.List;

import com.chinacreator.common.cps.bean.CmsDocument;
import com.chinacreator.common.cps.business.CmsDocumentBusiness;

public class CmsDocumentAction extends CPSBaseAction
{

	/**
	 * 
	 */
	private static final long	serialVersionUID	= 7389917935818694433L;
	
	public List<CmsDocument> docsList = new ArrayList<CmsDocument>();
	private String channelId;
	private String orgLeve;
	
	public String toCmsDocmentListPage()
	{
		CmsDocumentBusiness business = new CmsDocumentBusiness();
		docsList = business.queryCmsDocumentList(channelId, orgLeve);
		return "toCmsDocmentListPage";
	}

	public List<CmsDocument> getDocsList()
	{
		return docsList;
	}

	public void setDocsList(List<CmsDocument> docsList)
	{
		this.docsList = docsList;
	}

	public String getChannelId()
	{
		return channelId;
	}

	public void setChannelId(String channelId)
	{
		this.channelId = channelId;
	}

	public String getOrgLeve()
	{
		return orgLeve;
	}

	public void setOrgLeve(String orgLeve)
	{
		this.orgLeve = orgLeve;
	}
	
}
