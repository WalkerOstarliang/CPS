-- Add/modify columns 
alter table T_LSGL_CZFW_JBXX modify CZFWBH VARCHAR2(30) not null;

-- Create sequence 
create sequence T_COMMON_FWJCPZ_ID
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;



create or replace function f_get_fwmaxjcsj(v_fwid varchar2)
return date
--获取房屋的最后一次单位检查时间
as
        v_maxjcdate    date;
begin
       select max(t.xcsj) into v_maxjcdate from t_lsgl_fw_czwxcdj t where t.fwid=v_fwid;
       return v_maxjcdate;
end;