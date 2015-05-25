-- Add/modify columns 
alter table T_COMMON_ORGANIZATION_OTHER add szzj varchar2(3);
alter table T_COMMON_ORGANIZATION_OTHER add drsznx number;
alter table T_COMMON_ORGANIZATION_OTHER add ncjwss number;
alter table T_COMMON_ORGANIZATION_OTHER add rjgyjfbz number;
alter table T_COMMON_ORGANIZATION_OTHER add sjbfdw number;
alter table T_COMMON_ORGANIZATION_OTHER add fhzb varchar2(100);
alter table T_COMMON_ORGANIZATION_OTHER add hjsj date;
alter table T_COMMON_ORGANIZATION_OTHER add hjry varchar2(100);
alter table T_COMMON_ORGANIZATION_OTHER add qtry varchar2(100);
-- Add comments to the columns 
comment on column T_COMMON_ORGANIZATION_OTHER.szzj
  is '所长职级';
comment on column T_COMMON_ORGANIZATION_OTHER.drsznx
  is '担任所长年限';
comment on column T_COMMON_ORGANIZATION_OTHER.ncjwss
  is '农村警务室数';
comment on column T_COMMON_ORGANIZATION_OTHER.rjgyjfbz
  is '人均公用经费保障';
comment on column T_COMMON_ORGANIZATION_OTHER.sjbfdw
  is '实际拨付到位';
comment on column T_COMMON_ORGANIZATION_OTHER.fhzb
  is '防护装备';
comment on column T_COMMON_ORGANIZATION_OTHER.hjsj
  is '获奖时间';
comment on column T_COMMON_ORGANIZATION_OTHER.hjry
  is '获奖荣誉';
comment on column T_COMMON_ORGANIZATION_OTHER.qtry
  is '其他荣誉';
  
  
  -- Add/modify columns 
alter table T_COMMON_ORGANIZATION_OTHER add jwqs number;
-- Add comments to the columns 
comment on column T_COMMON_ORGANIZATION_OTHER.jwqs
  is '警务区数';
  
  
  
  
  insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (t_common_dictionary_id.nextval, 'ZDY_FHZB', '保障装备', '1', '汽车', '', '', '1', null);
insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (t_common_dictionary_id.nextval, 'ZDY_FHZB', '保障装备', '2', '计算机', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (t_common_dictionary_id.nextval, 'ZDY_FHZB', '保障装备', '3', '单警装备', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (t_common_dictionary_id.nextval, 'ZDY_FHZB', '保障装备', '4', '防弹头盔', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (t_common_dictionary_id.nextval, 'ZDY_FHZB', '保障装备', '5', '防弹背心', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (t_common_dictionary_id.nextval, 'ZDY_FHZB', '保障装备', '6', '防刺背心', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (t_common_dictionary_id.nextval, 'ZDY_FHZB', '保障装备', '7', '其它防护装备', '', '', '1', null);
commit;
  
  
  
  insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (t_common_dictionary_id.nextval, 'ZDY_HJRY', '获奖荣誉', '1', '集体一等功', '', '', '1', null);
insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (t_common_dictionary_id.nextval, 'ZDY_HJRY', '获奖荣誉', '2', '集体二等功', '', '', '1', null);
insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (t_common_dictionary_id.nextval, 'ZDY_HJRY', '获奖荣誉', '3', '集体三等功', '', '', '1', null);
insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (t_common_dictionary_id.nextval, 'ZDY_HJRY', '获奖荣誉', '9', '其他荣誉', '', '', '1', null);

commit;