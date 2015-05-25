-- Create sequence 
create sequence SEQ_GJCID
minvalue 10000000000000000001
maxvalue 99999999999999999999
start with 10000000000000000001
increment by 1
cache 20;

-- Create table
create table T_ZA_NBDW_GJC
(
  id      VARCHAR2(20) not null,
  gjc     VARCHAR2(200),
  cjr     VARCHAR2(30),
  cjsj    DATE,
  czsj    DATE,
  czr     VARCHAR2(30),
  czrsfzh VARCHAR2(18),
  cjrsfzh VARCHAR2(18),
  czbz    VARCHAR2(1)
);
-- Add comments to the columns 
comment on column T_ZA_NBDW_GJC.id
  is '主键ID';
comment on column T_ZA_NBDW_GJC.gjc
  is '关键词';
comment on column T_ZA_NBDW_GJC.cjr
  is '创建人';
comment on column T_ZA_NBDW_GJC.cjsj
  is '创建时间';
comment on column T_ZA_NBDW_GJC.czsj
  is '操作时间';
comment on column T_ZA_NBDW_GJC.czr
  is '操作人';
comment on column T_ZA_NBDW_GJC.czrsfzh
  is '操作人身份证';
comment on column T_ZA_NBDW_GJC.cjrsfzh
  is '创建人身份证';
comment on column T_ZA_NBDW_GJC.czbz
  is '操作标识 0:新增 1：修改 2：删除';
-- Create/Recreate primary, unique and foreign key constraints 
alter table T_ZA_NBDW_GJC
  add primary key (ID);
  
-- Create table
create table T_NBGL_GJCLOG
(
  id      VARCHAR2(20),
  gjc_old VARCHAR2(200),
  gjc_new VARCHAR2(200),
  czbs    VARCHAR2(1),
  czr     VARCHAR2(30),
  czrsfzh VARCHAR2(18),
  czsj    DATE
);
-- Add comments to the columns 
comment on column T_NBGL_GJCLOG.id
  is '日志ID';
comment on column T_NBGL_GJCLOG.gjc_old
  is '修改前关键词';
comment on column T_NBGL_GJCLOG.gjc_new
  is '修改后关键词';
comment on column T_NBGL_GJCLOG.czbs
  is '操作标识';
comment on column T_NBGL_GJCLOG.czr
  is '操作人';
comment on column T_NBGL_GJCLOG.czrsfzh
  is '操作人身份证号';
comment on column T_NBGL_GJCLOG.czsj
  is '操作时间';

