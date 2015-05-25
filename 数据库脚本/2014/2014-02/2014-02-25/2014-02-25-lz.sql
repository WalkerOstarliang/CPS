-- Add/modify columns 
alter table T_LSGL_LDRK_JZZXX add dyzt varchar2(2);
-- Add comments to the columns 
comment on column T_LSGL_LDRK_JZZXX.JZZDYZT
  is '10  未制证   20 已制证  30 注销 ';
comment on column T_LSGL_LDRK_JZZXX.dyzt
  is '1 首次打印  2 遗失补打 3 错正重打';
  
  
  
  
  
insert into t_common_dictionary values(T_COMMON_DICTIONARY_ID.Nextval,'ZDY_JZZ_DYZT','居住证状态','1','首次打印','','','1','');
insert into t_common_dictionary values(T_COMMON_DICTIONARY_ID.Nextval,'ZDY_JZZ_DYZT','居住证状态','2','遗失补打','','','1','');
insert into t_common_dictionary values(T_COMMON_DICTIONARY_ID.Nextval,'ZDY_JZZ_DYZT','居住证状态','3','错正重打','','','1','');
commit;