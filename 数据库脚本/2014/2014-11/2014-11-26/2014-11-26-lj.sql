
--数据脚本
-- Add/modify columns 
alter table T_AF_LMPCXX add ZXSJ date;
alter table T_AF_LMPCXX add YXX varchar2(1);
alter table T_AF_LMPCXX add ZXRJH varchar2(30);
alter table T_AF_LMPCXX add ZXRXM varchar2(30);
-- Add comments to the columns 
comment on column T_AF_LMPCXX.ZXSJ
  is '注销时间（人工注销）';
comment on column T_AF_LMPCXX.YXX
  is '（针对人工注销）有效性：0有效，1注销';
comment on column T_AF_LMPCXX.ZXRJH
  is '注销人警号';
comment on column T_AF_LMPCXX.ZXRXM
  is '注销人姓名';