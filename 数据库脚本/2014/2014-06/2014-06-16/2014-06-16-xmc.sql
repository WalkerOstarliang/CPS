-- Create table
create table T_AF_JDCXX
(
  CAR_ID         VARCHAR2(30),
  CAR_HOLDER     VARCHAR2(100),
  CAR_ADDR       VARCHAR2(164),
  CAR_TELEPHONE  VARCHAR2(18),
  CAR_NUM        VARCHAR2(6),
  CAR_RECORD     VARCHAR2(9),
  CAR_BRAND      VARCHAR2(100),
  CAR_MOTOR      VARCHAR2(64),
  CAR_AGENT      VARCHAR2(30),
  CAR_AUDIT      VARCHAR2(30),
  CAR_AGENTDATE  VARCHAR2(19),
  CAR_ISOMUX     VARCHAR2(6),
  CAR_OPERNAME   VARCHAR2(32),
  CAR_OPERDATE   VARCHAR2(19),
  CAR_UPDATE     VARCHAR2(19),
  CAR_LEVEL      VARCHAR2(2),
  CAR_BRANDCOUNT VARCHAR2(20),
  CAR_CARDCOUNT  VARCHAR2(20),
  CAR_STATE      VARCHAR2(20),
  CAR_CHECKER    VARCHAR2(30),
  CAR_CHECKDATE  VARCHAR2(19),
  CAR_CARISOMUX  VARCHAR2(19),
  CAR_CERTNUM    VARCHAR2(32),
  CAR_COLOR1     VARCHAR2(32),
  CAR_COLOR2     VARCHAR2(32),
  CAR_COLOR3     VARCHAR2(32),
  CAR_CERT       VARCHAR2(32)
)
tablespace TS_DT_SQJW
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
-- Add comments to the table 
comment on table T_AF_JDCXX
  is '机动车信息';
-- Add comments to the columns 
comment on column T_AF_JDCXX.CAR_ID
  is '编号
';
comment on column T_AF_JDCXX.CAR_HOLDER
  is '所有人
';
comment on column T_AF_JDCXX.CAR_ADDR
  is '住址
';
comment on column T_AF_JDCXX.CAR_TELEPHONE
  is '联系电话
';
comment on column T_AF_JDCXX.CAR_NUM
  is '号牌号码
';
comment on column T_AF_JDCXX.CAR_RECORD
  is '档案编号
';
comment on column T_AF_JDCXX.CAR_BRAND
  is '品牌型号
';
comment on column T_AF_JDCXX.CAR_MOTOR
  is '车架号
';
comment on column T_AF_JDCXX.CAR_AGENT
  is '经办人
';
comment on column T_AF_JDCXX.CAR_AUDIT
  is '审核人
';
comment on column T_AF_JDCXX.CAR_AGENTDATE
  is '经办日期
';
comment on column T_AF_JDCXX.CAR_ISOMUX
  is '所属区域
';
comment on column T_AF_JDCXX.CAR_OPERNAME
  is '操作员
';
comment on column T_AF_JDCXX.CAR_OPERDATE
  is '操作日期
';
comment on column T_AF_JDCXX.CAR_UPDATE
  is '更新日期
';
comment on column T_AF_JDCXX.CAR_LEVEL
  is '数据级别
';
