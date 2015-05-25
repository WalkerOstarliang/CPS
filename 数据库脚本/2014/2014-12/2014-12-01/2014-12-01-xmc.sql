-- Create table
create table T_TJFX_LRDKTJBB
(
  ORGCODE     VARCHAR2(12),
  ORGNAME     VARCHAR2(120),
  PARENT_CODE VARCHAR2(12),
  LEVE        NUMBER,
  TJRQ        VARCHAR2(8),
  TJSJ        DATE,
  TJQSSJ      DATE,
  TJJZSJ      DATE,
  LDRKZS      NUMBER,
  LDRKNANS    NUMBER,
  LDRKNVS     NUMBER,
  YBJZZS      NUMBER,
  YLFNS       NUMBER
)
tablespace TS_DT_SQJW
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255;
-- Add comments to the table 
comment on table T_TJFX_LRDKTJBB
  is '流动人口统计报表';
-- Add comments to the columns 
comment on column T_TJFX_LRDKTJBB.ORGCODE
  is '单位代码';
comment on column T_TJFX_LRDKTJBB.ORGNAME
  is '单位名称';
comment on column T_TJFX_LRDKTJBB.PARENT_CODE
  is '父类代码';
comment on column T_TJFX_LRDKTJBB.LEVE
  is '层级';
comment on column T_TJFX_LRDKTJBB.TJRQ
  is '统计日期';
comment on column T_TJFX_LRDKTJBB.TJSJ
  is '统计时间';
comment on column T_TJFX_LRDKTJBB.TJQSSJ
  is '统计起始时间';
comment on column T_TJFX_LRDKTJBB.TJJZSJ
  is '统计截止时间';
comment on column T_TJFX_LRDKTJBB.LDRKZS
  is '流动人口总是';
comment on column T_TJFX_LRDKTJBB.LDRKNANS
  is '流动人口男人数';
comment on column T_TJFX_LRDKTJBB.LDRKNVS
  is '流动人口女人数';
comment on column T_TJFX_LRDKTJBB.YBJZZS
  is '已办居住证数';
comment on column T_TJFX_LRDKTJBB.YLFNS
  is '育龄妇女数';
