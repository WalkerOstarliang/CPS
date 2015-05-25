DELETE FROM t_common_dictionary WHERE zdlb = 'ZDY_PCSLB' AND dm = '7';
COMMIT;

INSERT INTO t_common_dictionary VALUES(seq_common.nextval,'ZDY_SDMC1','队室名称','1','社区警务队','','','1','');
INSERT INTO t_common_dictionary VALUES(seq_common.nextval,'ZDY_SDMC1','队室名称','2','案件办理队','','','1','');
INSERT INTO t_common_dictionary VALUES(seq_common.nextval,'ZDY_SDMC1','队室名称','3','巡逻防控队','','','1','');
INSERT INTO t_common_dictionary VALUES(seq_common.nextval,'ZDY_SDMC1','队室名称','9','其他','','','1','');

INSERT INTO t_common_dictionary VALUES(seq_common.nextval,'ZDY_SDMC2','队室名称','1','综合信息研判室（内勤室）','','','1','');
INSERT INTO t_common_dictionary VALUES(seq_common.nextval,'ZDY_SDMC2','队室名称','2','矛盾纠纷调解室','','','1','');
INSERT INTO t_common_dictionary VALUES(seq_common.nextval,'ZDY_SDMC2','队室名称','9','其他','','','1','');
commit;

alter table T_COMMON_ORGANIZATION_OTHER add "DSMC5" varchar2(100);
-- Add comments to the columns 
comment on column T_COMMON_ORGANIZATION_OTHER."DSMC5"
  is '队室名称（二室）';
  
  alter table T_COMMON_ORGANIZATION_OTHER add "SYJLS" number;
-- Add comments to the columns 
comment on column T_COMMON_ORGANIZATION_OTHER."SYJLS"
  is '实有警力数';
  
    alter table T_COMMON_ORGANIZATION_OTHER add "ZCMJS" number;
-- Add comments to the columns 
comment on column T_COMMON_ORGANIZATION_OTHER."ZCMJS"
  is '驻村民警数';
  
  alter table T_COMMON_ORGANIZATION_OTHER add "QCS" number;
-- Add comments to the columns 
comment on column T_COMMON_ORGANIZATION_OTHER."QCS"
  is '汽车数';
  alter table T_COMMON_ORGANIZATION_OTHER add "FDTKS" number;
-- Add comments to the columns 
comment on column T_COMMON_ORGANIZATION_OTHER."FDTKS"
  is '防弹头盔数';
  
  alter table T_COMMON_ORGANIZATION_OTHER add "DJZBS" number;
-- Add comments to the columns 
comment on column T_COMMON_ORGANIZATION_OTHER."DJZBS"
  is '单警装备数';
  
    alter table T_COMMON_ORGANIZATION_OTHER add "FDBXS" number;
-- Add comments to the columns 
comment on column T_COMMON_ORGANIZATION_OTHER."FDBXS"
  is '防弹背心数';
  
    alter table T_COMMON_ORGANIZATION_OTHER add "FCBXS" number;
-- Add comments to the columns 
comment on column T_COMMON_ORGANIZATION_OTHER."FCBXS"
  is '防刺背心数';
  

 