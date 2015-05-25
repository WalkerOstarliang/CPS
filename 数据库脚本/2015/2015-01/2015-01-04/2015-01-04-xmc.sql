-- Create table
create table T_COMMON_IMPORTXLS_CONFIG
(
  PROKEY   VARCHAR2(200),
  ZWFIELDS VARCHAR2(3000),
  YWFIELDS VARCHAR2(3000)
);
-- Add comments to the table 
comment on table T_COMMON_IMPORTXLS_CONFIG
  is 'XLS对象导入配置';
-- Add comments to the columns 
comment on column T_COMMON_IMPORTXLS_CONFIG.PROKEY
  is 'key键';
comment on column T_COMMON_IMPORTXLS_CONFIG.ZWFIELDS
  is '中文字段';
comment on column T_COMMON_IMPORTXLS_CONFIG.YWFIELDS
  is '英文字段';

  
-- Add/modify columns 
alter table T_COMMON_IMPORTXLS_CONFIG add requiredFields VARCHAR2(3000);
-- Add comments to the columns 
comment on column T_COMMON_IMPORTXLS_CONFIG.requiredFields
  is '必填字段';
  

 -- Create table
create table T_IMPORT_CYRYS
(
  BH        VARCHAR2(100),
  JGBH      VARCHAR2(27),
  XM        VARCHAR2(30),
  SFZH      VARCHAR2(20),
  MZ        VARCHAR2(50),
  LXDH      VARCHAR2(20),
  ZW        VARCHAR2(200),
  RZSJ      VARCHAR2(100),
  LZSJ      VARCHAR2(100),
  JZDZ      VARCHAR2(200),
  BZ        VARCHAR2(500),
  DRSJ      DATE,
  DJDWDM    VARCHAR2(12),
  DJDWMC    VARCHAR2(120),
  DJRXM     VARCHAR2(30),
  DJRSFZH   VARCHAR2(18),
  DJRJH     VARCHAR2(20),
  ERRORBS   VARCHAR2(1) default '0',
  ERRORINFO VARCHAR2(3000),
  EXECBS    VARCHAR2(1) default '0'
);
-- Add comments to the table 
comment on table T_IMPORT_CYRYS
  is '从业人员导入记录表';
-- Add comments to the columns 
comment on column T_IMPORT_CYRYS.BH
  is '编号';
comment on column T_IMPORT_CYRYS.JGBH
  is '机构编号';
comment on column T_IMPORT_CYRYS.XM
  is '姓名';
comment on column T_IMPORT_CYRYS.SFZH
  is '身份证号';
comment on column T_IMPORT_CYRYS.MZ
  is '民族';
comment on column T_IMPORT_CYRYS.LXDH
  is '联系电话';
comment on column T_IMPORT_CYRYS.ZW
  is '职务';
comment on column T_IMPORT_CYRYS.RZSJ
  is '入职时间';
comment on column T_IMPORT_CYRYS.LZSJ
  is '离职时间';
comment on column T_IMPORT_CYRYS.JZDZ
  is '居住地址';
comment on column T_IMPORT_CYRYS.BZ
  is '备注';
comment on column T_IMPORT_CYRYS.DRSJ
  is '导入时间';
comment on column T_IMPORT_CYRYS.DJDWDM
  is '登记单位代码';
comment on column T_IMPORT_CYRYS.DJDWMC
  is '登记单位名称';
comment on column T_IMPORT_CYRYS.DJRXM
  is '登记人姓名';
comment on column T_IMPORT_CYRYS.DJRSFZH
  is '登记人身份证号';
comment on column T_IMPORT_CYRYS.DJRJH
  is '登记人警号';
comment on column T_IMPORT_CYRYS.ERRORBS
  is '错误标示 0：未验证 1：验证有错误 2：验证成功';
comment on column T_IMPORT_CYRYS.ERRORINFO
  is '错误信息';
comment on column T_IMPORT_CYRYS.EXECBS
  is '执行标示 0：待执行 1：已执行 2：执行发生错误';
  
  
