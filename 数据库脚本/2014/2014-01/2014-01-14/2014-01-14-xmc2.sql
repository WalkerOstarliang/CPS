CREATE OR REPLACE PROCEDURE P_EXEC_XQZAXZQHTJ
--辖区案件统计分析 按月统计 ，每天进行计算
AS
 CURSOR CUR_LIST IS
    SELECT DM,MC,PARENT_DM,JC FROM T_COMMON_HNXZQH
    WHERE LEVE<=3
          AND DM LIKE '43%'
    ORDER BY DM ASC;
  TYPE LISTTYPE IS TABLE OF CUR_LIST%ROWTYPE;
  LIST       LISTTYPE;

  V_ORGCODE  VARCHAR2(12);
  V_PARENTCODE  VARCHAR2(12);
  V_ORGNAME  VARCHAR2(120);
  V_LEVE     NUMBER;
  V_QJASL    NUMBER; --抢劫案数量
  V_QDASJ    NUMBER; --抢夺案数量
  V_DQZSL      NUMBER; --盗窃案数量
  V_ZPASL    NUMBER;  --咋骗案数量
  V_ZSASL      NUMBER; --走私案数量
  V_QTASL      NUMBER;  --其他案数量
  V_AJZSL      NUMBER; --案件总数量
  V_TJYF      VARCHAR2(6); --统计月份
  V_ERROR    VARCHAR2(1000); --错误代码
  V_STARTDATE VARCHAR2(8);  --统计起始时间
  V_ENDDATE   VARCHAR2(8); --统计开始时间
  V_RECORD    NUMBER;    
 
BEGIN
  V_TJYF:=TO_CHAR(SYSDATE,'YYYYMM');
  V_STARTDATE:=TO_CHAR(SYSDATE,'YYYYMM')||'01';
  V_ENDDATE:=TO_CHAR(SYSDATE,'YYYYMMDD');
  --打开县区以上单位统计游标
  OPEN CUR_LIST;
  LOOP
    --先拿出游标中的 1000 条数据
    FETCH CUR_LIST BULK COLLECT
      INTO LIST LIMIT 100;
    EXIT WHEN LIST.COUNT = 0;
    --循环 当前的1000条数据
    FOR I IN LIST.FIRST .. LIST.LAST LOOP
        BEGIN
            SELECT
                   T.ORGCODE,
                   T.PARENT_CODE,
                   T.ORGJC,
                   T.LEVE,
                   F_GET_XQFASLCOUNT(T.ORGCODE,'1',V_STARTDATE,V_ENDDATE),--抢劫案数量
                   F_GET_XQFASLCOUNT(T.ORGCODE,'2',V_STARTDATE,V_ENDDATE),--抢夺案数量
                   F_GET_XQFASLCOUNT(T.ORGCODE,'3',V_STARTDATE,V_ENDDATE),--盗窃案数量
                   F_GET_XQFASLCOUNT(T.ORGCODE,'4',V_STARTDATE,V_ENDDATE),--咋骗案数量
                   F_GET_XQFASLCOUNT(T.ORGCODE,'5',V_STARTDATE,V_ENDDATE),--走私案数量
                   F_GET_XQFASLCOUNT(T.ORGCODE,'0',V_STARTDATE,V_ENDDATE)--案件总数量
                   INTO V_ORGCODE,V_PARENTCODE,V_ORGNAME,V_LEVE,
                        V_QJASL,V_QDASJ,
                        V_DQZSL,V_ZPASL,V_ZSASL,V_AJZSL
                FROM V_COMMON_ORGANIZATION T
                WHERE ORGCODE=LIST(I).DM;
            --其他案件数量
            V_QTASL:=V_AJZSL-V_ZSASL-V_ZPASL-V_DQZSL-V_QDASJ-V_QJASL;
            
            SELECT COUNT(1) INTO V_RECORD FROM T_COMMON_XQFAQKTJ WHERE DWDM=V_ORGCODE AND TJYF=V_TJYF;
            IF V_RECORD <= 0 THEN
               INSERT INTO T_COMMON_XQFAQKTJ
                  (DWDM, DWMC, QJASL, QDASJ, DQZSL, ZPASL, ZSASL, QTASL, AJZSL, TJYF, LEVE, PARENTCODE)
                VALUES
                  (V_ORGCODE, V_ORGNAME, V_QJASL, V_QDASJ, V_DQZSL, V_ZPASL, V_ZSASL, V_QTASL, V_AJZSL, V_TJYF, V_LEVE,V_PARENTCODE);

            ELSE
               UPDATE T_COMMON_XQFAQKTJ
               SET 
                   QJASL = V_QJASL,
                   QDASJ = V_QDASJ,
                   DQZSL = V_DQZSL,
                   ZPASL = V_ZPASL,
                   ZSASL = V_ZSASL,
                   QTASL = V_QTASL,
                   AJZSL = V_AJZSL
               WHERE DWDM = V_ORGCODE AND TJYF=V_TJYF;
            END IF;
            EXCEPTION WHEN OTHERS THEN
               V_ERROR:=SQLERRM;
        END;
        COMMIT;
    END LOOP;
  END LOOP;
END P_EXEC_XQZAXZQHTJ;
/

