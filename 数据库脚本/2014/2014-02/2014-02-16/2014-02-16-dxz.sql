-- Add/modify columns 
alter table T_LSGL_RK_GXR add zjlx varchar2(3);
alter table T_LSGL_RK_GXR add wwx varchar2(200);
alter table T_LSGL_RK_GXR add wwm varchar2(200);
-- Add comments to the columns 
comment on column T_LSGL_RK_GXR.zjlx
  is '证件类型';
comment on column T_LSGL_RK_GXR.wwx
  is '外文姓';
comment on column T_LSGL_RK_GXR.wwm
  is '外文名';
  
  
  -- Add comments to the columns 
comment on column T_LSGL_RK_GXR.GXRSFZH
  is '关系人证件号码';
comment on column T_LSGL_RK_GXR.CZBS
  is '操作标示(1:新增 2：修改  3：删除)';
  