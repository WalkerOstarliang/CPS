-- Created on 2015-2-9 by ADMINISTRATOR 
declare 
  -- Local variables here
  v_count integer;
begin
  select count(1) into v_count  from t_common_parameter where PROKEY='import.scheduler.start';
  if v_count <= 0 then
     insert into t_common_parameter (ID, PROKEY, PROVALUE, DESCR)
      values (17, 'import.scheduler.start', 'true', '是否启动系统定时任务自动导入任务配置');
      commit;
  end if;
end;
/