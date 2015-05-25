-- Add/modify columns 
alter table T_COMMON_XQTJQK add RSDQSL number default 0;
-- Add comments to the columns 
comment on column T_COMMON_XQTJQK.RSDQSL
  is '入室盗窃数';


---

CREATE OR REPLACE PROCEDURE P_REPORT_COUNT_XQGK(rq varchar2) AS
  /***************************
  rq 计算月份(201309)
  YJYXZT 月结标志
  案件信息统计维度计算过程
  ***********************************/
  --游标
  CURSOR GETLIST IS
    select orgcode, parent_code, leve
      from sqjw.t_common_xqtjqk
     where parent_code is not null
    -- and orgcode = '430121413108'
     order by leve, orgcode;
  TYPE GETTYPE IS TABLE OF GETLIST%ROWTYPE;
  TYPE CURSOR_TYPE IS REF CURSOR;
  LIST    GETTYPE;
  CSRDATA CURSOR_TYPE; --数据来源
  -- rec     t_reportdimension_anjie %ROWTYPE;
  sql_fa varchar2(4000); --案件
  sql_tj varchar2(4000); --立案

  sql_inst varchar2(4000);
  sql_log  varchar2(4000);
  sql_err  varchar2(4000);

  PARENT_CODE_1 varchar2(4000);
  QJAJS_1       number := 0;
  QDAJS_1       number := 0;
  DQAJS_1       number := 0;
  ZPAJS_1       number := 0;
  DFXQCS_1      number := 0;
  AJZS_1        number := 0;
  --入室盗窃
  RSDQSL_1      number := 0;
  --
  rq_tmp date;
  num    number := 1;
  yxsj   varchar2(17);
  --YJYXZT_tmp varchar2(20);

