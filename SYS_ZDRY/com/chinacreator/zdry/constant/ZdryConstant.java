package com.chinacreator.zdry.constant;
/**   
 * @author 禹文超
 * @mail wenchao.yu@chinacreator.com
 * @Description: TODO(重点人员常量类)
 * @date Mar 12, 2013 4:43:46 PM
 */
public class ZdryConstant implements java.io.Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1928972150403306046L;
	
	//列管申请类型:1. 申请列管 2.申请撤管
	public static final String ZDRY_LGSQLX_SQLG = "1";
	public static final String ZDRY_LGSQLX_SQCG = "2";
	
	//申请状态：1. 申请, 2.审批 3. 结束
	public static final String ZDRY_SQZT_SQ="1";
	public static final String ZDRY_SQZT_SP="2";
	public static final String ZDRY_SQZT_JS="3";
	
	//列管状态: 1. 列管审批中, 2.列管中, 3. 撤管审批中, 4. 已撤管, 5.审批不通过  
	public static final String ZDRY_LGZT_LGSPZ="1";
	public static final String ZDRY_LGZT_LGZ="2";
	public static final String ZDRY_LGZT_CGSPZ="3";
	public static final String ZDRY_LGZT_YCG="4";
	public static final String ZDRY_LGZT_SPBTG="5";
	
	//重点人员是否管控：1. 已列管， 0. 已撤管
	public static final String ZDRY_ISGK_YLG = "1";
	public static final String ZDRY_ISGK_YCG = "0";
	
	//处理单位类型-承办人填写申请表
	public static final String ZDRY_CLDWLX_CBRTXSQB="1";
	
	//处理单位类型-派出所领导审核
	public static final String ZDRY_CLDWLX_PCSLDSH="2";
	
	//处理单位类型-分局领导审核
	public static final String ZDRY_CLDWLX_FJLDSH="3";
	
	//处理结果 1同意 2.不同意
	public static final String ZDRY_CLJG_TY = "1";
	public static final String ZDRY_CLJG_BTY = "2";
	
	public static final String ZDRY_SP_ZJSPBZ = "1";
	
	//列管来源-犯罪人员认领
	public static final String ZDRY_LGLY_FZRYRL = "";
	
	//犯罪人员认领状态 1.已认领  0.未认领
	public static final String ZDRY_RLZT_YRL = "1";
	public static final String ZDRY_RLZT_WRL = "0";
	
	//报表名称
	public static final String ZDRY_RSTJ = "重点人员数";
	public static final String ZDRY_RSGKTJ = "重点人员列管数";
	
	
}
