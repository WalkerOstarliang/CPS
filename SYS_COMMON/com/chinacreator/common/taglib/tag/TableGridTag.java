package com.chinacreator.common.taglib.tag;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.BodyTagSupport;

import com.chinacreator.common.helper.ValidateHelper;
import com.chinacreator.common.taglib.bean.ColumnBean;
import com.googlecode.jsonplugin.JSONUtil;
/**
 * 表格分页标签<br>
 * 使用方式:<br>
 * &lt;ct:tableGrid id="lkzllist"  url="/dtgk/test/queryTableGrid.action" title="临控指令列表"  autoload="true"   usepager="true"  pageSize="10" width="1500"  pageSizeModel="10,15,20,30"  click="clickme" dblclick="dblclickme" contentTemplateId="listdetail" contenturl="/dtgk/TESTCAST/contenttest.jsp" searformId="searchForm"&gt;<br> 
 *			&lt;ct:column field="xm" title="序号" isNumber="true" align="center"&gt;&lt;/ct:column><br>
 *			&lt;ct:column field="xm" title="姓名" align="center"&gt;&lt;/ct:column><br>
 *		    &lt;ct:column field="sspcsmc" title="所属派出所"&gt;&lt;/ct:column><br>
 *			&lt;ct:column title="操作"&gt; <br>
 *				&lt;a href="#"&gt;删除&lt;/a> <br>
 *			&lt;/ct:column&gt;<br>
 *	&lt;/ct:tableGrid&gt; <br>
 * @author 熊明春
 * 
 */
public class TableGridTag extends BodyTagSupport 
{

	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = 3624144133743551731L;
	
	private String id;
	private String title;
	private String width = "100%";
	private String height;
	private String url;
	private String contenturl;	//内容url
	private String contentTemplateId;
	private String dataType = "json";
	private String usepager = "true";
	private String autothead = "false";
	private String initAfter;			//表格初始化完成后要做的事件 javascript
	private String pageSize = "10";
	private String pageSizeModel = "5,10,15,20,25,30,40,50,60,70,80,90,100"; 
	private String autoload = "true";
	private String showTotalSpan = "true";
	private String mutilSelect = "true";
	private String searchform = "";
	private String modal = "false";			//是否使用模态对话框打开
	private String click = null;
	private String dblclick = null;
	private String queryBefore;
	private String queryAfter;
	private String tbarId;
	private String isAsynch = "true";
	private List<?> list;
	
	private List<ColumnBean> colModel = new ArrayList<ColumnBean>();