BEGIN
  yxsj    := to_char(sysdate, 'YYYYMMDDHH24MISS');
  sql_log := 'insert into t_operate_log@TO_199(YXPCH,PROCEDURES_ID,PROCEDURES_NAME,YXZT/*,YJYXZT*/,YXSJ) values
           (:part1,:part2,:part3,:part4,:part5/*,:part6*/)';
  sql_err := 'insert  into  t_operate_err@TO_199(YXPCH,ERR_NUM,ERR_TEXT,YXSJ) values (:part1,:part2,:part3,:part4)';

  begin
    /* update sqjw.t_common_xqtjqk a
       set QJSL = 0, QDSL = 0, DQSL = 0, ZPSL = 0, DFXQCSL = 0, ZS = 0;
    commit;*/
    OPEN GETLIST;
    LOOP
      FETCH GETLIST BULK COLLECT
        INTO LIST LIMIT 1000;
      EXIT WHEN LIST.COUNT = 0;
      FOR I IN LIST.FIRST .. LIST.LAST LOOP
        if /*list(i).leve*/
         '1' < '6' then
          --050100 盗窃案 050200 诈骗案 050300 抢夺案 050400 敲诈勒索案 051000  
          --050202 入室盗窃案
          sql_tj := 'select parent_code,nvl(sum(qjajs), 0) qjajs,
            nvl(sum(qdajs), 0) qdajs,
            nvl(sum(dqajs), 0) dqajs,
            nvl(sum(zpajs), 0) zpajs,
            nvl(sum(rsdqsl),0) rsdqsj,
            nvl(sum(dfxqcs), 0) dfxqcs,
            nvl(sum(ajzs), 0) ajzs  from (select connect_by_root orgcode parent_code,orgcode from sqjw.t_common_xqtjqk xq start with orgcode =''' || list(i)
                   .orgcode || '''
            connect by prior xq.orgcode=parent_code)dw,(select /*+index(aj IDX_AJJBXXB_FARQ)*/aj.faanshequ,
            case when aj.anjianleibie like ''0501%'' then 1 else 0 end qjajs,
            case when aj.anjianleibie = ''050400'' then 1 else 0 end qdajs,
            case when aj.anjianleibie like ''0502%'' then 1 else 0 end dqajs,
            case when aj.anjianleibie like ''0503%'' then 1 else 0 end zpajs,
            case when aj.anjianleibie like ''0502%'' or aj.anjianleibie like ''0501%''
            or aj.anjianleibie like ''0503%'' or aj.anjianleibie like ''0504%''
            or aj.anjianleibie like ''0510%'' then 1 else 0 end dfxqcs,
            case when aj.anjianleibie = ''050202'' then 1 else 0 end rsdqsl,
            1 ajzs from cs_jz_zfba.t_ajjbxxb@TO_199 aj where  aj.farq>=to_char(to_date(''' || rq ||
                    ''',''yyyymmdd'')-30,''YYYYMMDD'') and aj.farq<=''' || rq ||
                    ''' and aj.actflag<''4''
            and aj.gonganbianhao like ''4301%''
            and aj.faanshequ in(select orgcode from sqjw.t_common_xqtjqk xq start with orgcode =''' || list(i)
                   .orgcode || '''
            connect by prior xq.orgcode=parent_code)
            ) A where dw.orgcode= a.faanshequ
            group by parent_code';
        else
          sql_tj := 'select faanshequ,nvl(sum(qjajs), 0) qjajs,
                  nvl(sum(qdajs), 0) qdajs,
                  nvl(sum(dqajs), 0) dqajs,
                  nvl(sum(zpajs), 0) zpajs,
                  nvl(sum(dfxqcs), 0) dfxqcs,
                  nvl(sum(rsdqsl),0) rsdqsl,
                  nvl(sum(ajzs), 0) ajzs  from (select /*+index(aj IDX_AJJBXXB_FARQ)*/ aj.faanshequ,
                  case when aj.anjianleibie like ''0501%'' then 1 else 0 end qjajs,
                  case when aj.anjianleibie = ''050400'' then 1 else 0 end qdajs,
                  case when aj.anjianleibie like ''0502%'' then 1 else 0 end dqajs,
                  case when aj.anjianleibie like ''0503%'' then 1 else 0 end zpajs,
                  case when aj.anjianleibie like ''0502%'' or aj.anjianleibie like ''0501%''
                  or aj.anjianleibie like ''0503%'' or aj.anjianleibie like ''0504%''
                  or aj.anjianleibie like ''0510%'' then 1 else 0 end dfxqcs,
                  case when aj.anjianleibie = ''050202'' then 1 else 0 end rsdqsl,
                  1 ajzs from cs_jz_zfba.t_ajjbxxb@TO_199 aj where   aj.farq>=to_char(to_date(''' || rq ||
                    ''',''yyyymmdd'')-30,''YYYYMMDD'') and aj.farq<=''' || rq ||
                    ''' and aj.actflag<''4''
                  and aj.gonganbianhao like ''4301%''
                  and aj.faanshequ =''' || list(i)
                   .orgcode || '''
                  ) A group by faanshequ';
        end if;
        --dbms_output.put_line(LIST(I).LEVE || '---' || sql_tj);
        OPEN CSRDATA FOR sql_tj;
        LOOP
          FETCH CSRDATA
            INTO PARENT_CODE_1,
                 QJAJS_1,
                 QDAJS_1,
                 DQAJS_1,
                 ZPAJS_1,
                 DFXQCS_1,
                 RSDQSL_1,
                 AJZS_1;
          EXIT WHEN CSRDATA %NOTFOUND;
          update sqjw.t_common_xqtjqk a
             set QJSL    = 0,
                 QDSL    = 0,
                 DQSL    = 0,
                 ZPSL    = 0,
                 DFXQCSL = 0,
                 RSDQSL= 0,
                 ZS      = 0
           where a.orgcode = PARENT_CODE_1
             AND A.LEVE = LIST(I).LEVE;
          update sqjw.t_common_xqtjqk a
             set QJSL    = QJAJS_1,
                 QDSL    = QDAJS_1,
                 DQSL    = DQAJS_1,
                 ZPSL    = ZPAJS_1,
                 DFXQCSL = DFXQCS_1,
                 RSDQSL  = RSDQSL_1
                 --,
                 --ZS      = AJZS_1
           where a.orgcode = PARENT_CODE_1
             AND A.LEVE = LIST(I).LEVE;
          COMMIT;
        end loop;
        PARENT_CODE_1 := '';
        QJAJS_1       := 0;
        QDAJS_1       := 0;
        DQAJS_1       := 0;
        ZPAJS_1       := 0;
        DFXQCS_1      := 0;
        RSDQSL_1      :=0;
        --AJZS_1        := 0;
        close CSRDATA;
        --PARENT_CODE   QJAJS QDAJS DQAJS ZPAJS DFXQCS  AJZS
      end loop;
    end loop;
    execute immediate sql_log
      using rq, 'P_REPORT_COUNT_XQGK', '辖区概况案件数量计算', '1', YXSJ;
    commit;
    close GETLIST;
    -- 总数=抢劫案+ 抢夺案+ 盗窃案+ 诈骗案+ 其他案件 
    update sqjw.t_common_xqtjqk
       set zs = QJSL + QDSL + DQSL + ZPSL + DFXQCSL + RSDQSL;
    commit;
  exception
    when others then
      execute immediate sql_log
        using rq, 'P_REPORT_COUNT_XQGK', '辖区概况案件数量计算(异常)', '2', YXSJ;
      execute immediate sql_err
        using rq, sqlerrm, sqlcode, YXSJ;
      commit;
  end;

