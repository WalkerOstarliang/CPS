create table T_ZFDX_DDB
(
  ID      VARCHAR2(22),
  DDBXM   VARCHAR2(30),
  DDBSFZH VARCHAR2(18),
  DDBLXDH VARCHAR2(30),
  ZZMM    VARCHAR2(10),
  HJDQH   VARCHAR2(6),
  XZZXZ   VARCHAR2(150),
  DRSJ    DATE,
  SFRDDB  VARCHAR2(1),
  SFZXWY  VARCHAR2(1),
  SFDC    VARCHAR2(1),
  DCRQ    DATE,
  DJRXM   VARCHAR2(30),
  DJRJH   VARCHAR2(30),
  DJRSFZH VARCHAR2(18),
  DJDWDM  VARCHAR2(12),
  DJDWMC  VARCHAR2(150),
  SSJWQDM VARCHAR2(12),
  SSJWQMC VARCHAR2(150),
  SQDM    VARCHAR2(12),
  SQMC    VARCHAR2(150),
  ZXBS    VARCHAR2(1),
  ZXSJ    DATE,
  IP      VARCHAR2(150),
  XGRXM   VARCHAR2(30),
  XGRJH   VARCHAR2(30),
  XGSJ    DATE,
  DJSJ    DATE,
  XB      VARCHAR2(2),
  CSRQ    DATE
);
-- Add comments to the table 
comment on table T_ZFDX_DDB
  is '辖区人大代表、政协委员信息（党代表）';
-- Add comments to the columns 
comment on column T_ZFDX_DDB.ID
  is '6位行政编码+6位日期+10位序列号';
comment on column T_ZFDX_DDB.DDBXM
  is '党代表姓名';
comment on column T_ZFDX_DDB.DDBSFZH
  is '党代表身份证号';
comment on column T_ZFDX_DDB.DDBLXDH
  is '党代表联系电话';
comment on column T_ZFDX_DDB.ZZMM
  is '政治面貌';
comment on column T_ZFDX_DDB.HJDQH
  is '户籍区划';
comment on column T_ZFDX_DDB.XZZXZ
  is '现住地详址';
comment on column T_ZFDX_DDB.DRSJ
  is '调入日期';
comment on column T_ZFDX_DDB.SFRDDB
  is '是否人大代表（0：否，1：是）';
comment on column T_ZFDX_DDB.SFZXWY
  is '是否政协委员（0：否，1：是）';
comment on column T_ZFDX_DDB.SFDC
  is '是否调出（0：否，1：是）';
comment on column T_ZFDX_DDB.DCRQ
  is '调出日期';
comment on column T_ZFDX_DDB.DJRXM
  is '登记人姓名';
comment on column T_ZFDX_DDB.DJRJH
  is '登记人警号';
comment on column T_ZFDX_DDB.DJRSFZH
  is '登记人身份证号';
comment on column T_ZFDX_DDB.DJDWDM
  is '登记单位代码';
comment on column T_ZFDX_DDB.DJDWMC
  is '登记单位名称';
comment on column T_ZFDX_DDB.SSJWQDM
  is '所属警务区代码';
comment on column T_ZFDX_DDB.SSJWQMC
  is '所属警务区名称';
comment on column T_ZFDX_DDB.SQDM
  is '所属社区代码';
comment on column T_ZFDX_DDB.SQMC
  is '所属社区名称';
comment on column T_ZFDX_DDB.ZXBS
  is '注销标识（0：正常，1：注销）';
comment on column T_ZFDX_DDB.ZXSJ
  is '注销时间';
comment on column T_ZFDX_DDB.IP
  is 'IP地址';
comment on column T_ZFDX_DDB.XGRXM
  is '修改人姓名';
comment on column T_ZFDX_DDB.XGRJH
  is '修改人警号';
comment on column T_ZFDX_DDB.XGSJ
  is '修改时间';


