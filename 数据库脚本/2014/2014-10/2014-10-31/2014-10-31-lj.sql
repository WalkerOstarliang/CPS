/*
 提供证明表
*/
create table T_GZGL_TGZM
(
  ID      VARCHAR2(22) not null,
  SQRXM   VARCHAR2(30) not null,
  SQRXB   VARCHAR2(2) not null,
  SQRZJZL VARCHAR2(10),
  SQRZJHM VARCHAR2(30),
  SQRLXFS VARCHAR2(30) not null,
  SQSJ    DATE not null,
  TGZMLX  VARCHAR2(60) not null,
  TGZMNR  CLOB not null,
  CBSJ    DATE,
  CBDWDM  VARCHAR2(12),
  CBDWMC  VARCHAR2(100),
  CBRXM   VARCHAR2(30) not null,
  QFRXM   VARCHAR2(30) not null,
  CLJG    VARCHAR2(200),
  BZ      VARCHAR2(200),
  SSSQDM  VARCHAR2(12),
  SSSQMC  VARCHAR2(100),
  SSJWQDM VARCHAR2(12) not null,
  SSJWQMC VARCHAR2(100) not null,
  CZRXM   VARCHAR2(30),
  CZRJH   VARCHAR2(30),
  CZRSFZH VARCHAR2(18),
  CZSJ    DATE,
  CZDWDM  VARCHAR2(12),
  CZDWMC  VARCHAR2(100),
  DJRXM   VARCHAR2(30),
  DJRSFZH VARCHAR2(18),
  DJSJ    DATE,
  DJDWDM  VARCHAR2(12),
  DJDWMC  VARCHAR2(100),
  ZXBS    VARCHAR2(2),
  ZXSJ    DATE,
  SCSJ    DATE
);
-- Add comments to the table 
comment on table T_GZGL_TGZM
  is '为民服务--工作管理--提供证明表';
-- Add comments to the columns 
comment on column T_GZGL_TGZM.ID
  is '6位行政编码+6位日期+10位序列号';
comment on column T_GZGL_TGZM.SQRXM
  is '申请人姓名';
comment on column T_GZGL_TGZM.SQRXB
  is '申请人性别（参照“性别”字典）';
comment on column T_GZGL_TGZM.SQRZJZL
  is '申请人证件种类（参照“证件种类”字典）';
comment on column T_GZGL_TGZM.SQRZJHM
  is '申请人证件号码';
comment on column T_GZGL_TGZM.SQRLXFS
  is '申请人联系方式';
comment on column T_GZGL_TGZM.SQSJ
  is '申请时间';
comment on column T_GZGL_TGZM.TGZMLX
  is '提供证明类型';
comment on column T_GZGL_TGZM.TGZMNR
  is '提供证明内容';
comment on column T_GZGL_TGZM.CBSJ
  is '承办时间';
comment on column T_GZGL_TGZM.CBDWDM
  is '承办单位机构代码';
comment on column T_GZGL_TGZM.CBDWMC
  is '承办单位名称';
comment on column T_GZGL_TGZM.CBRXM
  is '承办人姓名';
comment on column T_GZGL_TGZM.QFRXM
  is '签发人姓名';
comment on column T_GZGL_TGZM.CLJG
  is '处理结果';
comment on column T_GZGL_TGZM.BZ
  is '备注';
comment on column T_GZGL_TGZM.SSSQDM
  is '所属社区代码';
comment on column T_GZGL_TGZM.SSSQMC
  is '所属社区名称';
comment on column T_GZGL_TGZM.SSJWQDM
  is '所属警务区代码';
comment on column T_GZGL_TGZM.SSJWQMC
  is '所属警务区名称';
comment on column T_GZGL_TGZM.CZRXM
  is '录入人姓名（操作人姓名）';
comment on column T_GZGL_TGZM.CZRJH
  is '操作人警号';
comment on column T_GZGL_TGZM.CZRSFZH
  is '操作人身份证号';
comment on column T_GZGL_TGZM.CZSJ
  is '操作时间（初始为登记时间，如果跟登记时间不一致代表修改时间）';
