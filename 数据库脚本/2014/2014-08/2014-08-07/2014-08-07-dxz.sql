-- Add/modify columns 
alter table T_LSGL_LDRK_JZZXX add sfzh varchar2(18);
alter table T_LSGL_LDRK_JZZXX add xb varchar2(2);
alter table T_LSGL_LDRK_JZZXX add hjdqh varchar2(6);
alter table T_LSGL_LDRK_JZZXX add rkfwglid varchar2(30);
-- Add comments to the columns 
comment on column T_LSGL_LDRK_JZZXX.sfzh
  is '身份证号';
comment on column T_LSGL_LDRK_JZZXX.xb
  is '性别';
comment on column T_LSGL_LDRK_JZZXX.hjdqh
  is '户籍地区划';
comment on column T_LSGL_LDRK_JZZXX.rkfwglid
  is '人口房屋关联ID';