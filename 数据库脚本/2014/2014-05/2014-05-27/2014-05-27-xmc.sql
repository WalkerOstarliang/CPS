-- Create table
create table T_COMMON_DYWCLSJTJ
(
  ORGCODE  VARCHAR2(12),
  ORGNAME  VARCHAR2(120),
  TJSJ     DATE,
  LDRKYQ   NUMBER,
  CYRYHS   NUMBER,
  CYRYPF   NUMBER,
  ZDRYTG   NUMBER,
  ZDRYZKDJ NUMBER,
  CZWXC    NUMBER,
  CZFDJ    NUMBER,
  STXXBZ   NUMBER
)
tablespace TS_DT_SQJW
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255;
-- Add comments to the table 
comment on table T_COMMON_DYWCLSJTJ
  is '当月未处理数据统计';
-- Add comments to the columns 
comment on column T_COMMON_DYWCLSJTJ.ORGCODE
  is '机构代码';
comment on column T_COMMON_DYWCLSJTJ.ORGNAME
  is '机构名称';
comment on column T_COMMON_DYWCLSJTJ.TJSJ
  is '统计时间';
comment on column T_COMMON_DYWCLSJTJ.LDRKYQ
  is '流动人口延期';
comment on column T_COMMON_DYWCLSJTJ.CYRYHS
  is '从业人员核实';
comment on column T_COMMON_DYWCLSJTJ.CYRYPF
  is '从业人员派发';
comment on column T_COMMON_DYWCLSJTJ.ZDRYTG
  is '重点人员托管';
comment on column T_COMMON_DYWCLSJTJ.ZDRYZKDJ
  is '重点人员在控登记';
comment on column T_COMMON_DYWCLSJTJ.CZWXC
  is '出租屋巡查登记';
comment on column T_COMMON_DYWCLSJTJ.CZFDJ
  is '出租房登记';
comment on column T_COMMON_DYWCLSJTJ.STXXBZ
  is '实体信息标注';

  
CREATE OR REPLACE PROCEDURE P_EXEC_BYWCLRWTJ
--执行统计本月未处理数据统计分析
AS
    CURSOR CUR_ORGLIST IS 
           SELECT ORGCODE,ORGNAME 
           FROM T_COMMON_ORGANIZATION_SJJS 
           WHERE LEVE>=4 ORDER BY LEVE DESC;
           
   TYPE TYPELIST IS TABLE OF CUR_ORGLIST%ROWTYPE;
   LIST TYPELIST;
   v_sql         varchar2(4000);
   v_ldrkyq      number;
   v_cyryhs      number;
   v_cyrypf      number;
   v_zdrytg      number;
   v_zdryzkdj    number;
   v_czwxc       number;
   v_czfdj       number;
   v_stxxbz      number;
   v_size        number;
BEGIN
    OPEN CUR_ORGLIST;
    LOOP
      FETCH CUR_ORGLIST BULK COLLECT INTO LIST LIMIT 100;
      EXIT WHEN LIST.COUNT=0;
      FOR I IN LIST.FIRST .. LIST.LAST LOOP
          --流动人口延期
          select replace(sql,'#[orgcode]',''''||LIST(i).orgcode||'''') into v_sql 
          from t_common_xttx_pz 
          where upper(pzdm)=upper('ldrkdqtx');

          v_sql:='select count(1) from ('||v_sql||')';
          execute immediate v_sql into v_ldrkyq;
          
          --从业人员核实
          select replace(sql,'#[orgcode]',''''||LIST(i).orgcode||'''') into v_sql 
          from t_common_xttx_pz 
          where upper(pzdm)=upper('cyrytx');

          v_sql:='select count(1) from ('||v_sql||')';
          execute immediate v_sql into v_cyryhs;
          
          --从业人员派发
          select replace(sql,'#[orgcode]',''''||LIST(i).orgcode||'''') into v_sql 
          from t_common_xttx_pz 
          where upper(pzdm)=upper('cyrypftx');

          v_sql:='select count(1) from ('||v_sql||')';
          execute immediate v_sql into v_cyrypf;
          
          --重点人员托管
          select replace(sql,'#[orgcode]',''''||LIST(i).orgcode||'''') into v_sql 
          from t_common_xttx_pz 
          where upper(pzdm)=upper('zdryzktg');

          v_sql:='select count(1) from ('||v_sql||')';
          execute immediate v_sql into v_zdrytg;
          
            --重点人员在空登记
          select replace(sql,'#[orgcode]',''''||LIST(i).orgcode||'''') into v_sql 
          from t_common_xttx_pz 
          where upper(pzdm)=upper('zdryzkdj');

          v_sql:='select count(1) from ('||v_sql||')';
          execute immediate v_sql into v_zdryzkdj;
          
          --出租房屋巡查
          select replace(sql,'#[orgcode]',''''||LIST(i).orgcode||'''') into v_sql 
          from t_common_xttx_pz 
          where upper(pzdm)=upper('FWJCPZDMALL');

          v_sql:='select count(1) from ('||v_sql||')';
          execute immediate v_sql into v_czwxc;
          
          --出租房屋登记
          select replace(sql,'#[orgcode]',''''||LIST(i).orgcode||'''') into v_sql 
          from t_common_xttx_pz 
          where upper(pzdm)=upper('czfwxxdjtx');

          v_sql:='select count(1) from ('||v_sql||')';
          execute immediate v_sql into v_czfdj;
          
           --实体标注
          select replace(sql,'#[orgcode]',''''||LIST(i).orgcode||'''') into v_sql 
          from t_common_xttx_pz 
          where upper(pzdm)=upper('stxxbztx');

          v_sql:='select count(1) from ('||v_sql||')';
          execute immediate v_sql into v_stxxbz;
          
          
          select count(1) into v_size from T_COMMON_DYWCLSJTJ where orgcode=list(i).orgcode;
          if v_size > 0 then
             update t_common_dywclsjtj
                set 
                    orgname = list(i).orgname,
                    tjsj = sysdate,
                    ldrkyq = v_ldrkyq,
                    cyryhs = v_cyryhs,
                    cyrypf = v_cyrypf,
                    zdrytg = v_zdrytg,
                    zdryzkdj = v_zdryzkdj,
                    czwxc = v_czwxc,
                    czfdj = v_czfdj,
                    stxxbz = v_stxxbz
              where orgcode = list(i).orgcode;
          else
           insert into t_common_dywclsjtj
             (orgcode, orgname, tjsj, ldrkyq, cyryhs, cyrypf, zdrytg, zdryzkdj, czwxc, czfdj, stxxbz)
           values
             (list(i).orgcode, list(i).orgname, sysdate, v_ldrkyq, v_cyryhs, v_cyrypf, v_zdrytg, v_zdryzkdj, v_czwxc, v_czfdj, v_stxxbz);
           
          end if;
          
      END LOOP;
      commit;
    END LOOP;
END;
/