comment on column T_GZGL_TGZM.CZDWDM
  is '操作单位代码';
comment on column T_GZGL_TGZM.CZDWMC
  is '操作单位名称';
comment on column T_GZGL_TGZM.DJRXM
  is '登记人姓名';
comment on column T_GZGL_TGZM.DJRSFZH
  is '登记人身份证号';
comment on column T_GZGL_TGZM.DJSJ
  is '登记时间';
comment on column T_GZGL_TGZM.DJDWDM
  is '登记单位代码';
comment on column T_GZGL_TGZM.DJDWMC
  is '登记单位名称';
comment on column T_GZGL_TGZM.ZXBS
  is '注销标识（''0'':正常；''1'':注销；''2'':删除）';
comment on column T_GZGL_TGZM.ZXSJ
  is '注销时间';
comment on column T_GZGL_TGZM.SCSJ
  is '删除时间';
  
---提供证明表主键id序列
-- Create sequence 
create sequence SEQ_GZGL_TGZMID
minvalue 1
maxvalue 9999999999
start with 1000000000
increment by 1
cache 20
cycle;

--迷途人员表
-- Create table
create table T_GZGL_MTRY
(
  ID            VARCHAR2(22),
  MTRYXM        VARCHAR2(30) not null,
  MTRYXMBM      VARCHAR2(30),
  MTRYXB        VARCHAR2(2) not null,
  MTRYNL        VARCHAR2(3),
  MTRYCSRQ      DATE,
  MTRYZJLB      VARCHAR2(10),
  MTRYZJHM      VARCHAR2(30),
  MTRYJG        VARCHAR2(10),
  MTRYTMTZ      VARCHAR2(10) not null,
  MTRYKY        VARCHAR2(10),
  MTRYTBBJ      VARCHAR2(10) not null,
  MTRYSTZK      VARCHAR2(30),
  MTRYLY        VARCHAR2(30) not null,
  MTRYZWCJ      VARCHAR2(10),
  MTRYDNACJ     VARCHAR2(10),
  MTRYXX        VARCHAR2(10),
  MTRYZMZP      BLOB,
  MTRYYZTZ      VARCHAR2(400) not null,
  MTRYSSWP      VARCHAR2(400) not null,
  MTRYBFXSJ     DATE not null,
  MTRYBFXDD     VARCHAR2(100),
  MTRYMTJG      VARCHAR2(400),
  MTRYDSSJ      DATE not null,
  MTRYJBRXM     VARCHAR2(30) not null,
  MTRYSJRXM     VARCHAR2(30),
  MTRYSJRZJLB   VARCHAR2(10),
  MTRYSJRZJHM   VARCHAR2(30),
  MTRYSJRLXFS   VARCHAR2(30),
  MTRYSJRZZ     VARCHAR2(120),
  MTRYBZ        VARCHAR2(200),
  SSJWQDM       VARCHAR2(12),
  SSJWQMC       VARCHAR2(120),
  DJSJ          DATE,
  DJRXM         VARCHAR2(30),
  DJRJH         VARCHAR2(30),
  DJDWDM        VARCHAR2(12),
  DJDWMC        VARCHAR2(120),
  CZRXM         VARCHAR2(30),
  CZRJH         VARCHAR2(30),
  CZSJ          DATE,
  CZDWDM        VARCHAR2(12),
  CZDWMC        VARCHAR2(120),
  ZXBS          VARCHAR2(2),
  SCSJ          DATE,
  MTRYSG        VARCHAR2(10) not null,
  MTRYLSSJ      DATE,
  MTRYLSQX      VARCHAR2(120),
  MTRYJSDWMC    VARCHAR2(120),
  MTRYJSDWDH    VARCHAR2(50),
  MTRYJSDWDZ    VARCHAR2(120),
  MTRYRLRXM     VARCHAR2(30),
  MTRYRLRZJLB   VARCHAR2(10),
  MTRYRLRZJHM   VARCHAR2(30),
  MTRYRLRLXFS   VARCHAR2(30),
  MTRYRLRGX     VARCHAR2(10),
  MTRYRLRZZ     VARCHAR2(120),
  MTRYYSBZ      VARCHAR2(200),
  MTRYYSDJSJ    DATE,
  MTRYYSDJDWDM  VARCHAR2(12),
  MTRYYSDJDWMC  VARCHAR2(120),
  MTRYYSDJRXM   VARCHAR2(30),
  MTRYYSDJRJH   VARCHAR2(30),
  MTRYYSJBRXM   VARCHAR2(30),
  MTRYYSSSJWQDM VARCHAR2(12),
  MTRYYSSSJWQMC VARCHAR2(120)
);
-- Add comments to the table 
comment on table T_GZGL_MTRY
  is '为民服务--工作管理--迷途人员表';
