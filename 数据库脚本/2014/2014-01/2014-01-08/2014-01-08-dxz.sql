-- 预警反馈信息
create table t_zdry_fkxx
(
  ID             VARCHAR2(10) not null,
  LDXXBH         VARCHAR2(27) not null,
  CZFKXXBH       VARCHAR2(22) not null,
  YJXXBH         VARCHAR2(20) not null,
  SJYJJB         VARCHAR2(1),
  FKSJ           DATE,
  FKRSFZH        VARCHAR2(18),
  FKRXM          VARCHAR2(30),
  FKDW           VARCHAR2(100),
  FKDWJGDM       VARCHAR2(12),
  MBFXZT         VARCHAR2(1),
  DTXXLB         VARCHAR2(6),
  HDFSSJ         DATE,
  HDFSDDQH       VARCHAR2(6),
  HDFSDDXZ       VARCHAR2(100),
  HDFSDDSSSHCS   VARCHAR2(120),
  HDFSDDSSSHCSDM VARCHAR2(30),
  FXHDXGXX       VARCHAR2(400),
  FXMBZRMJSFZH   VARCHAR2(18),
  FXMBZRMJXM     VARCHAR2(30),
  FXMBZRDW       VARCHAR2(100),
  FXMBZRDWJGDM   VARCHAR2(12),
  CQCZCS         VARCHAR2(1),
  CZCSXL         VARCHAR2(3),
  CZSJ           DATE,
  CZDDQH         VARCHAR2(6),
  CZZRMJSFZH     VARCHAR2(18),
  CZZRMJXM       VARCHAR2(30),
  CZZRDWJGDM     VARCHAR2(12),
  CZJGMS         VARCHAR2(400),
  XDCHNJXX       VARCHAR2(64),
  XCCHWPXX       VARCHAR2(400),
  LXZCGZPG       VARCHAR2(2),
  LXZCGZPGYJ     VARCHAR2(900),
  MBCSZYLX       VARCHAR2(2),
  CZJG           VARCHAR2(3),
  CZFKBCXX       VARCHAR2(400),
  RKSJ           DATE default SYSDATE,
  SFWZDFK        VARCHAR2(1),
  CZDDXZ         VARCHAR2(100),
  CZZRDW         VARCHAR2(70),
  FSZT           CHAR(1) default 0,
  SJCZJG         VARCHAR2(3),
  SFBRYJ         VARCHAR2(2),
  FBRYJCSYY      VARCHAR2(2)
);
-- Add comments to the columns 
comment on column t_zdry_fkxx.ID
  is 'ID';
comment on column t_zdry_fkxx.LDXXBH
  is '联动信息编号';
comment on column t_zdry_fkxx.CZFKXXBH
  is '处置反馈信息编号';
comment on column t_zdry_fkxx.YJXXBH
  is '预警信息编号';
comment on column t_zdry_fkxx.SJYJJB
  is '省级预警级别';
comment on column t_zdry_fkxx.FKSJ
  is '反馈时间';
comment on column t_zdry_fkxx.FKRSFZH
  is '反馈人身份证号';
comment on column t_zdry_fkxx.FKRXM
  is '反馈人姓名';
comment on column t_zdry_fkxx.FKDW
  is '反馈单位';
comment on column t_zdry_fkxx.FKDWJGDM
  is '反馈单位机构代码';
comment on column t_zdry_fkxx.MBFXZT
  is '目标发现状态';
comment on column t_zdry_fkxx.DTXXLB
  is '动态信息类别';
comment on column t_zdry_fkxx.HDFSSJ
  is '活动发生时间';
comment on column t_zdry_fkxx.HDFSDDQH
  is '活动发生地点区划';
comment on column t_zdry_fkxx.HDFSDDXZ
  is '活动发生地点祥址';
comment on column t_zdry_fkxx.HDFSDDSSSHCS
  is '活动发生地点所属社会场所';
comment on column t_zdry_fkxx.HDFSDDSSSHCSDM
  is '活动发生地点所属社会场所代码';
