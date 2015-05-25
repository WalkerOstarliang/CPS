-- Add/modify columns 
alter table T_LSGL_LDRK_JZZXX add ZZBH VARCHAR2(30);
alter table T_LSGL_LDRK_JZZXX add ZZDWDM VARCHAR2(12);
alter table T_LSGL_LDRK_JZZXX add ZZDWMC VARCHAR2(120);
alter table T_LSGL_LDRK_JZZXX add ZZSJ date;
-- Add comments to the columns 
comment on column T_LSGL_LDRK_JZZXX.ZZBH
  is '暂住编号';
comment on column T_LSGL_LDRK_JZZXX.ZZDWDM
  is '制证单位代码';
comment on column T_LSGL_LDRK_JZZXX.ZZDWMC
  is '制证单位名称';
comment on column T_LSGL_LDRK_JZZXX.ZZSJ
  is '制证时间';

  
  -- Create/Recreate indexes 
create index T_LSGL_LDRK_JZZXX_zzbh on T_LSGL_LDRK_JZZXX (zzbh);

-- Create/Recreate indexes 
create unique index T_LSGL_RK_LDRKZZXX_zzbh on T_LSGL_RK_LDRKZZXX (zzbh);

  