-- 技防单位
create table T_ZA_DW_JFDW
(
  ID        VARCHAR2(27) not null,
  JGBH      VARCHAR2(27) not null,
  BALX      VARCHAR2(3),
  SWDSJKTT  NUMBER,
  SNTT      NUMBER,
  ZJBJJMJXT VARCHAR2(3),
  LWBJ      VARCHAR2(3),
  YHBWFDMC  VARCHAR2(3),
  BZ        VARCHAR2(400)
);
-- Add comments to the columns 
comment on column T_ZA_DW_JFDW.ID
  is '主键编号';
comment on column T_ZA_DW_JFDW.JGBH
  is '机构编号';
comment on column T_ZA_DW_JFDW.BALX
  is '备案类型';
comment on column T_ZA_DW_JFDW.SWDSJKTT
  is '室外电视监控探头';
comment on column T_ZA_DW_JFDW.SNTT
  is '室内探头';
comment on column T_ZA_DW_JFDW.ZJBJJMJXT
  is '周界报警及门禁系统';
comment on column T_ZA_DW_JFDW.LWBJ
  is '110联网报警';
comment on column T_ZA_DW_JFDW.YHBWFDMC
  is '要害部位防盗门窗';
comment on column T_ZA_DW_JFDW.BZ
  is '备注';
-- Create/Recreate primary, unique and foreign key constraints 
alter table T_ZA_DW_JFDW
  add primary key (ID);
  
--技防单位字典

insert into t_common_dictionary values(seq_common.nextval,'ZDY_JFDW_BALX','备案类型','1','工程','','','1','');
insert into t_common_dictionary values(seq_common.nextval,'ZDY_JFDW_BALX','备案类型','2','生产','','','1','');
insert into t_common_dictionary values(seq_common.nextval,'ZDY_JFDW_BALX','备案类型','3','销售','','','1','');


insert into t_common_dictionary values(seq_common.nextval,'ZDY_JFDW_SSYW','设施有无','1','有','','','1','');
insert into t_common_dictionary values(seq_common.nextval,'ZDY_JFDW_SSYW','设施有无','2','无','','','1','');
insert into t_common_dictionary values(seq_common.nextval,'ZDY_JFDW_SSYW','设施有无','3','待查','','','1','');

commit;  