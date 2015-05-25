-- Add/modify columns 
alter table T_KHKP_JFZ add tjyf VARCHAR2(12);
-- Add comments to the columns 
comment on column T_KHKP_JFZ.tjyf
  is '统计月份';
  
  
-- Create table
create table T_KHKP_ERROR_LOG
(
  ORGCODE VARCHAR2(12),
  ORGNAME VARCHAR2(120),
  JSJD    VARCHAR2(1),
  TJYF    VARCHAR2(6),
  JSSJ    DATE default sysdate,
  ERROR   VARCHAR2(3000),
  JSKSSJ  VARCHAR2(14),
  JSJSSJ  VARCHAR2(14),
  MS      VARCHAR2(200)
)
tablespace TS_DT_SQJW
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255;
-- Add comments to the table 
comment on table T_KHKP_ERROR_LOG
  is '考核考评错误日志';
-- Add comments to the columns 
comment on column T_KHKP_ERROR_LOG.ORGCODE
  is '单位代码';
comment on column T_KHKP_ERROR_LOG.ORGNAME
  is '单位名称';
comment on column T_KHKP_ERROR_LOG.JSJD
  is '计算阶段';
comment on column T_KHKP_ERROR_LOG.TJYF
  is '统计月份';
comment on column T_KHKP_ERROR_LOG.JSSJ
  is '计算时间';
comment on column T_KHKP_ERROR_LOG.ERROR
  is '错误描述';
comment on column T_KHKP_ERROR_LOG.JSKSSJ
  is '计算开始时间';
comment on column T_KHKP_ERROR_LOG.JSJSSJ
  is '计算结束时间';
comment on column T_KHKP_ERROR_LOG.MS
  is '描述';