comment on column t_zdry_fkxx.FXHDXGXX
  is '发现活动相关信息';
comment on column t_zdry_fkxx.FXMBZRMJSFZH
  is '发现目标责任民警身份证号';
comment on column t_zdry_fkxx.FXMBZRMJXM
  is '发现目标责任民警姓名';
comment on column t_zdry_fkxx.FXMBZRDW
  is '发现目标责任单位';
comment on column t_zdry_fkxx.FXMBZRDWJGDM
  is '发现目标责任单位机构代码';
comment on column t_zdry_fkxx.CQCZCS
  is '处置措施要求';
comment on column t_zdry_fkxx.CZCSXL
  is '处置措施细类';
comment on column t_zdry_fkxx.CZSJ
  is '处置事件';
comment on column t_zdry_fkxx.CZDDQH
  is '处置地点区划';
comment on column t_zdry_fkxx.CZZRMJSFZH
  is '处置责任民警身份证号';
comment on column t_zdry_fkxx.CZZRMJXM
  is '处置责任民警姓名';
comment on column t_zdry_fkxx.CZZRDWJGDM
  is '处置责任单位机构代码';
comment on column t_zdry_fkxx.CZJGMS
  is '处置结果描述';
comment on column t_zdry_fkxx.XDCHNJXX
  is '吸毒查获尿检信息';
comment on column t_zdry_fkxx.XCCHWPXX
  is '吸毒查获物品信息';
comment on column t_zdry_fkxx.LXZCGZPG
  is '离线侦查工作评估';
comment on column t_zdry_fkxx.LXZCGZPGYJ
  is '离线侦查工作评估依据';
comment on column t_zdry_fkxx.MBCSZYLX
  is '目标从事职业类型';
comment on column t_zdry_fkxx.CZJG
  is '处置结果';
comment on column t_zdry_fkxx.CZFKBCXX
  is '处置反馈补充信息';
comment on column t_zdry_fkxx.RKSJ
  is '入库时间';
comment on column t_zdry_fkxx.SFWZDFK
  is '是否为自动反馈 1,自动反馈 0，手动反馈';
comment on column t_zdry_fkxx.CZDDXZ
  is '处置详址';
comment on column t_zdry_fkxx.CZZRDW
  is '处置责任单位';
comment on column t_zdry_fkxx.FSZT
  is '发送状态0为未发送 1 为已发送 2 为三级联动抽取';
comment on column t_zdry_fkxx.SJCZJG
  is '实际处置结果';
comment on column t_zdry_fkxx.SFBRYJ
  is '是否本人预警';
comment on column t_zdry_fkxx.FBRYJCSYY
  is '非本人预警产生原因';
-- Create/Recreate primary, unique and foreign key constraints 
alter table t_zdry_fkxx
  add primary key (ID);
alter table t_zdry_fkxx
  add unique (LDXXBH);
-- Create/Recreate indexes 
create index IDX_CKYJQBFKXX_RKSJ on t_zdry_fkxx (RKSJ);
create index IDX_CKYJQBFKXX_RKSJ_F on t_zdry_fkxx (TO_CHAR(RKSJ,'yyyymmddhh24miss'));
create bitmap index INX_t_zdry_fkxx_FSZT on t_zdry_fkxx (FSZT);
create index SYS_C0021660 on t_zdry_fkxx (YJXXBH);



--预警签收信息
-- Create table
create table T_ZDRY_YJQSXX
(
  ID       VARCHAR2(10) not null,
  LDXXBH   VARCHAR2(27) not null,
  YJXXBH   VARCHAR2(20),
  QSSJ     DATE,
  QSRSFZH  VARCHAR2(18),
  QSRXM    VARCHAR2(30),
  QSDW     VARCHAR2(100),
  QSDWJGDM VARCHAR2(12),
  RKSJ     DATE default SYSDATE,
  SFWZDQS  VARCHAR2(1),
  FSZT     CHAR(1) default 0
)
tablespace TS_DT_DTJF
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64
    minextents 1
    maxextents unlimited
  );
-- Add comments to the table 
comment on table T_ZDRY_YJQSXX
  is '重点人员常控预警情报签收信息';