-- Add comments to the columns 
comment on column T_GZGL_MTRY.ID
  is '6位行政编码+6位日期+10位序列号';
comment on column T_GZGL_MTRY.MTRYXM
  is '迷途人员姓名';
comment on column T_GZGL_MTRY.MTRYXMBM
  is '迷途人员姓名别名';
comment on column T_GZGL_MTRY.MTRYXB
  is '迷途人员性别（参照“性别”字典）';
comment on column T_GZGL_MTRY.MTRYNL
  is '迷途人员年龄';
comment on column T_GZGL_MTRY.MTRYCSRQ
  is '迷途人员出生日期';
comment on column T_GZGL_MTRY.MTRYZJLB
  is '迷途人员证件类别（参照“证件种类”字典）';
comment on column T_GZGL_MTRY.MTRYZJHM
  is '迷途人员证件号码';
comment on column T_GZGL_MTRY.MTRYJG
  is '迷途人员籍贯（参照“籍贯”字典）';
comment on column T_GZGL_MTRY.MTRYTMTZ
  is '迷途人员体貌特征（参照“特殊特征”字典）';
comment on column T_GZGL_MTRY.MTRYKY
  is '迷途人员口音（参照“口音代码”字典）';
comment on column T_GZGL_MTRY.MTRYTBBJ
  is '迷途人员体表标记';
comment on column T_GZGL_MTRY.MTRYSTZK
  is '迷途人员身体状况';
comment on column T_GZGL_MTRY.MTRYLY
  is '迷途人员来源';
comment on column T_GZGL_MTRY.MTRYZWCJ
  is '迷途人员指纹采集';
comment on column T_GZGL_MTRY.MTRYDNACJ
  is '迷途人员DNA采集';
comment on column T_GZGL_MTRY.MTRYXX
  is '迷途人员血型（参照“血型”字典）';
comment on column T_GZGL_MTRY.MTRYZMZP
  is '迷途人员正面照片';
comment on column T_GZGL_MTRY.MTRYYZTZ
  is '迷途人员衣着特征';
comment on column T_GZGL_MTRY.MTRYSSWP
  is '迷途人员随身物品';
comment on column T_GZGL_MTRY.MTRYBFXSJ
  is '迷途人员被发现时间';
comment on column T_GZGL_MTRY.MTRYBFXDD
  is '迷途人员被发现地点';
comment on column T_GZGL_MTRY.MTRYMTJG
  is '迷途人员迷途经过';
comment on column T_GZGL_MTRY.MTRYDSSJ
  is '迷途人员到所时间';
comment on column T_GZGL_MTRY.MTRYJBRXM
  is '迷途人员经办人姓名';
comment on column T_GZGL_MTRY.MTRYSJRXM
  is '迷途人员送交人姓名';
comment on column T_GZGL_MTRY.MTRYSJRZJLB
  is '迷途人员送交人证件类别（参照“证件种类”字典）';
comment on column T_GZGL_MTRY.MTRYSJRZJHM
  is '迷途人员送交人证件号码';
comment on column T_GZGL_MTRY.MTRYSJRLXFS
  is '迷途人员送交人联系方式';
comment on column T_GZGL_MTRY.MTRYSJRZZ
  is '迷途人员送交人员地址';
comment on column T_GZGL_MTRY.MTRYBZ
  is '备注';
