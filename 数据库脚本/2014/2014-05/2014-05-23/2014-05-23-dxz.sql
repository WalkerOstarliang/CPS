-- Add/modify columns 
alter table T_ZA_WYXQ add ywwygs varchar2(2);
-- Add comments to the columns 
comment on column T_ZA_WYXQ.ywwygs
  is '有无物业公司（0：无 1：有）';
  
alter table T_ZA_WYXQ modify WYGS null;
alter table T_ZA_WYXQ modify WYGSFZR null;
alter table T_ZA_WYXQ modify LDS null;
alter table T_ZA_WYXQ modify JCKS null;
alter table T_ZA_WYXQ modify SFYJZTCC null;