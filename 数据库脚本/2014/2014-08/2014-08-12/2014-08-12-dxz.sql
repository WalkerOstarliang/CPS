insert into t_common_zdrylb values('32','取保候审','','','dl','GA_ZDRYLBDM','重点人员类别代码','','','','','','','1','取保候审','1');
insert into t_common_zdrylb values('320000000000','取保候审','','','32','GA_ZDRYXLDM','重点人员细类代码','','','','','','','1','取保候审','1');
insert into t_common_zdrylb values('31','监视居住','','','dl','GA_ZDRYLBDM','重点人员类别代码','','','','','','','1','监视居住','1');
insert into t_common_zdrylb values('310000000000','监视居住','','','31','GA_ZDRYXLDM','重点人员细类代码','','','','','','','1','监视居住','1');
insert into t_common_zdrylb values('30','社区戒毒','','','dl','GA_ZDRYLBDM','重点人员类别代码','','','','','','','1','社区戒毒','1');
insert into t_common_zdrylb values('300000000000','社区戒毒','','','30','GA_ZDRYXLDM','重点人员细类代码','','','','','','','1','社区戒毒','1');
insert into t_common_zdrylb values('29','社区康复','','','dl','GA_ZDRYLBDM','重点人员类别代码','','','','','','','1','社区康复','1');
insert into t_common_zdrylb values('290000000000','社区康复','','','29','GA_ZDRYXLDM','重点人员细类代码','','','','','','','1','社区康复','1');
commit;


CREATE OR REPLACE FUNCTION F_GET_ZDRYLBBJMC(V_ZDRYLBBJ VARCHAR2)
    RETURN VARCHAR2 AS
    V_ZDRYLBBJMC    VARCHAR2(300);
    V_ZDRYLBBJMCVAL VARCHAR2(300);
BEGIN
    V_ZDRYLBBJMCVAL := '';
    IF SUBSTR(V_ZDRYLBBJ, 1, 1) = '1' THEN
        SELECT MC
          INTO V_ZDRYLBBJMCVAL
          FROM T_COMMON_ZDRYLB
         WHERE DM = '01';
    
        IF V_ZDRYLBBJMC IS NOT NULL THEN
            V_ZDRYLBBJMC := V_ZDRYLBBJMC || ',' || V_ZDRYLBBJMCVAL;
        ELSE
            V_ZDRYLBBJMC := V_ZDRYLBBJMC || V_ZDRYLBBJMCVAL;
        END IF;
    END IF;
    IF SUBSTR(V_ZDRYLBBJ, 2, 1) = '1' THEN
        SELECT MC
          INTO V_ZDRYLBBJMCVAL
          FROM T_COMMON_ZDRYLB
         WHERE DM = '02';
    
        IF V_ZDRYLBBJMC IS NOT NULL THEN
            V_ZDRYLBBJMC := V_ZDRYLBBJMC || ',' || V_ZDRYLBBJMCVAL;
        ELSE
            V_ZDRYLBBJMC := V_ZDRYLBBJMC || V_ZDRYLBBJMCVAL;
        END IF;
    
    END IF;
    IF SUBSTR(V_ZDRYLBBJ, 3, 1) = '1' THEN
        SELECT MC
          INTO V_ZDRYLBBJMCVAL
          FROM T_COMMON_ZDRYLB
         WHERE DM = '03';
    
        IF V_ZDRYLBBJMC IS NOT NULL THEN
            V_ZDRYLBBJMC := V_ZDRYLBBJMC || ',' || V_ZDRYLBBJMCVAL;
        ELSE
            V_ZDRYLBBJMC := V_ZDRYLBBJMC || V_ZDRYLBBJMCVAL;
        END IF;
    END IF;
    IF SUBSTR(V_ZDRYLBBJ, 4, 1) = '1' THEN
        SELECT MC
          INTO V_ZDRYLBBJMCVAL
          FROM T_COMMON_ZDRYLB
         WHERE DM = '04';
    
        IF V_ZDRYLBBJMC IS NOT NULL THEN
            V_ZDRYLBBJMC := V_ZDRYLBBJMC || ',' || V_ZDRYLBBJMCVAL;
        ELSE
            V_ZDRYLBBJMC := V_ZDRYLBBJMC || V_ZDRYLBBJMCVAL;
        END IF;
    END IF;
    IF SUBSTR(V_ZDRYLBBJ, 5, 1) = '1' THEN
        SELECT MC
          INTO V_ZDRYLBBJMCVAL
          FROM T_COMMON_ZDRYLB
         WHERE DM = '05';
    
        IF V_ZDRYLBBJMC IS NOT NULL THEN
            V_ZDRYLBBJMC := V_ZDRYLBBJMC || ',' || V_ZDRYLBBJMCVAL;
        ELSE
            V_ZDRYLBBJMC := V_ZDRYLBBJMC || V_ZDRYLBBJMCVAL;
        END IF;
    END IF;
    IF SUBSTR(V_ZDRYLBBJ, 6, 1) = '1' THEN
        SELECT MC
          INTO V_ZDRYLBBJMCVAL
          FROM T_COMMON_ZDRYLB
         WHERE DM = '06';
    
        IF V_ZDRYLBBJMC IS NOT NULL THEN
            V_ZDRYLBBJMC := V_ZDRYLBBJMC || ',' || V_ZDRYLBBJMCVAL;
        ELSE
            V_ZDRYLBBJMC := V_ZDRYLBBJMC || V_ZDRYLBBJMCVAL;
        END IF;
    END IF;
    IF SUBSTR(V_ZDRYLBBJ, 7, 1) = '1' THEN
        SELECT MC
          INTO V_ZDRYLBBJMCVAL
          FROM T_COMMON_ZDRYLB
         WHERE DM = '07';
    
        IF V_ZDRYLBBJMC IS NOT NULL THEN
            V_ZDRYLBBJMC := V_ZDRYLBBJMC || ',' || V_ZDRYLBBJMCVAL;
        ELSE
            V_ZDRYLBBJMC := V_ZDRYLBBJMC || V_ZDRYLBBJMCVAL;
        END IF;
    END IF;
    IF SUBSTR(V_ZDRYLBBJ, 29, 1) = '1' THEN
        SELECT MC
          INTO V_ZDRYLBBJMCVAL
          FROM T_COMMON_ZDRYLB
         WHERE DM = '29';
    
        IF V_ZDRYLBBJMC IS NOT NULL THEN
            V_ZDRYLBBJMC := V_ZDRYLBBJMC || ',' || V_ZDRYLBBJMCVAL;
        ELSE
            V_ZDRYLBBJMC := V_ZDRYLBBJMC || V_ZDRYLBBJMCVAL;
        END IF;
    END IF;
    IF SUBSTR(V_ZDRYLBBJ, 30, 1) = '1' THEN
        SELECT MC
          INTO V_ZDRYLBBJMCVAL
          FROM T_COMMON_ZDRYLB
         WHERE DM = '30';
    
        IF V_ZDRYLBBJMC IS NOT NULL THEN
            V_ZDRYLBBJMC := V_ZDRYLBBJMC || ',' || V_ZDRYLBBJMCVAL;
        ELSE
            V_ZDRYLBBJMC := V_ZDRYLBBJMC || V_ZDRYLBBJMCVAL;
        END IF;
    END IF;
    IF SUBSTR(V_ZDRYLBBJ, 31, 1) = '1' THEN
        SELECT MC
          INTO V_ZDRYLBBJMCVAL
          FROM T_COMMON_ZDRYLB
         WHERE DM = '31';
    
        IF V_ZDRYLBBJMC IS NOT NULL THEN
            V_ZDRYLBBJMC := V_ZDRYLBBJMC || ',' || V_ZDRYLBBJMCVAL;
        ELSE
            V_ZDRYLBBJMC := V_ZDRYLBBJMC || V_ZDRYLBBJMCVAL;
        END IF;
    END IF;
    IF SUBSTR(V_ZDRYLBBJ, 32, 1) = '1' THEN
        SELECT MC
          INTO V_ZDRYLBBJMCVAL
          FROM T_COMMON_ZDRYLB
         WHERE DM = '32';
    
        IF V_ZDRYLBBJMC IS NOT NULL THEN
            V_ZDRYLBBJMC := V_ZDRYLBBJMC || ',' || V_ZDRYLBBJMCVAL;
        ELSE
            V_ZDRYLBBJMC := V_ZDRYLBBJMC || V_ZDRYLBBJMCVAL;
        END IF;
    END IF;
    RETURN V_ZDRYLBBJMC;