comment on column T_GZGL_MTRY.SSJWQDM
  is '所属警务区代码';
comment on column T_GZGL_MTRY.SSJWQMC
  is '所属警务区名称';
comment on column T_GZGL_MTRY.DJSJ
  is '登记时间';
comment on column T_GZGL_MTRY.DJRXM
  is '登记人姓名';
comment on column T_GZGL_MTRY.DJRJH
  is '登记人警号';
comment on column T_GZGL_MTRY.DJDWDM
  is '登记单位代码';
comment on column T_GZGL_MTRY.DJDWMC
  is '登记单位名称';
comment on column T_GZGL_MTRY.CZRXM
  is '操作人姓名';
comment on column T_GZGL_MTRY.CZRJH
  is '操作人警号';
comment on column T_GZGL_MTRY.CZSJ
  is '操作时间（如跟登记时间不一致，代表修改时间）';
comment on column T_GZGL_MTRY.CZDWDM
  is '操作单位代码';
comment on column T_GZGL_MTRY.CZDWMC
  is '操作单位名称';
comment on column T_GZGL_MTRY.ZXBS
  is '注销标识（''0'':正常；''1'':注销；''2'':删除）';
comment on column T_GZGL_MTRY.SCSJ
  is '删除时间';
comment on column T_GZGL_MTRY.MTRYSG
  is '迷途人员身高（单位：厘米）';
comment on column T_GZGL_MTRY.MTRYLSSJ
  is '迷途人员离所时间（属移送信息）';
comment on column T_GZGL_MTRY.MTRYLSQX
  is '迷途人员离所去向（属移送信息）';
comment on column T_GZGL_MTRY.MTRYJSDWMC
  is '迷途人员接收单位名称（属移送信息）';
comment on column T_GZGL_MTRY.MTRYJSDWDH
  is '迷途人员接收单位电话（属移送信息）';
comment on column T_GZGL_MTRY.MTRYJSDWDZ
  is '迷途人员接收单位地址（属移送信息）';
comment on column T_GZGL_MTRY.MTRYRLRXM
  is '迷途人员认领人姓名（属移送信息）';
comment on column T_GZGL_MTRY.MTRYRLRZJLB
  is '迷途人员认领人证件类别（参照“证件种类”字典）（属移送信息）';
comment on column T_GZGL_MTRY.MTRYRLRZJHM
  is '迷途人员认领人证件号码（属移送信息）';
comment on column T_GZGL_MTRY.MTRYRLRLXFS
  is '迷途人员认领人联系方式（属移送信息）';
comment on column T_GZGL_MTRY.MTRYRLRGX
  is '迷途人员与认领人关系（参照“与户主关系”字典）（属移送信息）';
comment on column T_GZGL_MTRY.MTRYRLRZZ
  is '迷途人员认领人住址（属移送信息）';
comment on column T_GZGL_MTRY.MTRYYSBZ
  is '迷途人员移送信息备注（属移送信息）';
comment on column T_GZGL_MTRY.MTRYYSDJSJ
  is '迷途人员移送信息登记时间（属移送信息）';
comment on column T_GZGL_MTRY.MTRYYSDJDWDM
  is '迷途人员移送信息登记单位代码（属移送信息）';
comment on column T_GZGL_MTRY.MTRYYSDJDWMC
  is '迷途人员移送信息登记单位名称（属移送信息）';
comment on column T_GZGL_MTRY.MTRYYSDJRXM
  is '迷途人员移送信息登记人姓名（属移送信息）';
comment on column T_GZGL_MTRY.MTRYYSDJRJH
  is '迷途人员移送信息登记人警号（属移送信息）';
comment on column T_GZGL_MTRY.MTRYYSJBRXM
  is '迷途人员移送信息经办人姓名（属移送信息）';
comment on column T_GZGL_MTRY.MTRYYSSSJWQDM
  is '迷途人员移送所属警务区代码（属移送信息）';
comment on column T_GZGL_MTRY.MTRYYSSSJWQMC
  is '迷途人员移送所属警务区名称（属移送信息）';

