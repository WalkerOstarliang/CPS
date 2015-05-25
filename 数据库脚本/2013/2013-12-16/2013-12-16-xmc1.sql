create or replace view v_common_organization as
select org_id as orgid,
        code as orgcode,
        org_name as orgname,
        parent_id as parent_orgid ,
        (select code from ptgl.td_sm_organization t1 where t1.org_id=t.parent_id and rownum=1) as parent_code,
        remark5 as orgjc,
        f_get_dwleve(t.code) as leve,
        t.creatingtime as createdate,
        org_sn as sn,
        (case remark6 when '0' then '1' else '0' end) as isyx,
        (case when t.org_name like '%派出所' then '1' else null end) as  ispcs
 from ptgl.td_sm_organization t;


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

CREATE OR REPLACE FUNCTION F_GET_DZNEWNUMBER(V_ORGCODE VARCHAR2, V_STARTDATE DATE, V_ENDDATE DATE) RETURN NUMBER
--指定时间内数据的新增地址数量统计
AS
       V_LEVE     NUMBER;  --机构级别  1：省 2:市3：县4：所 5：警务区/市                      
       V_DZS      NUMBER;  --地址数
BEGIN
      V_LEVE:=F_GET_DWLEVE(V_ORGCODE);
       
      V_DZS := 0;
      IF V_LEVE = 1 THEN
          SELECT COUNT(DZ.DZBM) INTO V_DZS 
          FROM T_COMMON_DZXX DZ 
          WHERE DJSJ>=V_STARTDATE AND DJSJ<=V_ENDDATE;
      ELSIF V_LEVE = 2 THEN
            SELECT COUNT(DZ.DZBM) INTO V_DZS 
            FROM T_COMMON_DZXX DZ 
            WHERE DZ.DJRDWDM LIKE SUBSTR(V_ORGCODE,1,4)||'%' 
                  AND DJSJ>=V_STARTDATE AND DJSJ<=V_ENDDATE;
      ELSIF V_LEVE = 3 THEN
             SELECT COUNT(DZ.DZBM) INTO V_DZS 
             FROM T_COMMON_DZXX DZ 
             WHERE DZ.DJRDWDM LIKE SUBSTR(V_ORGCODE,1,6)||'%' 
                   AND DJSJ>=V_STARTDATE AND DJSJ<=V_ENDDATE;
      ELSIF V_LEVE = 4 THEN
             SELECT COUNT(DZ.DZBM) INTO V_DZS 
             FROM T_COMMON_DZXX DZ 
             WHERE DZ.DJRDWDM LIKE SUBSTR(V_ORGCODE,1,8)||'%' 
                   AND DJSJ>=V_STARTDATE AND DJSJ<=V_ENDDATE;
      ELSIF V_LEVE = 5 THEN
             SELECT COUNT(DZ.DZBM) INTO V_DZS 
             FROM T_COMMON_DZXX DZ 
             WHERE DZ.DJRDWDM = V_ORGCODE 
                   AND DJSJ>=V_STARTDATE AND DJSJ<=V_ENDDATE;
      END IF;
      RETURN V_DZS;
END;
/

CREATE OR REPLACE FUNCTION F_GET_DZNEWNUMBER(V_ORGCODE VARCHAR2, V_STARTDATE DATE, V_ENDDATE DATE) RETURN NUMBER
--指定时间内数据的新增地址数量统计
AS
       V_LEVE     NUMBER;  --机构级别  1：省 2:市3：县4：所 5：警务区/市                      
       V_DZS      NUMBER;  --地址数
