insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'ZDY_HYLB', '行业类别', '09', '商铺门店', '', '', '1', null);
commit;

delete from t_common_dictionary where zdlb='ZDY_RYTSSX';
commit;
insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'ZDY_RYTSSX', '人员特殊属性', '1', '重性精神病人', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'ZDY_RYTSSX', '人员特殊属性', '2', '安保人员', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'ZDY_RYTSSX', '人员特殊属性', '3', '持枪资格人员', '', '', '1', null);
commit;