END;
/


-- Create table
create table T_FJY_QBRY
(
  id              CHAR(32) default sys_guid(),
  acttime         CHAR(17) default to_char(systimestamp,'YYYYMMDDHH24MISSFF3'),
  actflag         CHAR(1) default '1',
  actuser         VARCHAR2(32),
  anjianbianhao   VARCHAR2(23),
  gonganbianhao   CHAR(6),
  bananren1id     CHAR(12),
  bananren2id     CHAR(12),
  banandanweiid   CHAR(12),
  renyuanbianhao  VARCHAR2(23),
  jiyadw          CHAR(12),
  jiyagabh        CHAR(6),
  anjianmingcheng VARCHAR2(512),
  jieshoushijian  VARCHAR2(17),
  qubaofangshi    CHAR(1),
  qubaoqixian     VARCHAR2(16),
  xingming        VARCHAR2(64),
  lianxidianhua   VARCHAR2(64),
  jyflag          CHAR(1) default '0',
  jiyashijian     VARCHAR2(17),
  jiyabianhao     VARCHAR2(23),
  shifouweituo    CHAR(1) default '0',
  rylxflag        CHAR(1),
  jieshouren      VARCHAR2(64),
  jieshourenid    CHAR(12)
);
-- Add comments to the table 
comment on table T_FJY_QBRY
  is '重点人员（执法办案）';
-- Add comments to the columns 
comment on column T_FJY_QBRY.acttime
  is '操作时间';
comment on column T_FJY_QBRY.actflag
  is '操作标识';
comment on column T_FJY_QBRY.actuser
  is '操作人';
comment on column T_FJY_QBRY.anjianbianhao
  is '案件编号';
comment on column T_FJY_QBRY.gonganbianhao
  is '公安编号';
comment on column T_FJY_QBRY.bananren1id
  is '办案人1';
comment on column T_FJY_QBRY.bananren2id
  is '办案人2';
comment on column T_FJY_QBRY.banandanweiid
  is '办案单位';