BEGIN
      V_LEVE:=F_GET_DWLEVE(V_ORGCODE);
       
      V_DZS := 0;
      IF V_LEVE = 1 THEN
          SELECT COUNT(DZ.DZBM) INTO V_DZS 
          FROM T_COMMON_DZXX DZ 
          WHERE DJSJ>=V_STARTDATE AND DJSJ<=V_ENDDATE;
      ELSIF V_LEVE = 2 THEN
            SELECT COUNT(DZ.DZBM) INTO V_DZS 
            FROM T_COMMON_DZXX DZ 
            WHERE DZ.DJRDWDM LIKE SUBSTR(V_ORGCODE,1,4)||'%' 
                  AND DJSJ>=V_STARTDATE AND DJSJ<=V_ENDDATE;
      ELSIF V_LEVE = 3 THEN
             SELECT COUNT(DZ.DZBM) INTO V_DZS 
             FROM T_COMMON_DZXX DZ 
             WHERE DZ.DJRDWDM LIKE SUBSTR(V_ORGCODE,1,6)||'%' 
                   AND DJSJ>=V_STARTDATE AND DJSJ<=V_ENDDATE;
      ELSIF V_LEVE = 4 THEN
             SELECT COUNT(DZ.DZBM) INTO V_DZS 
             FROM T_COMMON_DZXX DZ 
             WHERE DZ.DJRDWDM LIKE SUBSTR(V_ORGCODE,1,8)||'%' 
                   AND DJSJ>=V_STARTDATE AND DJSJ<=V_ENDDATE;
      ELSIF V_LEVE = 5 THEN
             SELECT COUNT(DZ.DZBM) INTO V_DZS 
             FROM T_COMMON_DZXX DZ 
             WHERE DZ.DJRDWDM = V_ORGCODE 
                   AND DJSJ>=V_STARTDATE AND DJSJ<=V_ENDDATE;
      END IF;
      RETURN V_DZS;
END;
/

CREATE OR REPLACE FUNCTION F_GET_STXXNUMBERBYSTFLS(V_ORGCODE VARCHAR2, V_STFL VARCHAR2) RETURN NUMBER
--通过实体分类获取实体信息的数量 每次只能查询一类
--STFL 可以查看字典 T_COMMON_DICTIONARY ZDLB='ZDY_STFL' 
AS
       V_LEVE     NUMBER;  --机构级别  1：省 2:市3：县4：所 5：警务区/市                      
       V_DZS      NUMBER;  --地址数
BEGIN
      V_LEVE:=F_GET_DWLEVE(V_ORGCODE);
      V_DZS := 0;
      IF V_LEVE = 1 THEN
          SELECT COUNT(1) INTO V_DZS 
          FROM T_COMMON_STXX DZ 
          WHERE DZ.STFL=V_STFL;
          
      ELSIF V_LEVE = 2 THEN
            SELECT COUNT(1) INTO V_DZS 
            FROM T_COMMON_STXX DZ 
            WHERE DZ.DJDWDM LIKE SUBSTR(V_ORGCODE,1,4)||'%' 
                 AND DZ.STFL=V_STFL;
                 
      ELSIF V_LEVE = 3 THEN
             SELECT COUNT(1) INTO V_DZS 
             FROM T_COMMON_STXX DZ 
             WHERE DZ.DJDWDM LIKE SUBSTR(V_ORGCODE,1,6)||'%' 
                  AND DZ.STFL=V_STFL;
                  
      ELSIF V_LEVE = 4 THEN
             SELECT COUNT(1) INTO V_DZS 
             FROM T_COMMON_STXX DZ 
             WHERE DZ.DJDWDM LIKE SUBSTR(V_ORGCODE,1,8)||'%' 
                  AND DZ.STFL=V_STFL;
                  
      ELSIF V_LEVE = 5 THEN
             SELECT COUNT(1) INTO V_DZS 
             FROM T_COMMON_STXX DZ 
             WHERE DZ.DJDWDM = V_ORGCODE 
                  AND DZ.STFL=V_STFL;
      END IF;
      RETURN V_DZS;

END;
/

CREATE OR REPLACE FUNCTION F_GET_STXXNEWNUMBER(V_ORGCODE VARCHAR2, V_STARTDATE DATE, V_ENDDATE DATE) RETURN NUMBER
--获取指定时间内实体信息新增的数量
AS
       V_LEVE     NUMBER;  --机构级别  1：省 2:市3：县4：所 5：警务区/市
       V_DZS      NUMBER;  --地址数