-- Create table
create table T_IMPORT_SYRKS
(
  BH        VARCHAR2(100),
  FWID      VARCHAR2(27),
  XM        VARCHAR2(30),
  SFZH      VARCHAR2(20),
  MZ        VARCHAR2(50),
  LXDH      VARCHAR2(20),
  JZSJ      VARCHAR2(200),
  JZSY      VARCHAR2(100),
  JZCS      VARCHAR2(100),
  YHZGX     VARCHAR2(200),
  NJZQX     VARCHAR2(200),
  BZ        VARCHAR2(500),
  DRSJ      DATE,
  DJDWDM    VARCHAR2(12),
  DJDWMC    VARCHAR2(120),
  DJRXM     VARCHAR2(30),
  DJRSFZH   VARCHAR2(18),
  DJRJH     VARCHAR2(20),
  ERRORBS   VARCHAR2(1) default '0',
  ERRORINFO VARCHAR2(3000),
  EXECBS    VARCHAR2(1) default '0'
);
-- Add comments to the table 
comment on table T_IMPORT_SYRKS
  is '实有人口导入表';
-- Add comments to the columns 
comment on column T_IMPORT_SYRKS.BH
  is '编号';
comment on column T_IMPORT_SYRKS.FWID
  is '房屋ID';
comment on column T_IMPORT_SYRKS.XM
  is '姓名';
comment on column T_IMPORT_SYRKS.SFZH
  is '身份证号';
comment on column T_IMPORT_SYRKS.MZ
  is '民族';
comment on column T_IMPORT_SYRKS.LXDH
  is '联系电话';
comment on column T_IMPORT_SYRKS.JZSJ
  is '居住时间';
comment on column T_IMPORT_SYRKS.JZSY
  is '居住事由';
comment on column T_IMPORT_SYRKS.JZCS
  is '居住处所';
comment on column T_IMPORT_SYRKS.YHZGX
  is '与户主关系';
comment on column T_IMPORT_SYRKS.NJZQX
  is '拟居住期限';
comment on column T_IMPORT_SYRKS.BZ
  is '备注';
comment on column T_IMPORT_SYRKS.DRSJ
  is '导入时间';
comment on column T_IMPORT_SYRKS.DJDWDM
  is '登记单位代码';
comment on column T_IMPORT_SYRKS.DJDWMC
  is '登记单位名称';
comment on column T_IMPORT_SYRKS.DJRXM
  is '登记人姓名';
comment on column T_IMPORT_SYRKS.DJRSFZH
  is '登记人身份证号';
comment on column T_IMPORT_SYRKS.DJRJH
  is '登记人警号';
comment on column T_IMPORT_SYRKS.ERRORBS
  is '错误信息标识';
comment on column T_IMPORT_SYRKS.ERRORINFO
  is '错误信息';
comment on column T_IMPORT_SYRKS.EXECBS
  is '执行标示';

 -- Add/modify columns 
alter table T_IMPORT_CYRYS add jzdpcsdm VARCHAR2(12);
-- Add comments to the columns 
comment on column T_IMPORT_CYRYS.jzdpcsdm
  is '居住地派出所代码';

-- Add/modify columns 
alter table T_IMPORT_CYRYS modify JZDPCSDM VARCHAR2(200);
-- Add/modify columns 
alter table T_IMPORT_CYRYS rename column JZDPCSDM to JZDPCS;


-- Add/modify columns 
alter table T_IMPORT_CYRYS add BatchNo VARCHAR2(200);
-- Add comments to the columns 
comment on column T_IMPORT_CYRYS.BatchNo
  is '导入批次号';

  
-- Add/modify columns 
alter table T_IMPORT_SYRKS add BATCHNO VARCHAR2(200);
-- Add comments to the columns 
comment on column T_IMPORT_SYRKS.BATCHNO
  is '导入批次号';
  
  
