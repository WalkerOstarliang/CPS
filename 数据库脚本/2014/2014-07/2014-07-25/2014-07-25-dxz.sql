create table t_common_pcsry(
       id varchar2(10) primary key,
       orgid varchar2(30) not null,
       orgcode varchar2(12) not null,
       hjsj date,
       hjlx varchar2(3),
       bz varchar2(200),
       djrxm varchar2(30), 
       djrjh varchar2(20),
       djsj date,
       djdwdm varchar2(12),
       djdwmc varchar2(120),
       czrxm varchar2(30),
       czrjh varchar2(20),
       czrsfzh varchar2(20),
       czdwdm varchar2(12),
       czdwmc varchar2(120),
       czbs varchar2(1),
       czsj date
);

-- Add comments to the table 
comment on table T_COMMON_PCSRY
  is '派出所荣誉';
-- Add comments to the columns 
comment on column T_COMMON_PCSRY.id
  is '主键ID';
comment on column T_COMMON_PCSRY.orgid
  is '机构ID';
comment on column T_COMMON_PCSRY.orgcode
  is '机构代码';
comment on column T_COMMON_PCSRY.hjsj
  is '获奖时间';
comment on column T_COMMON_PCSRY.hjlx
  is '获奖类型';
comment on column T_COMMON_PCSRY.bz
  is '备注';
comment on column T_COMMON_PCSRY.djrxm
  is '登记人姓名';
comment on column T_COMMON_PCSRY.djrjh
  is '登记人警号';
comment on column T_COMMON_PCSRY.djsj
  is '登记时间';
comment on column T_COMMON_PCSRY.djdwdm
  is '登记单位代码';
comment on column T_COMMON_PCSRY.djdwmc
  is '登记单位名称';
comment on column T_COMMON_PCSRY.czrxm
  is '操作人姓名';
comment on column T_COMMON_PCSRY.czrjh
  is '操作人警号';
comment on column T_COMMON_PCSRY.czrsfzh
  is '操作人身份证号';
comment on column T_COMMON_PCSRY.czdwdm
  is '操作单位代码';
comment on column T_COMMON_PCSRY.czdwmc
  is '操作单位名称';
comment on column T_COMMON_PCSRY.czbs
  is '操作标识 1、新增 2、修改 3、删除';
comment on column T_COMMON_PCSRY.czsj
  is '操作时间';  

  -- Create sequence 
create sequence SEQ_PCSRYID
minvalue 1000000001
maxvalue 9999999999
start with 1000000001
increment by 1;