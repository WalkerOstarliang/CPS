create or replace function f_get_xqfaslcount(v_orgcode varchar2,v_ajlx varchar2,v_startdate varchar2,v_enddate varchar2)
return number
--辖区发案数量统计
--orgcode 机构代码 
--ajlx 案件类型 
--              0：案件总数
--              1：抢劫案(0210%,0501%) 2：抢夺案(0211%,0504%) 
--              3：盗窃案(0209%,0502%) 4：诈骗案(0305%,0503%) 
--              5: 走私案(0302%)
--startdate 开始时间
--enddate 结束时间
as
     v_sql      varchar2(4000);
     v_leve     number;
     v_count    number;
begin
     v_leve:=f_get_dwleve(v_orgcode);
     v_sql:='select count(1) from t_aj_jbxx where 1=1 ';
     
     
     if v_orgcode is not null then
        if v_leve <5 then
           v_sql:=v_sql||' and '|| 'BANANDANWEIID like '''||substr(v_orgcode,1,2*v_leve)||'%''';
        end if;
        if v_leve=5 then
           v_sql:=v_sql||' and FAANSHEQU='''||v_orgcode||'''';
        end if;
     end if;
     
     if v_ajlx is not null then
        if v_ajlx='1' then
             v_sql:=v_sql||' and (ANJIANLEIBIE like ''0210%'' or ANJIANLEIBIE like ''0501%'')';
        elsif v_ajlx='2' then
             v_sql:=v_sql||' and (ANJIANLEIBIE like ''0211%'' or ANJIANLEIBIE like ''0504%'')';
        elsif v_ajlx='3' then
             v_sql:=v_sql||' and (ANJIANLEIBIE like ''0209%'' or ANJIANLEIBIE like ''0502%'')';
        elsif v_ajlx='4' then
             v_sql:=v_sql||' and (ANJIANLEIBIE like ''0305%'' or ANJIANLEIBIE like ''0503%'')';
        elsif v_ajlx='5' then
             v_sql:=v_sql||' and ANJIANLEIBIE like ''0302%''';
        end if; 
     end if;
      
      if v_startdate is not null or v_enddate is not null then
       if v_startdate is not null then
          v_sql:=v_sql|| ' and FARQ >='''||v_startdate||'''';
       end if;
       if v_enddate is not null then
          v_sql:=v_sql|| ' and FARQ <='''||v_enddate||'''';
       end if;
     end if;
     dbms_output.put_line(v_sql);
     execute immediate v_sql into v_count;
     return v_count;
     
end f_get_xqfaslcount;


-- Create table
create table T_COMMON_XQFAQKTJ
(
  DWDM  VARCHAR2(12),
  DWMC  VARCHAR2(120),
  QJASL NUMBER,
  QDASJ NUMBER,
  DQZSL NUMBER,
  ZPASL NUMBER,
  ZSASL NUMBER,
  QTASL NUMBER,
  AJZSL NUMBER,
  TJYF  VARCHAR2(6)
);
-- Add comments to the table 
comment on table T_COMMON_XQFAQKTJ
  is '辖区发案情况统计';
-- Add comments to the columns 
comment on column T_COMMON_XQFAQKTJ.DWDM
  is '单位代码';
comment on column T_COMMON_XQFAQKTJ.DWMC
  is '单位名称';
comment on column T_COMMON_XQFAQKTJ.QJASL
  is '抢劫案数量';
comment on column T_COMMON_XQFAQKTJ.QDASJ
  is '抢夺案数量';
comment on column T_COMMON_XQFAQKTJ.DQZSL
  is '盗窃案数量';
comment on column T_COMMON_XQFAQKTJ.ZPASL
  is '咋骗案数量';
comment on column T_COMMON_XQFAQKTJ.ZSASL
  is '走私案数量';
comment on column T_COMMON_XQFAQKTJ.QTASL
  is '其他案件数量';
comment on column T_COMMON_XQFAQKTJ.AJZSL
  is '案件总数量';
comment on column T_COMMON_XQFAQKTJ.TJYF
  is '统计月份';
  
  
  
  -- Add/modify columns 
alter table T_COMMON_XQFAQKTJ add LEVE number;
alter table T_COMMON_XQFAQKTJ add orgJC VARCHAR2(120);
alter table T_COMMON_XQFAQKTJ add parentcode VARCHAR2(12);
-- Add comments to the columns 
comment on column T_COMMON_XQFAQKTJ.LEVE
  is '层级';
comment on column T_COMMON_XQFAQKTJ.parentcode
  is '父代码';
  
  
-- Drop columns 
alter table T_COMMON_XQFAQKTJ drop column ORGJC;
alter table T_COMMON_XQFAQKTJ add jssj date;
-- Add comments to the columns 
comment on column T_COMMON_XQFAQKTJ.jssj
  is '计算时间';

