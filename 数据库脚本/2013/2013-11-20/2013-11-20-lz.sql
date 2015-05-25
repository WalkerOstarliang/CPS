-- Add/modify columns 
alter table T_LSGL_FW_JBXX add FRDBSFZH VARCHAR2(20);
alter table T_LSGL_FW_JBXX add FRDBXM VARCHAR2(30);
alter table T_LSGL_FW_JBXX add FRDBLXDH VARCHAR2(20);
-- Add comments to the columns 
comment on column T_LSGL_FW_JBXX.FRDBSFZH
  is '公有房屋法人代表身份证号';
comment on column T_LSGL_FW_JBXX.FRDBXM
  is '公有房屋法人代表姓名';
comment on column T_LSGL_FW_JBXX.FRDBLXDH
  is '公有房屋法人代表联系方式';
  
 