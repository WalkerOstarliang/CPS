CREATE OR REPLACE PACKAGE SQJW_TJBB_RK
AS
       --出 租 房 屋 统 计 报 表
        PROCEDURE P_TJBB_CZFWTJBB(V_TJQSSJ  DATE,V_TJJZSJ  DATE);
       
       --暂 住 人 口 管 理 统 计 报 表
       PROCEDURE P_TJBB_ZZRKTJBB;
       
       --流动人口统计报表
       PROCEDURE P_TJBB_LDRKTJBB(V_TJQSSJ DATE, V_TJJZSJ DATE);
       
END SQJW_TJBB_RK;
/

CREATE OR REPLACE PACKAGE BODY SQJW_TJBB_RK IS
        --出 租 房 屋 统 计 报 表
        --V_PORGCODE :父类代码 V_PTJQSSJ：统计起始时间 V_PTJJZSJ 统计截止时间
        PROCEDURE P_TJBB_CZFWTJBB(V_TJQSSJ  DATE,V_TJJZSJ  DATE) 
        IS
          CURSOR ORG_CUR_LIST IS
                 SELECT ORGCODE, ORGNAME, PARENT_CODE, LEVE
                 FROM T_COMMON_ORGANIZATION_SJJS
                 WHERE LEVE=5;
                 
          CURSOR PUP_ORG_LIST IS
                 SELECT ORGCODE, ORGNAME, PARENT_CODE, LEVE
                 FROM T_COMMON_ORGANIZATION_SJJS
                 WHERE LEVE<5 ORDER BY ORGCODE;
                 
          TYPE TYPE_ORG_CUR_LIST IS TABLE OF ORG_CUR_LIST%ROWTYPE;
          ORGLIST           TYPE_ORG_CUR_LIST;
          
          TYPE TYPE_PUP_ORG_LIST IS TABLE OF PUP_ORG_LIST%ROWTYPE;
          PUPORGLIST        TYPE_PUP_ORG_LIST;
          
          V_CZFZS         NUMBER;
          V_CZWGFS        NUMBER;
          V_CZWSFS        NUMBER;
          V_YCZFS         NUMBER;
          V_QDZAZRZS      NUMBER;
          V_YBAZS         NUMBER;
          V_YCQZS         NUMBER;
          V_COUNT         NUMBER;
          V_TJSJ          DATE;
          V_TJRQ          VARCHAR2(8);
        BEGIN
        
          V_TJSJ := SYSDATE;
          V_TJRQ := TO_CHAR(V_TJQSSJ, 'YYYYMMDD');
          
          OPEN ORG_CUR_LIST;
          LOOP
               FETCH ORG_CUR_LIST BULK COLLECT INTO ORGLIST LIMIT 1000; 
               EXIT WHEN ORGLIST.COUNT = 0 ;
               FOR K IN ORGLIST.FIRST .. ORGLIST.LAST LOOP
                 
                  --出租房总数
                  SELECT COUNT(1) INTO V_CZFZS
                  FROM T_LSGL_FW_JBXX A INNER JOIN T_LSGL_CZFW_JBXX B ON A.FWID=B.FWBH
                  WHERE (A.ZXBS='0' OR A.ZXBS IS NULL) 
                     AND  A.SFCZW = '1'
                     AND (B.FWZT='0' OR B.FWZT IS NULL)
                     AND B.DJDWDM=ORGLIST(K).ORGCODE
                     AND B.DJSJ >= V_TJQSSJ
                     AND B.DJSJ < V_TJJZSJ;
                          
                          
                   --公房数
                   SELECT COUNT(1) INTO V_CZWGFS
                   FROM T_LSGL_FW_JBXX A INNER JOIN T_LSGL_CZFW_JBXX B ON A.FWID=B.FWBH
                   WHERE (A.ZXBS='0' OR A.ZXBS IS NULL) 
                       AND A.SFCZW = '1'
                       AND A.CQLX = '1'
                       AND (B.FWZT='0' OR B.FWZT IS NULL)
                       AND B.DJDWDM=ORGLIST(K).ORGCODE
                       AND B.DJSJ >= V_TJQSSJ
                       AND B.DJSJ < V_TJJZSJ;   
                           
                   --私房数
                   SELECT COUNT(1) INTO V_CZWSFS
                   FROM T_LSGL_FW_JBXX A INNER JOIN T_LSGL_CZFW_JBXX B ON A.FWID=B.FWBH
                   WHERE (A.ZXBS='0' OR A.ZXBS IS NULL) 
                       AND A.SFCZW = '1'
                       AND A.CQLX = '2'
                       AND (B.FWZT='0' OR B.FWZT IS NULL)
                       AND B.DJDWDM=ORGLIST(K).ORGCODE
                       AND B.DJSJ >= V_TJQSSJ
                       AND B.DJSJ < V_TJJZSJ; 
                           
                   --已租房数    
                   SELECT COUNT(1) INTO V_YCZFS
                   FROM T_LSGL_FW_JBXX A INNER JOIN T_LSGL_CZFW_JBXX B ON A.FWID=B.FWBH
                   WHERE (A.ZXBS='0' OR A.ZXBS IS NULL) 
                       AND A.SFCZW = '1'
                       AND (B.FWZT='0' OR B.FWZT IS NULL)
                       AND B.DJDWDM=ORGLIST(K).ORGCODE
                       AND B.DJSJ >= V_TJQSSJ
                       AND B.DJSJ < V_TJJZSJ
                       AND EXISTS (SELECT 1 FROM T_LSGL_RKFW_GL GL WHERE A.FWID = GL.FWID AND GL.ZXBS <> '1');
                         
                    --签订治安责任状数 
                   SELECT COUNT(DISTINCT A.FWID) INTO V_QDZAZRZS
                   FROM T_LSGL_FW_JBXX A INNER JOIN T_LSGL_CZFW_JBXX B ON A.FWID = B.FWBH
                   WHERE (A.ZXBS='0' OR A.ZXBS IS NULL) 
                       AND A.SFCZW = '1'
                       AND (B.FWZT='0' OR B.FWZT IS NULL)
                       AND B.DJDWDM=ORGLIST(K).ORGCODE
                       AND B.SFQDZRZ = '1'
                       AND B.DJSJ >= V_TJQSSJ
                       AND B.DJSJ < V_TJJZSJ;
                           
                   --有备案证数    
                   SELECT COUNT(DISTINCT A.FWID) INTO V_YBAZS
                   FROM T_LSGL_FW_JBXX A INNER JOIN T_LSGL_CZFW_JBXX B ON A.FWID = B.FWBH
                   WHERE (A.ZXBS='0' OR A.ZXBS IS NULL) 
                       AND A.SFCZW = '1'
                       AND (B.FWZT='0' OR B.FWZT IS NULL)
                       AND B.DJBH IS NOT NULL
                       AND B.DJDWDM=ORGLIST(K).ORGCODE
                       AND B.DJSJ >= V_TJQSSJ
                       AND B.DJSJ < V_TJJZSJ;
                       
                    --有产权证数    
                   SELECT COUNT(1) INTO V_YCQZS
                   FROM T_LSGL_FW_JBXX A INNER JOIN T_LSGL_CZFW_JBXX B ON A.FWID=B.FWBH
                   WHERE (A.ZXBS='0' OR A.ZXBS IS NULL) 
                       AND A.SFCZW = '1'
                       AND A.CQZHM IS NOT NULL
                       AND (B.FWZT='0' OR B.FWZT IS NULL)
                       AND B.DJDWDM=ORGLIST(K).ORGCODE
                       AND B.DJSJ >= V_TJQSSJ
                       AND B.DJSJ < V_TJJZSJ;
                  
                   --查看是否存在
                  SELECT COUNT(1) INTO V_COUNT FROM T_TJFX_CZFWTJBB WHERE ORGCODE = ORGLIST(K).ORGCODE AND TJRQ=V_TJRQ;
                       
                  --不存在则插入
                  IF V_COUNT = 0 THEN
                    INSERT INTO T_TJFX_CZFWTJBB
                      (ORGCODE,
                       ORGNAME,
                       LEVE,
                       PARENT_CODE,
                       TJRQ,
                       TJSJ,
                       TJQSRQ,
                       TJJZRQ,
                       CZFZS,
                       CZWGFS,
                       CZWSFS,
                       YCZFS,
                       QDZAZRZS,
                       YBAZS,
                       YCQZS)
                    VALUES
                      (ORGLIST(K).ORGCODE,
                       ORGLIST(K).ORGNAME,
                       ORGLIST(K).LEVE,
                       ORGLIST(K).PARENT_CODE,
                       V_TJRQ,
                       V_TJSJ,
                       TO_CHAR(V_TJQSSJ, 'YYYYMMDDHH24MISS'),
                       TO_CHAR(V_TJJZSJ, 'YYYYMMDDHH24MISS'),
                       V_CZFZS,
                       V_CZWGFS,
                       V_CZWSFS,
                       V_YCZFS,
                       V_QDZAZRZS,
                       V_YBAZS,
                       V_YCQZS);
                    --存在则更新         
                  ELSE
                    UPDATE T_TJFX_CZFWTJBB
                       SET ORGNAME     = ORGLIST(K).ORGNAME,
                           LEVE        = ORGLIST(K).LEVE,
                           PARENT_CODE = ORGLIST(K).PARENT_CODE,
                           TJSJ        = V_TJSJ,
                           TJQSRQ      = TO_CHAR(V_TJQSSJ, 'YYYYMMDDHH24MISS'),
                           TJJZRQ      = TO_CHAR(V_TJJZSJ, 'YYYYMMDDHH24MISS'),
                           CZFZS       = V_CZFZS,
                           CZWGFS      = V_CZWGFS,
                           CZWSFS      = V_CZWSFS,
                           YCZFS       = V_YCZFS,
                           QDZAZRZS    = V_QDZAZRZS,
                           YBAZS       = V_YBAZS,
                           YCQZS       = V_YCQZS
                     WHERE ORGCODE = ORGLIST(K).ORGCODE
                       AND TJRQ        = V_TJRQ;
                  END IF;
               END LOOP;
               COMMIT;
          END LOOP;
        
          --汇总上级单位
          OPEN PUP_ORG_LIST;
          LOOP
               FETCH PUP_ORG_LIST BULK COLLECT INTO PUPORGLIST LIMIT 1000;
               EXIT WHEN PUPORGLIST.COUNT=0;
               FOR I IN PUPORGLIST.FIRST .. PUPORGLIST.LAST LOOP
                  SELECT NVL(SUM(CZFZS),0), NVL(SUM(CZWGFS),0), NVL(SUM(CZWSFS),0),NVL(SUM(YCZFS),0), 
                         NVL(SUM(QDZAZRZS),0), NVL(SUM(YBAZS),0),NVL(SUM(YCQZS),0) 
                         INTO V_CZFZS,V_CZWGFS,V_CZWSFS,V_YCZFS,V_QDZAZRZS,V_YBAZS,V_YCQZS
                  FROM T_TJFX_CZFWTJBB 
                  WHERE TJRQ=V_TJRQ 
                        AND LEVE=5 
                        AND ORGCODE LIKE SUBSTR(PUPORGLIST(I).ORGCODE,1,2*PUPORGLIST(I).LEVE)||'%';  
                    
                  --查看是否存在
                  SELECT COUNT(1) INTO V_COUNT FROM T_TJFX_CZFWTJBB WHERE ORGCODE = PUPORGLIST(I).ORGCODE AND TJRQ=V_TJRQ;  
                  --不存在则插入
                  IF V_COUNT = 0 THEN
                          INSERT INTO T_TJFX_CZFWTJBB
                            (ORGCODE,
                             ORGNAME,
                             LEVE,
                             PARENT_CODE,
                             TJRQ,
                             TJSJ,
                             TJQSRQ,
                             TJJZRQ,
                             CZFZS,
                             CZWGFS,
                             CZWSFS,
                             YCZFS,
                             QDZAZRZS,
                             YBAZS,
                             YCQZS)
                          VALUES
                            (PUPORGLIST(I).ORGCODE,
                             PUPORGLIST(I).ORGNAME,
                             PUPORGLIST(I).LEVE,
                             PUPORGLIST(I).PARENT_CODE,
                             V_TJRQ,
                             V_TJSJ,
                             TO_CHAR(V_TJQSSJ, 'YYYYMMDDHH24MISS'),
                             TO_CHAR(V_TJJZSJ, 'YYYYMMDDHH24MISS'),
                             V_CZFZS,
                             V_CZWGFS,
                             V_CZWSFS,
                             V_YCZFS,
                             V_QDZAZRZS,
                             V_YBAZS,
                             V_YCQZS);
                    --存在则更新         
                  ELSE
                          UPDATE T_TJFX_CZFWTJBB
                          SET ORGNAME     = PUPORGLIST(I).ORGNAME,
                                 LEVE        = PUPORGLIST(I).LEVE,
                                 PARENT_CODE = PUPORGLIST(I).PARENT_CODE,
                                 TJSJ        = V_TJSJ,
                                 TJQSRQ      = TO_CHAR(V_TJQSSJ, 'YYYYMMDDHH24MISS'),
                                 TJJZRQ      = TO_CHAR(V_TJJZSJ, 'YYYYMMDDHH24MISS'),
                                 CZFZS       = V_CZFZS,
                                 CZWGFS      = V_CZWGFS,
                                 CZWSFS      = V_CZWSFS,
                                 YCZFS       = V_YCZFS,
                                 QDZAZRZS    = V_QDZAZRZS,
                                 YBAZS       = V_YBAZS,
                                 YCQZS       = V_YCQZS
                           WHERE ORGCODE = PUPORGLIST(I).ORGCODE
                                 AND TJRQ        = V_TJRQ;
                  END IF;
               END LOOP;
               COMMIT;
          END LOOP;
          
        END P_TJBB_CZFWTJBB;

        --暂 住 人 口 管 理 统 计 报 表

        /*
        
        社区警务 - 暂 住 人 口 统 计 报 表 (汇总表)
        
          参数说明：QSSJ   起始时间
        
                    JSSJ   结束时间
        
        例: SELECT * FROM TABLE(F_REPORT_SQJW_ZZRKTJ('20130101','20140701'))
        
        
        
          分类说明：
        
          -- 01务工
        
          '01',内部单位合同工
        
          '02',企事业雇用临时工
        
          '03',建筑民工
        
          '04',装卸运输工
        
          '07',养殖
        
          '09',其他劳务
        
          '14',团体务工
        
          '35' 手工业劳动
        
          36 修理工匠
        
          38 拣、收废品
        
        
        
          -- 02务农
        
          06 务农
        
          13 团体务农
        
        
        
          -- 03经商
        
          05 办厂
        
          11 单位经商
        
          12 个体户经商
        
          19 其他经营
        
          21 采购、供销
        
          49 其他经济型
        
        
        
          -- 04服务
        
          31 饮食业
        
          32 公用事业
        
          33 咨询服务
        
          34 仓储业
        
          39 其他服务
        
        
        
          -- 05因公出差
        
          22 驻地办事机构
        
          29 其他公务
        
          51 开会、考察、出差
        
        
        
          -- 06借读培训
        
          52 学习、培训
        
          53 寄读、借读
        
        
        
          -- 07治病、疗养
        
          54 治病、疗养
        
        
        
          -- 08保姆
        
          37 保姆
        
        
        
          -- 09投靠亲友
        
          60 寄养
        
          80 夫妻投靠
        
          81 子女投靠父母
        
          82 父母投靠子女
        
          83 其他投靠亲友
        
          99 其他社会型
        
        
        
          -- 10探亲、访友
        
          55 探亲、访友
        
        
        
          -- 11旅游、观光
        
          56 旅游、观光
        
        
        
          --99其它
        
          00 事由不详
        
          57 婚入
        
          58 离休、退休、退职
        
          59 刑满释放、解除教养
        
          70 盲流
        
          71 灾荒流入
        
            */
        PROCEDURE P_TJBB_ZZRKTJBB 
        AS
          CURSOR CUR_LIST(V_ORGCODE VARCHAR2) IS
            SELECT AAA.XH AS JZSYDM, 
                   AAA.MC AS JZSYMC,
                   -- 性别
                   SUM(DECODE(BBB.XB, '1', SL, 0)) AS XBMNUM,
                   SUM(DECODE(BBB.XB, '2', SL, 0)) AS XBWNUM,
                   -- 暂住时间
                   SUM(DECODE(BBB.NJZQX, 'BNN', SL, 0)) AS NJZQXBNYXNUM,
                   SUM(DECODE(BBB.NJZQX, 'WNN', SL, 0)) AS NJZQXBNZWNNUM,
                   SUM(DECODE(BBB.NJZQX, 'WNYS', SL, 0)) AS NJZQXWNYS,
                   -- 来自地区
                   SUM(DECODE(BBB.HJDLX, 'SNS', SL, 0)) AS HJDLXSNS,
                   SUM(DECODE(BBB.HJDLX, 'SNX', SL, 0)) AS HJDLXSNX,
                   SUM(DECODE(BBB.HJDLX, 'SWS', SL, 0)) AS HJDLXSWS,
                   SUM(DECODE(BBB.HJDLX, 'SWX', SL, 0)) AS HJDLXSWX,
                   SUM(DECODE(BBB.HJDLX, 'GAT', SL, 0)) AS HJDLXGAT,
                   SUM(DECODE(BBB.HJDLX, 'GW', SL, 0)) AS HJDLXGW,
                   SUM(DECODE(BBB.HJDLX, 'QT', SL, 0)) AS HJDLXQT,
                   -- 居住处所
                   SUM(DECODE(BBB.ZZCS, 'LD', SL, 0)) AS ZZCSLJ,
                   SUM(DECODE(BBB.ZZCS, 'JMJZ', SL, 0)) AS ZZCSJMJZ,
                   SUM(DECODE(BBB.ZZCS, 'DWNB', SL, 0)) AS ZZCSDWNB,
                   SUM(DECODE(BBB.ZZCS, 'GDXC', SL, 0)) AS ZZCSGDXC,
                   SUM(DECODE(BBB.ZZCS, 'ZLFW', SL, 0)) AS ZZCSZLFW,
                   SUM(DECODE(BBB.ZZCS, 'QT', SL, 0)) AS ZZCSQT
              FROM (SELECT T.DM, '务    工' AS MC, '1' AS XH
                      FROM SQJW.T_COMMON_DICTIONARY  T
                     WHERE T.ZDLB = 'ZDY_ZZSY'
                          --AND T.MC LIKE '%务工%'
                       AND T.DM IN
                           ('01', '02', '03', '04', '07', '09', '14', '35', '36', '38')
                    UNION ALL
                    SELECT T.DM, '务    农' AS MC, '2' AS XH
                      FROM SQJW.T_COMMON_DICTIONARY  T
                     WHERE T.ZDLB = 'ZDY_ZZSY'
                          --AND T.MC LIKE '%务农%'
                       AND T.DM IN ('06', '13')
                    UNION ALL
                    SELECT T.DM, '经    商' AS MC, '3' AS XH
                      FROM SQJW.T_COMMON_DICTIONARY  T
                     WHERE T.ZDLB = 'ZDY_ZZSY'
                          --AND T.MC LIKE '%经商%'
                       AND T.DM IN ('05', '11', '12', '19', '21', '49')
                    UNION ALL
                    SELECT T.DM, '服    务' AS MC, '4' AS XH
                      FROM SQJW.T_COMMON_DICTIONARY  T
                     WHERE T.ZDLB = 'ZDY_ZZSY'
                          --AND T.MC LIKE '%服务%'
                       AND T.DM IN ('31', '32', '33', '34', '39')
                    UNION ALL
                    SELECT T.DM, '因公出差' AS MC, '5' AS XH
                      FROM SQJW.T_COMMON_DICTIONARY  T
                     WHERE T.ZDLB = 'ZDY_ZZSY'
                          --AND T.MC LIKE '%出差%'
                       AND T.DM IN ('22', '29', '51')
                    UNION ALL
                    SELECT T.DM, '借读培训' AS MC, '6' AS XH
                      FROM SQJW.T_COMMON_DICTIONARY  T
                     WHERE T.ZDLB = 'ZDY_ZZSY'
                       AND T.DM IN ('52', '53')
                    UNION ALL
                    SELECT T.DM, '治病疗养' AS MC, '7' AS XH
                      FROM SQJW.T_COMMON_DICTIONARY  T
                     WHERE T.ZDLB = 'ZDY_ZZSY'
                       AND T.DM = '54'
                    UNION ALL
                    SELECT T.DM, '保    姆' AS MC, '8' AS XH
                      FROM SQJW.T_COMMON_DICTIONARY  T
                     WHERE T.ZDLB = 'ZDY_ZZSY'
                       AND T.DM = '37'
                    UNION ALL
                    SELECT T.DM, '投靠亲友' AS MC, '9' AS XH
                      FROM SQJW.T_COMMON_DICTIONARY  T
                     WHERE T.ZDLB = 'ZDY_ZZSY'
                       AND T.DM IN ('60', '80', '81', '82', '83', '99')
                    UNION ALL
                    SELECT T.DM, '探亲访友' AS MC, '10' AS XH
                      FROM SQJW.T_COMMON_DICTIONARY  T
                     WHERE T.ZDLB = 'ZDY_ZZSY'
                       AND T.DM = '55'
                    UNION ALL
                    SELECT T.DM, '旅游观光' AS MC, '11' AS XH
                      FROM SQJW.T_COMMON_DICTIONARY  T
                     WHERE T.ZDLB = 'ZDY_ZZSY'
                       AND T.DM = '56'
                    UNION ALL
                    SELECT T.DM, '其    他' AS MC, '12' AS XH
                      FROM SQJW.T_COMMON_DICTIONARY  T
                     WHERE T.ZDLB = 'ZDY_ZZSY'
                       AND T.DM IN ('00', '57', '58', '59', '70', '71')) AAA,
                   (SELECT ZZSY, ZZCS, HJDLX, NJZQX, XB, COUNT(DISTINCT SFZH) SL
                      FROM (SELECT
                             DECODE(A.ZZSY,
                                    '01','01','02','01','03','01','04','01','07','01','09','01','14','01','35','01','36','01','38','01', -- 务工
                                    '06','06','13','06', -- 务农
                                    '05','05','11','05','12','05','19','05','21','05','49','05', -- 经商
                                    '31','31','32','31','33','31','34','31','39','31', -- 服务
                                    '22','22','29','22','51','22', -- 因公出差
                                    '52','52','53','52', --借读培训
                                    '54','54', -- 治病疗养
                                    '37','37', -- 保姆
                                    '60','60','80','60','81','60','82','60','83','60','99','60', -- 投靠亲友
                                    '55','55', -- 探亲访友
                                    '56','56', -- 旅游观光
                                    '00','00','57','00','58','00','59','00','70','00','71','00', -- 其它
                                    '00') AS ZZSY,
                             -- 暂住处所
                             DECODE(A.ZZCS,
                                    '01','LD','02','LD','03','LD','04','LD','05','LD',
                                    '31','JMJZ','32','JMJZ','33','JMJZ',
                                    '21','DWNB','23','DWNB','25','DWNB',
                                    '41','GDXC','42','GDXC',
                                    '34','ZLFW',
                                    '11','QT','12','QT','13','QT','22','QT',
                                    '24','QT','26','QT','27','QT','43','QT','51','QT',
                                    '61','QT','62','QT','99','QT','00','QT','QT') ZZCS,
                             -- 来自地区
                             DECODE(A.HJDLX,
                                    '01','SNS',
                                    '03','SNS',
                                    '05','SNX',
                                    '07','SNX',
                                    '00','SNX',
                                    '99','SNX',
                                    '02','SWS',
                                    '04','SWS',
                                    '06','SWX',
                                    '08','SWX',
                                    '10','GAT',
                                    '11','GAT',
                                    '12','GAT',
                                    '13','GW',
                                    'QT') HJDLX,
                             -- 暂住时间
                             DECODE(A.NJZQX,'1','BNN','2',
                                    'BNN', --半年内
                                    '3','WNN','4','WNN','5',
                                    'WNN', --五年内
                                    '6','WNYS', --  五年以上的没有  先用  代码 6    QT 不要
                                    'QT') NJZQX,
                             -- 性别
                               DECODE(SUBSTR(A.SFZH,17,1),'1','1','3','1','5','1','7','1','9','1','2') XB,
                               A.SFZH
                              FROM T_LSGL_RK_LDRKZZXX  A 
                               WHERE  A.NJZQX IN ('1', '2', '3', '4', '5', '6')
                                      AND A.HJDLX IN ('00', '01', '02', '03', '04', '05', '06', '07', '08', '10', '11', '12', '13', '99')
                                      AND (A.ZXBS = '0' OR A.ZXBS IS NULL)
                                      AND A.DJDWDM=V_ORGCODE
                               )   
                     GROUP BY ZZSY, ZZCS, HJDLX, NJZQX, XB
                    ) BBB
                 WHERE AAA.DM = BBB.ZZSY(+)  
                 GROUP BY AAA.XH,  AAA.MC
                 ORDER BY TO_NUMBER(AAA.XH);
        
          CURSOR ORG_CUR_LIST IS
            SELECT ORGCODE, ORGNAME, PARENT_CODE, LEVE
            FROM T_COMMON_ORGANIZATION_SJJS
            WHERE LEVE=5;
        
          TYPE LISTTYPE IS TABLE OF CUR_LIST%ROWTYPE;
          LIST LISTTYPE;
          
          TYPE ORGLISTTYPE IS TABLE OF ORG_CUR_LIST%ROWTYPE;
          ORGLIST ORGLISTTYPE;
          V_COUNT NUMBER;
          V_TJYF  VARCHAR2(6);
          V_TJSJ  DATE;
        
        BEGIN
        
          V_TJSJ := SYSDATE;
          V_TJYF := TO_CHAR(V_TJSJ, 'YYYYMM');
          --计算所有警务区
          OPEN ORG_CUR_LIST;
          LOOP
            FETCH ORG_CUR_LIST BULK COLLECT INTO ORGLIST LIMIT 100;
            EXIT WHEN ORGLIST.COUNT = 0;
            FOR K IN ORGLIST.FIRST .. ORGLIST.LAST LOOP
                  OPEN CUR_LIST(ORGLIST(K).ORGCODE);
                  LOOP
                      FETCH CUR_LIST BULK COLLECT INTO LIST LIMIT 100;
                      EXIT WHEN LIST.COUNT = 0;
                      FOR I IN LIST.FIRST .. LIST.LAST LOOP
                        
                      --查询数量
                        SELECT COUNT(1) INTO V_COUNT  
                        FROM T_TJFX_ZZRKTJBB 
                        WHERE ORGCODE = ORGLIST(K).ORGCODE 
                              AND TJYF = V_TJYF 
                              AND JZSYDM = LIST(I).JZSYDM;
                        
                        IF V_COUNT = 0 THEN
                          INSERT INTO T_TJFX_ZZRKTJBB
                            (ORGCODE,
                             ORGNAME,
                             PARENT_CODE,
                             LEVE,
                             TJYF,
                             TJSJ,
                             JZSYDM,
                             JZSYMC,
                             XBMNUM,
                             XBWNUM,
                             NJZQXBNYXNUM,
                             NJZQXBNZWNNUM,
                             NJZQXWNYS,
                             HJDLXSNS,
                             HJDLXSNX,
                             HJDLXSWS,
                             HJDLXSWX,
                             HJDLXGAT,
                             HJDLXGW,
                             HJDLXQT,
                             ZZCSLJ,
                             ZZCSJMJZ,
                             ZZCSDWNB,
                             ZZCSGDXC,
                             ZZCSZLFW,
                             ZZCSQT)
                          VALUES
                            (ORGLIST(K).ORGCODE,
                             ORGLIST(K).ORGNAME,
                             ORGLIST(K).PARENT_CODE,
                             ORGLIST(K).LEVE,
                             V_TJYF,
                             V_TJSJ,
                             LIST(I).JZSYDM,
                             LIST(I).JZSYMC,
                             LIST(I).XBMNUM,
                             LIST(I).XBWNUM,
                             LIST(I).NJZQXBNYXNUM,
                             LIST(I).NJZQXBNZWNNUM,
                             LIST(I).NJZQXWNYS,
                             LIST(I).HJDLXSNS,
                             LIST(I).HJDLXSNX,
                             LIST(I).HJDLXSWS,
                             LIST(I).HJDLXSWX,
                             LIST(I).HJDLXGAT,
                             LIST(I).HJDLXGW,
                             LIST(I).HJDLXQT,
                             LIST(I).ZZCSLJ,
                             LIST(I).ZZCSJMJZ,
                             LIST(I).ZZCSDWNB,
                             LIST(I).ZZCSGDXC,
                             LIST(I).ZZCSZLFW,
                             LIST(I).ZZCSQT);
                        ELSE
                          UPDATE T_TJFX_ZZRKTJBB
                             SET ORGNAME       = ORGLIST(K).ORGNAME,
                                 PARENT_CODE   = ORGLIST(K).PARENT_CODE,
                                 LEVE          = ORGLIST(K).LEVE,
                                 TJSJ          = V_TJSJ,
                                 JZSYDM        = LIST(I).JZSYDM,
                                 JZSYMC        = LIST(I).JZSYMC,
                                 XBMNUM        = LIST(I).XBMNUM,
                                 XBWNUM        = LIST(I).XBWNUM,
                                 NJZQXBNYXNUM  = LIST(I).NJZQXBNYXNUM,
                                 NJZQXBNZWNNUM = LIST(I).NJZQXBNZWNNUM,
                                 NJZQXWNYS     = LIST(I).NJZQXWNYS,
                                 HJDLXSNS      = LIST(I).HJDLXSNS,
                                 HJDLXSNX      = LIST(I).HJDLXSNX,
                                 HJDLXSWS      = LIST(I).HJDLXSWS,
                                 HJDLXSWX      = LIST(I).HJDLXSWX,
                                 HJDLXGAT      = LIST(I).HJDLXGAT,
                                 HJDLXGW       = LIST(I).HJDLXGW,
                                 HJDLXQT       = LIST(I).HJDLXQT,
                                 ZZCSLJ        = LIST(I).ZZCSLJ,
                                 ZZCSJMJZ      = LIST(I).ZZCSJMJZ,
                                 ZZCSDWNB      = LIST(I).ZZCSDWNB,
                                 ZZCSGDXC      = LIST(I).ZZCSGDXC,
                                 ZZCSZLFW      = LIST(I).ZZCSZLFW,
                                 ZZCSQT        = LIST(I).ZZCSQT
                           WHERE ORGCODE = ORGLIST(K).ORGCODE
                             AND TJYF = V_TJYF
                             AND JZSYDM = LIST(I).JZSYDM;
                        END IF;
                      END LOOP;
                      COMMIT;
                  END LOOP;
                  CLOSE CUR_LIST;
              END LOOP;
          END LOOP;
          CLOSE ORG_CUR_LIST;
        END P_TJBB_ZZRKTJBB;
  
  
       --流动人口统计报表
       PROCEDURE P_TJBB_LDRKTJBB(V_TJQSSJ DATE, V_TJJZSJ DATE)
       AS
            CURSOR ORG_CUR_LIST IS
                 SELECT ORGCODE, ORGNAME, PARENT_CODE, LEVE
                 FROM T_COMMON_ORGANIZATION_SJJS
                 WHERE LEVE=5;
            
           CURSOR PUP_ORG_LIST IS
                 SELECT ORGCODE, ORGNAME, PARENT_CODE, LEVE
                 FROM T_COMMON_ORGANIZATION_SJJS
                 WHERE LEVE<5 ORDER BY ORGCODE;
            
            TYPE TYPE_ORG_CUR_LIST IS TABLE OF ORG_CUR_LIST%ROWTYPE;
            LIST   TYPE_ORG_CUR_LIST;
            
            TYPE TYPE_PUP_ORG_LIST IS TABLE OF PUP_ORG_LIST%ROWTYPE;
            PUPORGLIST TYPE_PUP_ORG_LIST;
            
            V_COUNT    NUMBER;
            V_TJSJ     DATE;
            V_TJRQ     VARCHAR2(8);
            V_LDRKZS   NUMBER;  
            V_LDRKNANS NUMBER;
            V_LDRKNVS  NUMBER;
            V_YBJZZS   NUMBER;
            V_YLFNS    NUMBER;
       BEGIN
            V_TJSJ:=SYSDATE;
            V_TJRQ:=TO_CHAR(V_TJQSSJ,'YYYYMMDD');
            OPEN ORG_CUR_LIST;
            LOOP
                 FETCH ORG_CUR_LIST BULK COLLECT INTO LIST LIMIT 1000;
                 EXIT WHEN LIST.COUNT=0;
                 FOR I IN LIST.FIRST .. LIST.LAST LOOP
                     --流动人口总数
                     SELECT COUNT(1) INTO V_LDRKZS
                     FROM T_LSGL_RK_LDRKZZXX
                     WHERE DJSJ>=V_TJQSSJ 
                           AND DJSJ<=V_TJJZSJ 
                           AND (ZXBS='0' OR ZXBS IS NULL)
                           AND DJDWDM=LIST(I).ORGCODE;
                     
                     --流动人口男人数
                    SELECT COUNT(1) INTO V_LDRKNANS
                    FROM T_LSGL_RK_LDRKZZXX LK
                    WHERE LK.DJSJ>=V_TJQSSJ 
                         AND LK.DJSJ<=V_TJJZSJ 
                         AND (LK.ZXBS='0' OR LK.ZXBS IS NULL)
                         AND DECODE(SUBSTR(LK.SFZH,17,1),'1','1','3','1','5','1','7','1','9','1','2')='1'
                         AND LK.DJDWDM=LIST(I).ORGCODE;
                     
                     --流动人口女人数
                     SELECT COUNT(1) INTO V_LDRKNVS
                     FROM T_LSGL_RK_LDRKZZXX LK INNER JOIN T_LSGL_RK_JBXX JB ON LK.RYBH=JB.RYBH
                     WHERE LK.DJSJ>=V_TJQSSJ 
                           AND LK.DJSJ<=V_TJJZSJ 
                            AND DECODE(SUBSTR(LK.SFZH,17,1),'1','1','3','1','5','1','7','1','9','1','2')='2'
                           AND (LK.ZXBS='0' OR LK.ZXBS IS NULL)
                           AND LK.DJDWDM=LIST(I).ORGCODE;
                     
                     --已办居住证数
                     SELECT COUNT(1) INTO V_YBJZZS
                     FROM T_LSGL_LDRK_JZZXX
                     WHERE JZZDYZT='20' 
                           AND ZZSJ>=V_TJQSSJ 
                           AND ZZSJ<V_TJJZSJ
                           AND ZZDWDM=LIST(I).ORGCODE;
                     
                     --育龄妇女数
                     SELECT COUNT(1) INTO V_YLFNS
                     FROM T_LSGL_RK_LDRKZZXX LK INNER JOIN T_LSGL_RK_JBXX JB ON LK.RYBH=JB.RYBH
                     WHERE LK.DJSJ>=V_TJQSSJ 
                           AND LK.DJSJ<=V_TJJZSJ 
                           AND (LK.ZXBS='0' OR LK.ZXBS IS NULL)
                           AND DECODE(SUBSTR(LK.SFZH,17,1),'1','1','3','1','5','1','7','1','9','1','2')='2'
                           AND LK.DJDWDM =LIST(I).ORGCODE
                           AND CSRQ <= SYSDATE - 16*365 AND CSRQ>=SYSDATE - 49*365;
                               
                     
                     --SELECT NVL((COUNT((SELECT 1 FROM T_TJFX_LRDKTJBB WHERE ORGCODE=LIST(I).ORGCODE AND TJRQ=V_TJRQ))),0) INTO V_COUNT FROM DUAL;
                     SELECT COUNT(1) INTO V_COUNT FROM T_TJFX_LRDKTJBB WHERE ORGCODE=LIST(I).ORGCODE AND TJRQ=V_TJRQ;
                     
                     IF V_COUNT = 0 THEN
                        INSERT INTO T_TJFX_LRDKTJBB
                          (ORGCODE, ORGNAME, PARENT_CODE, LEVE, TJRQ, TJSJ, TJQSSJ, TJJZSJ, 
                           LDRKZS, LDRKNANS, LDRKNVS, YBJZZS, YLFNS)
                        VALUES
                          (LIST(I).ORGCODE, LIST(I).ORGNAME, LIST(I).PARENT_CODE, 
                           LIST(I).LEVE, V_TJRQ, V_TJSJ, V_TJQSSJ, V_TJJZSJ, 
                           V_LDRKZS, V_LDRKNANS, V_LDRKNVS, V_YBJZZS, V_YLFNS);
                        
                     ELSE
                          UPDATE T_TJFX_LRDKTJBB
                             SET  
                                 ORGNAME = LIST(I).ORGNAME,
                                 PARENT_CODE = LIST(I).PARENT_CODE,
                                 LEVE = LIST(I).LEVE,
                                 TJRQ = V_TJRQ,
                                 TJSJ = V_TJSJ,
                                 TJQSSJ = V_TJQSSJ,
                                 TJJZSJ = V_TJJZSJ,
                                 LDRKZS = V_LDRKZS,
                                 LDRKNANS = V_LDRKNANS,
                                 LDRKNVS = V_LDRKNVS,
                                 YBJZZS = V_YBJZZS,
                                 YLFNS = V_YLFNS
                           WHERE ORGCODE=LIST(I).ORGCODE AND TJRQ=V_TJRQ;
                          
                     END IF;
                 END LOOP;
                COMMIT;
            END LOOP;
            
            --汇总上级单位
            OPEN PUP_ORG_LIST;
            LOOP
                 FETCH PUP_ORG_LIST BULK COLLECT INTO PUPORGLIST LIMIT 500;
                 EXIT WHEN PUPORGLIST.COUNT=0;
                 FOR I IN PUPORGLIST.FIRST .. PUPORGLIST.LAST LOOP
                     
                    SELECT NVL(SUM(LDRKZS),0),NVL(SUM(LDRKNANS),0),
                           NVL(SUM(LDRKNVS),0),NVL(SUM(YLFNS),0)
                           INTO V_LDRKZS,V_LDRKNANS,V_LDRKNVS,V_YLFNS
                    FROM T_TJFX_LRDKTJBB
                    WHERE TJRQ=V_TJRQ 
                          AND LEVE=5 
                          AND ORGCODE LIKE SUBSTR(PUPORGLIST(I).ORGCODE,1,2*PUPORGLIST(I).LEVE)||'%'; 
                    
                    --重算已办居住证数
                    SELECT COUNT(1) INTO V_YBJZZS
                    FROM T_LSGL_LDRK_JZZXX
                    WHERE JZZDYZT='20' 
                           AND ZZSJ>=V_TJQSSJ 
                           AND ZZSJ<V_TJJZSJ
                           AND ZZDWDM LIKE SUBSTR(PUPORGLIST(I).ORGCODE,1,2*PUPORGLIST(I).LEVE)||'%';
                    
                    SELECT COUNT(1) INTO V_COUNT FROM T_TJFX_LRDKTJBB WHERE ORGCODE=PUPORGLIST(I).ORGCODE AND TJRQ=V_TJRQ;
                     
                    IF V_COUNT = 0 THEN
                        INSERT INTO T_TJFX_LRDKTJBB
                          (ORGCODE, ORGNAME, PARENT_CODE, LEVE, TJRQ, TJSJ, TJQSSJ, TJJZSJ, 
                           LDRKZS, LDRKNANS, LDRKNVS, YBJZZS, YLFNS)
                        VALUES
                          (PUPORGLIST(I).ORGCODE, PUPORGLIST(I).ORGNAME, PUPORGLIST(I).PARENT_CODE, 
                           PUPORGLIST(I).LEVE, V_TJRQ, V_TJSJ, V_TJQSSJ, V_TJJZSJ, 
                           V_LDRKZS, V_LDRKNANS, V_LDRKNVS, V_YBJZZS, V_YLFNS);
                        
                    ELSE
                          UPDATE T_TJFX_LRDKTJBB
                             SET  
                                 ORGNAME = PUPORGLIST(I).ORGNAME,
                                 PARENT_CODE = PUPORGLIST(I).PARENT_CODE,
                                 LEVE = PUPORGLIST(I).LEVE,
                                 TJRQ = V_TJRQ,
                                 TJSJ = V_TJSJ,
                                 TJQSSJ = V_TJQSSJ,
                                 TJJZSJ = V_TJJZSJ,
                                 LDRKZS = V_LDRKZS,
                                 LDRKNANS = V_LDRKNANS,
                                 LDRKNVS = V_LDRKNVS,
                                 YBJZZS = V_YBJZZS,
                                 YLFNS = V_YLFNS
                           WHERE ORGCODE=PUPORGLIST(I).ORGCODE AND TJRQ=V_TJRQ;
                          
                    END IF;
                 END LOOP;
                 COMMIT;
            END LOOP;
       END P_TJBB_LDRKTJBB;
       
END SQJW_TJBB_RK;
/