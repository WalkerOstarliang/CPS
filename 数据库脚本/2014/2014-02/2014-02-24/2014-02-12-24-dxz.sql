-- 重点人员退回信息
create table T_ZDRY_RYTH
(
  ID      VARCHAR2(20) not null,
  SFZH    VARCHAR2(18) not null,
  THDWDM  VARCHAR2(12),
  THDWMC  VARCHAR2(120),
  THRLXFS VARCHAR2(20),
  THRJH   VARCHAR2(20),
  THRXM   VARCHAR2(30),
  THYY    VARCHAR2(200),
  MBDWDM  VARCHAR2(12),
  MBDWMC  VARCHAR2(120)
  thsj date
);
-- Add comments to the table 
comment on table T_ZDRY_RYTH
  is '重点人员退回信息';
-- Add comments to the columns 
comment on column T_ZDRY_RYTH.ID
  is '主键ID';
comment on column T_ZDRY_RYTH.SFZH
  is '重点人员身份证号';
comment on column T_ZDRY_RYTH.THDWDM
  is '退回单位代码';
comment on column T_ZDRY_RYTH.THDWMC
  is '退回单位名称';
comment on column T_ZDRY_RYTH.THRLXFS
  is '退回人联系方式';
comment on column T_ZDRY_RYTH.THRJH
  is '退回人警号';
comment on column T_ZDRY_RYTH.THRXM
  is '退回人姓名';
comment on column T_ZDRY_RYTH.THYY
  is '退回原因';
comment on column T_ZDRY_RYTH.MBDWDM
  is '目标单位代码';
comment on column T_ZDRY_RYTH.MBDWMC
  is '目标单位名称';
comment on column T_ZDRY_RYTH.THSJ
  is '退回时间';  
  
-- Create/Recreate primary, unique and foreign key constraints 
alter table T_ZDRY_RYTH
  add primary key (ID);
  
  
  -- Create sequence 
create sequence seq_zdry_ryth_id
minvalue 10000000000000000001
maxvalue 99999999999999999999
start with 10000000000000000001
increment by 1;

insert into t_common_dictionary values 
(seq_common.nextval,'ZDY_LXFSLX','联系方式类型','008','微信账号','','','1','');
commit;

-- Add/modify columns 
alter table T_ZDRY_RYPF modify ZDRYBH VARCHAR2(20);


-- Add/modify columns 
alter table T_ZDRY_RYPF add pfsj date;
-- Add comments to the columns 
comment on column T_ZDRY_RYPF.pfsj
  is '派发时间';

  
