-- Create table
create table T_COMMON_ORGANIZATION_OTHER
(
  ID         VARCHAR2(20) not null,
  BGDDLX     VARCHAR2(4),
  WLJRFS     VARCHAR2(4),
  ORGCODE    VARCHAR2(14),
  ORGNAME    VARCHAR2(120),
  ORGID      VARCHAR2(30),
  ISPCS      VARCHAR2(1),
  PCSSZXM    VARCHAR2(30),
  PCSSZSFZH  VARCHAR2(18),
  PCSSZJH    VARCHAR2(6),
  PCSFSZXM   VARCHAR2(30),
  PCSFSZSFZH VARCHAR2(18),
  PCSFSZJH   VARCHAR2(6),
  CZRXM      VARCHAR2(30),
  CZRDWDM    VARCHAR2(60),
  CZRDWMC    VARCHAR2(120),
  CZSJ       DATE
)

-- Add comments to the table 
comment on table T_COMMON_ORGANIZATION_OTHER
  is '警务室维护表';
-- Add comments to the columns 
comment on column T_COMMON_ORGANIZATION_OTHER.ID
  is '主键id';
comment on column T_COMMON_ORGANIZATION_OTHER.BGDDLX
  is '办公地点类型';
comment on column T_COMMON_ORGANIZATION_OTHER.WLJRFS
  is '网络接入方式';
comment on column T_COMMON_ORGANIZATION_OTHER.ORGCODE
  is '机构代码';
comment on column T_COMMON_ORGANIZATION_OTHER.ORGNAME
  is '机构名称';
comment on column T_COMMON_ORGANIZATION_OTHER.ORGID
  is '机构ID';
comment on column T_COMMON_ORGANIZATION_OTHER.ISPCS
  is '是否派出所';
comment on column T_COMMON_ORGANIZATION_OTHER.PCSSZXM
  is '派出所所长姓名';
comment on column T_COMMON_ORGANIZATION_OTHER.PCSSZSFZH
  is '派出所所长身份证号';
comment on column T_COMMON_ORGANIZATION_OTHER.PCSSZJH
  is '派出所所长警号';
comment on column T_COMMON_ORGANIZATION_OTHER.PCSFSZXM
  is '派出所副所长姓名';
comment on column T_COMMON_ORGANIZATION_OTHER.PCSFSZSFZH
  is '派出所副所长身份证号';
comment on column T_COMMON_ORGANIZATION_OTHER.PCSFSZJH
  is '派出所副所长警号';
comment on column T_COMMON_ORGANIZATION_OTHER.CZRXM
  is '操作人姓名';
comment on column T_COMMON_ORGANIZATION_OTHER.CZRDWDM
  is '操作人单位代码';
comment on column T_COMMON_ORGANIZATION_OTHER.CZRDWMC
  is '操作人单位名称';
comment on column T_COMMON_ORGANIZATION_OTHER.CZSJ
  is '操作时间';

-- Create table
create table T_COMMON_USER_LXFS
(
  ID        VARCHAR2(20),
  USERID    NUMBER,
  USERNAME  VARCHAR2(15),
  SFZH      VARCHAR2(20),
  MOBILE    VARCHAR2(11),
  TELEPHONE VARCHAR2(20)
)

-- Add comments to the table 
comment on table T_COMMON_USER_LXFS
  is '用户联系方式关联表';
-- Add comments to the columns 
comment on column T_COMMON_USER_LXFS.ID
  is '主键ID';
comment on column T_COMMON_USER_LXFS.USERID
  is '用户id';
comment on column T_COMMON_USER_LXFS.USERNAME
  is '用户名（警号）';
comment on column T_COMMON_USER_LXFS.SFZH
  is '身份证';
comment on column T_COMMON_USER_LXFS.MOBILE
  is '手机号码';
comment on column T_COMMON_USER_LXFS.TELEPHONE
  is '电话号码';


-- Create sequence 
create sequence T_COMMON_USER_LXFS_ID
minvalue 1
maxvalue 999999999999999999999999999
start with 381
increment by 1
cache 20;

-- Create sequence 
create sequence T_COMMON_ORGANIZATION_OTHER_ID
minvalue 1
maxvalue 999999999999999999999999999
start with 161
increment by 1
cache 20;  
  
  
  