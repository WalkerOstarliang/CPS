-- Add/modify columns 
alter table T_ZA_DWTB add DJRXM varchar2(30);
alter table T_ZA_DWTB add DJRJH varchar2(20);
alter table T_ZA_DWTB add DJDWDM varchar2(12);
alter table T_ZA_DWTB add DJDWMC varchar2(100);
-- Add comments to the columns 
comment on column T_ZA_DWTB.DJRXM
  is '登记人姓名';
comment on column T_ZA_DWTB.DJRJH
  is '登记人警号';
comment on column T_ZA_DWTB.DJDWDM
  is '登记单位代码';
comment on column T_ZA_DWTB.DJDWMC
  is '登记单位名称';