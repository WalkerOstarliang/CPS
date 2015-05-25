-- Add/modify columns 
alter table T_COMMON_STXX add djrsfzh varchar2(18);
-- Add comments to the columns 
comment on column T_COMMON_STXX.djrsfzh
  is '登记人身份证号';
  
-- Add/modify columns 
alter table T_COMMON_STXX add czrsfzh varchar2(18);
-- Add comments to the columns 
comment on column T_COMMON_STXX.czrsfzh
  is '操作人身份证号';
    
-- Add/modify columns 
alter table T_COMMON_DZXX add djrsfzh varchar2(18);
-- Add comments to the columns 
comment on column T_COMMON_DZXX.djrsfzh
  is '登记人身份证号';
  
  
-- Add/modify columns 
alter table T_LSGL_FW_JBXX add djrsfzh varchar2(18);
-- Add comments to the columns 
comment on column T_LSGL_FW_JBXX.djrsfzh
  is '登记人身份证号';
  
  
-- Add/modify columns 
alter table T_LSGL_CZFW_JBXX add djrsfzh varchar2(18);
-- Add comments to the columns 
comment on column T_LSGL_CZFW_JBXX.djrsfzh
  is '登记人身份证号';
  
-- Add/modify columns 
alter table T_COMMON_DZJLX add djrsfzh varchar2(18);
-- Add comments to the columns 
comment on column T_COMMON_DZJLX.djrsfzh
  is '登记人身份证号';
  
-- Add/modify columns 
alter table T_LSGL_RK_CZRK add djrsfzh varchar2(18);
alter table T_LSGL_RK_CZRK add czrsfzh varchar2(18);
-- Add comments to the columns 
comment on column T_LSGL_RK_CZRK.djrsfzh
  is '登记人身份证号';
comment on column T_LSGL_RK_CZRK.czrsfzh
  is '操作人身份证号';
  
-- Add/modify columns 
alter table T_LSGL_RK_LDRKZZXX add djrsfzh varchar2(18);
alter table T_LSGL_RK_LDRKZZXX add czrsfzh varchar2(18);
-- Add comments to the columns 
comment on column T_LSGL_RK_LDRKZZXX.djrsfzh
  is '登记人身份证号';
comment on column T_LSGL_RK_LDRKZZXX.czrsfzh
  is '操作人身份证号';
  
-- Add/modify columns 
alter table T_LSGL_RK_JZRKXX add djrsfzh varchar2(18);
alter table T_LSGL_RK_JZRKXX add czrsfzh varchar2(18);
-- Add comments to the columns 
comment on column T_LSGL_RK_JZRKXX.djrsfzh
  is '登记人身份证号';
comment on column T_LSGL_RK_JZRKXX.czrsfzh
  is '操作人身份证号';
  
  
-- Add/modify columns 
alter table T_LSGL_RK_JWRKXX add djrsfzh varchar2(18);
alter table T_LSGL_RK_JWRKXX add czrsfzh varchar2(18);
-- Add comments to the columns 
comment on column T_LSGL_RK_JWRKXX.djrsfzh
  is '登记人身份证号';
comment on column T_LSGL_RK_JWRKXX.czrsfzh
  is '操作人身份证号';
  
  
-- Add/modify columns 
alter table T_LSGL_RK_WLHCZHK add djrsfzh varchar2(18);
alter table T_LSGL_RK_WLHCZHK add czrsfzh varchar2(18);
-- Add comments to the columns 
comment on column T_LSGL_RK_WLHCZHK.djrsfzh
  is '登记人身份证号';
comment on column T_LSGL_RK_WLHCZHK.czrsfzh
  is '操作人身份证号';
  
  
-- Add/modify columns 
alter table T_LSGL_LDRK_JZZXX add djrsfzh varchar2(18);
alter table T_LSGL_LDRK_JZZXX add xgrsfzh varchar2(18);
-- Add comments to the columns 
comment on column T_LSGL_LDRK_JZZXX.djrsfzh
  is '登记人身份证号';
comment on column T_LSGL_LDRK_JZZXX.xgrsfzh
  is '修改人身份证号';
  
-- Add/modify columns 
alter table T_LSGL_RK_JHSY add djrsfzh varchar2(18);
-- Add comments to the columns 
comment on column T_LSGL_RK_JHSY.djrsfzh
  is '登记人身份证号码';
  
  
-- Add/modify columns 
alter table T_LSGL_RK_ZPXX add djrsfzh varchar2(18);
-- Add comments to the columns 
comment on column T_LSGL_RK_ZPXX.djrsfzh
  is '登记人身份证号';
  

-- Add/modify columns 
alter table T_LSGL_RK_GXR add djrsfzh varchar2(18);
alter table T_LSGL_RK_GXR add czrsfzh varchar2(18);
-- Add comments to the columns 
comment on column T_LSGL_RK_GXR.djrsfzh
  is '登记人身份证号';
comment on column T_LSGL_RK_GXR.czrsfzh
  is '操作人身份证号';
  
-- Add/modify columns 
alter table T_LSGL_RK_TMTZ add czrsfzh varchar2(18);
alter table T_LSGL_RK_TMTZ add djrsfzh varchar2(18);
-- Add comments to the columns 
comment on column T_LSGL_RK_TMTZ.czrsfzh
  is '操作人身份证号';
comment on column T_LSGL_RK_TMTZ.djrsfzh
  is '登记人身份证号';
  
-- Add/modify columns 
alter table T_LSGL_RY_LXFS add czrsfzh varchar2(18);
alter table T_LSGL_RY_LXFS add djrsfzh varchar2(18);
-- Add comments to the columns 
comment on column T_LSGL_RY_LXFS.czrsfzh
  is '操作人身份证号';
comment on column T_LSGL_RY_LXFS.djrsfzh
  is '登记人身份证号';
  