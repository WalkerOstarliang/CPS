-- Add/modify columns 
alter table T_COMMON_ORGANIZATION_OTHER add PCSJWQDJ VARCHAR2(3);
-- Add comments to the columns 
comment on column T_COMMON_ORGANIZATION_OTHER.PCSJWQDJ
  is '派出所警务区等级';

  
CREATE OR REPLACE PROCEDURE P_EXEC_ORGANIZATION_SJJS_SYNC
--同步单位数据计算函数
AS
       --注销的机构
       CURSOR CUR_LIST_WX IS
              SELECT ORGCODE
              FROM V_COMMON_ORGANIZATION
              WHERE ISYX='0';
       
       --有效的机构
       CURSOR CUR_LIST_YX IS
          SELECT ORGID,ORGCODE,ORGNAME, PARENT_ORGID,PARENT_CODE,ORGJC,'2' AS LEVE
          FROM V_COMMON_ORGANIZATION 
          WHERE LEVE='2' 
                AND ORGCODE LIKE '4301%' 
                AND ISYX='1' 
                AND ORGCODE='430100000000'

          UNION ALL

          SELECT ORGID,ORGCODE,ORGNAME, PARENT_ORGID,PARENT_CODE,ORGJC,'3' AS LEVE 
          FROM V_COMMON_ORGANIZATION 
          WHERE LEVE='3' 
                AND ORGCODE LIKE '4301%' 
                AND ISYX='1' 
                AND PARENT_CODE='430100000000' 
                AND ORGCODE != '430197000000'
                  
          UNION ALL

          SELECT ORGID,ORGCODE,ORGNAME, PARENT_ORGID,PARENT_CODE,ORGJC,'4' AS LEVE 
          FROM V_COMMON_ORGANIZATION
          WHERE LEVE='4' 
                AND ORGCODE LIKE '4301%'
                AND ISYX='1'
                AND ISPCS='1'

          UNION ALL

          SELECT ORGID,ORGCODE,ORGNAME, PARENT_ORGID,PARENT_CODE,ORGJC,'5' AS LEVE 
          FROM V_COMMON_ORGANIZATION 
          WHERE LEVE='5' 
                AND ORGCODE LIKE '4301%' 
                AND ISYX='1';
                
     TYPE LISTTYPE IS TABLE OF CUR_LIST_YX%ROWTYPE;
     TYPE LISTWXTYPE IS TABLE OF CUR_LIST_WX%ROWTYPE;
     LIST          LISTTYPE;      
     LIST_WX       LISTWXTYPE;
     V_COUNT       NUMBER;
     V_JWQFL       VARCHAR2(3);
BEGIN
     --删除无效的数据计算数据
     OPEN CUR_LIST_WX;
     LOOP
          FETCH CUR_LIST_WX BULK COLLECT INTO LIST_WX LIMIT 100;
          EXIT WHEN LIST_WX.COUNT=0;
          FOR I IN LIST_WX.FIRST .. LIST_WX.LAST LOOP
              BEGIN
                 DELETE FROM T_COMMON_ORGANIZATION_SJJS WHERE ORGCODE=LIST_WX(I).ORGCODE;
              END;
          END LOOP;
          COMMIT;
     END LOOP;     
     
     --新增修改单位数据计算表
     OPEN CUR_LIST_YX;
     LOOP
          FETCH CUR_LIST_YX BULK COLLECT INTO LIST LIMIT 100;
          EXIT WHEN LIST.COUNT=0;
          FOR I IN LIST.FIRST .. LIST.LAST LOOP
              BEGIN
                  SELECT COUNT(1) INTO V_COUNT FROM T_COMMON_ORGANIZATION_SJJS WHERE ORGCODE=LIST(I).ORGCODE;
                  
                  BEGIN
                         SELECT PCSJWQDJ INTO V_JWQFL FROM T_COMMON_ORGANIZATION_OTHER WHERE ORGCODE=LIST(I).ORGCODE;
                         
                         EXCEPTION WHEN OTHERS THEN
                         V_JWQFL:=NULL;   
                  END;      
                  IF V_COUNT>0 THEN
                     UPDATE T_COMMON_ORGANIZATION_SJJS
                     SET ORGID=LIST(I).ORGID,
                         ORGNAME=LIST(I).ORGNAME,
                         PARENT_ORGID=LIST(I).PARENT_ORGID,
                         PARENT_CODE=LIST(I).PARENT_CODE,
                         ORGJC=LIST(I).ORGJC,
                         LEVE=LIST(I).LEVE,
                         JWQFL=V_JWQFL
                      WHERE ORGCODE=LIST(I).ORGCODE;
                  ELSE
                      INSERT INTO T_COMMON_ORGANIZATION_SJJS
                        (ORGID, ORGCODE, ORGNAME, PARENT_ORGID, PARENT_CODE, ORGJC, LEVE, JWQFL)
                      VALUES
                        (LIST(I).ORGID,
                         LIST(I).ORGCODE,
                         LIST(I).ORGNAME,
                         LIST(I).PARENT_ORGID,
                         LIST(I).PARENT_CODE,
                         LIST(I).ORGJC,
                         LIST(I).LEVE,
                         V_JWQFL);
                  END IF;
              END;
          END LOOP;
          COMMIT;
     END LOOP;
