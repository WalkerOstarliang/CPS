-- Add/modify columns 
alter table T_TJFX_CZFWTJBB modify TJQSRQ VARCHAR2(14);
alter table T_TJFX_CZFWTJBB modify TJJZRQ VARCHAR2(14);


-- Create/Recreate indexes 
create index idx_CZFWTJBB_orgcode on T_TJFX_CZFWTJBB (orgcode);
create index idx_czfwtjbb_tjrq on T_TJFX_CZFWTJBB (tjrq);


-- Create/Recreate indexes 
create index idx_czfwtjbb_tjqsrq on T_TJFX_CZFWTJBB (tjqsrq)
  tablespace TS_IDX_SQJW
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create index idx_czfwtjbb_tjjzrq on T_TJFX_CZFWTJBB (tjjzrq)
  tablespace TS_IDX_SQJW
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