--迷途人员主键序列
-- Create sequence 
create sequence SEQ_GZGL_MTRYID
minvalue 1
maxvalue 9999999999
start with 1000000000
increment by 1
cache 20
cycle;

--弃婴信息表
-- Create table
create table T_GZGL_QYRY
(
  ID          VARCHAR2(22),
  QYRYXM      VARCHAR2(30) not null,
  QYRYXMBM    VARCHAR2(30),
  QYRYXB      VARCHAR2(2) not null,
  QYRYNL      VARCHAR2(3),
  QYRYCSRQ    DATE,
  QYRYZJLB    VARCHAR2(10),
  QYRYZJHM    VARCHAR2(30),
  QYRYJG      VARCHAR2(10),
  QYRYTQYZ    VARCHAR2(10) not null,
  QYRYTBBJ    VARCHAR2(10) not null,
  QYRYSTZK    VARCHAR2(30),
  QYRYLY      VARCHAR2(30) not null,
  QYRYZWCJ    VARCHAR2(10),
  QYRYDNACJ   VARCHAR2(10),
  QYRYXX      VARCHAR2(10),
  QYRYZMZP    BLOB,
  QYRYYZTZ    VARCHAR2(400) not null,
  QYRYSSWP    VARCHAR2(400) not null,
  QYRYBFXSJ   DATE not null,
  QYRYBFXDD   VARCHAR2(100),
  QYRYQYJG    VARCHAR2(400),
  QYRYDSSJ    DATE not null,
  QYRYJBRXM   VARCHAR2(30) not null,
  QYRYSJRXM   VARCHAR2(30),
  QYRYSJRZJLB VARCHAR2(10),
  QYRYSJRZJHM VARCHAR2(30),
  QYRYSJRLXFS VARCHAR2(30),
  QYRYSJRZZ   VARCHAR2(120),
  QYRYBZ      VARCHAR2(200),
  SSJWQDM     VARCHAR2(12),
  SSJWQMC     VARCHAR2(120),
  DJSJ        DATE,
  DJRXM       VARCHAR2(30),
  DJRJH       VARCHAR2(30),
  DJDWDM      VARCHAR2(12),
  DJDWMC      VARCHAR2(120),
  CZRXM       VARCHAR2(30),
  CZRJH       VARCHAR2(30),
  CZSJ        DATE,
  CZDWDM      VARCHAR2(12),
  CZDWMC      VARCHAR2(120),
  ZXBS        VARCHAR2(2),
  SCSJ        DATE,
  QYRYFXRXM   VARCHAR2(30),
  QYRYFXRSFZH VARCHAR2(18),
  QYRYFXRZJLB VARCHAR2(10),
  QYRYFXRZJHM VARCHAR2(30),
  QYRYFXRZZ   VARCHAR2(200),
  QYRYFXRLXFS VARCHAR2(30),
  QYRYLSSJ    DATE,
  QYRYLSQX    VARCHAR2(120),
  QYRYJSDWMC  VARCHAR2(120),
  QYRYJSDWDH  VARCHAR2(50),
  QYRYJSDWDZ  VARCHAR2(120),
  QYRYRLRXM   VARCHAR2(30),
  QYRYRLRSFZH VARCHAR2(18),
  QYRYRLRZJLB VARCHAR2(10),
  QYRYRLRZJHM VARCHAR2(30),
  QYRYRLRLXFS VARCHAR2(30),
  QYRYYRLRGX  VARCHAR2(10),
  QYRYRLRZZ   VARCHAR2(120),
  QYRYYSJBRXM VARCHAR2(30),
  QYRYYSSPRXM VARCHAR2(30),
  QYRYYSBZ    VARCHAR2(200),
  QYYSSSJWQDM VARCHAR2(12),
  QYYSSSJWQMC VARCHAR2(120),
  QYYSDJRXM   VARCHAR2(30),
  QYYSDJSJ    DATE,
  QYYSDJDWDM  VARCHAR2(12),
  QYYSDJDWMC  VARCHAR2(120)
);
-- Add comments to the table 
comment on table T_GZGL_QYRY
  is '为民服务--工作管理--弃婴信息表';