comment on column T_FJY_QBRY.renyuanbianhao
  is '人员编号';
comment on column T_FJY_QBRY.jiyadw
  is '羁押单位（接收单位）';
comment on column T_FJY_QBRY.jiyagabh
  is '羁押公安编号';
comment on column T_FJY_QBRY.anjianmingcheng
  is '案件名称';
comment on column T_FJY_QBRY.jieshoushijian
  is '接收时间';
comment on column T_FJY_QBRY.qubaofangshi
  is '取保方式';
comment on column T_FJY_QBRY.qubaoqixian
  is '取保期限';
comment on column T_FJY_QBRY.xingming
  is '姓名';
comment on column T_FJY_QBRY.lianxidianhua
  is '联系电话';
comment on column T_FJY_QBRY.jyflag
  is '羁押标识（0-未指定；1-未接收；2-已接收；3-退回；4-申请离开；5-已解除）';
comment on column T_FJY_QBRY.jiyashijian
  is '羁押时间';
comment on column T_FJY_QBRY.jiyabianhao
  is '羁押编号';
comment on column T_FJY_QBRY.shifouweituo
  is '是否委托';
comment on column T_FJY_QBRY.rylxflag
  is '人员类型标识（1-取保候审；2-监视居住；3-社区戒毒；4-社区康复）';
comment on column T_FJY_QBRY.jieshouren
  is '接收人';
comment on column T_FJY_QBRY.jieshourenid
  is '接收人id';
-- Create/Recreate indexes 
create index I_FJY_QBRY_01 on T_FJY_QBRY (ID);
create index I_FJY_QBRY_02 on T_FJY_QBRY (ANJIANBIANHAO);
create index I_FJY_QBRY_03 on T_FJY_QBRY (GONGANBIANHAO);
create index I_FJY_QBRY_04 on T_FJY_QBRY (BANANDANWEIID);
create index I_FJY_QBRY_05 on T_FJY_QBRY (JIYADW);
create index I_FJY_QBRY_06 on T_FJY_QBRY (JIYAGABH);
create index I_FJY_QBRY_07 on T_FJY_QBRY (RYLXFLAG);
create index I_FJY_QBRY_08 on T_FJY_QBRY (JYFLAG);



-- Create table
create table T_XSQBHSJDS
(
  id              CHAR(32) default sys_guid(),
  acttime         CHAR(17) default to_char(systimestamp,'YYYYMMDDHH24MISSFF3'),
  actflag         CHAR(1) default '1',
  actuser         VARCHAR2(32),
  gonganbianhao   CHAR(6),
  banandanweiid   CHAR(12),
  bananren1id     CHAR(12),
  bananren2id     CHAR(12),
  anjianbianhao   VARCHAR2(23),
  renyuanbianhao  VARCHAR2(23),
  chengqingid     CHAR(32),
  wenshunianfen   NUMBER,
  wenshubianhao   NUMBER,
  wenshuwenhao    VARCHAR2(64),
  gonganmingcheng VARCHAR2(64),
  xingming        VARCHAR2(64),
  quanpin         VARCHAR2(128),
  xingbie         CHAR(1),
  nianling        NUMBER,
  chushengriqi    VARCHAR2(8),
  shenfenzhenghao VARCHAR2(32),
  zhuzhidizhi     VARCHAR2(128),
  gongzuodanwei   VARCHAR2(64),
  zhiye           CHAR(2),
  anjianmingcheng VARCHAR2(256),
  shexianzuiming  VARCHAR2(512),
  falvyiju        VARCHAR2(128),
  pizhunrenxm     VARCHAR2(32),
  banandanweimc   VARCHAR2(64),
  bananren1xm     VARCHAR2(32),
  bananren2xm     VARCHAR2(32),
  pizhunriqi      VARCHAR2(14),
  tianfariqi      VARCHAR2(14),
  qubaoyuanyin    VARCHAR2(128),
  zhixingriqi     VARCHAR2(14),
  zhixingjiguan   VARCHAR2(64),
  zhuahuofangshi  CHAR(2),
  qubaofangshi    CHAR(1),
  bzjshuee        NUMBER,
  bzjqixian       VARCHAR2(14),
  bzjyinhang      VARCHAR2(64),
  bzrxingming     VARCHAR2(64),
  bzrxingbie      CHAR(1),
  bzrnianling     NUMBER,
  bzrhaoma        VARCHAR2(32),
  bzrdanwei       VARCHAR2(64),
  bzrzhuzhi       VARCHAR2(128),
  bzrguanxi       VARCHAR2(32),
  bzrzhiye        CHAR(2),
  bzrphone        VARCHAR2(64),
  bzrzjmc         VARCHAR2(32),
  shifouweituo    CHAR(1) default '0',
  signseal        VARCHAR2(64),
  zhishu          CHAR(1) default '0',
  baozhengrencsrq VARCHAR2(14),
  lianxifangshi   VARCHAR2(32),
  zhixingdanweiid VARCHAR2(12),
  jieshoushijian  VARCHAR2(14)
);
-- Add comments to the table 
comment on table T_XSQBHSJDS
  is '（执法办案）取保候审决定书';
-- Add comments to the columns 
comment on column T_XSQBHSJDS.acttime
  is '操作时间';
comment on column T_XSQBHSJDS.actflag
  is '操作标识';