-- Add comments to the columns 
comment on column T_ZDRY_YJQSXX.ID
  is 'ID';
comment on column T_ZDRY_YJQSXX.LDXXBH
  is '联动信息编号';
comment on column T_ZDRY_YJQSXX.YJXXBH
  is '预警信息编号';
comment on column T_ZDRY_YJQSXX.QSSJ
  is '签收时间';
comment on column T_ZDRY_YJQSXX.QSRSFZH
  is '签收人身份证号';
comment on column T_ZDRY_YJQSXX.QSRXM
  is '签收人姓名';
comment on column T_ZDRY_YJQSXX.QSDW
  is '签收单位';
comment on column T_ZDRY_YJQSXX.QSDWJGDM
  is '签收单位机构代码';
comment on column T_ZDRY_YJQSXX.RKSJ
  is '入库时间';
comment on column T_ZDRY_YJQSXX.SFWZDQS
  is '是否为自动签收 0 :不是自动签收 1 ：是自动签收';
comment on column T_ZDRY_YJQSXX.FSZT
  is '发送状态0为未发送 1 为已发送 2为三级联动抽取';
-- Create/Recreate primary, unique and foreign key constraints 
alter table T_ZDRY_YJQSXX
  add primary key (ID);
alter table T_ZDRY_YJQSXX
  add unique (LDXXBH);
-- Create/Recreate indexes 
create index IDX_CKYJQBQSX_RKSJ on T_ZDRY_YJQSXX (RKSJ);
create index SYS_C0021664 on T_ZDRY_YJQSXX (YJXXBH);


--预警信息
-- Create table
create table T_ZDRY_CKYJXX
(
  ID               VARCHAR2(10) not null,
  LDXXBH           VARCHAR2(27),
  YJXXBH           VARCHAR2(20) not null,
  FWZH             VARCHAR2(40),
  YJJSDW           VARCHAR2(12),
  YJJSDLX          VARCHAR2(1),
  YJJB             VARCHAR2(1),
  QSSX             DATE,
  SCCZFKSX         DATE,
  YJFBSJ           DATE,
  FBRXM            VARCHAR2(30),
  FBDWJGDM         VARCHAR2(12),
  FBDW             VARCHAR2(100),
  ZDRYBH           VARCHAR2(18),
  ZDRYLBBJ         VARCHAR2(32),
  ZDRYXL           VARCHAR2(130),
  ZDRYXM           VARCHAR2(30),
  ZDRYWWXM         VARCHAR2(80),
  SFZH             VARCHAR2(18),
  QTZJHM           VARCHAR2(30),
  DTXXLB           VARCHAR2(6),
  HDFSSJ           DATE,
  HDFSDDQH         VARCHAR2(6),
  HDFSDDXZ         VARCHAR2(100),
  HDFSDDSSSHCSDM   VARCHAR2(30),
  HDFSDDSSSHCS     VARCHAR2(120),
  HDFSDDSSGAJGJGDM VARCHAR2(12),
  HDFSDDSSGAJG     VARCHAR2(100),
  DJZJHM           VARCHAR2(30),
  DJXM             VARCHAR2(30),
  DJXB             VARCHAR2(1),
  DJCSRQ           DATE,
  HDXGXX           VARCHAR2(400),
  DTXXTGDWJGDM     VARCHAR2(12),
  DTXXTGDW         VARCHAR2(100),
  XXBDSJ           DATE not null,
  XXBDDWJGDM       VARCHAR2(12),
  XXBDDW           VARCHAR2(100),
  DTGJXXBH         VARCHAR2(20),
  BZ               VARCHAR2(400),
  JFXX             VARCHAR2(3000),
  SJLYBS           VARCHAR2(1),
  RKSJ             DATE default SYSDATE,
  SFTSJZ           VARCHAR2(1) default 0,
  SFXFDS           VARCHAR2(1) default 0,
  SFSCXYJ          VARCHAR2(1) default 0,
  SFQS             VARCHAR2(1) default 0,
  SFFK             VARCHAR2(1) default 0,
  SFYZDFF          VARCHAR2(1) default 0,
  SFCFYJ           VARCHAR2(1) default 0,
  SFYZDTSXQ        VARCHAR2(1) default 0,
  CZYQ             VARCHAR2(1000),
  SFTL             VARCHAR2(1)
);
-- Add comments to the table 
comment on table T_ZDRY_CKYJXX
  is '重点人员常控预警情报信息';
