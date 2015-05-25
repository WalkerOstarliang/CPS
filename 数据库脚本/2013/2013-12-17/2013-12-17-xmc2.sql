delete from t_common_dictionary where zdlb='ZDDXLB';
commit;
insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'ZDDXLB', '重点对象类别', '01', '涉恐人员', '', '', '1', 1);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'ZDDXLB', '重点对象类别', '02', '涉稳人员', '', '', '1', 2);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'ZDDXLB', '重点对象类别', '03', '在逃人员', '', '', '1', 3);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'ZDDXLB', '重点对象类别', '04', '涉毒人员', '', '', '1', 4);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'ZDDXLB', '重点对象类别', '05', '刑事犯罪前科人员', '', '', '1', 5);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'ZDDXLB', '重点对象类别', '06', '肇事肇祸精神病人', '', '', '1', 6);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'ZDDXLB', '重点对象类别', '07', '上访人员', '', '', '1', 7);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'ZDDXLB', '重点对象类别', '08', '工作对象', '', '', '1', 8);
commit;