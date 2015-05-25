-- Create table
create table T_COMMON_JZZTJ
(
  orgcode   VARCHAR2(12),
  orgname   VARCHAR2(120),
  jzzdys    NUMBER,
  jzzdjs    NUMBER,
  jzzdjms   NUMBER,
  jzzdjws   NUMBER,
  jzzdjbsrs NUMBER,
  jzzdjwsrs NUMBER,
  fzs       NUMBER,
  ysbds     NUMBER,
  ldrkdjs   NUMBER,
  jssj      DATE,
  zxsj      DATE default sysdate
);
-- Add comments to the columns 
comment on column T_COMMON_JZZTJ.orgcode
  is '单位代码';
comment on column T_COMMON_JZZTJ.orgname
  is '单位名称';
comment on column T_COMMON_JZZTJ.jzzdys
  is '居住证打印数';
comment on column T_COMMON_JZZTJ.jzzdjs
  is '居住证登记数';
comment on column T_COMMON_JZZTJ.jzzdjms
  is '居住证登记男人数';
comment on column T_COMMON_JZZTJ.jzzdjws
  is '居住证登记女人数';
comment on column T_COMMON_JZZTJ.jzzdjbsrs
  is '居住证登记本省人数';
comment on column T_COMMON_JZZTJ.jzzdjwsrs
  is '居住证登记外省人数';
comment on column T_COMMON_JZZTJ.fzs
  is '废证数';
comment on column T_COMMON_JZZTJ.ysbds
  is '遗失补打数';
comment on column T_COMMON_JZZTJ.ldrkdjs
  is '流动人口登记书';
comment on column T_COMMON_JZZTJ.jssj
  is '计算时间';
comment on column T_COMMON_JZZTJ.zxsj
  is '执行时间';

  
create or replace procedure p_exec_jzztj
 is
       v_jssj date;
begin
     v_jssj := trunc(sysdate - 1);
       
     insert into t_common_jzztj 
     select 
    org.orgcode,
    org.orgname,
    nvl(dys.dys,0) as jzzdys,    --居住证打印数
    nvl(djs.djs,0) as jzzdjs,    --居住证登记书
    nvl(xbfl.ms,0) as jzzdjms,        --居住证登记 男人数
    nvl(xbfl.ws,0) as jzzdjws,        --居住证登记 女人数
    nvl(qhfl.bss,0) as jzzdjbsrs,     --居住证登记  本省人数
    nvl(qhfl.wss,0) as jzzdjwsrs,     --居住证登记  外省人数
    nvl(fzs.fzs,0) as fzs,            --居住证废证数
    nvl(bds.bds,0) as ysbds,          --居住证遗失补打数
    nvl(lkdjs.lks,0) as ldrkdjs,       --流动人口登记数
    v_jssj as jssj ,       --计算时间 
    sysdate as zxsj
from t_common_organization_sjjs org
 left join 
   
   (
   --居住证打印数
   SELECT djdw, COUNT(1) dys
     FROM t_lsgl_ldrk_jzzxx
    WHERE jzzdyzt = '20'
      AND jzzzxbs = '0'
      and (trunc(djsj) = v_jssj or trunc(xgsj) = v_jssj )
    GROUP BY djdw
   ) dys
   on dys.djdw = org.orgcode

 left join 
 (
 --居住证登记数
 SELECT djdw, COUNT(1) djs
   FROM t_lsgl_ldrk_jzzxx
  WHERE jzzZXBS = '0'
  and trunc(djsj) = v_jssj
  GROUP BY djdw
  ) djs
  on djs.djdw = org.orgcode

left join (
--男，女（居住证登记数）
SELECT djdw,
       SUM(decode(xb, '1', xbs)) AS ms,
       SUM(decode(xb, '2', xbs)) AS ws
  FROM (SELECT djdw, xb, COUNT(1) AS xbs
          FROM t_lsgl_ldrk_jzzxx
         WHERE jzzZXBS = '0'
         and trunc(djsj) = v_jssj
         GROUP BY xb, djdw)
 GROUP BY djdw) xbfl
 on xbfl.djdw = org.orgcode
  
  left join 
 (
 --本省，外省（居住证登记数）
 SELECT djdw,
        SUM(decode(s1, 'bs', zs)) AS bss,
        SUM(decode(s1, 'ws', zs)) AS wss
   FROM (SELECT djdw, s1, COUNT(1) AS zs
           FROM (SELECT djdw, decode(substr(sfzh, 1, 2), '43', 'bs', 'ws') s1
                   FROM t_lsgl_ldrk_jzzxx a
                  WHERE jzzzxbs = '0'
                    AND trunc(djsj) = v_jssj)
          GROUP BY s1, djdw)
  GROUP BY djdw
 )  qhfl
 on qhfl.djdw = org.orgcode
 
 left join
  (
 --废证数
  SELECT djdw, COUNT(1) as fzs
    FROM t_lsgl_ldrk_jzzxx
   WHERE jzzdyzt = '20'
   and dyzt = '3'
   and jzzzxbs = '0'
   and trunc(xgsj) = v_jssj
   GROUP BY djdw
   ) fzs
   on fzs.djdw = org.orgcode
   
   left join 
  (
  --遗失补打数
  SELECT djdw, COUNT(1) as bds
    FROM t_lsgl_ldrk_jzzxx
   WHERE jzzdyzt = '20'
     AND dyzt = '2'
     and jzzzxbs = '0'
     and trunc(xgsj) = v_jssj
   GROUP BY djdw
   ) bds
   on bds.djdw = org.orgcode
   
   left join
   ( 
   --流口登记数
   SELECT djdwdm, COUNT(1) lks
     FROM t_lsgl_rk_ldrkzzxx
    WHERE zxbs = '0' AND trunc(djsj） = v_jssj GROUP BY djdwdm
    ) lkdjs
    on lkdjs.djdwdm = org.orgcode
    
    where org.leve = '5';
    commit;

end p_exec_jzztj;
/

begin
  sys.dbms_job.submit(job => :job,
                      what => 'p_exec_jzztj;',
                      next_date => to_date('12-08-2014 03:00:00', 'dd-mm-yyyy hh24:mi:ss'),
                      interval => 'trunc(sysdate)+1+3/24');
  commit;
end;
/  