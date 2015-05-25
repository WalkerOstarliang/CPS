-- Add/modify columns 
alter table T_COMMON_ORGANIZATION_FJ add XLDBH VARCHAR2(25);
-- Add comments to the columns 
comment on column T_COMMON_ORGANIZATION_FJ.XLDBH
  is '巡逻队编号（只有为巡逻队员时候才有）';

  
-- Add/modify columns 
alter table T_COMMON_USER_LXFS add lbqxcjsj date;
-- Add comments to the columns 
comment on column T_COMMON_USER_LXFS.lbqxcjsj
  is '来本地县区从警时间';
  
  
-- Add/modify columns 
alter table T_COMMON_PCSJBQKTJB add pcszfbzfjs number;
alter table T_COMMON_PCSJBQKTJB add pcsldrkxgys number;
alter table T_COMMON_PCSJBQKTJB add pcsxfdys number;
-- Add comments to the columns 
comment on column T_COMMON_PCSJBQKTJB.pcszfbzfjs
  is '派出所政法编制辅警数';
comment on column T_COMMON_PCSJBQKTJB.pcsldrkxgys
  is '派出所流动人口与出租屋协管员数';
comment on column T_COMMON_PCSJBQKTJB.pcsxfdys
  is '派出所巡防队员数';
  
-- Add/modify columns 
alter table T_COMMON_ORGANIZATION_FJ add gzjl clob;
-- Add comments to the columns 
comment on column T_COMMON_ORGANIZATION_FJ.gzjl
  is '工作经历';
  

 
CREATE OR REPLACE PROCEDURE P_EXEC_PCSJBQKTJ
AS
       CURSOR CUR_LIST IS 
              SELECT ORGCODE,ORGNAME,LEVE,PARENT_CODE
              FROM T_COMMON_ORGANIZATION_SJJS
              WHERE LEVE<=4;
      TYPE LISTTYPE IS TABLE OF CUR_LIST%ROWTYPE;
      LIST LISTTYPE;  
      V_ZJLS        NUMBER;--总警力数
      V_PCSZS        NUMBER;--派出所数
      V_PCSJLS      NUMBER;--派出所警力数
      
      V_PCSZFJS     NUMBER;--派出所辅警总数
      V_PCSZFBZFJS  NUMBER;--派出所政法编制辅警数
      V_PCSLDRKXGYS NUMBER;--派出所流动人口与出租屋协管员数
      V_PCSXFDYS    NUMBER;--派出所巡防队员数
      
      V_SQJWSFJS    NUMBER;--社区警务室辅警数
      V_SQJWSS      NUMBER;--社区警务室数
      V_SQMJS       NUMBER;--社区民警数
      V_NCJWSS      NUMBER;--农村警务室数量
      V_ZCMJS       NUMBER;--驻村民警数
      V_JWSLGANWS     NUMBER;--社区警务室接入公安内网数
      V_STPZS       NUMBER; --省厅批准数
      V_ERROR         VARCHAR2(300);