BEGIN
      V_LEVE:=F_GET_DWLEVE(V_ORGCODE);

      V_DZS := 0;
      IF V_LEVE = 1 THEN
          SELECT COUNT(1) INTO V_DZS
          FROM T_COMMON_STXX DZ
          WHERE DJSJ>=V_STARTDATE AND DJSJ<=V_ENDDATE;
          
      ELSIF V_LEVE = 2 THEN
            SELECT COUNT(1) INTO V_DZS
            FROM T_COMMON_STXX DZ
            WHERE DZ.DJDWDM LIKE SUBSTR(V_ORGCODE,1,4)||'%'
                  AND DJSJ>=V_STARTDATE AND DJSJ<=V_ENDDATE;
                  
      ELSIF V_LEVE = 3 THEN
             SELECT COUNT(1) INTO V_DZS
             FROM T_COMMON_STXX DZ
             WHERE DZ.DJDWDM LIKE SUBSTR(V_ORGCODE,1,6)||'%'
                   AND DJSJ>=V_STARTDATE AND DJSJ<=V_ENDDATE;
                   
      ELSIF V_LEVE = 4 THEN
             SELECT COUNT(1) INTO V_DZS
             FROM T_COMMON_STXX DZ
             WHERE DZ.DJDWDM LIKE SUBSTR(V_ORGCODE,1,8)||'%'
                   AND DJSJ>=V_STARTDATE AND DJSJ<=V_ENDDATE;
                   
      ELSIF V_LEVE = 5 THEN
             SELECT COUNT(1) INTO V_DZS
             FROM T_COMMON_STXX DZ
             WHERE DZ.DJDWDM = V_ORGCODE
                   AND DJSJ>=V_STARTDATE AND DJSJ<=V_ENDDATE;
                   
      END IF;
      RETURN V_DZS;
END;
/

CREATE OR REPLACE FUNCTION F_GET_FWCOUNT(V_ORGCODE VARCHAR2) RETURN NUMBER
--获取房屋的数量
AS
      V_LEVE     NUMBER;
BEGIN
      V_LEVE := F_GET_DWLEVE(V_ORGCODE);
      RETURN F_GET_FWNUMBER(V_ORGCODE,V_LEVE||'');

END;
/

CREATE OR REPLACE FUNCTION F_GET_CZFWCOUNT(V_ORGCODE VARCHAR2) RETURN NUMBER
--获取出租房屋数量
AS
       V_LEVE     NUMBER;
BEGIN
      V_LEVE := F_GET_DWLEVE(V_ORGCODE);
      RETURN F_GET_CZFWNUMBER(V_ORGCODE,V_LEVE||'');
END;
/

CREATE OR REPLACE FUNCTION F_GET_CYRYCOUNT(V_ORGCODE VARCHAR2) RETURN NUMBER
AS
       V_LEVE     NUMBER;
BEGIN
      V_LEVE := F_GET_DWLEVE(V_ORGCODE);
      RETURN F_GET_CYRYNUMBER(V_ORGCODE,V_LEVE||'');
END;
/

CREATE OR REPLACE FUNCTION F_GET_SYDWCOUNT(V_ORGCODE VARCHAR2,V_HYLB VARCHAR2, V_STARTDATE DATE, V_ENDDATE DATE) RETURN NUMBER
--获取实有单位数量
--如果时间为空则获取所有的
--时间不为空则获取自定时间内的
--V_ORGCODE :单位代码
--V_HYLB:行业类别
--V_STARTDATE ：开始时间
--V_ENDDATE：结束时间
AS
       V_LEVE     NUMBER;
       V_DWS      number;
