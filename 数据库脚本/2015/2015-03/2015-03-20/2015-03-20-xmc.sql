-- Create table
create table T_COMMON_DATAORG
(
  ORGID   VARCHAR2(5),
  ORGCODE VARCHAR2(12),
  PARENT_CODE VARCHAR2(12),
  ORGNAME VARCHAR2(120),
  QLEVE   VARCHAR2(1),
  HAVEADD VARCHAR2(1)
)
tablespace TS_DT_SQJW
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
-- Add comments to the table 
comment on table T_COMMON_DATAORG
  is '页面查询条件单位配置，以及是否具有新增权限配置表';
-- Add comments to the columns 
comment on column T_COMMON_DATAORG.ORGCODE
  is '机构代码';
comment on column T_COMMON_DATAORG.ORGNAME
  is '机构名称';
comment on column T_COMMON_DATAORG.QLEVE
  is '层级 1 ，2，3，4，5';
comment on column T_COMMON_DATAORG.HAVEADD
  is '是否有新增数据权限 0：无 1：有';
