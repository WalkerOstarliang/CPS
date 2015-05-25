-- Add/modify columns 
alter table T_COMMON_ORGANIZATION_FJ add CZSJ date default sysdate;
alter table T_COMMON_ORGANIZATION_FJ add CZBS varchar2(1);
alter table T_COMMON_ORGANIZATION_FJ add CZRXM varchar2(30);
alter table T_COMMON_ORGANIZATION_FJ add CZDWDM varchar2(12);
alter table T_COMMON_ORGANIZATION_FJ add CZDWMC varchar2(120);
-- Add comments to the columns 
comment on column T_COMMON_ORGANIZATION_FJ.CZSJ
  is '操作时间';
comment on column T_COMMON_ORGANIZATION_FJ.CZBS
  is '操作标示';
comment on column T_COMMON_ORGANIZATION_FJ.CZRXM
  is '操作人姓名';
comment on column T_COMMON_ORGANIZATION_FJ.CZDWDM
  is '操作单位代码';
comment on column T_COMMON_ORGANIZATION_FJ.CZDWMC
  is '操作单位名称';