comment on column T_XSQBHSJDS.actuser
  is '操作人';
comment on column T_XSQBHSJDS.gonganbianhao
  is '公安编号';
comment on column T_XSQBHSJDS.banandanweiid
  is '办案单位';
comment on column T_XSQBHSJDS.bananren1id
  is '办案人1';
comment on column T_XSQBHSJDS.bananren2id
  is '办案人2';
comment on column T_XSQBHSJDS.anjianbianhao
  is '案件编号';
comment on column T_XSQBHSJDS.renyuanbianhao
  is '人员编号';
comment on column T_XSQBHSJDS.chengqingid
  is '呈请ID';
comment on column T_XSQBHSJDS.wenshunianfen
  is '文书年份';
comment on column T_XSQBHSJDS.wenshubianhao
  is '文书编号';
comment on column T_XSQBHSJDS.wenshuwenhao
  is '文书文号';
comment on column T_XSQBHSJDS.gonganmingcheng
  is '公安名称';
comment on column T_XSQBHSJDS.xingming
  is '姓名';
comment on column T_XSQBHSJDS.quanpin
  is '全拼';
comment on column T_XSQBHSJDS.xingbie
  is '性别';
comment on column T_XSQBHSJDS.nianling
  is '年龄';
comment on column T_XSQBHSJDS.chushengriqi
  is '出生日期';
comment on column T_XSQBHSJDS.shenfenzhenghao
  is '生份证号';
comment on column T_XSQBHSJDS.zhuzhidizhi
  is '住址地址';
comment on column T_XSQBHSJDS.gongzuodanwei
  is '工作单位';
comment on column T_XSQBHSJDS.zhiye
  is '职业';
comment on column T_XSQBHSJDS.anjianmingcheng
  is '案件名称';
comment on column T_XSQBHSJDS.shexianzuiming
  is '涉嫌罪名';
comment on column T_XSQBHSJDS.falvyiju
  is '法律依据';
comment on column T_XSQBHSJDS.pizhunrenxm
  is '批准人姓名';
comment on column T_XSQBHSJDS.banandanweimc
  is '办案单位名称';
comment on column T_XSQBHSJDS.bananren1xm
  is '办案人1';
comment on column T_XSQBHSJDS.bananren2xm
  is '办案人2';
comment on column T_XSQBHSJDS.pizhunriqi
  is '批准日期';
comment on column T_XSQBHSJDS.tianfariqi
  is '填发日期';
comment on column T_XSQBHSJDS.qubaoyuanyin
  is '取保原因';
comment on column T_XSQBHSJDS.zhixingriqi
  is '执行日期';
comment on column T_XSQBHSJDS.zhixingjiguan
  is '执行机关';
comment on column T_XSQBHSJDS.zhuahuofangshi
  is '抓获方式';
comment on column T_XSQBHSJDS.qubaofangshi
  is '取保方式';
comment on column T_XSQBHSJDS.baozhengrencsrq
  is '保证人出生日期';
comment on column T_XSQBHSJDS.lianxifangshi
  is '联系电话';
-- Create/Recreate indexes 
create unique index I_XSQBHSJDS_00 on T_XSQBHSJDS (ID);
create index I_XSQBHSJDS_01 on T_XSQBHSJDS (ACTFLAG);
create index I_XSQBHSJDS_02 on T_XSQBHSJDS (GONGANBIANHAO);
create index I_XSQBHSJDS_03 on T_XSQBHSJDS (BANANDANWEIID);
create index I_XSQBHSJDS_04 on T_XSQBHSJDS (BANANREN1ID);
create index I_XSQBHSJDS_05 on T_XSQBHSJDS (BANANREN2ID);
create index I_XSQBHSJDS_06 on T_XSQBHSJDS (ANJIANBIANHAO);
create index I_XSQBHSJDS_07 on T_XSQBHSJDS (RENYUANBIANHAO);
create index I_XSQBHSJDS_08 on T_XSQBHSJDS (CHENGQINGID);
create index I_XSQBHSJDS_09 on T_XSQBHSJDS (WENSHUNIANFEN);
create index I_XSQBHSJDS_10 on T_XSQBHSJDS (WENSHUBIANHAO);
create index I_XSQBHSJDS_TM on T_XSQBHSJDS (ACTTIME);

