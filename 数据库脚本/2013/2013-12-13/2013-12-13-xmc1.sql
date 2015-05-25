CREATE OR REPLACE FUNCTION F_GET_DWLEVE(V_ORGCODE VARCHAR2) RETURN NUMBER
--获取单位所在级别 1：省厅 2：市级3：县级4:派出所5：警务室
AS
       V_LEVE     NUMBER;
BEGIN
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
       ELSIF SUBSTR(V_ORGCODE,9,2)='31' AND SUBSTR(V_ORGCODE,11,2) > '01' AND SUBSTR(V_ORGCODE,11,2)<='40' THEN
          V_LEVE:=5;  
       END IF;
       RETURN V_LEVE;
END;
/

CREATE OR REPLACE FUNCTION F_GET_DZNUMBERCOUNT(V_ORGCODE VARCHAR2) RETURN NUMBER
--获取地址数量
AS
       V_LEVE     NUMBER;  --机构级别  1：省 2:市3：县4：所 5：警务区/市                      
       V_DZS      NUMBER;  --地址数
BEGIN
       V_LEVE:=F_GET_DWLEVE(V_ORGCODE);
       
       V_DZS := 0;
      IF V_LEVE = 1 THEN
          SELECT COUNT(DZ.DZBM) INTO V_DZS FROM T_COMMON_DZXX DZ;
      ELSIF V_LEVE = 2 THEN
            SELECT COUNT(DZ.DZBM) INTO V_DZS FROM T_COMMON_DZXX DZ WHERE DZ.DJRDWDM LIKE SUBSTR(V_ORGCODE,1,4)||'%';
      ELSIF V_LEVE = 3 THEN
             SELECT COUNT(DZ.DZBM) INTO V_DZS FROM T_COMMON_DZXX DZ WHERE DZ.DJRDWDM LIKE SUBSTR(V_ORGCODE,1,6)||'%';
      ELSIF V_LEVE = 4 THEN
             SELECT COUNT(DZ.DZBM) INTO V_DZS FROM T_COMMON_DZXX DZ WHERE DZ.DJRDWDM LIKE SUBSTR(V_ORGCODE,1,8)||'%';
      ELSIF V_LEVE = 5 THEN
             SELECT COUNT(DZ.DZBM) INTO V_DZS FROM T_COMMON_DZXX DZ WHERE DZ.DJRDWDM = V_ORGCODE;
      END IF;
      RETURN V_DZS;
END;
/
CREATE OR REPLACE FUNCTION F_GET_DZCOUNTOFTYPE(V_ORGCODE VARCHAR2, V_TYPE VARCHAR2) RETURN VARCHAR2
--查询地址标注与未标注的数量 
AS
       V_LEVE     NUMBER;  --机构级别  1：省 2:市3：县4：所 5：警务区/市        
       V_YBZDZCOUNT     NUMBER;  --已标注地址统计
       V_WBZDZCOUNT     NUMBER;  --未标注地址统计
BEGIN
      V_LEVE:=F_GET_DWLEVE(V_ORGCODE);
      
      --已标注
      IF V_TYPE='1' THEN 
          IF V_LEVE = 1 THEN
               SELECT COUNT(DZ.DZBM) INTO V_YBZDZCOUNT 
               FROM T_COMMON_DZXX DZ 
               WHERE DZXZB IS NOT NULL AND DZYZB IS NOT NULL;
               
          ELSIF V_LEVE = 2 THEN
               SELECT COUNT(DZ.DZBM) INTO V_YBZDZCOUNT 
               FROM T_COMMON_DZXX DZ 
               WHERE DZ.DJRDWDM LIKE SUBSTR(V_ORGCODE,1,4)||'%'
                     AND DZXZB IS NOT NULL or DZYZB IS NOT NULL;
                     
          ELSIF V_LEVE = 3 THEN
                SELECT COUNT(DZ.DZBM) INTO V_YBZDZCOUNT 
                FROM T_COMMON_DZXX DZ 
                WHERE DZ.DJRDWDM LIKE SUBSTR(V_ORGCODE,1,6)||'%'
                      AND DZXZB IS NOT NULL AND DZYZB IS NOT NULL;
                      
          ELSIF V_LEVE = 4 THEN
                SELECT COUNT(DZ.DZBM) INTO V_YBZDZCOUNT 
                FROM T_COMMON_DZXX DZ 
                WHERE DZ.DJRDWDM LIKE SUBSTR(V_ORGCODE,1,8)||'%' 
                      AND DZXZB IS NOT NULL AND DZYZB IS NOT NULL;
                      
          ELSIF V_LEVE = 5 THEN
                SELECT COUNT(DZ.DZBM) INTO V_YBZDZCOUNT 
                FROM T_COMMON_DZXX DZ 
                WHERE DZ.DJRDWDM = V_ORGCODE
                       AND DZXZB IS NOT NULL AND DZYZB IS NOT NULL;
          END IF;
          RETURN V_YBZDZCOUNT;
      --未标注
      ELSIF V_TYPE='2' THEN
           IF V_LEVE = 1 THEN
               SELECT COUNT(DZ.DZBM) INTO V_WBZDZCOUNT 
               FROM T_COMMON_DZXX DZ 
               WHERE DZXZB IS NULL OR DZYZB IS NULL;
               
          ELSIF V_LEVE = 2 THEN
               SELECT COUNT(DZ.DZBM) INTO V_WBZDZCOUNT 
               FROM T_COMMON_DZXX DZ 
               WHERE DZ.DJRDWDM LIKE SUBSTR(V_ORGCODE,1,4)||'%'
                     AND (DZXZB IS NULL OR DZYZB IS NULL);
                     
          ELSIF V_LEVE = 3 THEN
                SELECT COUNT(DZ.DZBM) INTO V_WBZDZCOUNT 
                FROM T_COMMON_DZXX DZ 
                WHERE DZ.DJRDWDM LIKE SUBSTR(V_ORGCODE,1,6)||'%'
                      AND (DZXZB IS NULL OR DZYZB IS NULL);
                      
          ELSIF V_LEVE = 4 THEN
                SELECT COUNT(DZ.DZBM) INTO V_WBZDZCOUNT 
                FROM T_COMMON_DZXX DZ 
                WHERE DZ.DJRDWDM LIKE SUBSTR(V_ORGCODE,1,8)||'%' 
                      AND (DZXZB IS NULL OR DZYZB IS NULL);
                      
          ELSIF V_LEVE = 5 THEN
                SELECT COUNT(DZ.DZBM) INTO V_WBZDZCOUNT 
                FROM T_COMMON_DZXX DZ 
                WHERE DZ.DJRDWDM = V_ORGCODE
                       AND (DZXZB IS NULL OR DZYZB IS NULL);
          END IF;
           RETURN V_WBZDZCOUNT;
      END IF;     
END;
/