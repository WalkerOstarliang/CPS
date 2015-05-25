insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (800124, 'ZDY_LDRKLB', '流动人口类别', '2', '市内流动人口', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (800123, 'ZDY_LDRKLB', '流动人口类别', '1', '市外流动人口', '', '', '1', null);

commit;



-- Create table
create table T_LSGL_RK_JHSY
(
  ID     VARCHAR2(32) not null,
  JLBH   VARCHAR2(30),
  JHSYYQ VARCHAR2(2),
  JSZHM  VARCHAR2(32),
  FZRQ   DATE,
  ZNQK   VARCHAR2(2),
  BYJYCS VARCHAR2(2),
  DJRXM  VARCHAR2(32),
  DJRJH  VARCHAR2(10),
  DJDWDM VARCHAR2(60),
  DJDWMC VARCHAR2(120),
  DJSJ   DATE
);
-- Add comments to the table 
comment on table T_LSGL_RK_JHSY
  is '计划生育';
-- Add comments to the columns 
comment on column T_LSGL_RK_JHSY.ID
  is '主键ID';
comment on column T_LSGL_RK_JHSY.JLBH
  is '记录编号';
comment on column T_LSGL_RK_JHSY.JHSYYQ
  is '计划生育孕情';
comment on column T_LSGL_RK_JHSY.JSZHM
  is '计生证号码';
comment on column T_LSGL_RK_JHSY.FZRQ
  is '发证日期';
comment on column T_LSGL_RK_JHSY.ZNQK
  is '子女情况';
comment on column T_LSGL_RK_JHSY.BYJYCS
  is '避孕节育措施';
comment on column T_LSGL_RK_JHSY.DJRXM
  is '登记人姓名';
comment on column T_LSGL_RK_JHSY.DJRJH
  is '登记人警号';
comment on column T_LSGL_RK_JHSY.DJDWDM
  is '登记单位代码';
comment on column T_LSGL_RK_JHSY.DJDWMC
  is '登记单位名称';
comment on column T_LSGL_RK_JHSY.DJSJ
  is '登记时间';
