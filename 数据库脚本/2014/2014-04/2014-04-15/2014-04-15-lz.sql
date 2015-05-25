insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (t_common_dictionary_id.nextval, 'ZDY_MJHJQK', '民警获奖情况', '1', '省十佳社区（驻村）民警', '', '', '1', null);
insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (t_common_dictionary_id.nextval, 'ZDY_MJHJQK', '民警获奖情况', '2', '市十佳社区（驻村）民警', '', '', '1', null);
insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (t_common_dictionary_id.nextval, 'ZDY_MJHJQK', '民警获奖情况', '3', '县十佳社区（驻村）民警', '', '', '1', null);
insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (t_common_dictionary_id.nextval, 'ZDY_MJHJQK', '民警获奖情况', '4', '全国优秀社区（驻村）民警', '', '', '1', null);
insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (t_common_dictionary_id.nextval, 'ZDY_MJHJQK', '民警获奖情况', '5', '全省优秀社区民警', '', '', '1', null);
insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (t_common_dictionary_id.nextval, 'ZDY_MJHJQK', '民警获奖情况', '6', '全市优秀社区（驻村）民警', '', '', '1', null);
insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (t_common_dictionary_id.nextval, 'ZDY_MJHJQK', '民警获奖情况', '7', '全县社区（驻村）民警', '', '', '1', null);
commit;


-- Add/modify columns 
alter table T_COMMON_USER_LXFS add hjsj date;
alter table T_COMMON_USER_LXFS add hjqk varchar2(10);
-- Add comments to the columns 
comment on column T_COMMON_USER_LXFS.hjsj
  is '获奖时间';
comment on column T_COMMON_USER_LXFS.hjqk
  is '获奖情况';
  
  
  -- Add/modify columns 
alter table T_COMMON_USER_LXFS add bz varchar2(200);
-- Add comments to the columns 
comment on column T_COMMON_USER_LXFS.bz
  is '备注';