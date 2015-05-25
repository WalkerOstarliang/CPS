insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (t_common_dictionary_id.nextval, 'ZDY_SFQX', '是否清晰', '0', '不清晰', '', '', '1', null);
insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (t_common_dictionary_id.nextval, 'ZDY_SFQX', '是否清晰', '1', '清晰', '', '', '1', null);
commit;


-- Add/modify columns 
alter table T_ZA_DW_NBAQJC modify XHMS VARCHAR2(600);


insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (t_common_dictionary_id.nextval, 'XGY_CQORXZSQ', '城区或乡镇社区协管员', '0', '城区', '', '', '1', null);
insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (t_common_dictionary_id.nextval, 'XGY_CQORXZSQ', '城区或乡镇社区协管员', '1', '乡镇', '', '', '1', null);
commit;



insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (t_common_dictionary_id.nextval, 'ZDY_HTQX', '合同期限', '0', '一年', '', '', '1', null);
insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (t_common_dictionary_id.nextval, 'ZDY_HTQX', '合同期限', '1', '一年以上', '', '', '1', null);
commit;


insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (t_common_dictionary_id.nextval, 'ZDY_GZLY', '工资来源', '0', '财政拨款', '', '', '1', null);
insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (t_common_dictionary_id.nextval, 'ZDY_GZLY', '工资来源', '1', '自筹', '', '', '1', null);
commit;


insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (t_common_dictionary_id.nextval, 'ZDY_GZE', '工资额', '0', '800-1200', '', '', '1', null);
insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (t_common_dictionary_id.nextval, 'ZDY_GZE', '工资额', '1', '1201-1500', '', '', '1', null);
insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (t_common_dictionary_id.nextval, 'ZDY_GZE', '工资额', '2', '1500以上', '', '', '1', null);
commit;


insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (t_common_dictionary_id.nextval, 'ZDY_5X1J', '五险一金', '0', '无', '', '', '1', null);
insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (t_common_dictionary_id.nextval, 'ZDY_5X1J', '五险一金', '1', '五险', '', '', '1', null);
insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (t_common_dictionary_id.nextval, 'ZDY_5X1J', '五险一金', '2', '五险一金', '', '', '1', null);
commit;




-- Add/modify columns 
alter table T_COMMON_ORGANIZATION_FJ add pysj date;
alter table T_COMMON_ORGANIZATION_FJ add cqorxz varchar2(2);
alter table T_COMMON_ORGANIZATION_FJ add htqx varchar2(2);
alter table T_COMMON_ORGANIZATION_FJ add gzly varchar2(2);
alter table T_COMMON_ORGANIZATION_FJ add gze varchar2(2);
alter table T_COMMON_ORGANIZATION_FJ add wxyj varchar2(2);
-- Add comments to the columns 
comment on column T_COMMON_ORGANIZATION_FJ.pysj
  is '聘用时间';
comment on column T_COMMON_ORGANIZATION_FJ.cqorxz
  is '城区或乡镇社区协管员';
comment on column T_COMMON_ORGANIZATION_FJ.htqx
  is '合同期限';
comment on column T_COMMON_ORGANIZATION_FJ.gzly
  is '工资来源';
comment on column T_COMMON_ORGANIZATION_FJ.gze
  is '工资额';
comment on column T_COMMON_ORGANIZATION_FJ.wxyj
  is '五险一金';