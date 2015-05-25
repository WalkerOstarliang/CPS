insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'ZDY_LCHZ', '楼层后缀', '1', '层', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'ZDY_LCHZ', '楼层后缀', '2', '栋', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'ZDY_LCHZ', '楼层后缀', '3', '排', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'ZDY_LCHZ', '楼层后缀', '4', '舍', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'ZDY_LCHZ', '楼层后缀', '9', '楼', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'ZDY_SHHZ', '室号后缀', '1', '室', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'ZDY_SHHZ', '室号后缀', '2', '号', '', '', '1', null);

commit;

-- Add/modify columns 
alter table T_COMMON_DZXX modify DZBM not null;

-- Add/modify columns 
alter table T_COMMON_DZXX modify DZBM VARCHAR2(30);
