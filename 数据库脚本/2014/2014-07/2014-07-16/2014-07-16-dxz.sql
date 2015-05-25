-- Add/modify columns 
alter table T_LSGL_RK_LDRKZZXX add qx varchar2(200);
-- Add comments to the columns 
comment on column T_LSGL_RK_LDRKZZXX.qx
  is '流动人口去向';