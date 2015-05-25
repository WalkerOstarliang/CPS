-- Add/modify columns 
alter table T_IMPORT_SYRKS add WWUSERNAME VARCHAR2(200);
alter table T_IMPORT_SYRKS add WWUSERSFZH VARCHAR2(50);
-- Add comments to the columns 
comment on column T_IMPORT_SYRKS.WWUSERNAME
  is '外网导入用户名';
comment on column T_IMPORT_SYRKS.WWUSERSFZH
  is '外网导入用户身份证号';



  -- Add/modify columns 
alter table t_lsgl_rk_czrk add wwzh VARCHAR2(200);
alter table t_lsgl_rk_czrk add wwsfzh VARCHAR2(50);
-- Add comments to the columns 
comment on column t_lsgl_rk_czrk.wwzh
  is '外网用户名';
comment on column t_lsgl_rk_czrk.wwsfzh
  is '外网用户身份证';
  

  -- Add/modify columns 
alter table t_lsgl_rk_ldrkzzxx add wwzh VARCHAR2(200);
alter table t_lsgl_rk_ldrkzzxx add wwsfzh VARCHAR2(50);
-- Add comments to the columns 
comment on column t_lsgl_rk_ldrkzzxx.wwzh
  is '外网用户名';
comment on column t_lsgl_rk_ldrkzzxx.wwsfzh
  is '外网用户身份证';
  
  
  -- Add/modify columns 
alter table t_lsgl_rk_jzrkxx add wwzh VARCHAR2(200);
alter table t_lsgl_rk_jzrkxx add wwsfzh VARCHAR2(50);
-- Add comments to the columns 
comment on column t_lsgl_rk_jzrkxx.wwzh
  is '外网用户名';
comment on column t_lsgl_rk_jzrkxx.wwsfzh
  is '外网用户身份证';
  
-- Add/modify columns 
alter table T_LSGL_RK_WLHCZHK add wwzh VARCHAR2(200);
alter table T_LSGL_RK_WLHCZHK add wwsfzh VARCHAR2(50);
-- Add comments to the columns 
comment on column T_LSGL_RK_WLHCZHK.wwzh
  is '外网用户名';
comment on column T_LSGL_RK_WLHCZHK.wwsfzh
  is '外网用户身份证';

-- Add/modify columns 
alter table T_IMPORT_CYRYS add WWUSERNAME VARCHAR2(200);
alter table T_IMPORT_CYRYS add WWUSERSFZH VARCHAR2(50);
-- Add comments to the columns 
comment on column T_IMPORT_CYRYS.WWUSERNAME
  is '外网用户名';
comment on column T_IMPORT_CYRYS.WWUSERSFZH
  is '外网用户身份证号';
  
  
