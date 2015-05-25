package com.chinacreator.common.cps.bean;

public class CmsDocument {

	private String title;
	private String channelId;
	private String documentId;
	private String siteDir;
	private String chnlPath;
	private String displayName;
	private String docWTime;
	private String author;
	private String isNew;
	private String isPublic;
	private String picPath;
	private String conn;
	private String orgName;

	public String getOrgName() {
		return orgName;
	}

	public void setOrgName(String orgName) {
		this.orgName = orgName;
	}

	public String getConn() {
		return conn;
	}

	public void setConn(String conn) {
		this.conn = conn;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getChannelId() {
		return channelId;
	}

	public void setChannelId(String channelId) {
		this.channelId = channelId;
	}

	public String getDocumentId() {
		return documentId;
	}

	public void setDocumentId(String documentId) {
		this.documentId = documentId;
	}

	public String getChnlPath() {
		return chnlPath;
	}

	public void setChnlPath(String chnlPath) {
		this.chnlPath = chnlPath;
	}

	public String getDisplayName() {
		return displayName;
	}

	public void setDisplayName(String displayName) {
		this.displayName = displayName;
	}

	public String getDocWTime() {
		return docWTime;
	}

	public void setDocWTime(String docWTime) {
		this.docWTime = docWTime;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getIsNew() {
		return isNew;
	}

	public void setIsNew(String isNew) {
		this.isNew = isNew;
	}

	public String getSiteDir() {
		return siteDir;
	}

	public void setSiteDir(String siteDir) {
		this.siteDir = siteDir;
	}

	public String getPicPath() {
		return picPath;
	}

	public void setPicPath(String picPath) {
		this.picPath = picPath;
	}

	public String getIsPublic() {
		return isPublic;
	}

	public void setIsPublic(String isPublic) {
		this.isPublic = isPublic;
	}

}
