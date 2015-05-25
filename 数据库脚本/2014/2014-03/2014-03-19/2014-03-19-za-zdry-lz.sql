-- Add/modify columns 
alter table T_ZA_DXHDXX add djrsfzh varchar2(18);
alter table T_ZA_DXHDXX add czrsfzh varchar2(18);
-- Add comments to the columns 
comment on column T_ZA_DXHDXX.djrsfzh
  is '登记人身份证号码';
comment on column T_ZA_DXHDXX.czrsfzh
  is '操作人身份证号码';
  
  
  
-- Add/modify columns 
alter table T_ZDRY_WFFZJL add czrsfzh varchar2(18);
-- Add comments to the columns 
comment on column T_ZDRY_WFFZJL.czrsfzh
  is '操作人身份证号码';
  
-- Add/modify columns 
alter table T_ZDRY_XSBX add djrsfzh varchar2(18);
alter table T_ZDRY_XSBX add czrsfzh varchar2(18);
-- Add comments to the columns 
comment on column T_ZDRY_XSBX.djrsfzh
  is '登记人身份证号码';
comment on column T_ZDRY_XSBX.czrsfzh
  is '操作人身份证号码';
  
  
-- Add/modify columns 
alter table T_ZDRY_WTXX add wtrsfzh varchar2(18);
alter table T_ZDRY_WTXX add jgrsfzh varchar2(18);
-- Add comments to the columns 
comment on column T_ZDRY_WTXX.wtrsfzh
  is '委托人身份证号码';
comment on column T_ZDRY_WTXX.jgrsfzh
  is '接管人身份证号码';