-- Create table
create table T_XSJSJZJDS
(
  id              CHAR(32) default sys_guid(),
  acttime         CHAR(17) default to_char(systimestamp,'YYYYMMDDHH24MISSFF3'),
  actflag         CHAR(1) default '1',
  actuser         VARCHAR2(32),
  gonganbianhao   CHAR(6),
  banandanweiid   CHAR(12),
  bananren1id     CHAR(12),
  bananren2id     CHAR(12),
  anjianbianhao   VARCHAR2(23),
  renyuanbianhao  VARCHAR2(23),
  chengqingid     CHAR(32),
  wenshunianfen   NUMBER,
  wenshubianhao   NUMBER,
  wenshuwenhao    VARCHAR2(48),
  gonganmingcheng VARCHAR2(64),
  xingming        VARCHAR2(64),
  quanpin         VARCHAR2(128),
  xingbie         CHAR(1),
  nianling        NUMBER,
  chushengriqi    VARCHAR2(8),
  shenfenzhenghao VARCHAR2(32),
  zhuzhidizhi     VARCHAR2(128),
  gongzuodanwei   VARCHAR2(64),
  zhiye           CHAR(2),
  anjianmingcheng VARCHAR2(256),
  shexianzuiming  VARCHAR2(512),
  falvyiju        VARCHAR2(128),
  pizhunrenxm     VARCHAR2(32),
  banandanweimc   VARCHAR2(64),
  bananren1xm     VARCHAR2(32),
  bananren2xm     VARCHAR2(32),
  pizhunriqi      VARCHAR2(14),
  tianfariqi      VARCHAR2(14),
  jianshidizhi    VARCHAR2(128),
  jianshiyuanyin  VARCHAR2(128),
  kaishiriqi      CHAR(17),
  zhixingjiguan   VARCHAR2(64),
  minzu           CHAR(2),
  shifouweituo    CHAR(1) default '0',
  signseal        VARCHAR2(64),
  zhishu          CHAR(1) default '0',
  jiashuxingming  VARCHAR2(128),
  jiashuzhuzhi    VARCHAR2(128),
  pizhunjiguan    VARCHAR2(64),
  zhidingflag     CHAR(1) default '0',
  lshjflag        CHAR(1) default '1',
  zhixingdanweiid CHAR(12),
  jieshoushijian  CHAR(14)
);
-- Add comments to the table 
comment on table T_XSJSJZJDS
  is '（执法办案）监视居住决定书';
-- Add comments to the columns 
comment on column T_XSJSJZJDS.acttime
  is '操作时间';
comment on column T_XSJSJZJDS.actflag
  is '操作标识';
comment on column T_XSJSJZJDS.actuser
  is '操作人';
comment on column T_XSJSJZJDS.gonganbianhao
  is '公安编号';
comment on column T_XSJSJZJDS.banandanweiid
  is '办案单位';
comment on column T_XSJSJZJDS.bananren1id
  is '办案人1';
comment on column T_XSJSJZJDS.bananren2id
  is '办案人2';
comment on column T_XSJSJZJDS.anjianbianhao
  is '案件编号';
comment on column T_XSJSJZJDS.renyuanbianhao
  is '人员编号';
comment on column T_XSJSJZJDS.chengqingid
  is '呈请ID';
comment on column T_XSJSJZJDS.wenshunianfen
  is '文书年份';
comment on column T_XSJSJZJDS.wenshubianhao
  is '文书文号';
comment on column T_XSJSJZJDS.wenshuwenhao
  is '文书文号';
comment on column T_XSJSJZJDS.gonganmingcheng
  is '公安名称';
comment on column T_XSJSJZJDS.xingming
  is '姓名';
comment on column T_XSJSJZJDS.quanpin
  is '全拼';
comment on column T_XSJSJZJDS.xingbie
  is '性别';
comment on column T_XSJSJZJDS.nianling
  is '年龄';
comment on column T_XSJSJZJDS.chushengriqi
  is '出身日期';
comment on column T_XSJSJZJDS.shenfenzhenghao
  is '身份证号';
comment on column T_XSJSJZJDS.zhuzhidizhi
  is '住址地址';
comment on column T_XSJSJZJDS.gongzuodanwei
  is '工作单位';
comment on column T_XSJSJZJDS.zhiye
  is '职业';
comment on column T_XSJSJZJDS.anjianmingcheng
  is '案件名称';
comment on column T_XSJSJZJDS.shexianzuiming
  is '涉嫌罪名';
comment on column T_XSJSJZJDS.falvyiju
  is '法律依据';
comment on column T_XSJSJZJDS.pizhunrenxm
  is '批准人姓名';
comment on column T_XSJSJZJDS.banandanweimc
  is '办案单位名称';
comment on column T_XSJSJZJDS.bananren1xm
  is '办案人姓名1';
comment on column T_XSJSJZJDS.bananren2xm
  is '办案人姓名2';
comment on column T_XSJSJZJDS.pizhunriqi
  is '批准日期';
comment on column T_XSJSJZJDS.tianfariqi
  is '填发日期';
comment on column T_XSJSJZJDS.jianshidizhi
  is '监视地址';
comment on column T_XSJSJZJDS.jianshiyuanyin
  is '监视原因';
comment on column T_XSJSJZJDS.kaishiriqi
  is '开始时间';
comment on column T_XSJSJZJDS.zhixingjiguan
  is '执行机关';
comment on column T_XSJSJZJDS.minzu
  is '民族';
comment on column T_XSJSJZJDS.shifouweituo
  is '是否委托';
comment on column T_XSJSJZJDS.jiashuxingming
  is '家属姓名';
comment on column T_XSJSJZJDS.jiashuzhuzhi
  is '家属住址';
comment on column T_XSJSJZJDS.pizhunjiguan
  is '批准机关';
comment on column T_XSJSJZJDS.zhidingflag
  is '指定监视居住标志：0=不指定，1指定';
comment on column T_XSJSJZJDS.lshjflag
  is '律师会见许可的标志：0=否，1=是';
comment on column T_XSJSJZJDS.zhixingdanweiid
  is '执行单位';
comment on column T_XSJSJZJDS.jieshoushijian
  is '接收时间';
