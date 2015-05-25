
-- Create table
create table T_ZA_WBDW_QZJC
(
  ID       NUMBER not null,
  QZGLBM   VARCHAR2(100),
  ZGLDXM   VARCHAR2(30),
  YDDH     VARCHAR2(20),
  CQZXYZJ  NUMBER,
  YLCQZ    NUMBER,
  XBCQZ    NUMBER,
  ZZBLCQZ  NUMBER,
  SXSBCQZ  NUMBER,
  QZXYZJ   NUMBER,
  YLQZ     NUMBER,
  XBQZ     NUMBER,
  ZZBLQZ   NUMBER,
  SXSBQZ   NUMBER,
  QZZJ     NUMBER,
  QZXXQK   VARCHAR2(400),
  ZDZJ     NUMBER,
  ZDXXQK   VARCHAR2(400),
  QDFKQK   VARCHAR2(400),
  QDKZBQK  VARCHAR2(400),
  STLQQK   VARCHAR2(400),
  QDKCZDWT VARCHAR2(400),
  LDXZ     CHAR(1),
  QMQC     CHAR(1),
  GLBM     CHAR(1),
  PXGZLS   CHAR(1),
  PBQXY    CHAR(1),
  QZDWGL   VARCHAR2(400),
  AQZRS    VARCHAR2(400),
  SJQZJC   VARCHAR2(400),
  LSYHZZ   VARCHAR2(400),
  TZDJQK   VARCHAR2(400),
  JGBH     VARCHAR2(27),
  DJRXM    VARCHAR2(30),
  DJRJH    VARCHAR2(20),
  DJRSFZH  VARCHAR2(18),
  DJRDWID  VARCHAR2(12),
  DJSJ     DATE,
  CZRXM    VARCHAR2(30),
  CZRJH    VARCHAR2(20),
  CZRSFZH  VARCHAR2(18),
  CZDWID   VARCHAR2(12),
  CZSJ     DATE,
  CZBS     CHAR(1),
  JCRXM    VARCHAR2(30),
  JCDWDM   VARCHAR2(12),
  JCDWMC   VARCHAR2(120),
  BJCRXM   VARCHAR2(30),
  JCRQ     DATE,
  QMSJ     DATE
)
tablespace TS_DT_SQJW
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255;
-- Add comments to the table 
comment on table T_ZA_WBDW_QZJC
  is '危爆单位枪支检查';
-- Add comments to the columns 
comment on column T_ZA_WBDW_QZJC.ID
  is '主键id';
comment on column T_ZA_WBDW_QZJC.QZGLBM
  is '枪支管理部门';
comment on column T_ZA_WBDW_QZJC.ZGLDXM
  is '主管领导姓名';
comment on column T_ZA_WBDW_QZJC.YDDH
  is '移动电话';
comment on column T_ZA_WBDW_QZJC.CQZXYZJ
  is '持枪证现有总计(本)';
comment on column T_ZA_WBDW_QZJC.YLCQZ
  is '原老持枪证(本)';
comment on column T_ZA_WBDW_QZJC.XBCQZ
  is '新办持枪证(本)';
comment on column T_ZA_WBDW_QZJC.ZZBLCQZ
  is '正在办理持枪证(本)';
comment on column T_ZA_WBDW_QZJC.SXSBCQZ
  is '尚需申办持枪证(人)';
comment on column T_ZA_WBDW_QZJC.QZXYZJ
  is '枪证现有总计(本)';
comment on column T_ZA_WBDW_QZJC.YLQZ
  is '原老枪证(本)';
comment on column T_ZA_WBDW_QZJC.XBQZ
  is '新办枪证(本)';
comment on column T_ZA_WBDW_QZJC.ZZBLQZ
  is '正在办理枪证(本)';
comment on column T_ZA_WBDW_QZJC.SXSBQZ
  is '尚需申办枪证(本)';