-- Add/modify columns 
alter table T_IMPORT_SYRKS add RYLB VARCHAR2(1);
-- Add comments to the columns 
comment on column T_IMPORT_SYRKS.RYLB
  is '人员类别';
  
  
-- Add/modify columns 
alter table T_IMPORT_SYRKS add RKID VARCHAR2(30);
-- Add comments to the columns 
comment on column T_IMPORT_SYRKS.RKID
  is '人口主键';
  
-- Add/modify columns 
alter table T_IMPORT_SYRKS add LOCKBS VARCHAR2(1) default '0';
-- Add comments to the columns 
comment on column T_IMPORT_SYRKS.LOCKBS
  is '锁定标示 0 ：未锁定 1：锁定';


-- Add/modify columns 
alter table T_IMPORT_CYRYS add LOCKBS VARCHAR2(1) default '0';
-- Add comments to the columns 
comment on column T_IMPORT_CYRYS.LOCKBS
  is '锁定标示 0：未锁定 1：锁定';
  
-- Create/Recreate indexes 
create index IMPORT_SYRKS_bh on T_IMPORT_SYRKS (bh) tablespace TS_IDX_SQJW ;

create index IMPORT_SYRKS_FWID on T_IMPORT_SYRKS (FWID) tablespace TS_IDX_SQJW ;

create index IMPORT_SYRKS_SFZH on T_IMPORT_SYRKS (SFZH) tablespace TS_IDX_SQJW ;

create index IMPORT_SYRKS_DRSJ on T_IMPORT_SYRKS (DRSJ) tablespace TS_IDX_SQJW ;

create index IMPORT_SYRKS_DJDWDM on T_IMPORT_SYRKS (DJDWDM) tablespace TS_IDX_SQJW ;

create index IMPORT_SYRKS_ERRORBS on T_IMPORT_SYRKS (ERRORBS) tablespace TS_IDX_SQJW ;

create index IMPORT_SYRKS_EXECBS on T_IMPORT_SYRKS (EXECBS) tablespace TS_IDX_SQJW ;



-- Create/Recreate indexes 
create index IMPORT_Cyrys_bh on t_Import_Cyrys (bh) tablespace TS_IDX_SQJW ;

create index IMPORT_Cyrys_JGBH on t_Import_Cyrys (JGBH) tablespace TS_IDX_SQJW ;

create index IMPORT_Cyrys_SFZH on t_Import_Cyrys (SFZH) tablespace TS_IDX_SQJW ;

create index IMPORT_Cyrys_DRSJ on t_Import_Cyrys (DRSJ) tablespace TS_IDX_SQJW ;

create index IMPORT_Cyrys_DJDWDM on t_Import_Cyrys (DJDWDM) tablespace TS_IDX_SQJW ;

create index IMPORT_Cyrys_ERRORBS on t_Import_Cyrys (ERRORBS) tablespace TS_IDX_SQJW ;

create index IMPORT_Cyrys_EXECBS on t_Import_Cyrys (EXECBS) tablespace TS_IDX_SQJW ;


insert into t_common_importxls_config (PROKEY, ZWFIELDS, YWFIELDS, REQUIREDFIELDS)
values ('cyryimportbean.xls.field.config', '姓名*,身份证号码*,电话号码*,职务*,入职时间*,离职时间,居住地派出所*,居住地址*,备注', 'xm,sfzh,lxdh,zw,rzsj,lzsj,jzdpcs,jzdz,bz', 'xm,sfzh,lxdh,zw,rzsj,jzdpcs,jzdz');

insert into t_common_importxls_config (PROKEY, ZWFIELDS, YWFIELDS, REQUIREDFIELDS)
values ('syrkimportbean.xls.field.config', '姓名*,身份证号码*,电话号码*,居住时间*,居住事由*,居住处所*,与户主关系*,拟居住期限*,备注', 'xm,sfzh,lxdh,jzsj,jzsy,jzcs,yhzgx,njzqx,bz', 'xm,sfzh,lxdh,jzsj,jzsy,jzcs,yhzgx,njzqx');
commit;

  