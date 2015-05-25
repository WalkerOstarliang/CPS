create or replace package SQJW_TJBB_DW as
  --单位统计
  procedure p_tjbb_dwtj(djsj_start date, djsj_end date);
end SQJW_TJBB_DW;
/



create or replace package body SQJW_TJBB_DW is
  procedure p_tjbb_dwtj(djsj_start date, djsj_end date) is
    cursor cur_dwlist(v_djsjs date, v_djsje date) is
      select a.orgcode as dwdm,
             tzhy,
             ggcs,
             nbdw,
             wbdw,
             wb,
             swdw,
             lg,
             ksdw,
             jfdw,
             (a.qtdw + nvl(b.qtdw, 0)) as qtdw,
             sp,
             wldw,
             nvl(ddh, 0) as ddh,
             nvl(pmh, 0) as pmh,
             (tzhy - lg - ksdw - nvl(ddh, 0) - nvl(pmh, 0)) as qtth,
             (tzhy + ggcs + nbdw + wbdw + wb + swdw + lg + ksdw + jfdw +
             (a.qtdw + nvl(b.qtdw, 0)) + sp + wldw) as zs
        from (select orgcode,sum(tzhy) as tzhy,sum(ggcs) as ggcs,sum(nbdw) as nbdw,
                     sum(wbdw) as wbdw,sum(wb) as wb,sum(swdw) as swdw,sum(lg) as lg,
                     sum(ksdw) as ksdw,sum(jfdw) as jfdw,sum(qtdw) as qtdw,
                     sum(sp) as sp,sum(wldw) as wldw
                from (select orgcode,
                             decode(dwfl, '01', sl, 0) as tzhy,
                             decode(dwfl, '02', sl, 0) as ggcs,
                             decode(dwfl, '03', sl, 0) as nbdw,
                             decode(dwfl, '04', sl, 0) as wbdw,
                             decode(dwfl, '05', sl, 0) as wb,
                             decode(dwfl, '06', sl, 0) as swdw,
                             decode(dwfl, '07', sl, 0) as lg,
                             decode(dwfl, '08', sl, 0) as ksdw,
                             decode(dwfl, '09', sl, 0) as jfdw,
                             decode(dwfl, '10', sl, 0) as qtdw,
                             decode(dwfl, '11', sl, 0) as sp,
                             decode(dwfl, '12', sl, 0) as wldw
                        from (select a.djdwdm as orgcode,
                                     b.dm as dwfl,
                                     count(distinct a.jgbh) as sl
                                from t_za_jg_jbxx a, t_common_dictionary b
                               where instr(a.hylb, b.dm) > 0
                                 and (a.zxbs = '0' or zxbs is null)
                                 and a.djdwdm is not null
                                 and a.djsj >= v_djsjs
                                 and a.djsj <= v_djsje
                                 and b.zdlb = 'ZDY_HYLB'
                               group by b.dm, a.djdwdm))
               group by orgcode) a,
             (select djdwdm, count(1) as qtdw
                from t_za_jg_jbxx
               where (zxbs = '0' or zxbs is null)
                 and hylb is null
                 and djsj >= v_djsjs
                 and djsj <= v_djsje
                 and djdwdm is not null
               group by djdwdm) b,

             (select djdwdm, sum(ddh) as ddh, sum(pmh) as pmh
                from (select djdwdm,
                             case
                               when dwlb = '1909' then
                                count(1)
                               else
                                0
                             end ddh,
                             case
                               when dwlb = '1920' then
                                count(1)
                               else
                                0
                             end pmh
                        from t_za_jg_jbxx dw
                       where instr(hylb, '01') > 0
                         and djsj >= v_djsjs
                         and djsj <= v_djsje
                         and (dw.zxbs = '0' or dw.zxbs is null)
                       group by djdwdm, dwlb)
               group by djdwdm) c
       where a.orgcode = b.djdwdm(+)
         and a.orgcode = c.djdwdm(+);

   TYPE dw_recode IS TABLE OF cur_dwlist%ROWTYPE;
   dwlist dw_recode;
   
    v_djsj_start date := to_date('1900-01-01 00:00:00','yyyy-mm-dd hh24:mi:ss'); 
    v_djsj_end date := sysdate;
  begin
   if djsj_start is not null then
      v_djsj_start := djsj_start; 
   end if;
   if djsj_end is not null then 
      v_djsj_end := djsj_end;
   end if;
  
   open cur_dwlist(v_djsj_start,v_djsj_end);
   loop
   FETCH cur_dwlist BULK COLLECT INTO dwlist LIMIT 1000;
   EXIT WHEN dwlist.COUNT=0;
   FOR i IN dwlist.first .. dwlist.last LOOP
   begin
       insert into t_tjfx_dwtj
              (dwdm, tzhy, ggcs, nbdw, wbdw, wb, swdw, lg, ksdw, jfdw, qtdw, sp, wldw, ddh, pmh, qtth, zs, jssj, tjsj_s, tjsj_e)
       values
              (dwlist(i).dwdm, dwlist(i).tzhy, dwlist(i).ggcs, dwlist(i).nbdw, dwlist(i).wbdw, dwlist(i).wb, dwlist(i).swdw, dwlist(i).lg,
              dwlist(i).ksdw, dwlist(i).jfdw, dwlist(i).qtdw, dwlist(i).sp, dwlist(i).wldw, dwlist(i).ddh, dwlist(i).pmh, dwlist(i).qtth, dwlist(i).zs, sysdate,
               djsj_start, djsj_end);
   end;            
   end loop;
        commit;
   end loop;
   
  end p_tjbb_dwtj;
end SQJW_TJBB_DW;
/
