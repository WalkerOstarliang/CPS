insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (t_common_dictionary_id.nextval, 'ZDY_YW', '有无', '0', '无', '', '', '1', null);
insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (t_common_dictionary_id.nextval, 'ZDY_YW', '有无', '1', '有', '', '', '1', null);
commit;



-- Add/modify columns 
alter table T_ZA_DW_NBAQJC add djrxm varchar2(50);
alter table T_ZA_DW_NBAQJC add djrsfzh varchar2(18);
alter table T_ZA_DW_NBAQJC add djdwdm varchar2(12);
alter table T_ZA_DW_NBAQJC add djdwmc varchar2(120);
alter table T_ZA_DW_NBAQJC add djsj date;
alter table T_ZA_DW_NBAQJC add czrxm varchar2(50);
alter table T_ZA_DW_NBAQJC add czrsfzh varchar2(18);
alter table T_ZA_DW_NBAQJC add czdwdm varchar2(12);
alter table T_ZA_DW_NBAQJC add czdwmc varchar2(120);
alter table T_ZA_DW_NBAQJC add czsj date;
-- Add comments to the columns 
comment on column T_ZA_DW_NBAQJC.djrxm
  is '登记人姓名';
comment on column T_ZA_DW_NBAQJC.djrsfzh
  is '登记人身份证号';
comment on column T_ZA_DW_NBAQJC.djdwdm
  is '登记单位代码';
comment on column T_ZA_DW_NBAQJC.djdwmc
  is '登记单位名称';
comment on column T_ZA_DW_NBAQJC.djsj
  is '登记时间';
comment on column T_ZA_DW_NBAQJC.czrxm
  is '操作人姓名';
comment on column T_ZA_DW_NBAQJC.czrsfzh
  is '操作人身份证号';
comment on column T_ZA_DW_NBAQJC.czdwdm
  is '操作单位代码';
comment on column T_ZA_DW_NBAQJC.czdwmc
  is '操作单位名称';
comment on column T_ZA_DW_NBAQJC.czsj
  is '操作时间';