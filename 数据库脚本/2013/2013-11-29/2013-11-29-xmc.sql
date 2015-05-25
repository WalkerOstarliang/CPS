
insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'ZDY_CXFL', '城乡分类', '100', '城镇', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'ZDY_CXFL', '城乡分类', '110', '城区', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'ZDY_CXFL', '城乡分类', '111', '主城区', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'ZDY_CXFL', '城乡分类', '112', '城乡结合区', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'ZDY_CXFL', '城乡分类', '120', '镇区', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'ZDY_CXFL', '城乡分类', '121', '镇中心去', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'ZDY_CXFL', '城乡分类', '122', '镇乡结合区', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'ZDY_CXFL', '城乡分类', '123', '特殊区域', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'ZDY_CXFL', '城乡分类', '200', '乡村', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'ZDY_CXFL', '城乡分类', '210', '乡中心区', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'ZDY_CXFL', '城乡分类', '220', '村庄', '', '', '1', null);

commit;

delete T_AF_SQJBXX;

-- Add/modify columns 
alter table T_AF_SQJBXX add SQID VARCHAR2(20);
-- Add comments to the columns 
comment on column T_AF_SQJBXX.SQID
  is '社区ID';
  
  
alter table T_AF_SQJBXX
drop constraint PRI_SQBH cascade;
alter table T_AF_SQJBXX add constraint PRI_SQBH unique (SQBH) ;
alter table T_AF_SQJBXX add constraint T_AF_SQJBXX_sqid primary key (SQID);


-- Create sequence 
create sequence seq_af_sqjbxxid
minvalue 100
maxvalue 999999999999
start with 100
increment by 1
cache 10;


-- Add/modify columns 
alter table T_AF_SQJBXX modify SQLX VARCHAR2(3);


-- Add/modify columns 
alter table T_AF_SQGBXX modify GBZW VARCHAR2(50);
-- Add comments to the columns 
comment on column T_AF_SQGBXX.GBZW
  is '干部职务 多个使用"," 分隔';