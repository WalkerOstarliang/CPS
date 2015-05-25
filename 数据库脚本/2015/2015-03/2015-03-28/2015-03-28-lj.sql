-- Create table
create table T_ZFDX_YZWYH
(
  ID      VARCHAR2(22),
  WYXQMC  VARCHAR2(150),
  CLRQ    DATE,
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
  STID    VARCHAR2(50),
  STMC    VARCHAR2(200),
  SQDM    VARCHAR2(12),
  SQMC    VARCHAR2(120)
);
-- Add comments to the table 
comment on table T_ZFDX_YZWYH
  is '走访对象----业主委员会表';
-- Add comments to the columns 
comment on column T_ZFDX_YZWYH.ID
  is '6位行政编码+6位日期+10位序列号';
comment on column T_ZFDX_YZWYH.WYXQMC
  is '业主委员会名称';
comment on column T_ZFDX_YZWYH.CLRQ
  is '成立日期';
comment on column T_ZFDX_YZWYH.DJRXM
  is '登记人姓名';
comment on column T_ZFDX_YZWYH.DJRJH
  is '登记人警号';
comment on column T_ZFDX_YZWYH.DJRSFZH
  is '登记人身份证号';
comment on column T_ZFDX_YZWYH.DJDWDM
  is '登记单位代码';
comment on column T_ZFDX_YZWYH.DJDWMC
  is '登记单位名称';
comment on column T_ZFDX_YZWYH.SSJWQDM
  is '所属警务区代码';
comment on column T_ZFDX_YZWYH.SSJWQMC
  is '所属警务区名称';
comment on column T_ZFDX_YZWYH.ZXBS
  is '注销标识  0：正常 ， 1：注销';
comment on column T_ZFDX_YZWYH.ZXSJ
  is '注销时间';
comment on column T_ZFDX_YZWYH.IP
  is 'ip地址';
comment on column T_ZFDX_YZWYH.XGRXM
  is '修改人姓名';
comment on column T_ZFDX_YZWYH.XGRJH
  is '修改人警号';
comment on column T_ZFDX_YZWYH.XGSJ
  is '修改时间';
comment on column T_ZFDX_YZWYH.DJSJ
  is '登记时间';
comment on column T_ZFDX_YZWYH.STID
  is '关联治安物业小区ID';
comment on column T_ZFDX_YZWYH.STMC
  is '物业小区名称';
comment on column T_ZFDX_YZWYH.SQDM
  is '社区代码';
comment on column T_ZFDX_YZWYH.SQMC
  is '社区名称';

 
 -- Create sequence （业主委员会ID序列）
create sequence SEQ_AFGL_YZWYHID
minvalue 1
maxvalue 9999999999
start with 1000000000
increment by 1
cache 20
cycle;



create table T_ZFDX_YZWYHCY
(
  ID      VARCHAR2(22),
  WYXQMC  VARCHAR2(150),
  XM      VARCHAR2(30),
  SFZH    VARCHAR2(18),
  XB      VARCHAR2(2),
  LXDH    VARCHAR2(30),
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
  ZZMM    VARCHAR2(10),
  SQDM    VARCHAR2(12),
  SQMC    VARCHAR2(120),
  YZWYHID VARCHAR2(22),
  JRRQ    DATE,
  ZW      VARCHAR2(10)
);
-- Add comments to the table 
comment on table T_ZFDX_YZWYHCY
  is '走访对象----业主委员会成员表';
-- Add comments to the columns 
comment on column T_ZFDX_YZWYHCY.ID
  is '6位行政编码+6位日期+10位序列号';
comment on column T_ZFDX_YZWYHCY.WYXQMC
  is '业主委员会名称';
comment on column T_ZFDX_YZWYHCY.XM
  is '委员会成员姓名';
comment on column T_ZFDX_YZWYHCY.SFZH
  is '成员身份证';
comment on column T_ZFDX_YZWYHCY.XB
  is '成员性别';
comment on column T_ZFDX_YZWYHCY.LXDH
  is '成员联系电话';
comment on column T_ZFDX_YZWYHCY.DJRXM
  is '登记人姓名';
comment on column T_ZFDX_YZWYHCY.DJRJH
  is '登记人警号';
comment on column T_ZFDX_YZWYHCY.DJRSFZH
  is '登记人身份证号';
comment on column T_ZFDX_YZWYHCY.DJDWDM
  is '登记单位代码';
comment on column T_ZFDX_YZWYHCY.DJDWMC
  is '登记单位名称';
comment on column T_ZFDX_YZWYHCY.SSJWQDM
  is '所属警务区代码';
comment on column T_ZFDX_YZWYHCY.SSJWQMC
  is '所属警务区名称';
comment on column T_ZFDX_YZWYHCY.ZXBS
  is '注销标识 0：正常 ， 1：注销';
comment on column T_ZFDX_YZWYHCY.ZXSJ
  is '注销时间';
comment on column T_ZFDX_YZWYHCY.IP
  is 'ip地址';
comment on column T_ZFDX_YZWYHCY.XGRXM
  is '修改人姓名';
comment on column T_ZFDX_YZWYHCY.XGRJH
  is '修改人警号';
comment on column T_ZFDX_YZWYHCY.XGSJ
  is '修改时间';
comment on column T_ZFDX_YZWYHCY.DJSJ
  is '登记时间';
comment on column T_ZFDX_YZWYHCY.CSRQ
  is '出生日期';
comment on column T_ZFDX_YZWYHCY.ZZMM
  is '政治面貌';
comment on column T_ZFDX_YZWYHCY.SQDM
  is '社区代码';
comment on column T_ZFDX_YZWYHCY.SQMC
  is '社区名称';
comment on column T_ZFDX_YZWYHCY.YZWYHID
  is '业主委员会ID，关联业主委员会表';
comment on column T_ZFDX_YZWYHCY.JRRQ
  is '加入业主委员会日期';
comment on column T_ZFDX_YZWYHCY.ZW
  is '职务  1：主席 ；2：副主席；3：成员';
  
 -- Create sequence (业主委员会成员ID序列)
create sequence SEQ_AFGL_YZWYHCYID
minvalue 1
maxvalue 9999999999
start with 1000000000
increment by 1
cache 20
cycle;