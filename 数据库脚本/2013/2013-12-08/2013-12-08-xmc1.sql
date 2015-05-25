insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'ZDY_JZJG', '建筑结构', '01', '土木结构', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'ZDY_JZJG', '建筑结构', '02', '砖木结构', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'ZDY_JZJG', '建筑结构', '03', '砖混结构', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'ZDY_JZJG', '建筑结构', '04', '框架结构', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'ZDY_JZJG', '建筑结构', '05', '剪力结构', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'ZDY_JZJG', '建筑结构', '06', '钢结构', '', '', '1', null);

commit;

insert into t_common_parameter (ID, PROKEY, PROVALUE, DESCR)
values (9, 'pgis.url', 'http://10.143.2.73:91/PGIS_APP_Entity', 'PGIS地图链接地址');

commit;

delete from t_common_dictionary where zdlb='ZAGL_XFDJ';

commit;

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'ZAGL_XFDJ', '消防等级', '1', '一级', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'ZAGL_XFDJ', '消防等级', '2', '二级', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'ZAGL_XFDJ', '消防等级', '3', '三级', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'ZAGL_XFDJ', '消防等级', '4', '四级', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'ZAGL_XFDJ', '消防等级', '5', '五级', '', '', '1', null);

commit;

-- Add comments to the columns 
comment on column T_COMMON_STXX.STBM
  is '实体编码 12位社区编码 + 5位街路巷代码 + 6门（楼）址或标志物名或兴趣点名代码';

-- Add/modify columns 
alter table T_COMMON_DZJLX modify DM not null;
