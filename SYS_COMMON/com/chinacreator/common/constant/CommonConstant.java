package com.chinacreator.common.constant;



public final class CommonConstant implements java.io.Serializable{
	
	/**
	 * 
	 */
	private static final long	serialVersionUID	= 3062675383126474722L;
	
	public static final String ST_SQJW_ROOT_MENU_ID = "SQJW1000003086";
	
	public static final String USER_FUNCTION_DATA = "user_function_data";
	
	public static final String DBNAME_SQJW = "sqjw";
	
	public static final String DBNAME_PTGL = "ptgl";
	
	public static final String DBNAME_BB ="csjzbb";
	
	public static final String DBNAME_XXGL = "xxgl";
	
	public static final String LOGIN_INFO = "loginInfo";
	
	public static final String LOGIN_OUT = "logout";
	
	//省份证号
	public static final String USER_IDCARD = "sfzh";
	
	public static final String USER_USERNAME = "username";
	
	//机构基本信息
	public static final String DWTYPE_JG = "JG";
	
	//特种行业
	public static final String DWTYPE_TH = "TH";
	
	//内保单位
	public static final String DWTYPE_NB = "NB";
	
	//公共场所
	public static final String DWTYPE_GC = "GC";
	
	//新增
	public static final String OPERTYPE_ADD = "add";
	
	
	//修改
	public static final String OPERTYPE_UPDATE = "update";
	
	//删除
	public static final String OPERTYPE_DELETE = "delete";

	//查询
	public static final String OPERTYPE_SELECT = "select";
	
	//任务反馈
	public static final String OPERTYPE_FK = "fk";
	
	//明细
	public static final String OPERTYPE_DETAIL = "detail";
	
	//其他操作类型
	public static final String OPERTYPE_QT = "qt";
	
	//人员档案
	public static final String OPERTYPE_RYDAXX="rydaxx";
	

	//字典类别常量
	public static final String ZDRY_ZDLB_TXLB="ZDRY_TXLB";
	public static final String ZDRY_ZDLB_RYLX="ZDRY_RYLX";
	public static final String ZDRY_ZDLB_XB="GB_XB";
	public static final String ZDRY_ZDLB_LGZT="ZDRY_LGZT";
	public static final String ZDRY_ZDLB_CLDWLX = "ZDRY_CLDWLX";
	public static final String ZDRY_ZDLB_CLJG = "ZDRY_CLJG";
	public static final String ZDRY_GXR_JTGX="ZDRY_JTGX";
	
	public static final String HN_XZQH = "HN_XZQH";
	public static final String ZDRY_RYKC_ZKZT = "ZDRY_ZKZT";
	
	//登录用户等级
	public static final int DLYHDJ_ST = 1;		//省厅
	public static final int DLYHDJ_SJ = 2;		//市级
	public static final int DLYHDJ_XJ = 3;		//县级
	public static final int DLYHDJ_PCS = 4;		//派出所
	public static final int DLYHDJ_SQ = 5;		//社区
	
	//操作标识
	public static final String CZBZ_ADD = "1";        //新增
	public static final String CZBZ_UPDATE = "2";     //修改
	public static final String CZBZ_DEL = "3";     	  //删除
	public static final String CZBZ_ZX = "4";         //注销
	public static final String CZBZ_HF = "5";         //恢复
	
	//注销类型字典
	public static final String ZX_DIC_ZC = "0";          //正常
	public static final String ZX_DIC_ZX = "1";          //注销
	
	//"是","否" 选择
	public static final String FOU = "0";           //否
	public static final String SHI = "1";           //是
	
	//重点人员类别
	public static final String ZDRY_ZDRY = "01";      //重点人员
	public static final String ZDRY_GZDX = "02";      //工作对象
 	public static final String ZDRY_SKRY = "00";      //涉恐人员
	public static final String ZDRY_SWRY = "00";      //涉稳人员
	public static final String ZDRY_ZTRY = "00";      //在逃人员
	public static final String ZDRY_SDRY = "00";      //涉毒人员
	public static final String ZDRY_XSFZQKRY = "00";    //刑事犯罪前科人员
	public static final String ZDRY_JSBR = "00";	  //肇事肇祸精神病人
	public static final String ZDRY_SFRY = "00";      //上访人员
	
	
	//房屋管理类别
	public static final String FWJC_YELLOW="301";   //黄色一般户
	public static final String FWJC_RED="302";      //红色重点户
	public static final String FWJC_GREEN="303";    //绿色放心户
	
	//常控预警
	public static final String CKYJ_QSZT_QS = "1"; //签收状态
	
	public static final String CKYJ_FKZT_FK = "1"; //反馈状态
	
	//重点人员接管状态
	public static final String ZDRY_JGZT_WJG = "0"; //未接管
	public static final String ZDRY_JGZT_YJG = "1"; //已接管
	public static final String ZDRY_JGZT_TH = "2";  //退回
	
	//单位管理状态
	public static final String DW_OP_CZZT_PF = "1"; //派发
	public static final String DW_OP_CZZT_QS = "2"; //签收
	public static final String DW_OP_CZZT_TH = "3"; //退回
	public static final String DW_OP_CZZT_SD = "4"; //锁定
	public static final String DW_OP_CZZT_CX = "5"; //撤销锁定
	
	public static final String DW_OP_GLZT_ZC = "0"; //正常
	public static final String DW_OP_GLZT_SD = "1"; //锁定
	
}
