-- Add/modify columns 
alter table T_ZA_WYXQ add zxsj date;
alter table T_ZA_WYXQ add jlrq date;
alter table T_ZA_WYXQ add xqmj number;
-- Add comments to the columns 
comment on column T_ZA_WYXQ.zxsj
  is '注销时间';
comment on column T_ZA_WYXQ.jlrq
  is '建立日期';
comment on column T_ZA_WYXQ.xqmj
  is '小区面积';
  
  
  -- Add/modify columns 
alter table T_ZA_WYXQ rename column DJRSFZ to DJRSFZH;
-- Add comments to the columns 
comment on column T_ZA_WYXQ.CZRSFZH
  is '操作人身份证号';
-- Add/modify columns 
alter table T_ZA_WYXQ rename column SSPCSDMMC to SSPCSMC;

-- Create sequence 
create sequence seq_za_wyxq_id
minvalue 1000000001
maxvalue 9999999999
start with 1000000001
increment by 1;

  