-- Add comments to the columns 
comment on column T_GZGL_QYRY.ID
  is '6位行政编码+6位日期+10位序列号';
comment on column T_GZGL_QYRY.QYRYXM
  is '弃婴人员姓名';
comment on column T_GZGL_QYRY.QYRYXMBM
  is '弃婴人员姓名别名';
comment on column T_GZGL_QYRY.QYRYXB
  is '弃婴人员性别（参照“性别”字典）';
comment on column T_GZGL_QYRY.QYRYNL
  is '弃婴人员年龄';
comment on column T_GZGL_QYRY.QYRYCSRQ
  is '弃婴人员出生日期';
comment on column T_GZGL_QYRY.QYRYZJLB
  is '弃婴人员证件类别（参照“证件种类”字典）';
comment on column T_GZGL_QYRY.QYRYZJHM
  is '弃婴人员证件号码';
comment on column T_GZGL_QYRY.QYRYJG
  is '弃婴人员籍贯（参照“籍贯”字典）';
comment on column T_GZGL_QYRY.QYRYTQYZ
  is '弃婴人员体貌特征（参照“特殊特征”字典）';
comment on column T_GZGL_QYRY.QYRYTBBJ
  is '弃婴人员体表标记';
comment on column T_GZGL_QYRY.QYRYSTZK
  is '弃婴人员身体状况';
comment on column T_GZGL_QYRY.QYRYLY
  is '弃婴人员来源';
comment on column T_GZGL_QYRY.QYRYZWCJ
  is '弃婴人员指纹采集';
comment on column T_GZGL_QYRY.QYRYDNACJ
  is '弃婴人员DNA采集';
comment on column T_GZGL_QYRY.QYRYXX
  is '弃婴人员血型（参照“血型”字典）';
comment on column T_GZGL_QYRY.QYRYZMZP
  is '弃婴人员正面照片';
comment on column T_GZGL_QYRY.QYRYYZTZ
  is '弃婴人员衣着特征';
comment on column T_GZGL_QYRY.QYRYSSWP
  is '弃婴人员随身物品';
comment on column T_GZGL_QYRY.QYRYBFXSJ
  is '弃婴人员被发现时间';
comment on column T_GZGL_QYRY.QYRYBFXDD
  is '弃婴人员被发现地点';
comment on column T_GZGL_QYRY.QYRYQYJG
  is '弃婴人员发现经过';
comment on column T_GZGL_QYRY.QYRYDSSJ
  is '弃婴人员到所时间';
comment on column T_GZGL_QYRY.QYRYJBRXM
  is '弃婴人员经办人姓名';
comment on column T_GZGL_QYRY.QYRYSJRXM
  is '弃婴人员送交人姓名';
comment on column T_GZGL_QYRY.QYRYSJRZJLB
  is '弃婴人员送交人证件类别（参照“证件种类”字典）';
comment on column T_GZGL_QYRY.QYRYSJRZJHM
  is '弃婴人员送交人证件号码';
comment on column T_GZGL_QYRY.QYRYSJRLXFS
  is '弃婴人员送交人联系方式';
comment on column T_GZGL_QYRY.QYRYSJRZZ
  is '弃婴人员送交人员地址';
comment on column T_GZGL_QYRY.QYRYBZ
  is '备注';
comment on column T_GZGL_QYRY.SSJWQDM
  is '所属警务区代码';
comment on column T_GZGL_QYRY.SSJWQMC
  is '所属警务区名称';
comment on column T_GZGL_QYRY.DJSJ
  is '登记时间';
comment on column T_GZGL_QYRY.DJRXM
  is '登记人姓名';
comment on column T_GZGL_QYRY.DJRJH
  is '登记人警号';
comment on column T_GZGL_QYRY.DJDWDM
  is '登记单位代码';
comment on column T_GZGL_QYRY.DJDWMC
  is '登记单位名称';
comment on column T_GZGL_QYRY.CZRXM
  is '操作人姓名';
comment on column T_GZGL_QYRY.CZRJH
  is '操作人警号';
