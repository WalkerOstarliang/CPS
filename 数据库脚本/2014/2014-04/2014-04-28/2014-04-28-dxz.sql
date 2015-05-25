insert into t_common_dictionary values
(seq_common.nextval,'ZDY_BADJ','备案等级','01','一级','','','1','');
insert into t_common_dictionary values
(seq_common.nextval,'ZDY_BADJ','备案等级','02','二级','','','1','');
insert into t_common_dictionary values
(seq_common.nextval,'ZDY_BADJ','备案等级','03','三级','','','1','');
commit;

-- Add/modify columns 
alter table T_ZA_DW_JFDW add scslsj date;
alter table T_ZA_DW_JFDW add badj varchar2(3);
-- Add comments to the columns 
comment on column T_ZA_DW_JFDW.scslsj
  is '首次申领时间';
comment on column T_ZA_DW_JFDW.badj
  is '备案等级';
  
update T_COMMON_ZDRYLB set parent_dm = 'dl' where dm in('01','02','03','04','05','06','07');
commit;  