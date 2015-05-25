insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'ZDY_JTGJ', '交通工具', '1', '自行车', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'ZDY_JTGJ', '交通工具', '2', '摩托车', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'ZDY_JTGJ', '交通工具', '3', '电动车', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'ZDY_JTGJ', '交通工具', '4', '汽车', '', '', '1', null);
commit;


-- Add/modify columns 
alter table T_COMMON_ORGANIZATION_OTHER add YWJWS VARCHAR2(1);
alter table T_COMMON_ORGANIZATION_OTHER add DNTS number;
alter table T_COMMON_ORGANIZATION_OTHER add JTGJ VARCHAR2(50);
-- Add comments to the columns 
comment on column T_COMMON_ORGANIZATION_OTHER.BGDDLX
  is '办公地点类型(警务区)';
comment on column T_COMMON_ORGANIZATION_OTHER.WLJRFS
  is '网络接入方式(警务区)';
comment on column T_COMMON_ORGANIZATION_OTHER.YWJWS
  is '有无警务室(警务区) 0：无 1：有';
comment on column T_COMMON_ORGANIZATION_OTHER.DNTS
  is '电脑台数';
comment on column T_COMMON_ORGANIZATION_OTHER.JTGJ
  is '交通工具';
  
-- Add/modify columns 
alter table T_COMMON_ORGANIZATION_OTHER add BGDD VARCHAR2(3);
-- Add comments to the columns 
comment on column T_COMMON_ORGANIZATION_OTHER.BGDD
  is '办公地点';
  
  
insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'ZDY_BGDD', '办公地点', '1', '社区（村）居委会内', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'ZDY_BGDD', '办公地点', '2', '社区（村）居委会相邻', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'ZDY_BGDD', '办公地点', '3', '其它', '', '', '1', null);

commit;


-- Add/modify columns 
alter table T_COMMON_ORGANIZATION_OTHER add JRGANW VARCHAR2(1);
alter table T_COMMON_ORGANIZATION_OTHER add JRWW VARCHAR2(1);
-- Add comments to the columns 
comment on column T_COMMON_ORGANIZATION_OTHER.WLJRFS
  is '网络接入方式(警务区)（禁用）';
comment on column T_COMMON_ORGANIZATION_OTHER.JRGANW
  is '接入公安内网';
comment on column T_COMMON_ORGANIZATION_OTHER.JRWW
  is '接入外网';

  