comment on column T_GZGL_QYRY.CZSJ
  is '操作时间（如跟登记时间不一致，代表修改时间）';
comment on column T_GZGL_QYRY.CZDWDM
  is '操作单位代码';
comment on column T_GZGL_QYRY.CZDWMC
  is '操作单位名称';
comment on column T_GZGL_QYRY.ZXBS
  is '注销标识（''0'':正常；''1'':注销；''2'':删除）';
comment on column T_GZGL_QYRY.SCSJ
  is '删除时间';
comment on column T_GZGL_QYRY.QYRYFXRXM
  is '弃婴人员发现人姓名';
comment on column T_GZGL_QYRY.QYRYFXRSFZH
  is '弃婴人员发现人身份证号码';
comment on column T_GZGL_QYRY.QYRYFXRZJLB
  is '弃婴人员发现人证件类别（参照“证件种类”字典）';
comment on column T_GZGL_QYRY.QYRYFXRZJHM
  is '弃婴人员发现人证件号码';
comment on column T_GZGL_QYRY.QYRYFXRZZ
  is '弃婴人员发现人住址';
comment on column T_GZGL_QYRY.QYRYFXRLXFS
  is '弃婴人员发现人联系方式';
comment on column T_GZGL_QYRY.QYRYLSSJ
  is '弃婴离所时间（属移送信息）';
comment on column T_GZGL_QYRY.QYRYLSQX
  is '弃婴离所去向（属移送信息）';
comment on column T_GZGL_QYRY.QYRYJSDWMC
  is '弃婴接收单位名称（属移送信息）';
comment on column T_GZGL_QYRY.QYRYJSDWDH
  is '弃婴接收单位电话（属移送信息）';
comment on column T_GZGL_QYRY.QYRYJSDWDZ
  is '弃婴接收单位地址（属移送信息）';
comment on column T_GZGL_QYRY.QYRYRLRXM
  is '弃婴认领人姓名（属移送信息）';
comment on column T_GZGL_QYRY.QYRYRLRSFZH
  is '弃婴认领人身份证号码（属移送信息）';
comment on column T_GZGL_QYRY.QYRYRLRZJLB
  is '弃婴认领人证件类别（属移送信息）';
comment on column T_GZGL_QYRY.QYRYRLRZJHM
  is '弃婴认领人证件号码（属移送信息）';
comment on column T_GZGL_QYRY.QYRYRLRLXFS
  is '弃婴认领人联系方式（属移送信息）';
comment on column T_GZGL_QYRY.QYRYYRLRGX
  is '弃婴与认领人关系（参考“与户主关系”字典）（属移送信息）';
comment on column T_GZGL_QYRY.QYRYRLRZZ
  is '认领人住址（属移送信息）';
comment on column T_GZGL_QYRY.QYRYYSJBRXM
  is '认领经办人姓名（属移送信息）';
comment on column T_GZGL_QYRY.QYRYYSSPRXM
  is '弃婴认领审批人姓名（属移送信息）';
comment on column T_GZGL_QYRY.QYRYYSBZ
  is '弃婴认领备注（属移送信息）';
comment on column T_GZGL_QYRY.QYYSSSJWQDM
  is '弃婴移送所属警务区代码（属移送信息）';
comment on column T_GZGL_QYRY.QYYSSSJWQMC
  is '弃婴移送所属警务区名称（属移送信息）';
comment on column T_GZGL_QYRY.QYYSDJRXM
  is '弃婴移送登记人姓名（属移送信息）';
comment on column T_GZGL_QYRY.QYYSDJSJ
  is '弃婴移送登记时间（属移送信息）';
comment on column T_GZGL_QYRY.QYYSDJDWDM
  is '弃婴移送信息登记单位代码（属移送信息）';
comment on column T_GZGL_QYRY.QYYSDJDWMC
  is '弃婴移送信息登记单位名称（属移送信息）';

--弃婴表主键序列
-- Create sequence 
create sequence SEQ_GZGL_QYRYID
minvalue 1
maxvalue 9999999999
start with 1000000000
increment by 1
cache 20
cycle;


  