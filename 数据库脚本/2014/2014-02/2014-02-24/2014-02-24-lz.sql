-- Create sequence 
create sequence T_COMMON_DICTIONARY_ID
minvalue 1
maxvalue 999999999999999999999999999
start with 800136
increment by 1
cache 20;


insert into t_common_dictionary values(T_COMMON_DICTIONARY_ID.Nextval,'ZDY_STXX_ZXBS','实体信息注销标识','1','正常','','','1','');
insert into t_common_dictionary values(T_COMMON_DICTIONARY_ID.Nextval,'ZDY_STXX_ZXBS','实体信息注销标识','0','注销','','','1','');
commit;