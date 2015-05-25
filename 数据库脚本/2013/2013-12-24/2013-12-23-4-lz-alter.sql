-- Add/modify columns 
alter table T_COMMON_ORGANIZATION_FJ modify ZW VARCHAR2(20);


-- Add/modify columns 
alter table T_COMMON_ORGANIZATION_OTHER modify JWMSD varchar2(10);
alter table T_COMMON_ORGANIZATION_OTHER modify ZBMSB varchar2(10);
alter table T_COMMON_ORGANIZATION_OTHER modify JWMSS varchar2(10);
alter table T_COMMON_ORGANIZATION_OTHER modify ZBMSL varchar2(10);



-- Add/modify columns 
alter table T_COMMON_ORGANIZATION_OTHER add djsj date;
-- Add comments to the columns 
comment on column T_COMMON_ORGANIZATION_OTHER.djsj
  is '登记时间';
  
  
  
  insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (800099, 'ZDY_PCSDJ', '等级', '5', '五级', '', '', '1', null);

commit;