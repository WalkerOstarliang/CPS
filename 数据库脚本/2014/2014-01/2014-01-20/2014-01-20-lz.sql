-- Create sequence 
create sequence SEQ_LSGL_LDRKJZZXX_BH
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;




-- Add/modify columns 
alter table T_LSGL_LDRK_JZZXX modify FZRQ date;
alter table T_LSGL_LDRK_JZZXX modify DJSJ date;
alter table T_LSGL_LDRK_JZZXX modify XGSJ date;
alter table T_LSGL_LDRK_JZZXX modify JZZZXSJ date;