-- Add comments to the columns 
comment on column T_ZDRY_CKYJXX.ID
  is 'ID';
comment on column T_ZDRY_CKYJXX.LDXXBH
  is '联动信息编号';
comment on column T_ZDRY_CKYJXX.YJXXBH
  is '预警信息编号';
comment on column T_ZDRY_CKYJXX.FWZH
  is '发文字号';
comment on column T_ZDRY_CKYJXX.YJJSDW
  is '预警接收单位';
comment on column T_ZDRY_CKYJXX.YJJSDLX
  is '预警接收地类型';
comment on column T_ZDRY_CKYJXX.YJJB
  is '预警级别';
comment on column T_ZDRY_CKYJXX.QSSX
  is '签收时限';
comment on column T_ZDRY_CKYJXX.SCCZFKSX
  is '首次处置反馈时限';
comment on column T_ZDRY_CKYJXX.YJFBSJ
  is '预警发布时间';
comment on column T_ZDRY_CKYJXX.FBRXM
  is '发布人姓名';
comment on column T_ZDRY_CKYJXX.FBDWJGDM
  is '发布单位机构代码';
comment on column T_ZDRY_CKYJXX.FBDW
  is '发布单位';
comment on column T_ZDRY_CKYJXX.ZDRYBH
  is '重点人员编号';
comment on column T_ZDRY_CKYJXX.ZDRYLBBJ
  is '重点人员类别标示';
comment on column T_ZDRY_CKYJXX.ZDRYXL
  is '重点人员细类';
comment on column T_ZDRY_CKYJXX.ZDRYXM
  is '重点人员姓名';
comment on column T_ZDRY_CKYJXX.ZDRYWWXM
  is '重点人员外文姓名';
comment on column T_ZDRY_CKYJXX.SFZH
  is '身份证号';
comment on column T_ZDRY_CKYJXX.QTZJHM
  is '其他证件号码';
comment on column T_ZDRY_CKYJXX.DTXXLB
  is '动态信息类别';
comment on column T_ZDRY_CKYJXX.HDFSSJ
  is '活动发生时间';
comment on column T_ZDRY_CKYJXX.HDFSDDQH
  is '活动发生地点区划';
comment on column T_ZDRY_CKYJXX.HDFSDDXZ
  is '活动发生地点祥址';
comment on column T_ZDRY_CKYJXX.HDFSDDSSSHCSDM
  is '活动发生地点所属社会场所代码';
comment on column T_ZDRY_CKYJXX.HDFSDDSSSHCS
  is '活动发生地点所属社会场所';
comment on column T_ZDRY_CKYJXX.HDFSDDSSGAJGJGDM
  is '活动发生地点所属公安机关机构代码';
comment on column T_ZDRY_CKYJXX.HDFSDDSSGAJG
  is '活动发生地点所属公安机关';
comment on column T_ZDRY_CKYJXX.DJZJHM
  is '登记证件类型';
comment on column T_ZDRY_CKYJXX.DJXM
  is '登记姓名';
comment on column T_ZDRY_CKYJXX.DJXB
  is '登记性别';
comment on column T_ZDRY_CKYJXX.DJCSRQ
  is '登记出生日期 YYYYMMDD';
comment on column T_ZDRY_CKYJXX.HDXGXX
  is '活动相关信息';
comment on column T_ZDRY_CKYJXX.DTXXTGDWJGDM
  is '动态信息提供单位机构代码';
comment on column T_ZDRY_CKYJXX.DTXXTGDW
  is '动态信息提供单位';
comment on column T_ZDRY_CKYJXX.XXBDSJ
  is '信息比对时间';