END P_REPORT_COUNT_XQGK;


/



-- Add/modify columns 
alter table T_COMMON_XQTJQK add RSDQSL number default 0;
-- Add comments to the columns 
comment on column T_COMMON_XQTJQK.RSDQSL
  is '入室盗窃数';


---

CREATE OR REPLACE PROCEDURE P_REPORT_COUNT_XQGK(rq varchar2) AS
  /***************************
  rq 计算月份(201309)
  YJYXZT 月结标志
  案件信息统计维度计算过程
  ***********************************/
  --游标
  CURSOR GETLIST IS
    select orgcode, parent_code, leve
      from sqjw.t_common_xqtjqk
     where parent_code is not null
    -- and orgcode = '430121413108'
     order by leve, orgcode;
  TYPE GETTYPE IS TABLE OF GETLIST%ROWTYPE;
  TYPE CURSOR_TYPE IS REF CURSOR;
  LIST    GETTYPE;
  CSRDATA CURSOR_TYPE; --数据来源
  -- rec     t_reportdimension_anjie %ROWTYPE;
  sql_fa varchar2(4000); --案件
  sql_tj varchar2(4000); --立案

  sql_inst varchar2(4000);
  sql_log  varchar2(4000);
  sql_err  varchar2(4000);

  PARENT_CODE_1 varchar2(4000);
  QJAJS_1       number := 0;
  QDAJS_1       number := 0;
  DQAJS_1       number := 0;
  ZPAJS_1       number := 0;
  DFXQCS_1      number := 0;
  AJZS_1        number := 0;
  --入室盗窃
  RSDQSL_1      number := 0;
  --
  rq_tmp date;
  num    number := 1;
  yxsj   varchar2(17);
  --YJYXZT_tmp varchar2(20);