BEGIN
      V_LEVE := F_GET_DWLEVE(V_ORGCODE);
      
      --查询所有的
     IF V_STARTDATE IS NULL OR V_ENDDATE IS NULL THEN
        IF V_LEVE=1 THEN
           --行业类别为空
           IF V_HYLB IS NULL THEN
              SELECT COUNT(DW.JGBH) INTO V_DWS
              FROM T_ZA_JG_JBXX DW
              WHERE DW.CZBS != '3'
                    AND (DW.ZXBS = '0' OR DW.ZXBS IS NULL);
           ELSE
              SELECT COUNT(DW.JGBH) INTO V_DWS
              FROM T_ZA_JG_JBXX DW
              WHERE DW.CZBS != '3' 
                    AND DW.HYLB=V_HYLB
                    AND (DW.ZXBS = '0' OR DW.ZXBS IS NULL);
           END IF;
                    
        ELSIF V_LEVE = 2 THEN
 
           IF V_HYLB IS NULL THEN
              SELECT COUNT(DW.JGBH) INTO V_DWS
              FROM T_ZA_JG_JBXX DW
              WHERE DW.CZBS != '3'
                    AND (DW.ZXBS = '0' OR DW.ZXBS IS NULL)
                    AND DW.ZRDWPCSDM LIKE SUBSTR(V_ORGCODE,1,4)||'%';
           ELSE
              SELECT COUNT(DW.JGBH) INTO V_DWS
              FROM T_ZA_JG_JBXX DW
              WHERE DW.CZBS != '3'
                    AND DW.HYLB = V_HYLB
                    AND (DW.ZXBS = '0' OR DW.ZXBS IS NULL)
                    AND DW.ZRDWPCSDM LIKE SUBSTR(V_ORGCODE,1,4)||'%';
           END IF;
        ELSIF V_LEVE = 3 THEN
           IF V_HYLB IS NULL THEN
              SELECT COUNT(DW.JGBH) INTO V_DWS
              FROM T_ZA_JG_JBXX DW
              WHERE DW.CZBS != '3'
                    AND (DW.ZXBS = '0' OR DW.ZXBS IS NULL)
                    AND DW.ZRDWPCSDM LIKE SUBSTR(V_ORGCODE,1,6)||'%';
           ELSE 
              SELECT COUNT(DW.JGBH) INTO V_DWS
              FROM T_ZA_JG_JBXX DW
              WHERE DW.CZBS != '3'
                    AND DW.HYLB = V_HYLB
                    AND (DW.ZXBS = '0' OR DW.ZXBS IS NULL)
                    AND DW.ZRDWPCSDM LIKE SUBSTR(V_ORGCODE,1,6)||'%';
           END IF;
                    
        ELSIF V_LEVE = 4 THEN
           IF V_HYLB IS NULL THEN
              SELECT COUNT(DW.JGBH) INTO V_DWS
              FROM T_ZA_JG_JBXX DW
              WHERE DW.CZBS != '3'
                    AND (DW.ZXBS = '0' OR DW.ZXBS IS NULL)
                    AND DW.ZRDWPCSDM LIKE SUBSTR(V_ORGCODE,1,8)||'%';
           ELSE 
              SELECT COUNT(DW.JGBH) INTO V_DWS
              FROM T_ZA_JG_JBXX DW
              WHERE DW.CZBS != '3'
                    AND DW.HYLB = V_HYLB
                    AND (DW.ZXBS = '0' OR DW.ZXBS IS NULL)
                    AND DW.ZRDWPCSDM LIKE SUBSTR(V_ORGCODE,1,8)||'%';
           END IF;       
        ELSIF V_LEVE = 5 THEN
           IF V_HYLB IS NULL THEN
              SELECT COUNT(DW.JGBH) INTO V_DWS
              FROM T_ZA_JG_JBXX DW
              WHERE DW.CZBS != '3'
                    AND (DW.ZXBS = '0' OR DW.ZXBS IS NULL)
                    AND DW.ZRDWPCSDM = V_ORGCODE;
           ELSE 
              SELECT COUNT(DW.JGBH) INTO V_DWS
              FROM T_ZA_JG_JBXX DW
              WHERE DW.CZBS != '3'
                    AND DW.HYLB = V_HYLB
                    AND (DW.ZXBS = '0' OR DW.ZXBS IS NULL)
                    AND DW.ZRDWPCSDM = V_ORGCODE;
           END IF;  
        END IF;
     --查询带时间的范围内的           
     ELSE
       IF V_LEVE=1 THEN
          IF V_HYLB IS NULL THEN
              SELECT COUNT(DW.JGBH) INTO V_DWS
              FROM T_ZA_JG_JBXX DW
              WHERE DW.CZBS != '3'
                    AND (DW.ZXBS = '0' OR DW.ZXBS IS NULL)
                    AND DJSJ>=V_STARTDATE AND DJSJ<=V_ENDDATE;
          ELSE
             SELECT COUNT(DW.JGBH) INTO V_DWS
              FROM T_ZA_JG_JBXX DW
              WHERE DW.CZBS != '3'
                    AND DW.HYLB = V_HYLB
                    AND (DW.ZXBS = '0' OR DW.ZXBS IS NULL)
                    AND DJSJ>=V_STARTDATE AND DJSJ<=V_ENDDATE; 
          END IF;
                    
        ELSIF V_LEVE = 2 THEN
          IF V_HYLB IS NULL THEN
              SELECT COUNT(DW.JGBH) INTO V_DWS
              FROM T_ZA_JG_JBXX DW
              WHERE DW.CZBS != '3'
                    AND (DW.ZXBS = '0' OR DW.ZXBS IS NULL)
                    AND DW.ZRDWPCSDM LIKE SUBSTR(V_ORGCODE,1,4)||'%'
                    AND DJSJ>=V_STARTDATE AND DJSJ<=V_ENDDATE;
          ELSE
              SELECT COUNT(DW.JGBH) INTO V_DWS
              FROM T_ZA_JG_JBXX DW
              WHERE DW.CZBS != '3'
                    AND DW.HYLB = V_HYLB
                    AND (DW.ZXBS = '0' OR DW.ZXBS IS NULL)
                    AND DW.ZRDWPCSDM LIKE SUBSTR(V_ORGCODE,1,4)||'%'
                    AND DJSJ>=V_STARTDATE AND DJSJ<=V_ENDDATE;
          END IF;
                    
        ELSIF V_LEVE = 3 THEN
           IF V_HYLB IS NULL THEN
              SELECT COUNT(DW.JGBH) INTO V_DWS
              FROM T_ZA_JG_JBXX DW
              WHERE DW.CZBS != '3'
                    AND (DW.ZXBS = '0' OR DW.ZXBS IS NULL)
                    AND DW.ZRDWPCSDM LIKE SUBSTR(V_ORGCODE,1,6)||'%'
                    AND DJSJ>=V_STARTDATE AND DJSJ<=V_ENDDATE;
           ELSE
              SELECT COUNT(DW.JGBH) INTO V_DWS
              FROM T_ZA_JG_JBXX DW
              WHERE DW.CZBS != '3'
                    AND DW.HYLB = V_HYLB
                    AND (DW.ZXBS = '0' OR DW.ZXBS IS NULL)
                    AND DW.ZRDWPCSDM LIKE SUBSTR(V_ORGCODE,1,6)||'%'
                    AND DJSJ>=V_STARTDATE AND DJSJ<=V_ENDDATE;
           
           END IF;
                    
        ELSIF V_LEVE = 4 THEN
           IF V_HYLB IS NULL THEN
              SELECT COUNT(DW.JGBH) INTO V_DWS
              FROM T_ZA_JG_JBXX DW
              WHERE DW.CZBS != '3'
                    AND (DW.ZXBS = '0' OR DW.ZXBS IS NULL)
                    AND DW.ZRDWPCSDM LIKE SUBSTR(V_ORGCODE,1,8)||'%'
                    AND DJSJ>=V_STARTDATE AND DJSJ<=V_ENDDATE;
           ELSE
              SELECT COUNT(DW.JGBH) INTO V_DWS
              FROM T_ZA_JG_JBXX DW
              WHERE DW.CZBS != '3'
                    AND DW.HYLB = V_HYLB
                    AND (DW.ZXBS = '0' OR DW.ZXBS IS NULL)
                    AND DW.ZRDWPCSDM LIKE SUBSTR(V_ORGCODE,1,8)||'%'
                    AND DJSJ>=V_STARTDATE AND DJSJ<=V_ENDDATE;
           
           END IF;
                    
        ELSIF V_LEVE = 5 THEN
            IF V_HYLB IS NULL THEN
              SELECT COUNT(DW.JGBH) INTO V_DWS
              FROM T_ZA_JG_JBXX DW
              WHERE DW.CZBS != '3'
                    AND (DW.ZXBS = '0' OR DW.ZXBS IS NULL)
                    AND DW.ZRDWPCSDM = V_ORGCODE
                    AND DJSJ>=V_STARTDATE AND DJSJ<=V_ENDDATE;
            ELSE
              SELECT COUNT(DW.JGBH) INTO V_DWS
              FROM T_ZA_JG_JBXX DW
              WHERE DW.CZBS != '3'
                    AND DW.HYLB = V_HYLB
                    AND (DW.ZXBS = '0' OR DW.ZXBS IS NULL)
                    AND DW.ZRDWPCSDM = V_ORGCODE
                    AND DJSJ>=V_STARTDATE AND DJSJ<=V_ENDDATE;
            END IF;
       END IF;
  END IF;
  RETURN V_DWS;
