CREATE OR REPLACE PROCEDURE P_EXEC_TJFX_FAQKTJ
--统计分析 发案情况统计表
AS
  CURSOR CUR_LIST IS
      SELECT ORGCODE, ORGNAME, PARENT_CODE, ORGJC,LEVE
      FROM T_COMMON_ORGANIZATION_SJJS;
     

  TYPE LISTTYPE IS TABLE OF CUR_LIST%ROWTYPE;
  LIST LISTTYPE;
  V_CURRENTDATE     DATE;
  V_COUNT       NUMBER;   --统计数量
  V_LEVE        NUMBER;
  V_TJYF        NUMBER;   --统计月份
  V_TJSJ        DATE;     --统计时间
  V_XSAJS       NUMBER;  --刑事案件数量
  V_ZAAJS       NUMBER;  --治安案件数量
  V_QJAJS       NUMBER;  --抢劫案件数量
  V_QDAJS       NUMBER;  --抢夺案件数量
  V_RSDQAJS     NUMBER;  --入室盗窃案件数量
  V_DQJDCAJS    NUMBER;  --盗窃机动车案件数量
  V_QTAJS       NUMBER;  --其他案件数量
  V_JFTJS       NUMBER;  --纠纷调解数
  V_ZNSGS       NUMBER;  --灾难事故数