BEGIN
  yxsj    := to_char(sysdate, 'YYYYMMDDHH24MISS');
  sql_log := 'insert into t_operate_log@TO_199(YXPCH,PROCEDURES_ID,PROCEDURES_NAME,YXZT/*,YJYXZT*/,YXSJ) values
           (:part1,:part2,:part3,:part4,:part5/*,:part6*/)';
  sql_err := 'insert  into  t_operate_err@TO_199(YXPCH,ERR_NUM,ERR_TEXT,YXSJ) values (:part1,:part2,:part3,:part4)';

  begin
    /* update sqjw.t_common_xqtjqk a
       set QJSL = 0, QDSL = 0, DQSL = 0, ZPSL = 0, DFXQCSL = 0, ZS = 0;
    commit;*/
    OPEN GETLIST;
    LOOP
      FETCH GETLIST BULK COLLECT
        INTO LIST LIMIT 1000;
      EXIT WHEN LIST.COUNT = 0;
      FOR I IN LIST.FIRST .. LIST.LAST LOOP
        if /*list(i).leve*/
         '1' < '6' then
          --050100 盗窃案 050200 诈骗案 050300 抢夺案 050400 敲诈勒索案 051000  
          --050202 入室盗窃案
          sql_tj := 'select parent_code,nvl(sum(qjajs), 0) qjajs,
            nvl(sum(qdajs), 0) qdajs,
            nvl(sum(dqajs), 0) dqajs,
            nvl(sum(zpajs), 0) zpajs,
            nvl(sum(rsdqsl),0) rsdqsj,
            nvl(sum(dfxqcs), 0) dfxqcs,
            nvl(sum(ajzs), 0) ajzs  from (select connect_by_root orgcode parent_code,orgcode from sqjw.t_common_xqtjqk xq start with orgcode =''' || list(i)
                   .orgcode || '''
            connect by prior xq.orgcode=parent_code)dw,(select /*+index(aj IDX_AJJBXXB_FARQ)*/aj.faanshequ,
            case when aj.anjianleibie like ''0501%'' then 1 else 0 end qjajs,
            case when aj.anjianleibie = ''050400'' then 1 else 0 end qdajs,
            case when aj.anjianleibie like ''0502%'' then 1 else 0 end dqajs,
            case when aj.anjianleibie like ''0503%'' then 1 else 0 end zpajs,
            case when aj.anjianleibie like ''0502%'' or aj.anjianleibie like ''0501%''
            or aj.anjianleibie like ''0503%'' or aj.anjianleibie like ''0504%''
            or aj.anjianleibie like ''0510%'' then 1 else 0 end dfxqcs,
            case when aj.anjianleibie = ''050202'' then 1 else 0 end rsdqsl,
            1 ajzs from cs_jz_zfba.t_ajjbxxb@TO_199 aj where  aj.farq>=to_char(to_date(''' || rq ||
                    ''',''yyyymmdd'')-30,''YYYYMMDD'') and aj.farq<=''' || rq ||
                    ''' and aj.actflag<''4''
            and aj.gonganbianhao like ''4301%''
            and aj.faanshequ in(select orgcode from sqjw.t_common_xqtjqk xq start with orgcode =''' || list(i)
                   .orgcode || '''
            connect by prior xq.orgcode=parent_code)
            ) A where dw.orgcode= a.faanshequ
            group by parent_code';
        else
          sql_tj := 'select faanshequ,nvl(sum(qjajs), 0) qjajs,
                  nvl(sum(qdajs), 0) qdajs,
                  nvl(sum(dqajs), 0) dqajs,
                  nvl(sum(zpajs), 0) zpajs,
                  nvl(sum(dfxqcs), 0) dfxqcs,
                  nvl(sum(rsdqsl),0) rsdqsl,
                  nvl(sum(ajzs), 0) ajzs  from (select /*+index(aj IDX_AJJBXXB_FARQ)*/ aj.faanshequ,
                  case when aj.anjianleibie like ''0501%'' then 1 else 0 end qjajs,
                  case when aj.anjianleibie = ''050400'' then 1 else 0 end qdajs,
                  case when aj.anjianleibie like ''0502%'' then 1 else 0 end dqajs,
                  case when aj.anjianleibie like ''0503%'' then 1 else 0 end zpajs,
                  case when aj.anjianleibie like ''0502%'' or aj.anjianleibie like ''0501%''
                  or aj.anjianleibie like ''0503%'' or aj.anjianleibie like ''0504%''
                  or aj.anjianleibie like ''0510%'' then 1 else 0 end dfxqcs,
                  case when aj.anjianleibie = ''050202'' then 1 else 0 end rsdqsl,
                  1 ajzs from cs_jz_zfba.t_ajjbxxb@TO_199 aj where   aj.farq>=to_char(to_date(''' || rq ||
                    ''',''yyyymmdd'')-30,''YYYYMMDD'') and aj.farq<=''' || rq ||
                    ''' and aj.actflag<''4''
                  and aj.gonganbianhao like ''4301%''
                  and aj.faanshequ =''' || list(i)
                   .orgcode || '''
                  ) A group by faanshequ';
        end if;
        --dbms_output.put_line(LIST(I).LEVE || '---' || sql_tj);
        OPEN CSRDATA FOR sql_tj;
        LOOP
          FETCH CSRDATA
            INTO PARENT_CODE_1,
                 QJAJS_1,
                 QDAJS_1,
                 DQAJS_1,
                 ZPAJS_1,
                 DFXQCS_1,
                 RSDQSL_1,
                 AJZS_1;
          EXIT WHEN CSRDATA %NOTFOUND;
          update sqjw.t_common_xqtjqk a
             set QJSL    = 0,
                 QDSL    = 0,
                 DQSL    = 0,
                 ZPSL    = 0,
                 DFXQCSL = 0,
                 RSDQSL= 0,
                 ZS      = 0
           where a.orgcode = PARENT_CODE_1
             AND A.LEVE = LIST(I).LEVE;
          update sqjw.t_common_xqtjqk a
             set QJSL    = QJAJS_1,
                 QDSL    = QDAJS_1,
                 DQSL    = DQAJS_1,
                 ZPSL    = ZPAJS_1,
                 DFXQCSL = DFXQCS_1,
                 RSDQSL  = RSDQSL_1
                 --,
                 --ZS      = AJZS_1
           where a.orgcode = PARENT_CODE_1
             AND A.LEVE = LIST(I).LEVE;
          COMMIT;
        end loop;
        PARENT_CODE_1 := '';
        QJAJS_1       := 0;
        QDAJS_1       := 0;
        DQAJS_1       := 0;
        ZPAJS_1       := 0;
        DFXQCS_1      := 0;
        RSDQSL_1      :=0;
        --AJZS_1        := 0;
        close CSRDATA;
        --PARENT_CODE   QJAJS QDAJS DQAJS ZPAJS DFXQCS  AJZS
      end loop;
    end loop;
    execute immediate sql_log
      using rq, 'P_REPORT_COUNT_XQGK', '辖区概况案件数量计算', '1', YXSJ;
    commit;
    close GETLIST;
    -- 总数=抢劫案+ 抢夺案+ 盗窃案+ 诈骗案+ 其他案件 
    update sqjw.t_common_xqtjqk
       set zs = QJSL + QDSL + DQSL + ZPSL + DFXQCSL + RSDQSL;
    commit;
  exception
    when others then
      execute immediate sql_log
        using rq, 'P_REPORT_COUNT_XQGK', '辖区概况案件数量计算(异常)', '2', YXSJ;
      execute immediate sql_err
        using rq, sqlerrm, sqlcode, YXSJ;
      commit;
  end;

END P_REPORT_COUNT_XQGK;


/


/*
检查是否已经插入了，如果已经有了，则不需要插入该记录了，如果没有则执行。


insert into TD_SQJW_SqDetailQueryInfo (ID, CODE, SQL, ACTURL, TYPENAME)
values (31, 'rsdq', 'select 
  aj.anjianbianhao as ajbh,
  decode(aj.anjianbiaozhi,1,''刑事案件'',2,''行政案件'',''其他案件'') as ajlx,
  aj.anjianmingcheng as ajmc, 
  aj.wenshuwenhao as wswh,
  substr(aj.shouliriqi,1,8) as slrq
from cs_jz_zfba.t_ajjbxxb@TO_199 aj where aj.actflag<''4'' and aj.farq<=to_char(sysdate-1,''yyyymmdd'')
and aj.gonganbianhao like ''4301%''
and aj.farq>=to_char(sysdate-31,''yyyymmdd'') and aj.anjianleibie  like ''050202%'' and aj.faanshequ=', 'http://10.143.1.200/csjz/jsp/gzpt/asjDetail.jsp?ajbh=', '入室盗

窃');



*/