END;
/

CREATE OR REPLACE FUNCTION F_GET_SYRKCOUNT(V_ORGCODE VARCHAR2,V_RYLB VARCHAR2,V_STARTDATE DATE, V_ENDDATE DATE) RETURN NUMBER
--获取实有人口数量
--V_ORGCODE ：机构代码
--V_RYLB：人员类别
--V_STARTDATE：开始时间
--V_ENDDATE ：结束时间
AS
   V_LEVE NUMBER;
   V_RKS  NUMBER;
BEGIN
   V_LEVE := F_GET_DWLEVE(V_ORGCODE);
    --查询所有的
   IF V_STARTDATE IS NULL OR V_ENDDATE IS NULL THEN
       IF V_LEVE=1 THEN
           
           IF V_RYLB IS NULL THEN
              SELECT COUNT(1) INTO V_RKS
              FROM T_LSGL_RK_JBXX RK;
           ELSE
              SELECT COUNT(1) INTO V_RKS
              FROM T_LSGL_RK_JBXX RK
              WHERE RK.RYLB=V_RYLB;
           END IF;
                    
        ELSIF V_LEVE = 2 THEN
 
           IF V_RYLB IS NULL THEN
              SELECT COUNT(1) INTO V_RKS
              FROM T_LSGL_RK_JBXX RK
              WHERE RK.CZDWDM LIKE SUBSTR(V_ORGCODE,1,4)||'%';
           ELSE
              SELECT COUNT(1) INTO V_RKS
              FROM T_LSGL_RK_JBXX RK
              WHERE RK.RYLB=V_RYLB
                    AND RK.CZDWDM LIKE SUBSTR(V_ORGCODE,1,4)||'%';
           END IF;
        ELSIF V_LEVE = 3 THEN
            IF V_RYLB IS NULL THEN
              SELECT COUNT(1) INTO V_RKS
              FROM T_LSGL_RK_JBXX RK
              WHERE RK.CZDWDM LIKE SUBSTR(V_ORGCODE,1,6)||'%';
           ELSE
              SELECT COUNT(1) INTO V_RKS
              FROM T_LSGL_RK_JBXX RK
              WHERE RK.RYLB=V_RYLB
                    AND RK.CZDWDM LIKE SUBSTR(V_ORGCODE,1,6)||'%';
           END IF;
                    
        ELSIF V_LEVE = 4 THEN
            IF V_RYLB IS NULL THEN
              SELECT COUNT(1) INTO V_RKS
              FROM T_LSGL_RK_JBXX RK
              WHERE RK.CZDWDM LIKE SUBSTR(V_ORGCODE,1,8)||'%';
           ELSE
              SELECT COUNT(1) INTO V_RKS
              FROM T_LSGL_RK_JBXX RK
              WHERE RK.RYLB=V_RYLB
                    AND RK.CZDWDM LIKE SUBSTR(V_ORGCODE,1,8)||'%';
           END IF;
        ELSIF V_LEVE = 5 THEN
           IF V_RYLB IS NULL THEN
              SELECT COUNT(1) INTO V_RKS
              FROM T_LSGL_RK_JBXX RK
              WHERE RK.CZDWDM=V_ORGCODE;
           ELSE
              SELECT COUNT(1) INTO V_RKS
              FROM T_LSGL_RK_JBXX RK
              WHERE RK.RYLB=V_RYLB
                    AND RK.CZDWDM=V_ORGCODE;
           END IF;
        END IF;
     --查询带时间的范围内的           
     ELSE
       IF V_LEVE=1 THEN
           IF V_RYLB IS NULL THEN
              SELECT COUNT(1) INTO V_RKS
              FROM T_LSGL_RK_JBXX RK
              WHERE 1=1
                   AND RK.CZSJ>=V_STARTDATE AND RK.CZSJ<=V_ENDDATE;
           ELSE
              SELECT COUNT(1) INTO V_RKS
              FROM T_LSGL_RK_JBXX RK
              WHERE RK.RYLB=V_RYLB
                    AND RK.CZSJ>=V_STARTDATE AND RK.CZSJ<=V_ENDDATE;
           END IF;
                    
        ELSIF V_LEVE = 2 THEN
 
           IF V_RYLB IS NULL THEN
              SELECT COUNT(1) INTO V_RKS
              FROM T_LSGL_RK_JBXX RK
              WHERE RK.CZDWDM LIKE SUBSTR(V_ORGCODE,1,4)||'%'
                    AND RK.CZSJ>=V_STARTDATE AND RK.CZSJ<=V_ENDDATE;
           ELSE
              SELECT COUNT(1) INTO V_RKS
              FROM T_LSGL_RK_JBXX RK
              WHERE RK.RYLB=V_RYLB
                    AND RK.CZDWDM LIKE SUBSTR(V_ORGCODE,1,4)||'%'
                    AND RK.CZSJ>=V_STARTDATE AND RK.CZSJ<=V_ENDDATE;
           END IF;
        ELSIF V_LEVE = 3 THEN
            IF V_RYLB IS NULL THEN
              SELECT COUNT(1) INTO V_RKS
              FROM T_LSGL_RK_JBXX RK
              WHERE RK.CZDWDM LIKE SUBSTR(V_ORGCODE,1,6)||'%'
                    AND RK.CZSJ>=V_STARTDATE AND RK.CZSJ<=V_ENDDATE;
           ELSE
              SELECT COUNT(1) INTO V_RKS
              FROM T_LSGL_RK_JBXX RK
              WHERE RK.RYLB=V_RYLB
                    AND RK.CZDWDM LIKE SUBSTR(V_ORGCODE,1,6)||'%'
                    AND RK.CZSJ>=V_STARTDATE AND RK.CZSJ<=V_ENDDATE;
           END IF;
                    
        ELSIF V_LEVE = 4 THEN
            IF V_RYLB IS NULL THEN
              SELECT COUNT(1) INTO V_RKS
              FROM T_LSGL_RK_JBXX RK
              WHERE RK.CZDWDM LIKE SUBSTR(V_ORGCODE,1,8)||'%'
                    AND RK.CZSJ>=V_STARTDATE AND RK.CZSJ<=V_ENDDATE;
           ELSE
              SELECT COUNT(1) INTO V_RKS
              FROM T_LSGL_RK_JBXX RK
              WHERE RK.RYLB=V_RYLB
                    AND RK.CZDWDM LIKE SUBSTR(V_ORGCODE,1,8)||'%'
                    AND RK.CZSJ>=V_STARTDATE AND RK.CZSJ<=V_ENDDATE;
           END IF;
        ELSIF V_LEVE = 5 THEN
           IF V_RYLB IS NULL THEN
              SELECT COUNT(1) INTO V_RKS
              FROM T_LSGL_RK_JBXX RK
              WHERE RK.CZDWDM=V_ORGCODE
                    AND RK.CZSJ>=V_STARTDATE AND RK.CZSJ<=V_ENDDATE;
           ELSE
              SELECT COUNT(1) INTO V_RKS
              FROM T_LSGL_RK_JBXX RK
              WHERE RK.RYLB=V_RYLB
                    AND RK.CZDWDM=V_ORGCODE
                    AND RK.CZSJ>=V_STARTDATE AND RK.CZSJ<=V_ENDDATE;
           END IF;
        END IF;
    END IF;
    RETURN V_RKS;
