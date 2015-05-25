insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (800451, 'XFDW_HZ_PFZT', '消防单位-火灾派发状态', '1', '派发', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (800452, 'XFDW_HZ_PFZT', '消防单位-火灾派发状态', '2', '签收', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (800453, 'XFDW_HZ_PFZT', '消防单位-火灾派发状态', '3', '退回', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (800448, 'XFDW_HZ_HF', '消防单位-火灾划分', '1', '一般火灾', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (800449, 'XFDW_HZ_HF', '消防单位-火灾划分', '2', '重大火灾', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (800450, 'XFDW_HZ_HF', '消防单位-火灾划分', '3', '特大火灾', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (800445, 'XFDW_HZ_ZT', '消防单位-火灾落地状态', '1', '待处理', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (800446, 'XFDW_HZ_ZT', '消防单位-火灾落地状态', '0', '未处理', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (800447, 'XFDW_HZ_ZT', '消防单位-火灾落地状态', '2', '已签收', '', '', '1', null);



 
create table T_XFDW_HZLDXX
(
  HZXH   VARCHAR2(18) not null,
  XZQYBM VARCHAR2(100),
  QHSJ   VARCHAR2(20),
  QHDD   VARCHAR2(200),
  HZMC   VARCHAR2(200),
  SWRS   VARCHAR2(8),
  SSRS   VARCHAR2(8),
  ZJCCSS VARCHAR2(8),
  SZHS   VARCHAR2(8),
  HZYY   VARCHAR2(2000),
  QHCS   VARCHAR2(200),
  HZDJ   VARCHAR2(30),
  SSDWDM VARCHAR2(12),
  BZDZ   VARCHAR2(2000),
  ZT     CHAR(1) default '0',
  RKSJ   DATE default sysdate
)
;
comment on table T_XFDW_HZLDXX
  is '火灾信息';
comment on column T_XFDW_HZLDXX.HZXH
  is '火灾序号';
comment on column T_XFDW_HZLDXX.XZQYBM
  is '行政区域编码';
comment on column T_XFDW_HZLDXX.QHSJ
  is '起火时间';
comment on column T_XFDW_HZLDXX.QHDD
  is '起火地点';
comment on column T_XFDW_HZLDXX.HZMC
  is '单位名称或户主名';
comment on column T_XFDW_HZLDXX.SWRS
  is '死亡人数';
comment on column T_XFDW_HZLDXX.SSRS
  is '受伤人数';
comment on column T_XFDW_HZLDXX.ZJCCSS
  is '直接财产损失';
comment on column T_XFDW_HZLDXX.SZHS
  is '受灾户数';
comment on column T_XFDW_HZLDXX.HZYY
  is '火灾原因';
comment on column T_XFDW_HZLDXX.QHCS
  is '起火场所';
comment on column T_XFDW_HZLDXX.HZDJ
  is '火灾等级(3特大，2重大，1一般)';
comment on column T_XFDW_HZLDXX.SSDWDM
  is '所属单位代码';
comment on column T_XFDW_HZLDXX.BZDZ
  is '标准地址';
comment on column T_XFDW_HZLDXX.ZT
  is '状态(0.正常，1.待处理，2.已签收，3.已退回)';
comment on column T_XFDW_HZLDXX.RKSJ
  is '入库时间';
alter table T_XFDW_HZLDXX
  add constraint PK_T_XFDW_HZLDXX primary key (HZXH);

 
create table T_XFDW_HZPF
(
  ID      NUMBER not null,
  HZXH    VARCHAR2(18),
  CZRJH   VARCHAR2(20),
  CZRSFZH VARCHAR2(18),
  CZRDWDM VARCHAR2(30),
  CZSJ    DATE,
  CZIP    VARCHAR2(20),
  CLDWDM  VARCHAR2(30),
  CLZT    CHAR(1),
  BZSM    VARCHAR2(2000)
)
;
comment on table T_XFDW_HZPF
  is '火灾派发';
comment on column T_XFDW_HZPF.ID
  is '主键ID';
comment on column T_XFDW_HZPF.HZXH
  is '火灾序号';
comment on column T_XFDW_HZPF.CZRJH
  is '操作人警号';
comment on column T_XFDW_HZPF.CZRSFZH
  is '操作人身份证号';
comment on column T_XFDW_HZPF.CZRDWDM
  is '操作人单位代码';
comment on column T_XFDW_HZPF.CZSJ
  is '操作时间';
comment on column T_XFDW_HZPF.CZIP
  is '操作IP地址';
comment on column T_XFDW_HZPF.CLDWDM
  is '处理单位代码';
comment on column T_XFDW_HZPF.CLZT
  is '处理状态(1.待处理，2.已签收，3.退回)';
comment on column T_XFDW_HZPF.BZSM
  is '备注说明';
alter table T_XFDW_HZPF
  add constraint PK_T_XFDW_HZPF primary key (ID);





-- Create sequence 
create sequence SEQ_XFDW_HZPF_ID
minvalue 1
maxvalue 99999999
start with 1
increment by 1
cache 20;
