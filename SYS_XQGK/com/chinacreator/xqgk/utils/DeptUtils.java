package com.chinacreator.xqgk.utils;

public class DeptUtils {

	public static String getLevelCode(String orgCode){
		int level = getLevel(orgCode);
		if(level == 5){
			return orgCode;
		}else{
			String levelCode = orgCode.substring(0, (level * 2));
			return levelCode;
		}
	}
	
	public static int getLevel(String orgCode) {
		/*
	       --省级用户
	       IF SUBSTR(V_ORGCODE,3,2)='00' THEN
	          V_LEVE:=1;
	        --市级级
	       ELSIF SUBSTR(V_ORGCODE,5,2)='00' THEN
	          V_LEVE:=2;
	       --县级用户
	       ELSIF SUBSTR(V_ORGCODE,7,2)='00' OR (SUBSTR(V_ORGCODE,7,2) >='01' AND SUBSTR(V_ORGCODE,7,2)<='40' OR SUBSTR(V_ORGCODE,7,2) >='71')  THEN
	          V_LEVE:=3;
	       --派出所
	       ELSIF SUBSTR(V_ORGCODE,7,2)>='41' AND SUBSTR(V_ORGCODE,7,2)<='70' AND SUBSTR(V_ORGCODE,9,2) !='31' THEN
	          V_LEVE:=4;
	       --责任区
	       ELSIF SUBSTR(V_ORGCODE,7,2)>='41' AND SUBSTR(V_ORGCODE,7,2)<='70' AND SUBSTR(V_ORGCODE,9,4)='3100' THEN
	          V_LEVE:=4;
	        --警务室
	       ELSIF SUBSTR(V_ORGCODE,9,2)='31' AND SUBSTR(V_ORGCODE,11,2) >= '01' AND SUBSTR(V_ORGCODE,11,2)<='40' THEN
	          V_LEVE:=5;
	       END IF;
	       */
		int level = 5;//其他警务室/区
		String checkStr = "00";
		if (orgCode.substring(2, 4).equals(checkStr)){// 省级
			level = 1;
		}else if (orgCode.substring(4, 6).equals(checkStr)){// 市级
			level = 2;
		}else if (orgCode.substring(6, 8).equals(checkStr)){// 县级
			level = 3;
		}else if (orgCode.substring(8, 10).equals(checkStr)){//派出所
			level = 4;
		}else{//其他警务室/区
			level = 5;
		}
		
		/*
		if (!orgCode.substring(0, 2).equals(checkStr)){// 省级
			level = 1;
		}
		if (!orgCode.substring(2, 4).equals(checkStr)){// 市级
			level = 2;
		}
		if (!orgCode.substring(4, 6).equals(checkStr)){// 县级
			level = 3;
		}
		if (!orgCode.substring(6, 8).equals(checkStr)){//派出所
			level = 4;
		}
		if (!orgCode.substring(8, 10).equals(checkStr)){//其他警务室/区
			level = 5;
		}
		*/

		return level;
	}
	
}