END;
/
CREATE OR REPLACE FUNCTION F_GET_JWSQCOUNT(V_ORGCODE VARCHAR2) RETURN NUMBER
--获取警务区/室数量
AS
       V_LEVE     NUMBER;
       V_COUNT    NUMBER;
BEGIN
       V_LEVE := F_GET_DWLEVE(V_ORGCODE);
       IF V_LEVE = 1 THEN
          SELECT COUNT(1) INTO V_COUNT
          FROM V_COMMON_ORGANIZATION 
          WHERE ORGCODE LIKE SUBSTR(V_ORGCODE,1,2)||'%' 
                AND LEVE='5';
                
       ELSIF V_LEVE=2 THEN
          SELECT COUNT(1) INTO V_COUNT
          FROM V_COMMON_ORGANIZATION 
          WHERE ORGCODE LIKE SUBSTR(V_ORGCODE,1,4)||'%' 
                AND LEVE='5';
                
       ELSIF V_LEVE=3 THEN
          SELECT COUNT(1) INTO V_COUNT
          FROM V_COMMON_ORGANIZATION 
          WHERE ORGCODE LIKE SUBSTR(V_ORGCODE,1,6)||'%' 
                AND LEVE='5';
                
       ELSIF V_LEVE=4 THEN
          SELECT COUNT(1) INTO V_COUNT
          FROM V_COMMON_ORGANIZATION 
          WHERE ORGCODE LIKE SUBSTR(V_ORGCODE,1,8)||'%' 
                AND LEVE='5';
                
       ELSIF V_LEVE=5 THEN
          V_COUNT:=1;
       END IF;
       RETURN V_COUNT;
