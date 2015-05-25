-- Add/modify columns 
alter table T_LSGL_CZFW_CZRXX add djsj date;
alter table T_LSGL_CZFW_CZRXX add czsj date;
-- Add comments to the columns 
comment on column T_LSGL_CZFW_CZRXX.djsj
  is '登记时间';
comment on column T_LSGL_CZFW_CZRXX.czsj
  is '操作时间';
  
  -- Add comments to the columns 
comment on column T_LSGL_CZFW_CZRXX.CZRZT
  is '1普通 2登记负责人';