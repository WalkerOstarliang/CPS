-- Drop columns 
alter table T_AF_ZAXL drop column XLRY;
alter table T_AF_ZAXL drop column XLDXLXFS;
alter table T_AF_ZAXL add XLLX VARCHAR2(1000);
-- Add comments to the columns 
comment on column T_AF_ZAXL.XLLX
  is '巡逻路线';
  
  

-- Create table
create table T_AF_XLRYB
(
  ID       VARCHAR2(27) not null,
  ZAXLID   VARCHAR2(27),
  XLDYXM   VARCHAR2(30),
  XLDYSFZH VARCHAR2(18),
  XLDYLXDH VARCHAR2(20),
  DJRXM    VARCHAR2(30),
  DJRJH    VARCHAR2(20),
  DJRSFZH  VARCHAR2(18),
  DJSJ     DATE,
  DJDWDM   VARCHAR2(12),
  DJDWMC   VARCHAR2(120),
  CZRXM    VARCHAR2(30),
  CZRJH    VARCHAR2(20),
  CZRSFZH  VARCHAR2(18),
  CZDWDM   VARCHAR2(12),
  CZDWMC   VARCHAR2(120),
  CZSJ     DATE,
  CZBS     VARCHAR2(1),
  ZW       VARCHAR2(1),
  ZWMS     VARCHAR2(10)
);
-- Add comments to the table 
comment on table T_AF_XLRYB
  is '治安巡逻--巡逻人员表';
-- Add comments to the columns 
comment on column T_AF_XLRYB.ID
  is '主键（6位行政区划 + 14位时间 + 7位序列）';
comment on column T_AF_XLRYB.ZAXLID
  is '治安巡逻ID（关联治安巡逻表）';
comment on column T_AF_XLRYB.XLDYXM
  is '巡逻人员姓名';
comment on column T_AF_XLRYB.XLDYSFZH
  is '巡逻人员身份证号';
comment on column T_AF_XLRYB.XLDYLXDH
  is '巡逻人员联系电话';
comment on column T_AF_XLRYB.DJRXM
  is '登记人姓名';
comment on column T_AF_XLRYB.DJRJH
  is '登记人警号';
comment on column T_AF_XLRYB.DJRSFZH
  is '登记人身份证号';
comment on column T_AF_XLRYB.DJSJ
  is '登记时间';
comment on column T_AF_XLRYB.DJDWDM
  is '登记单位代码';
comment on column T_AF_XLRYB.DJDWMC
  is '登记单位名称';
comment on column T_AF_XLRYB.CZRXM
  is '操作人姓名';
comment on column T_AF_XLRYB.CZRJH
  is '操作人警号';
comment on column T_AF_XLRYB.CZRSFZH
  is '操作人身份证号';
comment on column T_AF_XLRYB.CZDWDM
  is '操作单位代码';
comment on column T_AF_XLRYB.CZDWMC
  is '操作单位名称';
comment on column T_AF_XLRYB.CZSJ
  is '操作时间';
comment on column T_AF_XLRYB.CZBS
  is '操作标识（0：正常  ； 1：注销）';
comment on column T_AF_XLRYB.ZW
  is '职务：（1：民警；2：巡逻民警；3：社区干部；4：群众）';
comment on column T_AF_XLRYB.ZWMS
  is '职务描述：（1：民警；2：巡逻民警；3：社区干部；4：群众）';

 
 
 
 -- Create table
create table T_AF_XLPCDXB
(
  ID       VARCHAR2(27) not null,
  ZAXLID   VARCHAR2(27),
  PCRYXM   VARCHAR2(30),
  PCRYSFZH VARCHAR2(18),
  PCRYLXDH VARCHAR2(20),
  DJRXM    VARCHAR2(30),
  DJRJH    VARCHAR2(20),
  DJRSFZH  VARCHAR2(18),
  DJSJ     DATE,
  DJDWDM   VARCHAR2(12),
  DJDWMC   VARCHAR2(120),
  CZRXM    VARCHAR2(30),
  CZRJH    VARCHAR2(20),
  CZRSFZH  VARCHAR2(18),
  CZDWDM   VARCHAR2(12),
  CZDWMC   VARCHAR2(120),
  CZSJ     DATE,
  CZBS     VARCHAR2(1)
);
-- Add comments to the table 
comment on table T_AF_XLPCDXB
  is '治安巡逻--盘查人员表';
-- Add comments to the columns 
comment on column T_AF_XLPCDXB.ID
  is '主键（6位行政区划 + 14位时间 + 7位序列）';
comment on column T_AF_XLPCDXB.ZAXLID
  is '治安巡逻ID（关联治安巡逻表）';
comment on column T_AF_XLPCDXB.PCRYXM
  is '盘查对象姓名';
comment on column T_AF_XLPCDXB.PCRYSFZH
  is '盘查对象身份证号';
comment on column T_AF_XLPCDXB.PCRYLXDH
  is '盘查对象联系电话';
comment on column T_AF_XLPCDXB.DJRXM
  is '登记人姓名';
comment on column T_AF_XLPCDXB.DJRJH
  is '登记人警号';
comment on column T_AF_XLPCDXB.DJRSFZH
  is '登记人身份证号';
comment on column T_AF_XLPCDXB.DJSJ
  is '登记时间';
comment on column T_AF_XLPCDXB.DJDWDM
  is '登记单位代码';
comment on column T_AF_XLPCDXB.DJDWMC
  is '登记单位名称';
comment on column T_AF_XLPCDXB.CZRXM
  is '操作人姓名';
comment on column T_AF_XLPCDXB.CZRJH
  is '操作人警号';
comment on column T_AF_XLPCDXB.CZRSFZH
  is '操作人身份证号';
comment on column T_AF_XLPCDXB.CZDWDM
  is '操作单位代码';
comment on column T_AF_XLPCDXB.CZDWMC
  is '操作单位名称';
comment on column T_AF_XLPCDXB.CZSJ
  is '操作时间';
comment on column T_AF_XLPCDXB.CZBS
  is '操作标识（0：正常 ； 1：注销）';
  
  
  
-- Create sequence 
create sequence SEQ_ZALXRYID
minvalue 1000001
maxvalue 9999999
start with 1000001
increment by 1
cache 20
cycle;



-- Create sequence 
create sequence SEQ_ZALXPCRYID
minvalue 1000001
maxvalue 9999999
start with 1000001
increment by 1
cache 20
cycle;
  