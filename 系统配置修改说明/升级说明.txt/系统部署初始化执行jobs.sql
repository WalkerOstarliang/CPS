create database link TO_ST_SQJW
  connect to SQJW identified by "sqjw_kc"
  using '(DESCRIPTION =
    (ADDRESS_LIST =
      (ADDRESS = (PROTOCOL = TCP)(HOST = 10.142.56.151)(PORT = 1521))
    )
    (CONNECT_DATA =
      (SERVICE_NAME = sqjw)
    )
  )';

var job number; 
begin
  sys.dbms_job.submit(job => :job,
                      what => 'p_syn_czrk_st_sqjw;',
                      next_date => to_date('17-04-2015 03:00:00', 'dd-mm-yyyy hh24:mi:ss'),
                      interval => 'trunc(sysdate)+1+ 3/24');
  commit;
end;
/

var job number;  
begin
  sys.dbms_job.submit(job => :job,
                      what => 'P_EXEC_CYRY_SYRKDJCHECK;',
                      next_date => to_date('16-04-2015 10:57:32', 'dd-mm-yyyy hh24:mi:ss'),
                      interval => 'sysdate + (10/(24*60))');
  commit;
end;
/
var job number;
begin
  sys.dbms_job.submit(job => :job,
                      what => 'p_exec_changexzqhfordata;',
                      next_date => to_date('16-04-2015 11:28:38', 'dd-mm-yyyy hh24:mi:ss'),
                      interval => 'sysdate + 1/24');
  commit;
end;
/
var job number;
begin
  sys.dbms_job.submit(job => :job,
                      what => 'p_exec_organization_sjjs_sync;',
                      next_date => to_date('16-04-2015 11:30:10', 'dd-mm-yyyy hh24:mi:ss'),
                      interval => 'sysdate+1/24');
  commit;
end;
/
var job number;
begin
  sys.dbms_job.submit(job => :job,
                      what => 'p_auto_zdryzdtg;',
                      next_date => to_date('17-04-2015 01:00:00', 'dd-mm-yyyy hh24:mi:ss'),
                      interval => 'trunc(sysdate)+1+1/24');
  commit;
end;
/
var job number;
begin
  sys.dbms_job.submit(job => :job,
                      what => 'P_EXEC_PCSJBQKTJ;',
                      next_date => to_date('16-04-2015 21:00:00', 'dd-mm-yyyy hh24:mi:ss'),
                      interval => 'trunc(sysdate) + 21/24');
  commit;
end;
/