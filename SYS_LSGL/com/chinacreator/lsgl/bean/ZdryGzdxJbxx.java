package com.chinacreator.lsgl.bean;

public class ZdryGzdxJbxx {
	/**
	 * 重点人员基本信息  字段
	 */
		private String scxfsj;	//重点人员首次下发时间，请各位不要更新
		private String ssxzsq;	//所属行政社区
		private String ssxzsqmc;	//所属行政社区名称
		private String gzdxbh;	//工作对象编号       GD+6位行政区划 + 12流水号
		private String rybh;	//人员编号               关联人员
		private String sfzh;	//身份证号
		private String rylb;	//人员类别                 RYLB 不再使用
		private String zdrybh;	//重点人员编号
		private String dxlb;	//对象类别                       ZDDXLB     
		private String gxdwdm;	//管辖单位代码
		private String gxdwmc;	//管辖单位名称
		private String zxlasj;	//最新立案时间
		private String salb;	//涉案类别
		private String ladw;	//立案单位
		private String ladwjgdm;	//立案单位代码
		private String cyzk;	//从业状况
		private String cbclqk;	//曾被处理情况
		private String ssyj;	//事实依据
		private String ywda;	//有无档案                0：无 1 ：有"
		private String dabh;	//档案编号
		private String ztlx;	//在逃类型                 ZDrY_ZTLX
		private String xmjjzs;	//刑满解救时间
		private String iscjbj;	//是否采集笔记         0：否 1 ：是"
		private String bjcjlx;	//笔记采集类型         ZDY_BJZL
		private String iscjzw;	//是否指纹采集          0：否 1 ：是"
		private String flwsbh;	//法律文书编号
		private String flwsmc;	//法律文书名称
		private String qfjg;	//签发机关
		private String qfsj;	//签发时间
		private String gllb;	//管理类别           ZDRY_GLLB
		private String glff;	//管理方法           ZDRYGLFF
		private String lgrq;	//列管日期
		private String lgly;	//列管来源           ZDRYLGLY
		private String lgyy;	//列管缘由
		private String cgrq;	//撤管日期
		private String cgly;	//撤管理由
		private String lgzt;	//列管状态          1:审批中 2：列管中 3：已撤管"
		private String isqgqlzdry;	//是否全国七类重点人员    0：否 1 ：是"
		private String nrbjzdryksj;	//纳入部级重点人员库时间
		private String zdrylbbj;	//重点人员类别标记
		private String zdryxl;	//重点人员细类
		private String yxx;	//有效性
		private String xzsj;	//新增时间
		private String bjsj;	//变更时间
		private String cxsj;	//撤销时间
		private String cxdw;	//撤销单位
		private String cxr;	//撤销人
		private String djrxm;	//登记人姓名
		private String djdwdm;	//登记单位代码
		private String djdwmc;	//登记单位名称
		private String djsj;	//登记时间
		private String sfrl;	//是否认领      1:是 0：否
		private String sszrdwdm;	//所属责任单位代码
		private String sszrdwmc;	//所属责任单位名称
		private String sszrmjjh;	//所属责任民警警号
		private String sszrmjxm;	//所属责任民警姓名
		private String sszrmjlxdh;	//所属责任民警联系电话
		public String getScxfsj() {
			return scxfsj;
		}
		public void setScxfsj(String scxfsj) {
			this.scxfsj = scxfsj;
		}
		public String getSsxzsq() {
			return ssxzsq;
		}
		public void setSsxzsq(String ssxzsq) {
			this.ssxzsq = ssxzsq;
		}
		public String getSsxzsqmc() {
			return ssxzsqmc;
		}
		public void setSsxzsqmc(String ssxzsqmc) {
			this.ssxzsqmc = ssxzsqmc;
		}
		public String getGzdxbh() {
			return gzdxbh;
		}
		public void setGzdxbh(String gzdxbh) {
			this.gzdxbh = gzdxbh;
		}
		public String getRybh() {
			return rybh;
		}
		public void setRybh(String rybh) {
			this.rybh = rybh;
		}
		public String getSfzh() {
			return sfzh;
		}
		public void setSfzh(String sfzh) {
			this.sfzh = sfzh;
		}
		public String getRylb() {
			return rylb;
		}
		public void setRylb(String rylb) {
			this.rylb = rylb;
		}
		public String getZdrybh() {
			return zdrybh;
		}
		public void setZdrybh(String zdrybh) {
			this.zdrybh = zdrybh;
		}
		public String getDxlb() {
			return dxlb;
		}
		public void setDxlb(String dxlb) {
			this.dxlb = dxlb;
		}
		public String getGxdwdm() {
			return gxdwdm;
		}
		public void setGxdwdm(String gxdwdm) {
			this.gxdwdm = gxdwdm;
		}
		public String getGxdwmc() {
			return gxdwmc;
		}
		public void setGxdwmc(String gxdwmc) {
			this.gxdwmc = gxdwmc;
		}
		public String getZxlasj() {
			return zxlasj;
		}
		public void setZxlasj(String zxlasj) {
			this.zxlasj = zxlasj;
		}
		public String getSalb() {
			return salb;
		}
		public void setSalb(String salb) {
			this.salb = salb;
		}
		public String getLadw() {
			return ladw;
		}
		public void setLadw(String ladw) {
			this.ladw = ladw;
		}
		public String getLadwjgdm() {
			return ladwjgdm;
		}
		public void setLadwjgdm(String ladwjgdm) {
			this.ladwjgdm = ladwjgdm;
		}
		public String getCyzk() {
			return cyzk;
		}
		public void setCyzk(String cyzk) {
			this.cyzk = cyzk;
		}
		public String getCbclqk() {
			return cbclqk;
		}
		public void setCbclqk(String cbclqk) {
			this.cbclqk = cbclqk;
		}
		public String getSsyj() {
			return ssyj;
		}
		public void setSsyj(String ssyj) {
			this.ssyj = ssyj;
		}
		public String getYwda() {
			return ywda;
		}
		public void setYwda(String ywda) {
			this.ywda = ywda;
		}
		public String getDabh() {
			return dabh;
		}
		public void setDabh(String dabh) {
			this.dabh = dabh;
		}
		public String getZtlx() {
			return ztlx;
		}
		public void setZtlx(String ztlx) {
			this.ztlx = ztlx;
		}
		public String getXmjjzs() {
			return xmjjzs;
		}
		public void setXmjjzs(String xmjjzs) {
			this.xmjjzs = xmjjzs;
		}
		public String getIscjbj() {
			return iscjbj;
		}
		public void setIscjbj(String iscjbj) {
			this.iscjbj = iscjbj;
		}
		public String getBjcjlx() {
			return bjcjlx;
		}
		public void setBjcjlx(String bjcjlx) {
			this.bjcjlx = bjcjlx;
		}
		public String getIscjzw() {
			return iscjzw;
		}
		public void setIscjzw(String iscjzw) {
			this.iscjzw = iscjzw;
		}
		public String getFlwsbh() {
			return flwsbh;
		}
		public void setFlwsbh(String flwsbh) {
			this.flwsbh = flwsbh;
		}
		public String getFlwsmc() {
			return flwsmc;
		}
		public void setFlwsmc(String flwsmc) {
			this.flwsmc = flwsmc;
		}
		public String getQfjg() {
			return qfjg;
		}
		public void setQfjg(String qfjg) {
			this.qfjg = qfjg;
		}
		public String getQfsj() {
			return qfsj;
		}
		public void setQfsj(String qfsj) {
			this.qfsj = qfsj;
		}
		public String getGllb() {
			return gllb;
		}
		public void setGllb(String gllb) {
			this.gllb = gllb;
		}
		public String getGlff() {
			return glff;
		}
		public void setGlff(String glff) {
			this.glff = glff;
		}
		public String getLgrq() {
			return lgrq;
		}
		public void setLgrq(String lgrq) {
			this.lgrq = lgrq;
		}
		public String getLgly() {
			return lgly;
		}
		public void setLgly(String lgly) {
			this.lgly = lgly;
		}
		public String getLgyy() {
			return lgyy;
		}
		public void setLgyy(String lgyy) {
			this.lgyy = lgyy;
		}
		public String getCgrq() {
			return cgrq;
		}
		public void setCgrq(String cgrq) {
			this.cgrq = cgrq;
		}
		public String getCgly() {
			return cgly;
		}
		public void setCgly(String cgly) {
			this.cgly = cgly;
		}
		public String getLgzt() {
			return lgzt;
		}
		public void setLgzt(String lgzt) {
			this.lgzt = lgzt;
		}
		public String getIsqgqlzdry() {
			return isqgqlzdry;
		}
		public void setIsqgqlzdry(String isqgqlzdry) {
			this.isqgqlzdry = isqgqlzdry;
		}
		public String getNrbjzdryksj() {
			return nrbjzdryksj;
		}
		public void setNrbjzdryksj(String nrbjzdryksj) {
			this.nrbjzdryksj = nrbjzdryksj;
		}
		public String getZdrylbbj() {
			return zdrylbbj;
		}
		public void setZdrylbbj(String zdrylbbj) {
			this.zdrylbbj = zdrylbbj;
		}
		public String getZdryxl() {
			return zdryxl;
		}
		public void setZdryxl(String zdryxl) {
			this.zdryxl = zdryxl;
		}
		public String getYxx() {
			return yxx;
		}
		public void setYxx(String yxx) {
			this.yxx = yxx;
		}
		public String getXzsj() {
			return xzsj;
		}
		public void setXzsj(String xzsj) {
			this.xzsj = xzsj;
		}
		public String getBjsj() {
			return bjsj;
		}
		public void setBjsj(String bjsj) {
			this.bjsj = bjsj;
		}
		public String getCxsj() {
			return cxsj;
		}
		public void setCxsj(String cxsj) {
			this.cxsj = cxsj;
		}
		public String getCxdw() {
			return cxdw;
		}
		public void setCxdw(String cxdw) {
			this.cxdw = cxdw;
		}
		public String getCxr() {
			return cxr;
		}
		public void setCxr(String cxr) {
			this.cxr = cxr;
		}
		public String getDjrxm() {
			return djrxm;
		}
		public void setDjrxm(String djrxm) {
			this.djrxm = djrxm;
		}
		public String getDjdwdm() {
			return djdwdm;
		}
		public void setDjdwdm(String djdwdm) {
			this.djdwdm = djdwdm;
		}
		public String getDjdwmc() {
			return djdwmc;
		}
		public void setDjdwmc(String djdwmc) {
			this.djdwmc = djdwmc;
		}
		public String getDjsj() {
			return djsj;
		}
		public void setDjsj(String djsj) {
			this.djsj = djsj;
		}
		public String getSfrl() {
			return sfrl;
		}
		public void setSfrl(String sfrl) {
			this.sfrl = sfrl;
		}
		public String getSszrdwdm() {
			return sszrdwdm;
		}
		public void setSszrdwdm(String sszrdwdm) {
			this.sszrdwdm = sszrdwdm;
		}
		public String getSszrdwmc() {
			return sszrdwmc;
		}
		public void setSszrdwmc(String sszrdwmc) {
			this.sszrdwmc = sszrdwmc;
		}
		public String getSszrmjjh() {
			return sszrmjjh;
		}
		public void setSszrmjjh(String sszrmjjh) {
			this.sszrmjjh = sszrmjjh;
		}
		public String getSszrmjxm() {
			return sszrmjxm;
		}
		public void setSszrmjxm(String sszrmjxm) {
			this.sszrmjxm = sszrmjxm;
		}
		public String getSszrmjlxdh() {
			return sszrmjlxdh;
		}
		public void setSszrmjlxdh(String sszrmjlxdh) {
			this.sszrmjlxdh = sszrmjlxdh;
		}
}
