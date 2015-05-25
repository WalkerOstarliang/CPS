-- Add/modify columns 
alter table T_LSGL_RK_JWRKXX add GJ VARCHAR2(3);
alter table T_LSGL_RK_JWRKXX add ZWM VARCHAR2(30);
alter table T_LSGL_RK_JWRKXX add XB VARCHAR2(1);
alter table T_LSGL_RK_JWRKXX add CSRQ date;
alter table T_LSGL_RK_JWRKXX add LXDH VARCHAR2(20);
alter table T_LSGL_RK_JWRKXX add FWCS VARCHAR2(40);
alter table T_LSGL_RK_JWRKXX add ZW VARCHAR2(40);
alter table T_LSGL_RK_JWRKXX add LXDHBZ VARCHAR2(40);
-- Add comments to the columns 
comment on column T_LSGL_RK_JWRKXX.GJ
  is '国籍';
comment on column T_LSGL_RK_JWRKXX.ZWM
  is '中文名';
comment on column T_LSGL_RK_JWRKXX.XB
  is '性别';
comment on column T_LSGL_RK_JWRKXX.CSRQ
  is '出生日期';
comment on column T_LSGL_RK_JWRKXX.LXDH
  is '联系电话';
comment on column T_LSGL_RK_JWRKXX.FWCS
  is '服务处所';
comment on column T_LSGL_RK_JWRKXX.ZW
  is '职务';
comment on column T_LSGL_RK_JWRKXX.LXDHBZ
  is '联系电话备注';

  
-- Create/Recreate primary, unique and foreign key constraints 
alter table T_LSGL_RK_JWRKXX
add constraint T_LSGL_RK_JWRKXX_rjzjzl_unique unique (GJ, RJZJZL, RJZJHM, YWX, YWM, XB);
-- Create/Recreate primary, unique and foreign key constraints 
alter table T_LSGL_RK_JWRKXX add constraint T_LSGL_RK_JWRKXX_JWBH primary key (JWBH);
alter table T_LSGL_RK_JWRKXX add constraint T_LSGL_RK_JWRKXX_RJZJZL_UNIQUE unique (GJ, RJZJZL, RJZJHM, YWX, YWM, XB);