-- Create/Recreate indexes 
create unique index I_XSJSJZJDS_00 on T_XSJSJZJDS (ID);
create index I_XSJSJZJDS_01 on T_XSJSJZJDS (ACTFLAG);
create index I_XSJSJZJDS_02 on T_XSJSJZJDS (GONGANBIANHAO);
create index I_XSJSJZJDS_03 on T_XSJSJZJDS (BANANDANWEIID);
create index I_XSJSJZJDS_04 on T_XSJSJZJDS (BANANREN1ID);
create index I_XSJSJZJDS_05 on T_XSJSJZJDS (BANANREN2ID);
create index I_XSJSJZJDS_06 on T_XSJSJZJDS (ANJIANBIANHAO);
create index I_XSJSJZJDS_07 on T_XSJSJZJDS (RENYUANBIANHAO);
create index I_XSJSJZJDS_08 on T_XSJSJZJDS (CHENGQINGID);
create index I_XSJSJZJDS_09 on T_XSJSJZJDS (WENSHUNIANFEN);
create index I_XSJSJZJDS_10 on T_XSJSJZJDS (WENSHUBIANHAO);
create index I_XSJSJZJDS_TM on T_XSJSJZJDS (ACTTIME);

-- Create table
create table T_XZZLSQJDJDS
(
  id               CHAR(32),
  acttime          VARCHAR2(17) default to_char(systimestamp,'yyyymmddHH24MISSFF3'),
  actflag          VARCHAR2(1) default '1',
  actuser          VARCHAR2(20),
  actip            VARCHAR2(24),
  anjianbianhao    VARCHAR2(23),
  anjianwenhao     VARCHAR2(100),
  anyou            VARCHAR2(128),
  anjianmingcheng  VARCHAR2(256),
  bananren1id      VARCHAR2(32),
  bananren2id      VARCHAR2(32),
  banandanweiid    VARCHAR2(32),
  gonganbianhao    VARCHAR2(6),
  wenshunianfen    NUMBER,
  wenshubianhao    NUMBER,
  wenshuwenhao     VARCHAR2(100),
  shenpibiaoid     VARCHAR2(32),
  pizhunrenid      VARCHAR2(32),
  pizhunshijian    VARCHAR2(14),
  tianfarenid      VARCHAR2(32),
  tianfashijian    VARCHAR2(14),
  renyuanbianhao   VARCHAR2(23),
  xingming         VARCHAR2(100),
  xingbie          CHAR(1),
  chushengriqi     VARCHAR2(8),
  shenfenzhengjian VARCHAR2(10),
  zhengjianhaoma   VARCHAR2(32),
  hujisuozaidi     VARCHAR2(100),
  xianzhuzhi       VARCHAR2(200),
  gongzuodanwei    VARCHAR2(200),
  pinyin           VARCHAR2(100),
  weifashishi      CLOB,
  zelingyiju       VARCHAR2(1000),
  jieduqixian      VARCHAR2(10),
  qishishijian     VARCHAR2(14),
  zhongzhishijian  VARCHAR2(14),
  zhixingshequ     VARCHAR2(200),
  shequdizhi       VARCHAR2(200),
  gonganmingcheng  VARCHAR2(64),
  signseal         VARCHAR2(64),
  zhishu           CHAR(1) default 0,
  fuyijiguan       VARCHAR2(64),
  susongjiguan     VARCHAR2(64),
  zhixingdanweiid  CHAR(12),
  jieshoushijian   CHAR(14)
);
-- Add comments to the table 
comment on table T_XZZLSQJDJDS
  is '（执法办案）社区戒毒决定书';
-- Add comments to the columns 
comment on column T_XZZLSQJDJDS.acttime
  is '操作时间';
comment on column T_XZZLSQJDJDS.actflag
  is '操作标识';
comment on column T_XZZLSQJDJDS.actuser
  is '操作人';
comment on column T_XZZLSQJDJDS.anjianbianhao
  is '案件编号';
comment on column T_XZZLSQJDJDS.anjianwenhao
  is '案件文号';
comment on column T_XZZLSQJDJDS.anjianmingcheng
  is '案件名称';
comment on column T_XZZLSQJDJDS.bananren1id
  is '办案人1';
comment on column T_XZZLSQJDJDS.bananren2id
  is '办案人2';
comment on column T_XZZLSQJDJDS.banandanweiid
  is '办案单位';
comment on column T_XZZLSQJDJDS.gonganbianhao
  is '公安编号';
comment on column T_XZZLSQJDJDS.wenshunianfen
  is '文书年份';
comment on column T_XZZLSQJDJDS.wenshubianhao
  is '文书编号';
comment on column T_XZZLSQJDJDS.wenshuwenhao
  is '文书文号';
comment on column T_XZZLSQJDJDS.shenpibiaoid
  is '审批编号';
comment on column T_XZZLSQJDJDS.pizhunrenid
  is '批准人';
comment on column T_XZZLSQJDJDS.pizhunshijian
  is '批准时间';
comment on column T_XZZLSQJDJDS.tianfarenid
  is '填发人';
comment on column T_XZZLSQJDJDS.tianfashijian
  is '填发时间';
comment on column T_XZZLSQJDJDS.renyuanbianhao
  is '人员编号';
comment on column T_XZZLSQJDJDS.xingming
  is '姓名';
comment on column T_XZZLSQJDJDS.xingbie
  is '性别';