CREATE OR REPLACE PROCEDURE P_EXEC_XQZAJGDMTJ
--辖区案件区县局一下单位统计分析 按月统计 ，每天进行计算
AS
        
  CURSOR CUR_LIST IS 
        SELECT ORGCODE,PARENT_CODE,ORGJC
        FROM V_COMMON_ORGANIZATION
        WHERE ((LEVE='4' AND ISPCS='1') OR LEVE='5' ) 
               AND PARENT_CODE IS NOT NULL 
               AND ISYX='1';
              
  TYPE LISTTYPE IS TABLE OF CUR_LIST%ROWTYPE;
  LIST       LISTTYPE;
  V_ORGCODE  VARCHAR2(12);
  V_PARENTCODE  VARCHAR2(12);
  V_ORGNAME  VARCHAR2(120);
  V_LEVE     NUMBER;
  V_QJASL    NUMBER; --抢劫案数量
  V_QDASJ    NUMBER; --抢夺案数量
  V_DQZSL      NUMBER; --盗窃案数量
  V_ZPASL    NUMBER;  --咋骗案数量
  V_ZSASL      NUMBER; --走私案数量
  V_QTASL      NUMBER;  --其他案数量
  V_AJZSL      NUMBER; --案件总数量
  V_TJYF      VARCHAR2(6); --统计月份
  V_ERROR    VARCHAR2(1000); --错误代码
  V_STARTDATE VARCHAR2(8);  --统计起始时间
  V_ENDDATE   VARCHAR2(8); --统计开始时间
  V_RECORD    NUMBER;    

BEGIN
   V_TJYF:=TO_CHAR(SYSDATE,'YYYYMM');
   V_STARTDATE:=TO_CHAR(SYSDATE,'YYYYMM')||'01';
   V_ENDDATE:=TO_CHAR(SYSDATE,'YYYYMMDD');
   OPEN CUR_LIST;
   LOOP
      --先拿出游标中的 1000 条数据
    FETCH CUR_LIST BULK COLLECT
      INTO LIST LIMIT 100;
    EXIT WHEN LIST.COUNT = 0;
    --循环 当前的1000条数据
    FOR I IN LIST.FIRST .. LIST.LAST LOOP
        BEGIN
            SELECT
                   T.ORGCODE,
                   T.PARENT_CODE,
                   T.ORGJC,
                   T.LEVE,
                   F_GET_XQFASLCOUNT(T.ORGCODE,'1',V_STARTDATE,V_ENDDATE),--抢劫案数量
                   F_GET_XQFASLCOUNT(T.ORGCODE,'2',V_STARTDATE,V_ENDDATE),--抢夺案数量
                   F_GET_XQFASLCOUNT(T.ORGCODE,'3',V_STARTDATE,V_ENDDATE),--盗窃案数量
                   F_GET_XQFASLCOUNT(T.ORGCODE,'4',V_STARTDATE,V_ENDDATE),--咋骗案数量
                   F_GET_XQFASLCOUNT(T.ORGCODE,'5',V_STARTDATE,V_ENDDATE),--走私案数量
                   F_GET_XQFASLCOUNT(T.ORGCODE,'0',V_STARTDATE,V_ENDDATE)--案件总数量
                   INTO V_ORGCODE,V_PARENTCODE,V_ORGNAME,V_LEVE,
                        V_QJASL,V_QDASJ,
                        V_DQZSL,V_ZPASL,V_ZSASL,V_AJZSL
                FROM V_COMMON_ORGANIZATION T
                WHERE ORGCODE=LIST(I).ORGCODE;
            --其他案件数量
            V_QTASL:=V_AJZSL-V_ZSASL-V_ZPASL-V_DQZSL-V_QDASJ-V_QJASL;
            
            SELECT COUNT(1) INTO V_RECORD FROM T_COMMON_XQFAQKTJ WHERE DWDM=V_ORGCODE AND TJYF=V_TJYF;
            IF V_RECORD <= 0 THEN
               INSERT INTO T_COMMON_XQFAQKTJ
                  (DWDM, DWMC, QJASL, QDASJ, DQZSL, ZPASL, ZSASL, QTASL, AJZSL, TJYF, LEVE, PARENTCODE)
                VALUES
                  (V_ORGCODE, V_ORGNAME, V_QJASL, V_QDASJ, V_DQZSL, V_ZPASL, V_ZSASL, V_QTASL, V_AJZSL, V_TJYF, V_LEVE,V_PARENTCODE);

            ELSE
               UPDATE T_COMMON_XQFAQKTJ
               SET 
                   QJASL = V_QJASL,
                   QDASJ = V_QDASJ,
                   DQZSL = V_DQZSL,
                   ZPASL = V_ZPASL,
                   ZSASL = V_ZSASL,
                   QTASL = V_QTASL,
                   AJZSL = V_AJZSL
               WHERE DWDM = V_ORGCODE AND TJYF=V_TJYF;
            END IF;
            EXCEPTION WHEN OTHERS THEN
               V_ERROR:=SQLERRM;
        END;  
        COMMIT;
    END LOOP; 
  END LOOP;
  CLOSE CUR_LIST;
END P_EXEC_XQZAJGDMTJ;
/

CREATE OR REPLACE PROCEDURE P_EXEC_XQZAQLSJTJ
--辖区案件全部数据统计分析 按月统计 ，每天进行计算
AS
  
BEGIN
     p_exec_xqzaxzqhtj;
     p_exec_xqzajgdmtj;        
END P_EXEC_XQZAQLSJTJ;
/