comment on column T_ZA_WBDW_QZJC.QZZJ
  is '枪支总计(支)';
comment on column T_ZA_WBDW_QZJC.QZXXQK
  is '枪支详细情况';
comment on column T_ZA_WBDW_QZJC.ZDZJ
  is '子弹总计(发)';
comment on column T_ZA_WBDW_QZJC.ZDXXQK
  is '子弹详细情况';
comment on column T_ZA_WBDW_QZJC.QDFKQK
  is '枪弹分库情况';
comment on column T_ZA_WBDW_QZJC.QDKZBQK
  is '枪弹库值班情况';
comment on column T_ZA_WBDW_QZJC.STLQQK
  is '三铁两器情况';
comment on column T_ZA_WBDW_QZJC.QDKCZDWT
  is '枪弹库存在的问题';
comment on column T_ZA_WBDW_QZJC.LDXZ
  is '是否成立领导小组';
comment on column T_ZA_WBDW_QZJC.QMQC
  is '是否对枪支进行全面清查';
comment on column T_ZA_WBDW_QZJC.GLBM
  is '是否管理部门分工明确';
comment on column T_ZA_WBDW_QZJC.PXGZLS
  is '是否落实培训工作';
comment on column T_ZA_WBDW_QZJC.PBQXY
  is '是否配备枪械员';
comment on column T_ZA_WBDW_QZJC.QZDWGL
  is '枪支单位管理存在的问题';
comment on column T_ZA_WBDW_QZJC.AQZRS
  is '安全责任书签订情况';
comment on column T_ZA_WBDW_QZJC.SJQZJC
  is '上级枪支管理部门检查情况';
comment on column T_ZA_WBDW_QZJC.LSYHZZ
  is '落实隐患整治情况';
comment on column T_ZA_WBDW_QZJC.TZDJQK
  is '台帐登记情况';
comment on column T_ZA_WBDW_QZJC.JGBH
  is '机构编号（关联）';
comment on column T_ZA_WBDW_QZJC.DJRXM
  is '登记人姓名';
comment on column T_ZA_WBDW_QZJC.DJRJH
  is '登记人警号';
comment on column T_ZA_WBDW_QZJC.DJRSFZH
  is '登记人身份证号';
comment on column T_ZA_WBDW_QZJC.DJRDWID
  is '登记人单位id';
comment on column T_ZA_WBDW_QZJC.DJSJ
  is '登记时间';
comment on column T_ZA_WBDW_QZJC.CZRXM
  is '操作人姓名';
comment on column T_ZA_WBDW_QZJC.CZRJH
  is '操作人警号';
comment on column T_ZA_WBDW_QZJC.CZRSFZH
  is '操作人身份证号';
comment on column T_ZA_WBDW_QZJC.CZDWID
  is '操作人单位id';
comment on column T_ZA_WBDW_QZJC.CZSJ
  is '操作时间';
comment on column T_ZA_WBDW_QZJC.CZBS
  is '操作标识(1:新增、2:修改、3:删除)';
comment on column T_ZA_WBDW_QZJC.JCRXM
  is '检查人姓名';
comment on column T_ZA_WBDW_QZJC.JCDWDM
  is '检查单位代码';
comment on column T_ZA_WBDW_QZJC.JCDWMC
  is '检查单位名称';
comment on column T_ZA_WBDW_QZJC.BJCRXM
  is '被检查人姓名';
comment on column T_ZA_WBDW_QZJC.JCRQ
  is '检查日期';
comment on column T_ZA_WBDW_QZJC.QMSJ
  is '签名时间';
-- Create/Recreate primary, unique and foreign key constraints 
alter table T_ZA_WBDW_QZJC
  add constraint PK_T_ZA_WBDW_QZJC primary key (ID);


-- Create sequence 
create sequence SEQ_WBDW_QZJC
minvalue 10000001
maxvalue 99999999
start with 10000001
increment by 1;