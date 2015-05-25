-- Add/modify columns 
alter table T_LSGL_FW_JBXX add FZZJLX VARCHAR2(6);
alter table T_LSGL_FW_JBXX add BZ VARCHAR2(300);
-- Add comments to the columns 
comment on column T_LSGL_FW_JBXX.FZZJLX
  is '房主证件类型';
comment on column T_LSGL_FW_JBXX.BZ
  is '备注';
