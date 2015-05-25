-- Create table
create table T_COMMON_WTSJTJFX_PZ
(
  ID             VARCHAR2(10) not null,
  SJTYPE         VARCHAR2(50) not null,
  QUERYSQL       CLOB not null,
  SHOWFIELDS     VARCHAR2(3000),
  SHOWFIELDNAMES VARCHAR2(4000)
);
-- Add comments to the table 
comment on table T_COMMON_WTSJTJFX_PZ
  is '问题数据明细查询配置';
-- Add comments to the columns 
comment on column T_COMMON_WTSJTJFX_PZ.SJTYPE
  is '数据类型';
comment on column T_COMMON_WTSJTJFX_PZ.QUERYSQL
  is '查询sql';
comment on column T_COMMON_WTSJTJFX_PZ.SHOWFIELDS
  is '显示字段';
comment on column T_COMMON_WTSJTJFX_PZ.SHOWFIELDNAMES
  is '显示字段中文';
-- Create/Recreate primary, unique and foreign key constraints 
alter table T_COMMON_WTSJTJFX_PZ
  add primary key (ID);
alter table T_COMMON_WTSJTJFX_PZ
  add unique (SJTYPE);

  
CREATE OR REPLACE PROCEDURE P_EXEC_WTSJTJFX
--问题数据统计分析
AS
   CURSOR CUR_LIST IS
          SELECT ORGCODE,PARENT_CODE,ORGNAME,LEVE
          FROM T_COMMON_ORGANIZATION_SJJS
          WHERE LEVE='5';
    
    TYPE LISTTYPE IS TABLE OF CUR_LIST%ROWTYPE;
    LIST                   LISTTYPE;
    V_ERROR                VARCHAR2(3000);
    V_TJYF                 VARCHAR2(6);
    V_TJRQ                 VARCHAR2(8);
    V_JSSJ                 DATE;
    V_TJQSSJ               DATE;
    V_TJJZSJ               DATE;
    V_ZWTS                 NUMBER;  --总问题数
    V_CZRKS                NUMBER;  --常住人口问题数据量
    V_LDRKS                NUMBER;  --流动人口
    V_JZRKS                NUMBER;  --寄住人口
    V_WLHRKS               NUMBER;  --未落户人口
    V_STXXS                NUMBER;  --实体信息
    V_FWXXS                NUMBER;  --房屋信息
    V_SYDWS                NUMBER;  --实有单位
    V_CYRYS                NUMBER;  --从业人员
