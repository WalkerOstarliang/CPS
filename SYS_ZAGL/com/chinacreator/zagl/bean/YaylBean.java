package com.chinacreator.zagl.bean;
/**
 * 预案演练
 */
public class YaylBean extends OperateBean{

	private static final long serialVersionUID = 3718292908141015952L;
	
	/**
	 * 编号
	 */
	private String bh;
	
	/**
	 * 预案编号
	 */
    private String yabh;
    
    /**
     * 演练名称
     */
	private String ylmc;
	
	/**
	 * 演练时间
	 */
	private String ylsj;
	
	/**
	 * 参演人数
	 */
	private String cyrs;
	
	/**
	 * 描述
	 */
	private String ms;
	
	private String cz;

	public String getBh() {
		return bh;
	}

	public void setBh(String bh) {
		this.bh = bh;
	}

	public String getYabh() {
		return yabh;
	}

	public void setYabh(String yabh) {
		this.yabh = yabh;
	}

	public String getYlmc() {
		return ylmc;
	}

	public void setYlmc(String ylmc) {
		this.ylmc = ylmc;
	}

	public String getYlsj() {
		return ylsj;
	}

	public void setYlsj(String ylsj) {
		this.ylsj = ylsj;
	}

	public String getCyrs() {
		return cyrs;
	}

	public void setCyrs(String cyrs) {
		this.cyrs = cyrs;
	}

	public String getMs() {
		return ms;
	}

	public void setMs(String ms) {
		this.ms = ms;
	}

	public String getCz() {
		cz = "<span class=\"cps_span_href\" onclick=\"delYayl('"+this.bh+"')\">删除</span>";
		return cz;
	}

	public void setCz(String cz) {
		this.cz = cz;
	}
}
