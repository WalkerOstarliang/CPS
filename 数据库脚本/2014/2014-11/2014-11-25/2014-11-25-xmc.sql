-- Create table
create table T_TJFX_CZFWTJBB
(
  ORGCODE     VARCHAR2(12),
  ORGNAME     VARCHAR2(120),
  LEVE        NUMBER,
  PARENT_CODE VARCHAR2(12),
  TJRQ        VARCHAR2(8),
  TJSJ        DATE,
  TJQSRQ      VARCHAR2(8),
  TJJZRQ      VARCHAR2(8),
  CZFZS       NUMBER,
  CZWGFS      NUMBER,
  CZWSFS      NUMBER,
  YCZFS       NUMBER,
  QDZAZRZS    NUMBER,
  YBAZS       NUMBER,
  YCQZS       NUMBER
)
tablespace TS_DT_SQJW
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255;
-- Add comments to the table 
comment on table T_TJFX_CZFWTJBB
  is '出租房屋统计报表';
-- Add comments to the columns 
comment on column T_TJFX_CZFWTJBB.ORGCODE
  is '机构代码';
comment on column T_TJFX_CZFWTJBB.ORGNAME
  is '机构名称';
comment on column T_TJFX_CZFWTJBB.LEVE
  is '级别';
comment on column T_TJFX_CZFWTJBB.PARENT_CODE
  is '父类代码';
comment on column T_TJFX_CZFWTJBB.TJRQ
  is '统计日期';
comment on column T_TJFX_CZFWTJBB.TJSJ
  is '统计时间';
comment on column T_TJFX_CZFWTJBB.TJQSRQ
  is '统计起始日期';
comment on column T_TJFX_CZFWTJBB.TJJZRQ
  is '统计截止日期';
comment on column T_TJFX_CZFWTJBB.CZFZS
  is '出租房总数';
comment on column T_TJFX_CZFWTJBB.CZWGFS
  is '出租屋公房数';
comment on column T_TJFX_CZFWTJBB.CZWSFS
  is '出租屋私房数';
comment on column T_TJFX_CZFWTJBB.YCZFS
  is '已经出租房数';
comment on column T_TJFX_CZFWTJBB.QDZAZRZS
  is '签订治安责任状数';
comment on column T_TJFX_CZFWTJBB.YBAZS
  is '有备案证数';
comment on column T_TJFX_CZFWTJBB.YCQZS
  is '有产权证数';
