-- Add/modify columns 
alter table T_ZA_DWTB_OPLOG add qsdz varchar2(500);
alter table T_ZA_DWTB_OPLOG add qsdw varchar2(500);
-- Add comments to the columns 
comment on column T_ZA_DWTB_OPLOG.qsdz
  is '签收后的地址';
comment on column T_ZA_DWTB_OPLOG.qsdw
  is '签收后的单位';

-- Create sequence 
create sequence seq_wbdwshid
minvalue 1000000000000001
maxvalue 9999999999999999
start with 1000000000000001
increment by 1;