	@Override
	public int doEndTag() throws JspException {
		try 
		{
			pageContext.getOut().write("<div id=\""+getId()+"\"></div>\n");
			pageContext.getOut().write("<script type=\"text/javascript\">\n");
			pageContext.getOut().write("$(function() {\n");
			pageContext.getOut().write("$('#" + getId() + "').tableGrid({");
			pageContext.getOut().write("id : '" + getId() + "',");
			if (ValidateHelper.isNotEmptyString(title))
			{
				pageContext.getOut().write("title : '"+getTitle()+"',");
			}
			if (ValidateHelper.isNotEmptyString(getWidth()))
			{
				pageContext.getOut().write("width : '"+getWidth()+"',");
			}
			
			if (ValidateHelper.isNotEmptyString(getWidth()))
			{
				pageContext.getOut().write("height : '" + getHeight() + "',");
			}
			
			if (ValidateHelper.isNotEmptyString(initAfter))
			{
				pageContext.getOut().write("initAfter : "+initAfter+",");
			}
			
			String contentPath = ((HttpServletRequest)pageContext.getRequest()).getContextPath();
			if (ValidateHelper.isNotEmptyString(url))
			{
				if (url.startsWith(contentPath))
				{
					pageContext.getOut().write("url : '"+getUrl()+"',");
				}
				else
				{
					pageContext.getOut().write("url : '"+contentPath + getUrl()+"',");
				}
			}
			
			pageContext.getOut().write("isAsynch : " + isAsynch + ",");
			
			if (ValidateHelper.isNotEmptyCollection(list))
			{
				pageContext.getOut().write("datas : "+ JSONUtil.serialize(list) +",");
			}
			
			if (ValidateHelper.isNotEmptyString(contentTemplateId))
			{
				pageContext.getOut().write("contentTemplateId : '"+contentTemplateId+"',");
			}
			else if (ValidateHelper.isNotEmptyString(contenturl))
			{
				if (contenturl.startsWith(contentPath))
				{
					pageContext.getOut().write("contenturl : '"+getContenturl()+"',");
				}
				else
				{
					pageContext.getOut().write("contenturl : '"+contentPath + getContenturl()+"',");
				}
			}
			
			pageContext.getOut().write("dataType : 'json',");
			pageContext.getOut().write("usepager : " +usepager+",");
			pageContext.getOut().write("currentPage : 1,");
			pageContext.getOut().write("totalPage : 1,");
			pageContext.getOut().write("pageSize : "+pageSize+",");
			pageContext.getOut().write("pageSizeModel : ["+pageSizeModel+"],");
			pageContext.getOut().write("autoload : "+autoload+",");
			pageContext.getOut().write("showTotalSpan : "+showTotalSpan+",");
			pageContext.getOut().write("mutilSelect : "+mutilSelect+",");
			pageContext.getOut().write("modal : "+modal+",");
			
			if (ValidateHelper.isNotEmptyString(tbarId))
			{
				pageContext.getOut().write("tbarId : '"+tbarId+"',");
			}
			
			if (ValidateHelper.isNotEmptyString(searchform))
			{
				pageContext.getOut().write("searchform : '"+searchform+"',");
			}
			if (ValidateHelper.isNotEmptyString(click))
			{
				pageContext.getOut().write("click : "+click+",");
			}
			
			if (ValidateHelper.isNotEmptyString(queryBefore))
			{
				pageContext.getOut().write("queryBefore : " + queryBefore + ",");
			}
			
			if (ValidateHelper.isNotEmptyString(queryAfter))
			{
				pageContext.getOut().write("queryAfter : " + queryAfter + ",");
			}
			
			
			if (ValidateHelper.isNotEmptyString(dblclick))
			{
				pageContext.getOut().write("dblclick : "+dblclick+",");
			}
			
			if (ValidateHelper.isNotEmptyString(autothead))
			{
				pageContext.getOut().write("autothead : "+autothead+",");
			}
			
			if (ValidateHelper.isNotEmptyCollection(colModel))
			{
				pageContext.getOut().write("colModel : [");
				for (int i=0;i<colModel.size();i++)
				{
					ColumnBean column = colModel.get(i);
					
					if(i == colModel.size() - 1)
					{
						pageContext.getOut().write(column.toString());
					}
					else
					{
						pageContext.getOut().write(column.toString()+",");
					}
				}
				pageContext.getOut().write("]");
			}
			pageContext.getOut().write("});\n");
			pageContext.getOut().write("});");
			pageContext.getOut().write("</script>");
			colModel.clear();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return super.doEndTag();
	}

	@Override
	public int doStartTag() throws JspException {
		return EVAL_BODY_INCLUDE;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getWidth() {
		return width;
	}

	public void setWidth(String width) {
		this.width = width;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getDataType() {
		return dataType;
	}

	public void setDataType(String dataType) {
		this.dataType = dataType;
	}

	public String getUsepager() {
		return usepager;
	}

	public void setUsepager(String usepager) {
		this.usepager = usepager;
	}

	
	public String getPageSize() {
		return pageSize;
	}

	public void setPageSize(String pageSize) {
		this.pageSize = pageSize;
	}

	public String getPageSizeModel() {
		return pageSizeModel;
	}

	public void setPageSizeModel(String pageSizeModel) {
		this.pageSizeModel = pageSizeModel;
	}

	public String getAutoload() {
		return autoload;
	}

	public void setAutoload(String autoload) {
		this.autoload = autoload;
	}


	public String getSearchform() {
		return searchform;
	}

	public void setSearchform(String searchform) {
		this.searchform = searchform;
	}

	public String getClick() {
		return click;
	}

	public void setClick(String click) {
		this.click = click;
	}

	public String getDblclick() {
		return dblclick;
	}

	public void setDblclick(String dblclick) {
		this.dblclick = dblclick;
	}

	
	public List<ColumnBean> getColModel() {
		return colModel;
	}

	public void setColModel(List<ColumnBean> colModel) {
		this.colModel = colModel;
	}


	public String getContenturl() {
		return contenturl;
	}

	public void setContenturl(String contenturl) {
		this.contenturl = contenturl;
	}

	public String getContentTemplateId() {
		return contentTemplateId;
	}

	public void setContentTemplateId(String contentTemplateId) {
		this.contentTemplateId = contentTemplateId;
	}


	public String getMutilSelect() {
		return mutilSelect;
	}

	public void setMutilSelect(String mutilSelect) {
		this.mutilSelect = mutilSelect;
	}


	public String getAutothead() {
		return autothead;
	}

	public void setAutothead(String autothead) {
		this.autothead = autothead;
	}

	public String getInitAfter() {
		return initAfter;
	}

	public void setInitAfter(String initAfter) {
		this.initAfter = initAfter;
	}

	public String getModal() {
		return modal;
	}

	public void setModal(String modal) {
		this.modal = modal;
	}

	public String getQueryBefore() {
		return queryBefore;
	}

	public void setQueryBefore(String queryBefore) {
		this.queryBefore = queryBefore;
	}

	public String getQueryAfter() {
		return queryAfter;
	}

	public void setQueryAfter(String queryAfter) {
		this.queryAfter = queryAfter;
	}

	public String getHeight() {
		return height;
	}

	public void setHeight(String height) {
		this.height = height;
	}

	public String getTbarId()
	{
		return tbarId;
	}

	public void setTbarId(String tbarId)
	{
		this.tbarId = tbarId;
	}
	
	public String getIsAsynch()
	{
		return isAsynch;
	}

	public void setIsAsynch(String isAsynch)
	{
		this.isAsynch = isAsynch;
	}

	public List<?> getList()
	{
		return list;
	}

	public void setList(List<?> list)
	{
		this.list = list;
	}

	public String getShowTotalSpan()
	{
		return showTotalSpan;
	}

	public void setShowTotalSpan(String showTotalSpan)
	{
		this.showTotalSpan = showTotalSpan;
	}

}
