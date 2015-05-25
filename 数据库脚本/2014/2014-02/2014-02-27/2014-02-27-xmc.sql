create or replace function f_get_czfwbpbm(v_orgcode varchar2,v_czfwbh varchar2)
return varchar2
--获取出租房屋标牌编码
as

       v_czfwbpbm varchar2(100);
begin
       select zhjc||'(租)字'||substr(v_orgcode,7,2)||substr(v_czfwbh,15,6) into v_czfwbpbm from t_common_hnxzqh where dm=substr(v_orgcode,1,6)||'000000' and leve='3';
       return v_czfwbpbm;
end;
/