create or replace package SQJW_TJBB_AQJC is

   
       --单位安全监测统计
       PROCEDURE T_TJBB_DWAQJCTJBB;
       
end SQJW_TJBB_AQJC;
/

CREATE OR REPLACE PACKAGE BODY SQJW_TJBB_AQJC IS
--单位安全监测统计
         PROCEDURE T_TJBB_DWAQJCTJBB
         IS
             CURSOR ORG_CUR_LIST IS
                     SELECT ORGCODE, ORGNAME, PARENT_CODE, LEVE
                     FROM T_COMMON_ORGANIZATION_SJJS
                     WHERE LEVE=5;
             TYPE TYPE_ORG_CUR_LIST IS TABLE OF ORG_CUR_LIST%ROWTYPE;
             ORGLIST                TYPE_ORG_CUR_LIST;
             V_TJSJ                 DATE;        
             V_COUNT                NUMBER;
             V_ZS	                  NUMBER;
             V_THJCS	              NUMBER;
             V_GCJCS	              NUMBER;
             V_NBJCS	              NUMBER;
             V_WXPJCS	              NUMBER;
             V_WBJCS	              NUMBER;
             V_SWJCS	              NUMBER;
             V_LGJCS	              NUMBER;
             V_KSJCS	              NUMBER;
             V_SPJCS	              NUMBER;
             V_WLJCS	              NUMBER;
             V_QTJCS	              NUMBER;
             V_JCLBZJCS	            NUMBER;
             V_XFJCS	              NUMBER;
             V_AQJCS	              NUMBER;
             V_YZGQKS	              NUMBER;
             V_WZGQKS	              NUMBER;
             V_FXWTS	              NUMBER;
             V_JGS	                NUMBER;
             V_FKS	                NUMBER;
             V_XFYHTZS	            NUMBER;
             V_DXXKZS	              NUMBER;
             V_QTS	                NUMBER;
             
         BEGIN
            V_TJSJ:=SYSDATE;
            OPEN ORG_CUR_LIST;
            LOOP
                 FETCH ORG_CUR_LIST BULK COLLECT INTO ORGLIST LIMIT 1000;
                 EXIT WHEN ORGLIST.COUNT = 0 ;
                 FOR I IN ORGLIST.FIRST .. ORGLIST.LAST LOOP
                 
                     --特行检查
                     SELECT COUNT(1) INTO V_THJCS
                     FROM T_ZA_DW_AQJCXX 
                     WHERE DJDWDM=ORGLIST(I).ORGCODE
                           AND JGBH IN ( SELECT JGBH FROM T_ZA_JG_JBXX WHERE INSTR(HYLB,'01') > 0);
                     
                     --V_ZS:=V_THJCS+V_GCJCS+V_NBJCS + V_WXPJCS + V_WBJCS + V_SWJCS + V_LGJCS + V_KSJCS + V_SPJCS + V_WLJCS + V_QTJCS;
                    
                     SELECT COUNT(1) INTO V_ZS
                     FROM T_ZA_DW_AQJCXX 
                     WHERE DJDWDM=ORGLIST(I).ORGCODE;
                     
                     --公共场所检查
                     SELECT COUNT(1) INTO V_GCJCS
                     FROM T_ZA_DW_AQJCXX 
                     WHERE DJDWDM=ORGLIST(I).ORGCODE
                           AND JGBH IN ( SELECT JGBH FROM T_ZA_JG_JBXX WHERE INSTR(HYLB,'02') > 0);
                      
                     --内保单位
                     SELECT COUNT(1) INTO V_NBJCS
                     FROM T_ZA_DW_AQJCXX 
                     WHERE DJDWDM=ORGLIST(I).ORGCODE
                           AND JGBH IN ( SELECT JGBH FROM T_ZA_JG_JBXX WHERE INSTR(HYLB,'03') > 0);
                           
                     --危险品单位
                     SELECT COUNT(1) INTO V_WXPJCS
                     FROM T_ZA_DW_AQJCXX 
                     WHERE DJDWDM=ORGLIST(I).ORGCODE
                           AND JGBH IN ( SELECT JGBH FROM T_ZA_JG_JBXX WHERE INSTR(HYLB,'04') > 0);
                                 
                     --上网服务场所
                     SELECT COUNT(1) INTO V_WBJCS
                     FROM T_ZA_DW_AQJCXX 
                     WHERE DJDWDM=ORGLIST(I).ORGCODE
                           AND JGBH IN ( SELECT JGBH FROM T_ZA_JG_JBXX WHERE INSTR(HYLB,'05') > 0);
                     
                     --涉外单位
                     SELECT COUNT(1) INTO V_SWJCS
                     FROM T_ZA_DW_AQJCXX 
                     WHERE DJDWDM=ORGLIST(I).ORGCODE
                           AND JGBH IN ( SELECT JGBH FROM T_ZA_JG_JBXX WHERE INSTR(HYLB,'06') > 0);
                       
                     --旅馆业
                     SELECT COUNT(1) INTO V_LGJCS
                     FROM T_ZA_DW_AQJCXX 
                     WHERE DJDWDM=ORGLIST(I).ORGCODE
                           AND JGBH IN ( SELECT JGBH FROM T_ZA_JG_JBXX WHERE INSTR(HYLB,'07') > 0);
                     
                     --开锁业
                     SELECT COUNT(1) INTO V_KSJCS
                     FROM T_ZA_DW_AQJCXX 
                     WHERE DJDWDM=ORGLIST(I).ORGCODE
                           AND JGBH IN ( SELECT JGBH FROM T_ZA_JG_JBXX WHERE INSTR(HYLB,'08') > 0);
                     
                     --商铺门店
                     SELECT COUNT(1) INTO V_SPJCS
                     FROM T_ZA_DW_AQJCXX 
                     WHERE DJDWDM=ORGLIST(I).ORGCODE
                           AND JGBH IN ( SELECT JGBH FROM T_ZA_JG_JBXX WHERE INSTR(HYLB,'09') > 0);
                     
                     --物流快递业
                     SELECT COUNT(1) INTO V_WLJCS
                     FROM T_ZA_DW_AQJCXX 
                     WHERE DJDWDM=ORGLIST(I).ORGCODE
                           AND JGBH IN ( SELECT JGBH FROM T_ZA_JG_JBXX WHERE INSTR(HYLB,'11') > 0);
                      
                     --其他
                     SELECT COUNT(1) INTO V_QTJCS
                     FROM T_ZA_DW_AQJCXX 
                     WHERE DJDWDM=ORGLIST(I).ORGCODE
                           AND JGBH IN ( SELECT JGBH FROM T_ZA_JG_JBXX WHERE INSTR(HYLB,'10') > 0);
                    
                    
                    --消防检查
                    SELECT COUNT(1) INTO V_XFJCS
                    FROM T_ZA_DW_AQJCXX
                    WHERE DJDWDM=ORGLIST(I).ORGCODE
                          AND INSTR(JCLB,'1') > 0;
                     
                    
                    --消防检查
                    SELECT COUNT(1) INTO V_AQJCS
                    FROM T_ZA_DW_AQJCXX
                    WHERE DJDWDM=ORGLIST(I).ORGCODE
                          AND INSTR(JCLB,'2') > 0;
                     
                    V_JCLBZJCS:=V_XFJCS + V_AQJCS;
                    
                    --已整改数
                    SELECT COUNT(1) INTO V_YZGQKS
                    FROM T_ZA_DW_AQJCXX
                    WHERE DJDWDM=ORGLIST(I).ORGCODE
                          AND ZGQK='2';
                    
                    --未整改数      
                    SELECT COUNT(1) INTO V_WZGQKS
                    FROM T_ZA_DW_AQJCXX
                    WHERE DJDWDM=ORGLIST(I).ORGCODE
                          AND ZGQK='1';
                          
                    --发现问题数
                    SELECT COUNT(1) INTO V_FXWTS
                    FROM T_ZA_DW_AQJCXX
                    WHERE DJDWDM=ORGLIST(I).ORGCODE
                          AND SFFXWT='1';
                    
                    --警告数
                    SELECT COUNT(1) INTO V_JGS
                    FROM T_ZA_DW_AQJCXX
                    WHERE DJDWDM=ORGLIST(I).ORGCODE
                          AND JCCLQK='1';
                        
                    --罚款
                    SELECT COUNT(1) INTO V_FKS
                    FROM T_ZA_DW_AQJCXX
                    WHERE DJDWDM=ORGLIST(I).ORGCODE
                          AND JCCLQK='2';
                   
                    --下发隐患通知书
                    SELECT COUNT(1) INTO V_XFYHTZS
                    FROM T_ZA_DW_AQJCXX
                    WHERE DJDWDM=ORGLIST(I).ORGCODE
                          AND JCCLQK='3';
                          
                    --吊销许可证
                    SELECT COUNT(1) INTO V_DXXKZS
                    FROM T_ZA_DW_AQJCXX
                    WHERE DJDWDM=ORGLIST(I).ORGCODE
                          AND JCCLQK='5';
                          
                     --其他
                    SELECT COUNT(1) INTO V_QTS
                    FROM T_ZA_DW_AQJCXX
                    WHERE DJDWDM=ORGLIST(I).ORGCODE
                          AND JCCLQK IS NULL;
                    
                    --查询安全检查表是否存在记录，如果存在记录则更新，不存在则插入
                    SELECT COUNT(1) INTO V_COUNT FROM T_TJFX_DWAQJCTJBB WHERE ORGCODE=ORGLIST(I).ORGCODE;
                    IF V_COUNT=0 THEN
                       INSERT INTO T_TJFX_DWAQJCTJBB
                         (ORGCODE, ORGNAME, PARENT_CODE, LEVE, TJSJ, 
                          ZS, THJCS, GCJCS, NBJCS, WXPJCS, WBJCS, SWJCS, 
                          LGJCS, KSJCS, SPJCS, WLJCS, QTJCS, JCLBZJCS, 
                          XFJCS, AQJCS, YZGQKS, WZGQKS, FXWTS, JGS, FKS, 
                          XFYHTZS, DXXKZS, QTS)
                       VALUES
                         (ORGLIST(I).ORGCODE, ORGLIST(I).ORGNAME, ORGLIST(I).PARENT_CODE, ORGLIST(I).LEVE, 
                          V_TJSJ, V_ZS, V_THJCS, V_GCJCS, V_NBJCS, V_WXPJCS, 
                          V_WBJCS, V_SWJCS, V_LGJCS, V_KSJCS, V_SPJCS, V_WLJCS, 
                          V_QTJCS, V_JCLBZJCS, V_XFJCS, V_AQJCS, V_YZGQKS, V_WZGQKS, 
                          V_FXWTS, V_JGS, V_FKS, V_XFYHTZS, V_DXXKZS, V_QTS);
                       
                    ELSE
                        UPDATE T_TJFX_DWAQJCTJBB
                           SET ORGCODE = ORGLIST(I).ORGCODE,
                               ORGNAME = ORGLIST(I).ORGNAME,
                               PARENT_CODE = ORGLIST(I).PARENT_CODE,
                               LEVE = ORGLIST(I).LEVE,
                               TJSJ = V_TJSJ,
                               ZS = V_ZS,
                               THJCS = V_THJCS,
                               GCJCS = V_GCJCS,
                               NBJCS = V_NBJCS,
                               WXPJCS = V_WXPJCS,
                               WBJCS = V_WBJCS,
                               SWJCS = V_SWJCS,
                               LGJCS = V_LGJCS,
                               KSJCS = V_KSJCS,
                               SPJCS = V_SPJCS,
                               WLJCS = V_WLJCS,
                               QTJCS = V_QTJCS,
                               JCLBZJCS = V_JCLBZJCS,
                               XFJCS = V_XFJCS,
                               AQJCS = V_AQJCS,
                               YZGQKS = V_YZGQKS,
                               WZGQKS = V_WZGQKS,
                               FXWTS = V_FXWTS,
                               JGS = V_JGS,
                               FKS = V_FKS,
                               XFYHTZS = V_XFYHTZS,
                               DXXKZS = V_DXXKZS,
                               QTS = V_QTS
                         WHERE ORGCODE = ORGLIST(I).ORGCODE;
                    END IF;
                 END LOOP;
                 COMMIT;
            END LOOP;
         END T_TJBB_DWAQJCTJBB;
END SQJW_TJBB_AQJC;
/