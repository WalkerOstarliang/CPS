-- Add/modify columns 
alter table T_COMMON_ORGANIZATION_FJ add sfzz varchar2(2);
alter table T_COMMON_ORGANIZATION_FJ add djrjh varchar2(6);
alter table T_COMMON_ORGANIZATION_FJ add djrxm varchar2(50);
alter table T_COMMON_ORGANIZATION_FJ add djdwdm varchar2(12);
alter table T_COMMON_ORGANIZATION_FJ add djdwmc varchar2(120);
alter table T_COMMON_ORGANIZATION_FJ add djrsfzh varchar2(18);
-- Add comments to the columns 
comment on column T_COMMON_ORGANIZATION_FJ.sfzz
  is '是否专职';
comment on column T_COMMON_ORGANIZATION_FJ.djrjh
  is '登记人警号';
comment on column T_COMMON_ORGANIZATION_FJ.djrxm
  is '登记人姓名';
comment on column T_COMMON_ORGANIZATION_FJ.djdwdm
  is '登记单位代码';
comment on column T_COMMON_ORGANIZATION_FJ.djdwmc
  is '登记单位名称';
comment on column T_COMMON_ORGANIZATION_FJ.djrsfzh
  is '登记人身份证号';
  
  
  -- Add/modify columns 
alter table T_COMMON_ORGANIZATION_FJ add lzsj date;
alter table T_COMMON_ORGANIZATION_FJ add zxbs varchar2(2);
-- Add comments to the columns 
comment on column T_COMMON_ORGANIZATION_FJ.lzsj
  is '离职事件';
comment on column T_COMMON_ORGANIZATION_FJ.zxbs
  is '注销标识';
  
  -- Add/modify columns 
alter table T_COMMON_ORGANIZATION_FJ add djsj date;
-- Add comments to the columns 
comment on column T_COMMON_ORGANIZATION_FJ.djsj
  is '登记时间';
  
  
  
  
    
  insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (t_common_dictionary_id.nextval, 'ZDY_LKXGYGW', '流口协管员岗位类别', '1', '内勤', '', '', '1', null);
  
  insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (t_common_dictionary_id.nextval, 'ZDY_LKXGYGW', '流口协管员岗位类别', '2', '信息采录', '', '', '1', null);
  
  insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (t_common_dictionary_id.nextval, 'ZDY_LKXGYGW', '流口协管员岗位类别', '3', '其他', '', '', '1', null);
  commit;
  
  
  
  -- Create sequence 
create sequence T_COMMON_ORGANIZATION_LKXGY_ID
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;