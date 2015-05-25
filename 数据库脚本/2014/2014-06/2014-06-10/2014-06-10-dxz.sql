create index t_lsgl_fw_jbxx_djsj on T_LSGL_FW_JBXX (djsj);

create index idx_lsgl_ldrkyqzx_czsj on T_LSGL_LDRK_YQZX (czsj);

create index idx_t_common_stxx_djsj on T_COMMON_STXX (djsj);


-- Add/modify columns 
alter table T_ZYQB_SJXX modify rksj default sysdate;
alter table T_ZYQB_SJXX add cjsj date;
-- Add comments to the columns 
comment on column T_ZYQB_SJXX.cjsj
  is '采集时间';
  
  
  
insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (82860, 'ZDY_LSTJLB', '两实统计类别', '001', '实有人口', null, null, '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (82861, 'ZDY_LSTJLB', '两实统计类别', '002', '常住人口', null, null, '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (82862, 'ZDY_LSTJLB', '两实统计类别', '003', '流动人口', null, null, '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (82863, 'ZDY_LSTJLB', '两实统计类别', '004', '寄住人口', null, null, '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (82864, 'ZDY_LSTJLB', '两实统计类别', '005', '未落户人口', null, null, '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (82865, 'ZDY_LSTJLB', '两实统计类别', '006', '境外人口', null, null, '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (82866, 'ZDY_LSTJLB', '两实统计类别', '007', '实体', null, null, '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (82867, 'ZDY_LSTJLB', '两实统计类别', '008', '房屋', null, null, '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (82868, 'ZDY_LSTJLB', '两实统计类别', '009', '出租房屋', null, null, '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (82869, 'ZDY_LSTJLB', '两实统计类别', '010', '从业人员', null, null, '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (82870, 'ZDY_LSTJLB', '两实统计类别', '011', '单位', null, null, '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (82871, 'ZDY_LSTJLB', '两实统计类别', '012', '出租房屋巡查', null, null, '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (82872, 'ZDY_LSTJLB', '两实统计类别', '013', '流动人口延期', null, null, '1', null);
commit;
  
