package com.chinacreator.xqgk.bean.show;
@SuppressWarnings("unused")
public class ZfbaRyBean {
	
	private int jyflag;
	private String rybh;
	private String ajbh;
	private String showJfFlag;
    
	public int getJyflag() {
		return jyflag;
	}
	public void setJyflag(int jyflag) {
		this.jyflag = jyflag;
	}
	public String getRybh() {
		return rybh;
	}
	public void setRybh(String rybh) {
		this.rybh = rybh;
	}
	public String getAjbh() {
		return ajbh;
	}
	public void setAjbh(String ajbh) {
		this.ajbh = ajbh;
	}
	public String getShowJfFlag() {
		String name = "未指定";
		if(jyflag == 1){
			name = "未接收";
		}else if(jyflag == 2){
			name = "已接收";
		}else if(jyflag == 3){
			name = "已退回";
		}else if(jyflag == 4){
			name = "申请离开";
		}else if(jyflag == 5){
			name = "已解除";
		}
		return name;
	}
}
