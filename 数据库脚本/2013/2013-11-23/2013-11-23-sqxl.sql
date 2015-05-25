-- Drop columns 
alter table T_GZGL_XLDRWAPXX drop column gzqsrq;
alter table T_GZGL_XLDRWAPXX drop column gzjzrq;
alter table T_GZGL_XLDRWAPXX drop column gzqstime;
alter table T_GZGL_XLDRWAPXX drop column gzjstime;
alter table T_GZGL_XLDRWAPXX add xlfs varchar2(60);
-- Add comments to the columns 
comment on column T_GZGL_XLDRWAPXX.xlfs
  is '巡逻方式';
-- Add/modify columns 
alter table T_GZGL_XLDRWAPXX add xlsj date;
alter table T_GZGL_XLDRWAPXX add ddmj varchar2(30);
-- Add comments to the columns 
comment on column T_GZGL_XLDRWAPXX.xlsj
  is '巡逻时间';
comment on column T_GZGL_XLDRWAPXX.ddmj
  is '带队民警';