END;
/

CREATE OR REPLACE PROCEDURE P_EXEC_ORGANI_SJJS_SYNC_ST
--同步单位数据计算函数
AS
       --注销的机构
       CURSOR CUR_LIST_WX IS
              SELECT ORGCODE
              FROM V_COMMON_ORGANIZATION
              WHERE ISYX='0';

       --有效的机构
       CURSOR CUR_LIST_YX IS
          
          SELECT ORGID,ORGCODE,ORGNAME, PARENT_ORGID,PARENT_CODE,ORGJC,'1' AS LEVE
          FROM V_COMMON_ORGANIZATION 
          WHERE ORGCODE='430000000000'
          
          UNION ALL

          SELECT ORGID,ORGCODE,ORGNAME, PARENT_ORGID,PARENT_CODE,ORGJC,'2' AS LEVE
          FROM V_COMMON_ORGANIZATION
          WHERE LEVE='2' and parent_code='430000000000'
                AND ISYX='1'
                
          UNION ALL

          SELECT ORGID,ORGCODE,ORGNAME, PARENT_ORGID,PARENT_CODE,ORGJC,'3' AS LEVE
          FROM V_COMMON_ORGANIZATION
          WHERE LEVE='3'
                AND ORGCODE LIKE '43%'
                AND ISYX='1'
                and substr(parent_code,6,6)='000000' 
                and orgcode !='430197000000'

          UNION ALL

          SELECT ORGID,ORGCODE,ORGNAME, PARENT_ORGID,PARENT_CODE,ORGJC,'4' AS LEVE
          FROM V_COMMON_ORGANIZATION
          WHERE LEVE='4'
                AND ORGCODE LIKE '43%'
                AND ISYX='1'
                AND ISPCS='1'

          UNION ALL

          SELECT ORGID,ORGCODE,ORGNAME, PARENT_ORGID,PARENT_CODE,ORGJC,'5' AS LEVE
          FROM V_COMMON_ORGANIZATION
          WHERE LEVE='5'
                AND ORGCODE LIKE '43%'
                AND ISYX='1';

     TYPE LISTTYPE IS TABLE OF CUR_LIST_YX%ROWTYPE;
     TYPE LISTWXTYPE IS TABLE OF CUR_LIST_WX%ROWTYPE;
     LIST          LISTTYPE;
     LIST_WX       LISTWXTYPE;
     V_COUNT       NUMBER;
     V_JWQFL       VARCHAR2(3);
BEGIN
     --删除无效的数据计算数据
     OPEN CUR_LIST_WX;
     LOOP
          FETCH CUR_LIST_WX BULK COLLECT INTO LIST_WX LIMIT 100;
          EXIT WHEN LIST_WX.COUNT=0;
          FOR I IN LIST_WX.FIRST .. LIST_WX.LAST LOOP
              BEGIN
                 DELETE FROM T_COMMON_ORGANIZATION_SJJS WHERE ORGCODE=LIST_WX(I).ORGCODE;
              END;
          END LOOP;
          COMMIT;
     END LOOP;

     --新增修改单位数据计算表
     OPEN CUR_LIST_YX;
     LOOP
          FETCH CUR_LIST_YX BULK COLLECT INTO LIST LIMIT 100;
          EXIT WHEN LIST.COUNT=0;
          FOR I IN LIST.FIRST .. LIST.LAST LOOP
              BEGIN
                  SELECT COUNT(1) INTO V_COUNT FROM T_COMMON_ORGANIZATION_SJJS WHERE ORGCODE=LIST(I).ORGCODE;

                  BEGIN
                         SELECT PCSJWQDJ INTO V_JWQFL FROM T_COMMON_ORGANIZATION_OTHER WHERE ORGCODE=LIST(I).ORGCODE;

                         EXCEPTION WHEN OTHERS THEN
                         V_JWQFL:=NULL;
                  END;
                  IF V_COUNT>0 THEN
                     UPDATE T_COMMON_ORGANIZATION_SJJS
                     SET ORGID=LIST(I).ORGID,
                         ORGNAME=LIST(I).ORGNAME,
                         PARENT_ORGID=LIST(I).PARENT_ORGID,
                         PARENT_CODE=LIST(I).PARENT_CODE,
                         ORGJC=LIST(I).ORGJC,
                         LEVE=LIST(I).LEVE,
                         JWQFL=V_JWQFL
                      WHERE ORGCODE=LIST(I).ORGCODE;
                  ELSE
                      INSERT INTO T_COMMON_ORGANIZATION_SJJS
                        (ORGID, ORGCODE, ORGNAME, PARENT_ORGID, PARENT_CODE, ORGJC, LEVE, JWQFL)
                      VALUES
                        (LIST(I).ORGID,
                         LIST(I).ORGCODE,
                         LIST(I).ORGNAME,
                         LIST(I).PARENT_ORGID,
                         LIST(I).PARENT_CODE,
                         LIST(I).ORGJC,
                         LIST(I).LEVE,
                         V_JWQFL);
                  END IF;
              END;
          END LOOP;
          COMMIT;
     END LOOP;
END;
/