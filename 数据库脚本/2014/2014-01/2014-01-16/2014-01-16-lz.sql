-- Add/modify columns 
alter table T_COMMON_DZJLX add djsj date;
alter table T_COMMON_DZJLX add djrjh varchar2(6);
-- Add comments to the columns 
comment on column T_COMMON_DZJLX.djsj
  is '登记时间';
comment on column T_COMMON_DZJLX.djrjh
  is '登记人警号';