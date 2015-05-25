-- Create table
create table T_TJFX_FAQKTJ
(
  ORGCODE     VARCHAR2(12),
  ORGNAME     VARCHAR2(120),
  LEVE        NUMBER,
  PARENT_CODE VARCHAR2(12),
  TJYF        VARCHAR2(6),
  TJSJ        DATE,
  XSAJS       NUMBER,
  ZAAJS       NUMBER,
  QJAJS       NUMBER,
  QDAJS       NUMBER,
  RSDQAJS     NUMBER,
  DQJDCAJS    NUMBER,
  QTAJS       NUMBER,
  JFTJS       NUMBER,
  ZNSGS       NUMBER
);
-- Add comments to the table 
comment on table T_TJFX_FAQKTJ
  is '统计分析-发案情况统计';
-- Add comments to the columns 
comment on column T_TJFX_FAQKTJ.ORGCODE
  is '机构代码';
comment on column T_TJFX_FAQKTJ.ORGNAME
  is '机构名称';
comment on column T_TJFX_FAQKTJ.LEVE
  is '层级';
comment on column T_TJFX_FAQKTJ.PARENT_CODE
  is '父代码';
comment on column T_TJFX_FAQKTJ.TJYF
  is '统计月份';
comment on column T_TJFX_FAQKTJ.TJSJ
  is '统计时间';
comment on column T_TJFX_FAQKTJ.XSAJS
  is '刑事案件数量';
comment on column T_TJFX_FAQKTJ.ZAAJS
  is '治安案件数量';
comment on column T_TJFX_FAQKTJ.QJAJS
  is '抢劫案件数量';
comment on column T_TJFX_FAQKTJ.QDAJS
  is '抢夺案件数量';
comment on column T_TJFX_FAQKTJ.RSDQAJS
  is '入室盗窃案件数量';
comment on column T_TJFX_FAQKTJ.DQJDCAJS
  is '盗窃机动车案件数量';
comment on column T_TJFX_FAQKTJ.QTAJS
  is '其他案件数量';
comment on column T_TJFX_FAQKTJ.JFTJS
  is '纠纷调解数';
comment on column T_TJFX_FAQKTJ.ZNSGS
  is '灾难事故数';
-- Create/Recreate indexes 
create index T_TJFX_FAQKTJ_LEVE on T_TJFX_FAQKTJ (LEVE);
create index T_TJFX_FAQKTJ_ORGCODE on T_TJFX_FAQKTJ (ORGCODE);




-- Add/modify columns 
alter table T_GZGL_JQTB add DJDWDM VARCHAR2(12);
alter table T_GZGL_JQTB add DJDWMC VARCHAR2(120);
-- Add comments to the columns 
comment on column T_GZGL_JQTB.ZRDWDM
  is '通知通报单位代码';
comment on column T_GZGL_JQTB.ZRDWMC
  is '通知通报单位名称';
comment on column T_GZGL_JQTB.DJDWDM
  is '填报单位代码';
comment on column T_GZGL_JQTB.DJDWMC
  is '填报单位名称';
-- Add/modify columns 
alter table T_GZGL_JQTB modify DQFFZD VARCHAR2(4000);

