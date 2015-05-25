alter table T_ZA_JG_JBXX add Dwdz varchar2(400);
comment on column T_ZA_JG_JBXX.Dwdz
  is '单位地址';
  
--根据机构返回民警姓名  
create or replace function f_getmjbycode(code varchar2) return varchar2 as
  v_mj varchar2(400);
begin
  v_mj := '';
  select wmsys.wm_concat(realname)
    into v_mj
    from v_common_user
   where org_code = code;
  return v_mj;
end f_getmjbycode;
  
  
insert into t_common_dictionary values (seq_common.nextval,'ZDY_HYLB','行业类别','10','其他','','',1,'');
commit;

insert into t_common_parameter (ID, PROKEY, PROVALUE, DESCR)
values (11, 'bdzda_url', 'http://zhyy1.qbpt.ga/course/queryAction.do', '部电子档案');

insert into t_common_parameter (ID, PROKEY, PROVALUE, DESCR)
values (12, 'sdzda_url', 'http://10.142.56.122:9988/newDzda/login/check_externalSystemLogin.action', '省电子档案');

insert into t_common_parameter (ID, PROKEY, PROVALUE, DESCR)
values (13, 'csdzda_url', 'https://10.143.1.134:9443/eledoc/pki.faces', '长沙电子档案');
commit;  