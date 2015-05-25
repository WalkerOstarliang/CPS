-- Add/modify columns 
alter table T_GZGL_ERMXXY add xm varchar2(60);
alter table T_GZGL_ERMXXY add xb varchar2(2);
alter table T_GZGL_ERMXXY add csrq date;
-- Add comments to the columns 
comment on column T_GZGL_ERMXXY.xm
  is '人员姓名';
comment on column T_GZGL_ERMXXY.xb
  is '人员性别';
comment on column T_GZGL_ERMXXY.csrq
  is '出生日期';