comment on column T_ZDRY_CKYJXX.XXBDDWJGDM
  is '信息比对单位机构代码';
comment on column T_ZDRY_CKYJXX.XXBDDW
  is '信息比对单位';
comment on column T_ZDRY_CKYJXX.DTGJXXBH
  is '动态轨迹信息编号';
comment on column T_ZDRY_CKYJXX.BZ
  is '备注';
comment on column T_ZDRY_CKYJXX.JFXX
  is '积分信息';
comment on column T_ZDRY_CKYJXX.SJLYBS
  is '数据来源表示 0：公安部 1 ：省厅 2 ： 地市';
comment on column T_ZDRY_CKYJXX.RKSJ
  is '入库时间';
comment on column T_ZDRY_CKYJXX.SFTSJZ
  is '是否推送警钟0 : 无状态表示待处理,1 : 要推送警钟，2: 正在发生中 3：已发送 4:发送失败';
comment on column T_ZDRY_CKYJXX.SFXFDS
  is '是否下发地市0 : 无状态表示待处理,1 : 要下发地市，2: 正在发生中 3：已发送 4:发送失败';
comment on column T_ZDRY_CKYJXX.SFSCXYJ
  is '是否生成新的预警信息(指人工研判后) 0 ： 表示没有生成 1 ： 表示已经生成';
comment on column T_ZDRY_CKYJXX.SFQS
  is '是否签收 0，未签收 1，已签收';
comment on column T_ZDRY_CKYJXX.SFFK
  is '是否反馈 0，未反馈 1，已反馈';
comment on column T_ZDRY_CKYJXX.SFYZDFF
  is '是否已自动分发0 ：没有自动分发，1 ： 已自动分发  只有当系统设置为 自动分发的时候才会更新这个状态，手动分发不会跟心状态';
comment on column T_ZDRY_CKYJXX.SFCFYJ
  is '是否重复预警  空也表示不重复预警    0 ：不是重复预警 1 ： 是重复预警';
comment on column T_ZDRY_CKYJXX.CZYQ
  is '处置建议. 推送警综';
comment on column T_ZDRY_CKYJXX.SFTL
  is '是否停留 1：是';
-- Create/Recreate primary, unique and foreign key constraints 
alter table T_ZDRY_CKYJXX
  add primary key (ID);
alter table T_ZDRY_CKYJXX
  add unique (LDXXBH);
-- Create/Recreate indexes 
create index IDX_CKYJQBXX_YJFBSJ on T_ZDRY_CKYJXX (YJFBSJ);
create index IDX_ZDRY_CKYJQBXX_DTXXLB on T_ZDRY_CKYJXX (DTXXLB);
create index IDX_ZDRY_CKYJQBXX_RKSJ on T_ZDRY_CKYJXX (RKSJ);
create index IDX_ZDRY_CKYJQBXX_RKSJ_F on T_ZDRY_CKYJXX (TO_CHAR(RKSJ,'YYYYMMDDHH24MISS'));
create index IDX_ZDRY_CKYJQBXX_YJJSDW on T_ZDRY_CKYJXX (YJJSDW);
create index SYS_C0021668 on T_ZDRY_CKYJXX (YJXXBH);
create index SYS_C0021669 on T_ZDRY_CKYJXX (SFZH);
create index SYS_C0021673 on T_ZDRY_CKYJXX (YJJSDLX);
create index SYS_C0021674 on T_ZDRY_CKYJXX (SFQS, SFFK, YJJB, YJJSDLX);
create index SYS_C0021675 on T_ZDRY_CKYJXX (SFFK);
create index SYS_C0021677 on T_ZDRY_CKYJXX (HDFSDDQH);
create index SYS_C0021677_ZDRYXL on T_ZDRY_CKYJXX (ZDRYXL);
create index SYS_C0021678_YJJB on T_ZDRY_CKYJXX (YJJB);
create index SYS_COO21690_ZDRYBJ on T_ZDRY_CKYJXX (ZDRYLBBJ);
create index SYS_COO21691_SFTL on T_ZDRY_CKYJXX (SFTL);