BEGIN
    V_TJYF:=TO_CHAR(SYSDATE,'YYYYMM');
    V_TJRQ:=TO_CHAR(SYSDATE,'YYYYMMDD');
    V_JSSJ:=SYSDATE;
    V_TJQSSJ:=SYSDATE-31;
    V_TJJZSJ:=SYSDATE;
    OPEN CUR_LIST;
    LOOP
         FETCH CUR_LIST BULK COLLECT INTO LIST LIMIT 100;
         EXIT WHEN LIST.COUNT=0;
         FOR I IN LIST.FIRST..LIST.LAST LOOP
             BEGIN
                  --常住人口问题数据
                  SELECT COUNT(1) INTO V_CZRKS
                  FROM (
                    SELECT SFZH
                    FROM T_LSGL_RK_CZRK
                    WHERE 1=1 AND DJDWDM=LIST(I).ORGCODE
                          AND DJSJ>=V_TJQSSJ 
                          AND DJSJ<=V_TJJZSJ
                          GROUP BY SFZH
                          HAVING COUNT(1) > 1
                   );
                  
                  --流动人口问题数据量统计
                  SELECT COUNT(1) INTO V_LDRKS
                  FROM (
                    SELECT SFZH
                    FROM T_LSGL_RK_LDRKZZXX
                    WHERE 1=1 AND DJDWDM=LIST(I).ORGCODE
                          AND DJSJ>=V_TJQSSJ 
                          AND DJSJ<=V_TJJZSJ
                          GROUP BY SFZH
                          HAVING COUNT(1) > 1
                   );
                   
                  --寄住人口问题数据量统计
                  SELECT COUNT(1) INTO V_JZRKS
                  FROM (
                    SELECT SFZH
                    FROM T_LSGL_RK_JZRKXX
                    WHERE 1=1 AND DJDWDM=LIST(I).ORGCODE
                          AND DJSJ>=V_TJQSSJ 
                          AND DJSJ<=V_TJJZSJ
                          GROUP BY SFZH
                          HAVING COUNT(1) > 1
                   );
                   
                   --未落户人口问题数据量统计
                  SELECT COUNT(1) INTO V_WLHRKS
                  FROM (
                    SELECT SFZH
                    FROM T_LSGL_RK_WLHCZHK
                    WHERE 1=1 AND DJDWDM=LIST(I).ORGCODE
                          AND DJSJ>=V_TJQSSJ 
                          AND DJSJ<=V_TJJZSJ
                          GROUP BY SFZH
                          HAVING COUNT(1) > 1
                   );
                   
                   --实体问题数据统计
                   SELECT COUNT(1) INTO V_STXXS
                    FROM
                    (
                        SELECT SQDM,MPH,XQZ,LDXZ
                        FROM T_COMMON_STXX
                        WHERE DJDWDM=LIST(I).ORGCODE
                              AND DJSJ>=V_TJQSSJ
                              AND DJSJ<=V_TJJZSJ
                             GROUP BY SQDM,MPH,XQZ,LDXZ
                             HAVING COUNT(1)> 1
                    );
                    
                    --房屋问题数据统计
                    SELECT COUNT(1) INTO V_FWXXS
                    FROM (
                    SELECT DZ.STID,DZ.DYH,DZ.FJH,DZ.FSDZ
                    FROM T_LSGL_FW_JBXX FW INNER JOIN T_COMMON_DZXX DZ ON FW.DZID=DZ.DZID
                    WHERE FW.DJDWDM=LIST(I).ORGCODE
                         AND FW.DJSJ>=V_TJQSSJ 
                         AND FW.DJSJ<=V_TJJZSJ
                         GROUP BY DZ.STID,DZ.DYH,DZ.FJH,DZ.FSDZ
                         HAVING COUNT(1)> 1
                    );
                    
                    --实有单位问题数据统计
                    SELECT COUNT(1) INTO V_SYDWS
                    FROM (
                        SELECT DWMC,DWDZ,COUNT(1)
                        FROM T_ZA_JG_JBXX JG
                        WHERE 1=1
                              AND JG.DJDWDM=LIST(I).ORGCODE
                              AND JG.DJSJ>=V_TJQSSJ  
                              AND JG.DJSJ<=V_TJJZSJ
                              GROUP BY JG.DWMC,DWDZ
                              HAVING COUNT(1) > 1  
                    );
                    
                    --从业人员问题数据统计
                    SELECT COUNT(1) INTO V_CYRYS
                    FROM (
                        SELECT JGBH,SFZH
                        FROM T_ZA_RY_CYRY 
                        WHERE 1=1
                            AND DJDWDM=LIST(I).ORGCODE
                            AND DJSJ>=V_TJQSSJ 
                            AND DJSJ<=V_TJJZSJ
                            GROUP BY JGBH,SFZH
                            HAVING COUNT(1)>1
                    );
      
                    V_ZWTS:=V_CZRKS + V_LDRKS + V_JZRKS + V_WLHRKS + V_STXXS + V_FWXXS + V_SYDWS + V_CYRYS;
                    
                    INSERT INTO T_COMMON_WTSJTJFX
                       (ID, ORGCODE, ORGNAME, TJYF, JSSJ, TJQSSJ, TJJZSJ, ZWTS, CZRKS, LDRKS, JZRKS, WLHRKS, STXXS, FWXXS, SYDWS, CYRYS, TJRQ)
                    VALUES
                       (SEQ_COMMON_WTSJTJ.NEXTVAL, LIST(I).ORGCODE, LIST(I).ORGNAME, V_TJYF, V_JSSJ, V_TJQSSJ, V_TJJZSJ, V_ZWTS, V_CZRKS, V_LDRKS, V_JZRKS, V_WLHRKS, V_STXXS, V_FWXXS, V_SYDWS, V_CYRYS, V_TJRQ);
                    COMMIT;
                 EXCEPTION WHEN OTHERS THEN
                   V_ERROR:=SQLERRM;
             END;
         END LOOP;
    END LOOP;
END;
/