BEGIN
    V_CURRENTDATE:=LAST_DAY(ADD_MONTHS(SYSDATE,-1));
    V_TJYF:=TO_CHAR(V_CURRENTDATE,'YYYYMM');
    V_TJSJ:=V_CURRENTDATE;       
    OPEN CUR_LIST;
    LOOP
      --先拿出游标中的 1000 条数据
      FETCH CUR_LIST BULK COLLECT
        INTO LIST LIMIT 100;
      EXIT WHEN LIST.COUNT = 0;
      --循环 当前的100条数据
      FOR I IN LIST.FIRST .. LIST.LAST LOOP
        BEGIN
              V_LEVE:=LIST(I).LEVE;
              --刑事案件
              IF V_LEVE=5 THEN
                  SELECT COUNT(1) INTO V_XSAJS
                  FROM T_ASJ_JBXX_DXF 
                  WHERE ANJIANBIAOZHI='1' 
                        AND LIANRIQI LIKE V_TJYF||'%'
                        AND FAANSHEQU IN (SELECT DM FROM T_COMMON_HNXZQH WHERE SSJWSDM=LIST(I).ORGCODE);
              ELSE
                  SELECT COUNT(1) INTO V_XSAJS
                  FROM T_ASJ_JBXX_DXF 
                  WHERE ANJIANBIAOZHI='1' 
                        AND LIANRIQI LIKE V_TJYF||'%'
                        AND FAANSHEQU IN (
                          SELECT DM 
                          FROM T_COMMON_HNXZQH 
                          WHERE SSJWSDM LIKE SUBSTR(LIST(I).ORGCODE,1,2*V_LEVE)||'%');     
              END IF;
              
             --治安案件
             IF V_LEVE=5 THEN
                  SELECT COUNT(1) INTO V_ZAAJS
                  FROM T_ASJ_JBXX_DXF 
                  WHERE ANJIANBIAOZHI='2' 
                      AND LIANRIQI LIKE V_TJYF||'%'
                      AND FAANSHEQU IN (SELECT DM FROM T_COMMON_HNXZQH WHERE SSJWSDM=LIST(I).ORGCODE);
              ELSE
                  SELECT COUNT(1) INTO V_ZAAJS
                  FROM T_ASJ_JBXX_DXF 
                  WHERE ANJIANBIAOZHI='2'  
                      AND LIANRIQI LIKE V_TJYF||'%'
                      AND FAANSHEQU IN (
                          SELECT DM 
                          FROM T_COMMON_HNXZQH 
                          WHERE SSJWSDM LIKE SUBSTR(LIST(I).ORGCODE,1,2*V_LEVE)||'%');     
              END IF;
             
             --抢劫案件
             IF V_LEVE=5 THEN
                  SELECT COUNT(1) INTO V_QJAJS
                  FROM T_ASJ_JBXX_DXF 
                  WHERE ANJIANLEIBIE LIKE '0501%'  
                        AND LIANRIQI LIKE V_TJYF||'%'
                        AND FAANSHEQU IN (SELECT DM FROM T_COMMON_HNXZQH WHERE SSJWSDM=LIST(I).ORGCODE);
              ELSE
                   SELECT COUNT(1) INTO V_QJAJS
                  FROM T_ASJ_JBXX_DXF 
                  WHERE ANJIANLEIBIE LIKE '0501%'  
                        AND LIANRIQI LIKE V_TJYF||'%'
                        AND FAANSHEQU IN (
                            SELECT DM 
                            FROM T_COMMON_HNXZQH 
                            WHERE SSJWSDM LIKE SUBSTR(LIST(I).ORGCODE,1,2*V_LEVE)||'%');   
              
              END IF;
              
              
              --抢夺案件
              IF V_LEVE=5 THEN
                  SELECT COUNT(1) INTO V_QDAJS
                  FROM T_ASJ_JBXX_DXF 
                  WHERE ANJIANLEIBIE='050400'  
                        AND LIANRIQI LIKE V_TJYF||'%'
                        AND FAANSHEQU IN (SELECT DM FROM T_COMMON_HNXZQH WHERE SSJWSDM=LIST(I).ORGCODE);
              ELSE
                  SELECT COUNT(1) INTO V_QDAJS
                  FROM T_ASJ_JBXX_DXF 
                  WHERE ANJIANLEIBIE='050400' 
                        AND LIANRIQI LIKE V_TJYF||'%'
                        AND FAANSHEQU IN (
                            SELECT DM 
                            FROM T_COMMON_HNXZQH 
                            WHERE SSJWSDM LIKE SUBSTR(LIST(I).ORGCODE,1,2*V_LEVE)||'%');  
              END IF;

             --入室盗窃案件
              IF V_LEVE=5 THEN
                  SELECT COUNT(1) INTO V_RSDQAJS
                  FROM T_ASJ_JBXX_DXF 
                  WHERE ANJIANLEIBIE IN ('050202','050280') 
                         AND LIANRIQI LIKE V_TJYF||'%'
                        AND FAANSHEQU IN (SELECT DM FROM T_COMMON_HNXZQH WHERE SSJWSDM=LIST(I).ORGCODE);
              ELSE
                  SELECT COUNT(1) INTO V_RSDQAJS
                  FROM T_ASJ_JBXX_DXF 
                  WHERE ANJIANLEIBIE IN ('050202','050280')
                        AND LIANRIQI LIKE V_TJYF||'%'
                        AND FAANSHEQU IN (
                            SELECT DM 
                            FROM T_COMMON_HNXZQH 
                            WHERE SSJWSDM LIKE SUBSTR(LIST(I).ORGCODE,1,2*V_LEVE)||'%');  
              END IF;
              
              --盗强机动车数
              IF V_LEVE=5 THEN 
                  SELECT COUNT(1) INTO V_DQJDCAJS
                  FROM T_ASJ_JBXX_DXF 
                  WHERE ANJIANLEIBIE IN ('050206','050207')
                         AND LIANRIQI LIKE V_TJYF||'%'
                         AND FAANSHEQU IN (SELECT DM FROM T_COMMON_HNXZQH WHERE SSJWSDM=LIST(I).ORGCODE);
              ELSE
                 SELECT COUNT(1) INTO V_DQJDCAJS
                  FROM T_ASJ_JBXX_DXF 
                  WHERE ANJIANLEIBIE IN ('050206','050207')
                         AND LIANRIQI LIKE V_TJYF||'%'
                         AND FAANSHEQU IN (
                            SELECT DM 
                            FROM T_COMMON_HNXZQH 
                            WHERE SSJWSDM LIKE SUBSTR(LIST(I).ORGCODE,1,2*V_LEVE)||'%'); 
              END IF;
             --其他案件
             V_QTAJS:=0;
             
             --纠纷调解数
             IF V_LEVE=5 THEN
                 SELECT COUNT(1) INTO V_JFTJS 
                 FROM T_FWQZ_JFTJDJXX 
                 WHERE DJDWDM=LIST(I).ORGCODE AND DJSJ>=TRUNC(V_CURRENTDATE,'MM') AND DJSJ<=V_CURRENTDATE;
             ELSE
                 SELECT COUNT(1) INTO V_JFTJS 
                 FROM T_FWQZ_JFTJDJXX 
                 WHERE DJDWDM LIKE SUBSTR(LIST(I).ORGCODE,1,2*LIST(I).LEVE)||'%' 
                       AND DJSJ>=TRUNC(V_CURRENTDATE,'MM') AND DJSJ<=V_CURRENTDATE;
             END IF;

             --灾难事故数
              V_ZNSGS:=0;
               
             SELECT COUNT(1) INTO V_COUNT FROM T_TJFX_FAQKTJ WHERE TJYF=V_TJYF AND ORGCODE=LIST(I).ORGCODE;
             IF V_COUNT=0 THEN
                INSERT INTO T_TJFX_FAQKTJ
                  (ORGCODE, ORGNAME, LEVE, PARENT_CODE, TJYF, TJSJ, 
                  XSAJS, ZAAJS, QJAJS, QDAJS, RSDQAJS, DQJDCAJS, QTAJS, 
                  JFTJS, ZNSGS)
                VALUES
                  (LIST(I).ORGCODE, LIST(I).ORGNAME, LIST(I).LEVE, LIST(I).PARENT_CODE, 
                   V_TJYF, V_TJSJ, V_XSAJS, V_ZAAJS, V_QJAJS, V_QDAJS, V_RSDQAJS, 
                   V_DQJDCAJS, V_QTAJS, V_JFTJS, V_ZNSGS);
             ELSE
                UPDATE T_TJFX_FAQKTJ
                   SET 
                       ORGNAME = LIST(I).ORGNAME,
                       LEVE = LIST(I).LEVE,
                       PARENT_CODE = LIST(I).PARENT_CODE,
                       TJSJ = V_TJSJ,
                       XSAJS = V_XSAJS,
                       ZAAJS = V_ZAAJS,
                       QJAJS = V_QJAJS,
                       QDAJS = V_QDAJS,
                       RSDQAJS = V_RSDQAJS,
                       DQJDCAJS = V_DQJDCAJS,
                       QTAJS = V_QTAJS,
                       JFTJS = V_JFTJS,
                       ZNSGS = V_ZNSGS
                 WHERE ORGCODE = LIST(I).ORGCODE AND  TJYF = V_TJYF;
             END IF;
               
        END;
      END LOOP;
      COMMIT;
    END LOOP;

END P_EXEC_TJFX_FAQKTJ;
/