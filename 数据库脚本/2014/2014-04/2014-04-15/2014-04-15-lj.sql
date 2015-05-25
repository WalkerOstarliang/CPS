-- Create table
create table T_ZDRY_QGQLZDRY
(
  BJZDRYBH    VARCHAR2(18),
  XM          VARCHAR2(30),
  XMPY        VARCHAR2(90),
  WWXM        VARCHAR2(80),
  XB          VARCHAR2(1),
  CSRQ        VARCHAR2(8),
  GJ          VARCHAR2(3),
  SFZH        VARCHAR2(18),
  QTZJHM      VARCHAR2(30),
  MZ          VARCHAR2(2),
  JG          VARCHAR2(6),
  HJDQH       VARCHAR2(6),
  HJDXZ       VARCHAR2(100),
  HJDPCS      VARCHAR2(70),
  XZDQH       VARCHAR2(6),
  HJDPCSDM    VARCHAR2(12),
  XZDXZ       VARCHAR2(100),
  XZDPCS      VARCHAR2(70),
  XZDPCSDM    VARCHAR2(12),
  GXDW        VARCHAR2(70),
  GXDWJGDM    VARCHAR2(12),
  LADW        VARCHAR2(70),
  LADWJGDM    VARCHAR2(12),
  ZJLASJ      VARCHAR2(14),
  NRBJZDRYKSJ VARCHAR2(14),
  ZDRYLBBJ    VARCHAR2(32),
  ZDRYXL      VARCHAR2(130),
  YXX         VARCHAR2(1),
  JLXZSJ      VARCHAR2(14),
  JLCXSJ      VARCHAR2(14),
  JLBGSJ      VARCHAR2(14),
  RKSJ        DATE,
  RCSQBKSJ    DATE
);
-- Add comments to the table 
comment on table T_ZDRY_QGQLZDRY
  is '全国七类重点人员';
-- Add comments to the columns 
comment on column T_ZDRY_QGQLZDRY.BJZDRYBH
  is '重点人员编号';
comment on column T_ZDRY_QGQLZDRY.XM
  is '重点人员姓名';
comment on column T_ZDRY_QGQLZDRY.XMPY
  is '重点人员姓名拼音';
comment on column T_ZDRY_QGQLZDRY.WWXM
  is '重点人员外文姓名';
comment on column T_ZDRY_QGQLZDRY.XB
  is '重点人员性别';
comment on column T_ZDRY_QGQLZDRY.CSRQ
  is '重点人员出生日期';
comment on column T_ZDRY_QGQLZDRY.GJ
  is '重点人员国籍';
comment on column T_ZDRY_QGQLZDRY.SFZH
  is '重点人员身份证号码';
comment on column T_ZDRY_QGQLZDRY.QTZJHM
  is '重点人员其他证件号码';
comment on column T_ZDRY_QGQLZDRY.MZ
  is '重点人员民族';
comment on column T_ZDRY_QGQLZDRY.JG
  is '重点人员籍贯';
comment on column T_ZDRY_QGQLZDRY.HJDQH
  is '重点人员户籍地区划';
comment on column T_ZDRY_QGQLZDRY.HJDXZ
  is '重点人员户籍地详址';
comment on column T_ZDRY_QGQLZDRY.HJDPCS
  is '重点人员户籍地派出所';
comment on column T_ZDRY_QGQLZDRY.XZDQH
  is '重点人员现住地区划';
comment on column T_ZDRY_QGQLZDRY.HJDPCSDM
  is '重点人员户籍地派出所代码';
comment on column T_ZDRY_QGQLZDRY.XZDXZ
  is '重点人员现住地详址';
comment on column T_ZDRY_QGQLZDRY.XZDPCS
  is '重点人员现住地派出所';
comment on column T_ZDRY_QGQLZDRY.XZDPCSDM
  is '重点人员现住地派出所代码';
comment on column T_ZDRY_QGQLZDRY.GXDW
  is '重点人员管辖单位';
comment on column T_ZDRY_QGQLZDRY.GXDWJGDM
  is '重点人员管辖单位代码';
comment on column T_ZDRY_QGQLZDRY.LADW
  is '重点人员立案单位';
comment on column T_ZDRY_QGQLZDRY.LADWJGDM
  is '重点人员立案单位代码';
comment on column T_ZDRY_QGQLZDRY.ZJLASJ
  is '重点人员立案时间';
comment on column T_ZDRY_QGQLZDRY.NRBJZDRYKSJ
  is '重点人员入部级库时间';
comment on column T_ZDRY_QGQLZDRY.ZDRYLBBJ
  is '重点人员人员类别';
comment on column T_ZDRY_QGQLZDRY.ZDRYXL
  is '重点人员人员细类';
comment on column T_ZDRY_QGQLZDRY.YXX
  is '重点人员有效性';
comment on column T_ZDRY_QGQLZDRY.JLXZSJ
  is '重点人员记录新增时间';
comment on column T_ZDRY_QGQLZDRY.JLCXSJ
  is '重点人员记录查询时间';
comment on column T_ZDRY_QGQLZDRY.JLBGSJ
  is '重点人员变更时间';
comment on column T_ZDRY_QGQLZDRY.RKSJ
  is '入警综库时间';
comment on column T_ZDRY_QGQLZDRY.RCSQBKSJ
  is '入长沙情报库时间';
-- Create/Recreate indexes 
create index INDEX_QGZDRY_BH on T_ZDRY_QGQLZDRY (BJZDRYBH);
create index INDEX_QGZDRY_SFZH on T_ZDRY_QGQLZDRY (SFZH);
