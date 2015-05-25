-- Create table
create table T_COMMON_XQFAQKTJ_SY
(
  DWDM       VARCHAR2(12),
  DWMC       VARCHAR2(120),
  QJASL      NUMBER default 0,
  QDASJ      NUMBER default 0,
  DQZSL      NUMBER default 0,
  ZPASL      NUMBER default 0,
  QTASL      NUMBER default 0,
  LEVE       NUMBER,
  PARENTCODE VARCHAR2(12),
  JSSJ       DATE default sysdate,
  ORGJC      VARCHAR2(120),
  QJASL_Y    NUMBER default 0,
  QJASL_N    NUMBER default 0,
  QDASJ_Y    NUMBER default 0,
  QDASJ_N    NUMBER default 0,
  DQZSL_Y    NUMBER default 0,
  DQZSL_N    NUMBER default 0,
  ZPASL_Y    NUMBER default 0,
  ZPASL_N    NUMBER default 0,
  QTASL_Y    NUMBER default 0,
  QTASL_N    NUMBER default 0
);
-- Add comments to the table 
comment on table T_COMMON_XQFAQKTJ_SY
  is '辖区发案情况统计';
-- Add comments to the columns 
comment on column T_COMMON_XQFAQKTJ_SY.DWDM
  is '单位代码';
comment on column T_COMMON_XQFAQKTJ_SY.DWMC
  is '单位名称';
comment on column T_COMMON_XQFAQKTJ_SY.QJASL
  is '抢劫案数量_前一天';
comment on column T_COMMON_XQFAQKTJ_SY.QDASJ
  is '抢夺案数量_前一天';
comment on column T_COMMON_XQFAQKTJ_SY.DQZSL
  is '盗窃案数量_前一天';
comment on column T_COMMON_XQFAQKTJ_SY.ZPASL
  is '咋骗案数量_前一天';
comment on column T_COMMON_XQFAQKTJ_SY.QTASL
  is '其他案件数量_前一天';
comment on column T_COMMON_XQFAQKTJ_SY.LEVE
  is '层级';
comment on column T_COMMON_XQFAQKTJ_SY.PARENTCODE
  is '父代码';
comment on column T_COMMON_XQFAQKTJ_SY.JSSJ
  is '计算时间';
comment on column T_COMMON_XQFAQKTJ_SY.ORGJC
  is '机构简称';
comment on column T_COMMON_XQFAQKTJ_SY.QJASL_Y
  is '抢劫案数量_当月';
comment on column T_COMMON_XQFAQKTJ_SY.QJASL_N
  is '抢劫案数量_当年';
comment on column T_COMMON_XQFAQKTJ_SY.QDASJ_Y
  is '抢夺案数量_当月';
comment on column T_COMMON_XQFAQKTJ_SY.QDASJ_N
  is '抢夺案数量_当年';
comment on column T_COMMON_XQFAQKTJ_SY.DQZSL_Y
  is '盗窃案数量_当月';
comment on column T_COMMON_XQFAQKTJ_SY.DQZSL_N
  is '盗窃案数量_当年';
comment on column T_COMMON_XQFAQKTJ_SY.ZPASL_Y
  is '咋骗案数量_当月';
comment on column T_COMMON_XQFAQKTJ_SY.ZPASL_N
  is '咋骗案数量_当年';
comment on column T_COMMON_XQFAQKTJ_SY.QTASL_Y
  is '其他案件数量_当月';
comment on column T_COMMON_XQFAQKTJ_SY.QTASL_N
  is '其他案件数量_当年';
-- Create/Recreate indexes 
create index IDX_COMMON_XQFA_SY on T_COMMON_XQFAQKTJ_SY (LEVE) ;
