-- Add/modify columns 
alter table T_ZA_JG_JBXX add wwm varchar2(60);
alter table T_ZA_JG_JBXX add zgbm varchar2(40);
-- Add comments to the columns 
comment on column T_ZA_JG_JBXX.wwm
  is '外文名称';
comment on column T_ZA_JG_JBXX.zgbm
  is '主管部门';
-- Add/modify columns 
alter table T_ZA_JG_JBXX modify HYLB VARCHAR2(50);  


insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (58140, 'ZAGL_ZDDJ', '重点等级', '4', '一般', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (58141, 'ZDY_THJYXM', '经营项目', '1', '住宿', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (58142, 'ZDY_THJYXM', '经营项目', '2', '餐饮（餐厅）', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (58143, 'ZDY_THJYXM', '经营项目', '3', '歌舞（歌舞厅）', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (58144, 'ZDY_THJYXM', '经营项目', '4', '洗浴（桑拿）', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (58145, 'ZDY_THJYXM', '经营项目', '5', '美容美发', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (58146, 'ZDY_THJYXM', '经营项目', '6', '茶座', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (58147, 'ZDY_THJYXM', '经营项目', '7', '酒吧', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (58148, 'ZDY_THJYXM', '经营项目', '8', '停车场', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (58149, 'ZDY_THJYXM', '经营项目', '9', '寄存室', '', '', '1', null);

commit;


-- Add/modify columns 
alter table T_ZA_DW_TZHY add zrmj varchar2(30);
alter table T_ZA_DW_TZHY add mjdh varchar2(20);
alter table T_ZA_DW_TZHY add pcsdh varchar2(20);
alter table T_ZA_DW_TZHY add zazrdwmc varchar2(120);
alter table T_ZA_DW_TZHY add zazrdwdm varchar2(12);
-- Add comments to the columns 
comment on column T_ZA_DW_TZHY.zrmj
  is '责任民警';
comment on column T_ZA_DW_TZHY.mjdh
  is '民警电话';
comment on column T_ZA_DW_TZHY.pcsdh
  is '派出所电话';
comment on column T_ZA_DW_TZHY.zazrdwmc
  is '治安责任单位名称';
comment on column T_ZA_DW_TZHY.zazrdwdm
  is '治安责任单位代码';