comment on column T_XZZLSQJDJDS.chushengriqi
  is '出生日期';
comment on column T_XZZLSQJDJDS.shenfenzhengjian
  is '身份证号码';
comment on column T_XZZLSQJDJDS.zhengjianhaoma
  is '证件号码';
comment on column T_XZZLSQJDJDS.hujisuozaidi
  is '户籍所在地';
comment on column T_XZZLSQJDJDS.xianzhuzhi
  is '现住址';
comment on column T_XZZLSQJDJDS.gongzuodanwei
  is '工作单位';
comment on column T_XZZLSQJDJDS.pinyin
  is '拼音';
comment on column T_XZZLSQJDJDS.weifashishi
  is '违法时间';
comment on column T_XZZLSQJDJDS.zelingyiju
  is '罪名依据';
comment on column T_XZZLSQJDJDS.jieduqixian
  is '戒毒期限';
comment on column T_XZZLSQJDJDS.qishishijian
  is '起始时间';
comment on column T_XZZLSQJDJDS.zhongzhishijian
  is '终止时间';
comment on column T_XZZLSQJDJDS.zhixingshequ
  is '执行社区';
comment on column T_XZZLSQJDJDS.shequdizhi
  is '社区地址';
comment on column T_XZZLSQJDJDS.gonganmingcheng
  is '公安名称';
comment on column T_XZZLSQJDJDS.fuyijiguan
  is '服役机关';
comment on column T_XZZLSQJDJDS.susongjiguan
  is '诉讼机关';
comment on column T_XZZLSQJDJDS.zhixingdanweiid
  is '执行单位';
comment on column T_XZZLSQJDJDS.jieshoushijian
  is '接收时间';
-- Create/Recreate indexes 
create unique index I_XZZLSQJDJDS_00 on T_XZZLSQJDJDS (ID);
create index I_XZZLSQJDJDS_01 on T_XZZLSQJDJDS (ACTFLAG);
create index I_XZZLSQJDJDS_02 on T_XZZLSQJDJDS (ANJIANBIANHAO);
create index I_XZZLSQJDJDS_03 on T_XZZLSQJDJDS (BANANREN1ID);
create index I_XZZLSQJDJDS_04 on T_XZZLSQJDJDS (BANANREN2ID);
create index I_XZZLSQJDJDS_05 on T_XZZLSQJDJDS (BANANDANWEIID);
create index I_XZZLSQJDJDS_06 on T_XZZLSQJDJDS (GONGANBIANHAO);
create index I_XZZLSQJDJDS_07 on T_XZZLSQJDJDS (WENSHUNIANFEN);
create index I_XZZLSQJDJDS_08 on T_XZZLSQJDJDS (WENSHUBIANHAO);
create index I_XZZLSQJDJDS_09 on T_XZZLSQJDJDS (SHENPIBIAOID);
create index I_XZZLSQJDJDS_10 on T_XZZLSQJDJDS (RENYUANBIANHAO);
create index I_XZZLSQJDJDS_TM on T_XZZLSQJDJDS (ACTTIME);

-- Create table
create table T_XZZLSQKFJDS
(
  id               CHAR(32),
  acttime          VARCHAR2(17) default to_char(systimestamp,'yyyymmddHH24MISSFF3'),
  actflag          VARCHAR2(1) default '1',
  actuser          VARCHAR2(20),
  actip            VARCHAR2(24),
  anjianbianhao    VARCHAR2(23),
  anjianwenhao     VARCHAR2(100),
  anyou            VARCHAR2(10),
  anjianmingcheng  VARCHAR2(256),
  bananren1id      VARCHAR2(32),
  bananren2id      VARCHAR2(32),
  banandanweiid    VARCHAR2(32),
  gonganbianhao    VARCHAR2(6),
  wenshunianfen    NUMBER,
  wenshubianhao    NUMBER,
  wenshuwenhao     VARCHAR2(100),
  shenpibiaoid     VARCHAR2(32),
  pizhunrenid      VARCHAR2(32),
  pizhunshijian    VARCHAR2(14),
  tianfarenid      VARCHAR2(32),
  tianfashijian    VARCHAR2(14),
  renyuanbianhao   VARCHAR2(23),
  xingming         VARCHAR2(100),
  xingbie          CHAR(1),
  chushengriqi     VARCHAR2(8),
  shenfenzhengjian VARCHAR2(10),
  zhengjianhaoma   VARCHAR2(32),
  hujisuozaidi     VARCHAR2(100),
  xianzhuzhi       VARCHAR2(200),
  gongzuodanwei    VARCHAR2(200),
  pinyin           VARCHAR2(100),
  weifashishi      CLOB,
  zelingyiju       VARCHAR2(1000),
  kangfuqixian     VARCHAR2(10),
  qishishijian     VARCHAR2(14),
  zhongzhishijian  VARCHAR2(14),
  zhixingshequ     VARCHAR2(200),
  shequdizhi       VARCHAR2(200),
  signseal         VARCHAR2(64),
  gonganmingcheng  VARCHAR2(64),
  zhishu           CHAR(1) default 0,
  fuyijiguan       VARCHAR2(64),
  susongjiguan     VARCHAR2(64)
);
-- Add comments to the table 
comment on table T_XZZLSQKFJDS
  is '（执法办案）社区康复决定书';
