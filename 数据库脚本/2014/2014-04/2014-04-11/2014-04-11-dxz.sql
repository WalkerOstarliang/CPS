-- Create table
create table T_ZA_WYXQ
(
  ID        VARCHAR2(25) not null,
  XQMC      VARCHAR2(200) not null,
  SSSQMC    VARCHAR2(200) not null,
  SSSQDM    VARCHAR2(12) not null,
  SSJWQDM   VARCHAR2(12) not null,
  SSJWQMC   VARCHAR2(200) not null,
  DZMC      VARCHAR2(400) not null,
  WYGS      VARCHAR2(200) not null,
  WYGSFZR   VARCHAR2(30) not null,
  LDS       NUMBER not null,
  JCKS      NUMBER not null,
  SFYJZTCC  VARCHAR2(1) not null,
  TCWS      NUMBER,
  DWFZR     VARCHAR2(30),
  ABFZR     VARCHAR2(30),
  DWFZRLXDH VARCHAR2(30),
  ABFZRLXDH VARCHAR2(30),
  DWDH      VARCHAR2(30),
  DWBZ      VARCHAR2(200),
  CYRS      NUMBER,
  BWLL      VARCHAR2(200),
  BAS       NUMBER,
  WSSYSBAS  NUMBER,
  FHZBS     NUMBER,
  JGS       NUMBER,
  GWS       NUMBER,
  ZBRS      NUMBER,
  GWWZJRS   NUMBER,
  FBSXQ     VARCHAR2(1),
  WQ        VARCHAR2(200),
  DYMJ      VARCHAR2(200),
  WFQT      VARCHAR2(200),
  WFBZ      VARCHAR2(200),
  SPJKS     NUMBER,
  DZWL      VARCHAR2(200),
  MJXT      VARCHAR2(200),
  JKZX      VARCHAR2(200),
  JFQT      VARCHAR2(200),
  SFZXZPBA  VARCHAR2(1),
  PQBAFWGS  VARCHAR2(200),
  SFBA      VARCHAR2(1),
  PQBAS     NUMBER,
  BAZH      VARCHAR2(100),
  BAFWQY    VARCHAR2(200),
  BAJGBZ    VARCHAR2(200),
  SSFXSJDM  VARCHAR2(12),
  SSFXSJMC  VARCHAR2(120),
  SSPCSDM   VARCHAR2(12),
  SSPCSDMMC VARCHAR2(120),
  SQMJXM    VARCHAR2(30),
  SQMJJH    VARCHAR2(6),
  DJRXM     VARCHAR2(30),
  DJRJH     VARCHAR2(6),
  DJRSFZ    VARCHAR2(18),
  DJSJ      DATE,
  DJDWDM    VARCHAR2(12),
  DJDWMC    VARCHAR2(120),
  CZRXM     VARCHAR2(30),
  CZRJH     VARCHAR2(6),
  CZRSFZH   VARCHAR2(18),
  CZDWDM    VARCHAR2(12),
  CZDWMC    VARCHAR2(120),
  CZSJ      DATE,
  CZBS      VARCHAR2(1),
  ZXBS      VARCHAR2(1),
  ZXYY      VARCHAR2(200)
);
-- Add comments to the table 
comment on table T_ZA_WYXQ
  is '治安物业小区';
-- Add comments to the columns 
comment on column T_ZA_WYXQ.ID
  is '主键ID';
comment on column T_ZA_WYXQ.XQMC
  is '小区名称';
comment on column T_ZA_WYXQ.SSSQMC
  is '所属社区名称';
comment on column T_ZA_WYXQ.SSSQDM
  is '所属社区代码';
comment on column T_ZA_WYXQ.SSJWQDM
  is '所属警务区代码';
comment on column T_ZA_WYXQ.SSJWQMC
  is '所属警务区名称';
comment on column T_ZA_WYXQ.DZMC
  is '地址名称';
comment on column T_ZA_WYXQ.WYGS
  is '物业公司';
comment on column T_ZA_WYXQ.WYGSFZR
  is '物业公司负责人';
comment on column T_ZA_WYXQ.LDS
  is '楼栋数';
comment on column T_ZA_WYXQ.JCKS
  is '进出口数';
comment on column T_ZA_WYXQ.SFYJZTCC
  is '是否有集中停车场';
comment on column T_ZA_WYXQ.TCWS
  is '停车位数';
comment on column T_ZA_WYXQ.DWFZR
  is '单位负责人';
comment on column T_ZA_WYXQ.ABFZR
  is '安保负责人';