-- Create sequence （党代表ID序列）
create sequence SEQ_AFGL_SQDDBID
minvalue 1
maxvalue 9999999999
start with 1000000000
increment by 1
cache 20
cycle;
 
 
-- Create table
create table T_ZFDX_LDZ
(
  ID      VARCHAR2(22),
  XM      VARCHAR2(30),
  SFZH    VARCHAR2(18),
  XB      VARCHAR2(2),
  LXDH    VARCHAR2(30),
  HJDQH   VARCHAR2(6),
  XZZXZ   VARCHAR2(150),
  DJRXM   VARCHAR2(30),
  DJRJH   VARCHAR2(30),
  DJRSFZH VARCHAR2(18),
  DJDWDM  VARCHAR2(12),
  DJDWMC  VARCHAR2(150),
  SSJWQDM VARCHAR2(12),
  SSJWQMC VARCHAR2(150),
  ZXBS    VARCHAR2(1),
  ZXSJ    DATE,
  IP      VARCHAR2(150),
  XGRXM   VARCHAR2(30),
  XGRJH   VARCHAR2(30),
  XGSJ    DATE,
  DJSJ    DATE,
  CSRQ    DATE,
  STID    VARCHAR2(50),
  STMC    VARCHAR2(200),
  STDZ    VARCHAR2(300),
  ZZMM    VARCHAR2(10),
  SQDM    VARCHAR2(12),
  SQMC    VARCHAR2(120)
);
-- Add comments to the table 
comment on table T_ZFDX_LDZ
  is '走访对象--楼栋长信息';
-- Add comments to the columns 
comment on column T_ZFDX_LDZ.ID
  is '6位行政编码+6位日期+10位序列号';
comment on column T_ZFDX_LDZ.XM
  is '姓名';
comment on column T_ZFDX_LDZ.SFZH
  is '身份证号';
comment on column T_ZFDX_LDZ.XB
  is '性别';
comment on column T_ZFDX_LDZ.LXDH
  is '联系电话';
comment on column T_ZFDX_LDZ.HJDQH
  is '户籍区划';
comment on column T_ZFDX_LDZ.XZZXZ
  is '现住址详址';
comment on column T_ZFDX_LDZ.DJRXM
  is '登记人姓名';
comment on column T_ZFDX_LDZ.DJRJH
  is '登记人警号';
comment on column T_ZFDX_LDZ.DJRSFZH
  is '登记人身份证号';
comment on column T_ZFDX_LDZ.DJDWDM
  is '登记单位代码';
comment on column T_ZFDX_LDZ.DJDWMC
  is '登记单位名称';
comment on column T_ZFDX_LDZ.SSJWQDM
  is '所属警务区代码';
comment on column T_ZFDX_LDZ.SSJWQMC
  is '所属警务区名称';
comment on column T_ZFDX_LDZ.ZXBS
  is '注销标识  0：正常 ， 1：注销';
comment on column T_ZFDX_LDZ.ZXSJ
  is '注销时间';
comment on column T_ZFDX_LDZ.IP
  is 'ip地址';
comment on column T_ZFDX_LDZ.XGRXM
  is '修改人姓名';
comment on column T_ZFDX_LDZ.XGRJH
  is '修改人警号';
comment on column T_ZFDX_LDZ.XGSJ
  is '修改时间';
comment on column T_ZFDX_LDZ.DJSJ
  is '登记时间';
comment on column T_ZFDX_LDZ.CSRQ
  is '出生日期';
comment on column T_ZFDX_LDZ.STID
  is '关联实体ID';
comment on column T_ZFDX_LDZ.STMC
  is '关联实体名称';
comment on column T_ZFDX_LDZ.STDZ
  is '实体地址';
comment on column T_ZFDX_LDZ.ZZMM
  is '政治面貌';
 
 
 -- Create sequence (楼栋长ID序列)
create sequence SEQ_AFGL_SQLDZID
minvalue 1
maxvalue 9999999999
start with 1000000000
increment by 1
cache 20
cycle;