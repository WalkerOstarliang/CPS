-- Add/modify columns 
alter table T_ZDRY_ZFBAFK add thyy varchar2(200);
alter table T_ZDRY_ZFBAFK add czrxm varchar2(30);
alter table T_ZDRY_ZFBAFK add czrid varchar2(30);
alter table T_ZDRY_ZFBAFK add czdwmc varchar2(120);
alter table T_ZDRY_ZFBAFK add czdwid varchar2(30);
-- Add comments to the columns 
comment on column T_ZDRY_ZFBAFK.thyy
  is '退回原因';
comment on column T_ZDRY_ZFBAFK.czrxm
  is '操作人姓名';
comment on column T_ZDRY_ZFBAFK.czrid
  is '操作人ID';
comment on column T_ZDRY_ZFBAFK.czdwmc
  is '操作单位名称';
comment on column T_ZDRY_ZFBAFK.czdwid
  is '操作单位ID';