comment on column T_ZA_WYXQ.DWFZRLXDH
  is '单位负责人联系电话';
comment on column T_ZA_WYXQ.ABFZRLXDH
  is '安保负责人联系电话';
comment on column T_ZA_WYXQ.DWDH
  is '单位电话';
comment on column T_ZA_WYXQ.DWBZ
  is '单位备注';
comment on column T_ZA_WYXQ.CYRS
  is '从业人员数';
comment on column T_ZA_WYXQ.BWLL
  is '保卫力量';
comment on column T_ZA_WYXQ.BAS
  is '保安数';
comment on column T_ZA_WYXQ.WSSYSBAS
  is '五十岁以上保安数';
comment on column T_ZA_WYXQ.FHZBS
  is '防护装备数';
comment on column T_ZA_WYXQ.JGS
  is '警棍数';
comment on column T_ZA_WYXQ.GWS
  is '岗位数';
comment on column T_ZA_WYXQ.ZBRS
  is '值班人数';
comment on column T_ZA_WYXQ.GWWZJRS
  is '岗位位置及人数';
comment on column T_ZA_WYXQ.FBSXQ
  is '是否封闭式小区';
comment on column T_ZA_WYXQ.WQ
  is '围墙';
comment on column T_ZA_WYXQ.DYMJ
  is '单元门禁';
comment on column T_ZA_WYXQ.WFQT
  is '物防其他信息';
comment on column T_ZA_WYXQ.WFBZ
  is '物防备注';
comment on column T_ZA_WYXQ.SPJKS
  is '视频监控数';
comment on column T_ZA_WYXQ.DZWL
  is '电子围栏';
comment on column T_ZA_WYXQ.MJXT
  is '门禁系统';
comment on column T_ZA_WYXQ.JKZX
  is '监控中心';
comment on column T_ZA_WYXQ.JFQT
  is '技防其他信息';
comment on column T_ZA_WYXQ.SFZXZPBA
  is '是否自行招聘保安';
comment on column T_ZA_WYXQ.PQBAFWGS
  is '聘请保安服务公司';
comment on column T_ZA_WYXQ.SFBA
  is '是否备案';
comment on column T_ZA_WYXQ.PQBAS
  is '聘请保安数';
comment on column T_ZA_WYXQ.BAZH
  is '备案证号';
comment on column T_ZA_WYXQ.BAFWQY
  is '保安服务区域';
comment on column T_ZA_WYXQ.BAJGBZ
  is '保安监管备注';
comment on column T_ZA_WYXQ.SSFXSJDM
  is '所属分县市局代码';
comment on column T_ZA_WYXQ.SSFXSJMC
  is '所属分县市局名称';
comment on column T_ZA_WYXQ.SSPCSDM
  is '所属派出所代码';
comment on column T_ZA_WYXQ.SSPCSDMMC
  is '所属派出所名称';
comment on column T_ZA_WYXQ.SQMJXM
  is '社区民警姓名';
comment on column T_ZA_WYXQ.SQMJJH
  is '社区民警警号';
comment on column T_ZA_WYXQ.DJRXM
  is '登记人姓名';
comment on column T_ZA_WYXQ.DJRJH
  is '登记人警号';
comment on column T_ZA_WYXQ.DJRSFZ
  is '登记人身份证号';
comment on column T_ZA_WYXQ.DJSJ
  is '登记时间';
comment on column T_ZA_WYXQ.DJDWDM
  is '登记单位代码';
comment on column T_ZA_WYXQ.DJDWMC
  is '登记单位名称';
comment on column T_ZA_WYXQ.CZRXM
  is '操作人姓名';
comment on column T_ZA_WYXQ.CZRJH
  is '操作人警号';
comment on column T_ZA_WYXQ.CZRSFZH
  is '操作人省份证号';
comment on column T_ZA_WYXQ.CZDWDM
  is '操作单位代码';
comment on column T_ZA_WYXQ.CZDWMC
  is '操作单位名称';
comment on column T_ZA_WYXQ.CZSJ
  is '操作时间';
comment on column T_ZA_WYXQ.CZBS
  is '操作标识';
comment on column T_ZA_WYXQ.ZXBS
  is '注销标识';
comment on column T_ZA_WYXQ.ZXYY
  is '注销原因';
-- Create/Recreate primary, unique and foreign key constraints 
alter table T_ZA_WYXQ
  add primary key (ID)
;


-- Add/modify columns 
alter table T_ZA_JG_JBXX modify SWDJH VARCHAR2(52);
