-- Create table
create table T_LSGL_CZFW_CZRXX
(
  ID      VARCHAR2(32) not null,
  CZFWBH  VARCHAR2(30),
  FWID    VARCHAR2(20),
  CZRBH   VARCHAR2(32),
  CZRZJZL VARCHAR2(5),
  CZRZJHM VARCHAR2(20),
  XM      VARCHAR2(30),
  XB      VARCHAR2(5),
  CSRQ    DATE,
  LXFS    VARCHAR2(11),
  CZRQ    DATE,
  CZYT    VARCHAR2(2),
  ZXRQ    DATE,
  CZRZT   VARCHAR2(2),
  ZXYY    VARCHAR2(200),
  ZXBS    VARCHAR2(2),
  SSXQ    VARCHAR2(6),
  SLRQ    DATE,
  BZ      VARCHAR2(500),
  SSSQDM  VARCHAR2(12),
  DJRXM   VARCHAR2(30),
  DJDWDM  VARCHAR2(12),
  DJDWMC  VARCHAR2(120),
  DJRSFZH VARCHAR2(18),
  CZRXM   VARCHAR2(30),
  CZDWDM  VARCHAR2(12),
  CZDWMC  VARCHAR2(120),
  CZRSFZH VARCHAR2(18),
  ZXRXM   VARCHAR2(30),
  ZXDWDM  VARCHAR2(12),
  ZXDWMC  VARCHAR2(120),
  ZXRSFZH VARCHAR2(18)
)
;
-- Add comments to the table 
comment on table T_LSGL_CZFW_CZRXX
  is '承租人信息';
-- Add comments to the columns 
comment on column T_LSGL_CZFW_CZRXX.ID
  is '主键ID';
comment on column T_LSGL_CZFW_CZRXX.CZFWBH
  is '出租房屋编号';
comment on column T_LSGL_CZFW_CZRXX.FWID
  is '房屋ID';
comment on column T_LSGL_CZFW_CZRXX.CZRBH
  is '承租人编号';
comment on column T_LSGL_CZFW_CZRXX.CZRZJZL
  is '证件种类';
comment on column T_LSGL_CZFW_CZRXX.CZRZJHM
  is '证件号码';
comment on column T_LSGL_CZFW_CZRXX.XM
  is '承租人姓名';
comment on column T_LSGL_CZFW_CZRXX.XB
  is '承租人性别';
comment on column T_LSGL_CZFW_CZRXX.CSRQ
  is '出生日期';
comment on column T_LSGL_CZFW_CZRXX.LXFS
  is '联系方式';
comment on column T_LSGL_CZFW_CZRXX.CZRQ
  is '承租日期';
comment on column T_LSGL_CZFW_CZRXX.CZYT
  is '承租用途';
comment on column T_LSGL_CZFW_CZRXX.ZXRQ
  is '注销日期';
comment on column T_LSGL_CZFW_CZRXX.CZRZT
  is '1普通 2登记复杂人';
comment on column T_LSGL_CZFW_CZRXX.ZXYY
  is '注销原因';
comment on column T_LSGL_CZFW_CZRXX.ZXBS
  is '注销标识';
comment on column T_LSGL_CZFW_CZRXX.SSXQ
  is '省市县区';
comment on column T_LSGL_CZFW_CZRXX.SLRQ
  is '受理日期';
comment on column T_LSGL_CZFW_CZRXX.BZ
  is '备注';
comment on column T_LSGL_CZFW_CZRXX.SSSQDM
  is '所属社区代码';
comment on column T_LSGL_CZFW_CZRXX.DJRXM
  is '登记人姓名';
comment on column T_LSGL_CZFW_CZRXX.DJDWDM
  is '登记单位代码';
comment on column T_LSGL_CZFW_CZRXX.DJDWMC
  is '登记单位名称';
comment on column T_LSGL_CZFW_CZRXX.DJRSFZH
  is '登记人身份证号';
comment on column T_LSGL_CZFW_CZRXX.CZRXM
  is '操作人姓名';
comment on column T_LSGL_CZFW_CZRXX.CZDWDM
  is '操作单位代码';
comment on column T_LSGL_CZFW_CZRXX.CZDWMC
  is '操作单位名称';
comment on column T_LSGL_CZFW_CZRXX.CZRSFZH
  is '操作人身份证号';
comment on column T_LSGL_CZFW_CZRXX.ZXRXM
  is '注销人姓名';
comment on column T_LSGL_CZFW_CZRXX.ZXDWDM
  is '注销单位代码';
comment on column T_LSGL_CZFW_CZRXX.ZXDWMC
  is '注销单位名称';
comment on column T_LSGL_CZFW_CZRXX.ZXRSFZH
  is '注销人身份证号';