-- Add comments to the columns 
comment on column T_XZZLSQKFJDS.acttime
  is '操作时间';
comment on column T_XZZLSQKFJDS.actflag
  is '操作标识';
comment on column T_XZZLSQKFJDS.actuser
  is '操作人';
comment on column T_XZZLSQKFJDS.anjianbianhao
  is '案件编号';
comment on column T_XZZLSQKFJDS.anjianwenhao
  is '案件文号';
comment on column T_XZZLSQKFJDS.anjianmingcheng
  is '案件名称';
comment on column T_XZZLSQKFJDS.bananren1id
  is '办案人1';
comment on column T_XZZLSQKFJDS.bananren2id
  is '办案人2';
comment on column T_XZZLSQKFJDS.banandanweiid
  is '办案单位';
comment on column T_XZZLSQKFJDS.gonganbianhao
  is '公安编号';
comment on column T_XZZLSQKFJDS.wenshunianfen
  is '文书年份';
comment on column T_XZZLSQKFJDS.wenshubianhao
  is '文书编号';
comment on column T_XZZLSQKFJDS.wenshuwenhao
  is '文书文号';
comment on column T_XZZLSQKFJDS.shenpibiaoid
  is '审批表ID';
comment on column T_XZZLSQKFJDS.pizhunrenid
  is '批准人ID';
comment on column T_XZZLSQKFJDS.pizhunshijian
  is '批准时间';
comment on column T_XZZLSQKFJDS.tianfarenid
  is '填发人';
comment on column T_XZZLSQKFJDS.tianfashijian
  is '填发时间';
comment on column T_XZZLSQKFJDS.renyuanbianhao
  is '人员编号';
comment on column T_XZZLSQKFJDS.xingming
  is '姓名';
comment on column T_XZZLSQKFJDS.xingbie
  is '性别';
comment on column T_XZZLSQKFJDS.chushengriqi
  is '出生日期';
comment on column T_XZZLSQKFJDS.shenfenzhengjian
  is '身份证号';
comment on column T_XZZLSQKFJDS.zhengjianhaoma
  is '证件号码';
comment on column T_XZZLSQKFJDS.hujisuozaidi
  is '户籍所在地';
comment on column T_XZZLSQKFJDS.xianzhuzhi
  is '现住地址';
comment on column T_XZZLSQKFJDS.gongzuodanwei
  is '工作单位';
comment on column T_XZZLSQKFJDS.pinyin
  is '职业';
comment on column T_XZZLSQKFJDS.weifashishi
  is '违法时间';
comment on column T_XZZLSQKFJDS.zelingyiju
  is '罪名依据';
comment on column T_XZZLSQKFJDS.kangfuqixian
  is '康复期限';
comment on column T_XZZLSQKFJDS.qishishijian
  is '起始时间';
comment on column T_XZZLSQKFJDS.zhongzhishijian
  is '终止时间';
comment on column T_XZZLSQKFJDS.zhixingshequ
  is '执行社区';
comment on column T_XZZLSQKFJDS.shequdizhi
  is '社区地址';
comment on column T_XZZLSQKFJDS.gonganmingcheng
  is '公安名称';
comment on column T_XZZLSQKFJDS.fuyijiguan
  is '服役机关';
comment on column T_XZZLSQKFJDS.susongjiguan
  is '诉讼机关';
-- Create/Recreate indexes 
create unique index I_XZZLSQKFJDS_00 on T_XZZLSQKFJDS (ID);
create index I_XZZLSQKFJDS_01 on T_XZZLSQKFJDS (ACTFLAG);
create index I_XZZLSQKFJDS_02 on T_XZZLSQKFJDS (ANJIANBIANHAO);
create index I_XZZLSQKFJDS_03 on T_XZZLSQKFJDS (BANANREN1ID);
create index I_XZZLSQKFJDS_04 on T_XZZLSQKFJDS (BANANREN2ID);
create index I_XZZLSQKFJDS_05 on T_XZZLSQKFJDS (BANANDANWEIID);
create index I_XZZLSQKFJDS_06 on T_XZZLSQKFJDS (GONGANBIANHAO);
create index I_XZZLSQKFJDS_07 on T_XZZLSQKFJDS (WENSHUNIANFEN);
create index I_XZZLSQKFJDS_08 on T_XZZLSQKFJDS (WENSHUBIANHAO);
create index I_XZZLSQKFJDS_09 on T_XZZLSQKFJDS (SHENPIBIAOID);
create index I_XZZLSQKFJDS_10 on T_XZZLSQKFJDS (RENYUANBIANHAO);
create index I_XZZLSQKFJDS_TM on T_XZZLSQKFJDS (ACTTIME);



-- Create table
create table T_ZDRY_ZFBAFK
(
  rybh VARCHAR2(23),
  jszt VARCHAR2(1),
  rksj DATE default sysdate
);
-- Add comments to the table 
comment on table T_ZDRY_ZFBAFK
  is '重点人员反馈给执法办案的接收状态';
-- Add comments to the columns 
comment on column T_ZDRY_ZFBAFK.rybh
  is '执法办案人员编号';
comment on column T_ZDRY_ZFBAFK.jszt
  is '接收状态（0：退回 1：接收）';
comment on column T_ZDRY_ZFBAFK.rksj
  is '入库时间';