BEGIN
      DELETE FROM T_COMMON_PCSJBQKTJB;
      COMMIT;
      OPEN CUR_LIST;
      LOOP
             FETCH CUR_LIST BULK COLLECT
             INTO LIST LIMIT 100;
             EXIT WHEN LIST.COUNT = 0;
             --循环 当前的1000条数据
             FOR I IN LIST.FIRST .. LIST.LAST LOOP
                 BEGIN
                     --获取总警力数
                     SELECT F_GET_ORGMJS(LIST(I).ORGCODE) INTO V_ZJLS FROM DUAL;
                     
                     --派出所数量
                     SELECT COUNT(1) INTO V_PCSZS 
                     FROM T_COMMON_ORGANIZATION_SJJS 
                     WHERE LEVE='4' AND ORGCODE LIKE SUBSTR(LIST(I).ORGCODE,1,2*LIST(I).LEVE)||'%';
                     
                     --派出所警力数
                    SELECT COUNT(1) INTO V_PCSJLS
                    FROM V_COMMON_USER U 
                         INNER JOIN V_COMMON_ORGUSER OU ON U.USERID=OU.USERID
                         INNER JOIN V_COMMON_ORGANIZATION O ON O.ORGID=OU.ORGID 
                    WHERE U.ISVALID='1'
                          AND O.ORGCODE IN (
                              SELECT ORGCODE FROM T_COMMON_ORGANIZATION_SJJS S 
                              WHERE S.LEVE>=4 
                                    AND S.ORGCODE LIKE SUBSTR(LIST(I).ORGCODE,1,2*LIST(I).LEVE)||'%' 
                          );
                   --派出所总辅警数
                   SELECT COUNT(1) INTO V_PCSZFJS
                   FROM T_COMMON_ORGANIZATION_FJ F
                   WHERE F_GET_DWLEVE(F.SSDWDM)>=4 
                        AND F.SSDWDM LIKE SUBSTR(LIST(I).ORGCODE,1,2*LIST(I).LEVE)||'%';
                        
                   --派出所政法编制辅警数
                   SELECT COUNT(1) INTO V_PCSLDRKXGYS
                   FROM T_COMMON_ORGANIZATION_FJ F
                   WHERE F_GET_DWLEVE(F.SSDWDM)>=4 
                         AND F.FJLB='3'
                        AND F.SSDWDM LIKE SUBSTR(LIST(I).ORGCODE,1,2*LIST(I).LEVE)||'%';
                        
                   --派出所流动人口与出租屋协管员数
                   SELECT COUNT(1) INTO V_PCSZFBZFJS
                   FROM T_COMMON_ORGANIZATION_FJ F
                   WHERE F_GET_DWLEVE(F.SSDWDM)>=4 
                         AND F.FJLB='1'
                        AND F.SSDWDM LIKE SUBSTR(LIST(I).ORGCODE,1,2*LIST(I).LEVE)||'%';
                        
                   
                   --派出所巡防队员数
                   SELECT COUNT(1) INTO V_PCSXFDYS
                   FROM T_COMMON_ORGANIZATION_FJ F
                   WHERE F_GET_DWLEVE(F.SSDWDM)>=4 
                         AND F.FJLB='2'
                        AND F.SSDWDM LIKE SUBSTR(LIST(I).ORGCODE,1,2*LIST(I).LEVE)||'%';
                        

                   --社区警务室配备辅警数
                   SELECT COUNT(1) INTO V_SQJWSFJS
                   FROM T_COMMON_ORGANIZATION_FJ F
                   WHERE F_GET_DWLEVE(F.SSDWDM)=5 
                        AND F.SSDWDM LIKE SUBSTR(LIST(I).ORGCODE,1,2*LIST(I).LEVE)||'%';
                       
                   --警务室数
                   SELECT COUNT(1) INTO V_SQJWSS
                   FROM T_COMMON_ORGANIZATION_SJJS S
                   WHERE LEVE=5  AND S.ORGCODE LIKE SUBSTR(LIST(I).ORGCODE,1,2*LIST(I).LEVE)||'%';
                     
                   --社区民警数
                   SELECT COUNT(1) INTO V_SQMJS
                   FROM V_COMMON_USER U 
                         INNER JOIN V_COMMON_ORGUSER OU ON U.USERID=OU.USERID
                         INNER JOIN V_COMMON_ORGANIZATION O ON O.ORGID=OU.ORGID 
                   WHERE U.ISVALID='1'
                          AND O.ORGCODE IN (
                              SELECT ORGCODE FROM T_COMMON_ORGANIZATION_SJJS S 
                              WHERE S.LEVE=5 
                                    AND S.ORGCODE LIKE SUBSTR(LIST(I).ORGCODE,1,2*LIST(I).LEVE)||'%' 
                          );     
                  
                   --农村警务室数量
                   SELECT COUNT(1) INTO V_NCJWSS
                   FROM V_COMMON_ORGANIZATION O
                       LEFT JOIN T_COMMON_ORGANIZATION_OTHER T ON O.ORGCODE=T.ORGCODE
                   WHERE O.LEVE=5 AND T.SFNCJWS='1'
                        AND O.ORGCODE LIKE SUBSTR(LIST(I).ORGCODE,1,2*LIST(I).LEVE)||'%';
                 
                   --省厅批准数
                   SELECT COUNT(1) INTO V_STPZS
                   FROM V_COMMON_ORGANIZATION O
                       LEFT JOIN T_COMMON_ORGANIZATION_OTHER T ON O.ORGCODE=T.ORGCODE
                   WHERE O.LEVE=4 AND T.SFSTPZ='1'
                        AND O.ORGCODE LIKE SUBSTR(LIST(I).ORGCODE,1,2*LIST(I).LEVE)||'%';
                 
                   --驻村民警数
                   SELECT COUNT(1) INTO V_ZCMJS
                   FROM T_COMMON_USER_LXFS L
                        INNER JOIN V_COMMON_USER U ON L.USERID=U.USERID
                        INNER JOIN V_COMMON_ORGUSER OU ON U.USERID=OU.USERID
                         INNER JOIN V_COMMON_ORGANIZATION O ON O.ORGID=OU.ORGID 
                   WHERE L.SFZCMJ='1' AND U.ISVALID='1'
                         AND O.ORGCODE LIKE SUBSTR(LIST(I).ORGCODE,1,2*LIST(I).LEVE)||'%';
                   
                   SELECT COUNT(1) INTO V_JWSLGANWS
                   FROM T_COMMON_ORGANIZATION_OTHER T
                   WHERE F_GET_DWLEVE(T.ORGCODE)=5 AND JRGANW='1'
                        AND T.ORGCODE LIKE SUBSTR(LIST(I).ORGCODE,1,2*LIST(I).LEVE)||'%';
                  
                   INSERT INTO T_COMMON_PCSJBQKTJB
                    (ID, ORGCODE, ORGNAME, LEVE,PARENTCODE, ZJLS, PCSZS, PCSJLS, PCSZFJS, SQJWSFJS, SQJWSS, SQMJS, NCJWSS, ZCMJS, JWSLGANWS,STPZS,PCSZFBZFJS,PCSLDRKXGYS,PCSXFDYS)
                   VALUES
                    (I, LIST(I).ORGCODE, LIST(I).ORGNAME, LIST(I).LEVE,LIST(I).PARENT_CODE, V_ZJLS, V_PCSZS, V_PCSJLS, V_PCSZFJS, V_SQJWSFJS, V_SQJWSS, V_SQMJS, V_NCJWSS, V_ZCMJS, V_JWSLGANWS,V_STPZS,V_PCSZFBZFJS,V_PCSLDRKXGYS,V_PCSXFDYS);
                   COMMIT;
               EXCEPTION WHEN OTHERS THEN
                         V_ERROR:=SQLERRM;
               END;
             END LOOP;
       END LOOP;
END;
/