END;
/

CREATE OR REPLACE FUNCTION F_GET_GXXZSQCCOUNT(V_ORGCODE VARCHAR2) RETURN NUMBER
--管辖行政社区个数
AS
       V_LEVE     NUMBER;
       V_COUNT    NUMBER;
BEGIN
       V_LEVE:=F_GET_DWLEVE(V_ORGCODE);
       IF V_LEVE=1 THEN
          SELECT COUNT(1) INTO V_COUNT
          FROM T_COMMON_HNXZQH 
          WHERE LEVE='5' 
                AND DM LIKE SUBSTR(V_ORGCODE,1,2)||'%';
                
       ELSIF V_LEVE=2 THEN
          SELECT COUNT(1) INTO V_COUNT
          FROM T_COMMON_HNXZQH 
          WHERE LEVE='5' 
                AND DM LIKE SUBSTR(V_ORGCODE,1,4)||'%';
                
       ELSIF V_LEVE=3 THEN
          SELECT COUNT(1) INTO V_COUNT
          FROM T_COMMON_HNXZQH 
          WHERE LEVE='5' 
                AND DM LIKE SUBSTR(V_ORGCODE,1,6)||'%';
                
       ELSIF V_LEVE=4 THEN
          SELECT COUNT(1) INTO V_COUNT
          FROM T_COMMON_HNXZQH 
          WHERE LEVE='5' 
                AND SSPCSDM LIKE SUBSTR(V_ORGCODE,1,8)||'%';
                
       ELSIF V_LEVE=5 THEN
          SELECT COUNT(1) INTO V_COUNT
          FROM T_COMMON_HNXZQH 
          WHERE LEVE='5' 
                AND SSJWSDM=V_ORGCODE;
                
      END IF;   
      RETURN  V_COUNT;
END;
/