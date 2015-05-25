
-- 居住证打印数据库脚本
-- Add/modify columns 
alter table T_LSGL_LDRK_JZZXX add DYRJH varchar2(30);
alter table T_LSGL_LDRK_JZZXX add DYRXM varchar2(30);
alter table T_LSGL_LDRK_JZZXX add DYIP varchar2(100);
alter table T_LSGL_LDRK_JZZXX add DYSJ date;
alter table T_LSGL_LDRK_JZZXX add DYDWDM varchar2(12);
alter table T_LSGL_LDRK_JZZXX add DYDWMC varchar2(100);
-- Add comments to the columns 
comment on column T_LSGL_LDRK_JZZXX.DYRJH
  is '打印人警号';
comment on column T_LSGL_LDRK_JZZXX.DYRXM
  is '打印人姓名';
comment on column T_LSGL_LDRK_JZZXX.DYIP
  is '打印机子IP地址';
comment on column T_LSGL_LDRK_JZZXX.DYSJ
  is '打印居住证时间';
comment on column T_LSGL_LDRK_JZZXX.DYDWDM
  is '打印居住证单位代码';
comment on column T_LSGL_LDRK_JZZXX.DYDWMC
  is '打印居住证单位名称';
