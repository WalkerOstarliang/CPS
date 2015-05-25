insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (800065, 'FW_ZXYY', '房屋注销原因', '9', '其他', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (800064, 'FW_ZXYY', '房屋注销原因', '3', '拆迁', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (800063, 'FW_ZXYY', '房屋注销原因', '2', '出售', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (800062, 'FW_ZXYY', '房屋注销原因', '1', '停租', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (800061, 'FW_ZXYY', '房屋注销原因', '0', '出租', '', '', '1', null);






-- Add/modify columns 
alter table T_LSGL_CZFW_CZXX modify CZFWBH VARCHAR2(30);