-- Create table
create table T_TJFX_JZZTJBB
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
  ZBZS        NUMBER,
  BSBZRS      NUMBER,
  WSBZRS      NUMBER,
  NANBZRS     NUMBER,
  NVBZRS      NUMBER,
  FZS         NUMBER,
  YSBLS       NUMBER
);
-- Add comments to the table 
comment on table T_TJFX_JZZTJBB
  is '居住证统计报表';
-- Add comments to the columns 
comment on column T_TJFX_JZZTJBB.ORGCODE
  is '机构代码';
comment on column T_TJFX_JZZTJBB.ORGNAME
  is '机构名称';
comment on column T_TJFX_JZZTJBB.PARENT_CODE
  is '父类代码';
comment on column T_TJFX_JZZTJBB.LEVE
  is '层级';
comment on column T_TJFX_JZZTJBB.TJRQ
  is '统计日期';
comment on column T_TJFX_JZZTJBB.TJSJ
  is '统计时间';
comment on column T_TJFX_JZZTJBB.TJQSSJ
  is '统计起始时间';
comment on column T_TJFX_JZZTJBB.TJJZSJ
  is '统计截止时间';
comment on column T_TJFX_JZZTJBB.LDRKZS
  is '流动人口总数';
comment on column T_TJFX_JZZTJBB.ZBZS
  is '总办证数';
comment on column T_TJFX_JZZTJBB.BSBZRS
  is '本省办证人数';
comment on column T_TJFX_JZZTJBB.WSBZRS
  is '外省办证人数';
comment on column T_TJFX_JZZTJBB.NANBZRS
  is '男办证人数';
comment on column T_TJFX_JZZTJBB.NVBZRS
  is '女办证人数';
comment on column T_TJFX_JZZTJBB.FZS
  is '废证数';
comment on column T_TJFX_JZZTJBB.YSBLS
  is '遗失补领数';


-- Create/Recreate indexes 
create index IDX_JZZTJBB_ORGCODE on T_TJFX_JZZTJBB (ORGCODE)
  tablespace TS_IDX_SQJW
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create index IDX_JZZTJBB_TJRQ on T_TJFX_JZZTJBB (TJRQ)
  tablespace TS_IDX_SQJW
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
