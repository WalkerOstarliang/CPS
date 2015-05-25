-- Add/modify columns 
alter table T_TJFX_DWDAYSJLTJBB add JWRKS number default 0;
alter table T_TJFX_DWDAYSJLTJBB add JCSJSQCJS number default 0;
alter table T_TJFX_DWDAYSJLTJBB add JCSJNCCJS number default 0;
alter table T_TJFX_DWDAYSJLTJBB add RHZFZS number default 0;
alter table T_TJFX_DWDAYSJLTJBB add RHZFSQCJS number default 0;
alter table T_TJFX_DWDAYSJLTJBB add RHZFNCCJS number default 0;
alter table T_TJFX_DWDAYSJLTJBB add ZAXLCJZS number default 0;
alter table T_TJFX_DWDAYSJLTJBB add ZAXLSQCJS number default 0;
alter table T_TJFX_DWDAYSJLTJBB add ZAXLNCCJS number default 0;
alter table T_TJFX_DWDAYSJLTJBB add DWAQJCS number default 0;
-- Add comments to the columns 
comment on column T_TJFX_DWDAYSJLTJBB.JWRKS
  is '境外人口数';
comment on column T_TJFX_DWDAYSJLTJBB.JCSJSQCJS
  is '基础数据社区警务室采集总数量';
comment on column T_TJFX_DWDAYSJLTJBB.JCSJNCCJS
  is '基础数据农村采集总数数量';
comment on column T_TJFX_DWDAYSJLTJBB.RHZFZS
  is '入户走访采集总数';
comment on column T_TJFX_DWDAYSJLTJBB.RHZFSQCJS
  is '入户走访社区采集数';
comment on column T_TJFX_DWDAYSJLTJBB.RHZFNCCJS
  is '入户走访农村采集数';
comment on column T_TJFX_DWDAYSJLTJBB.ZAXLCJZS
  is '治安巡逻采集总数';
comment on column T_TJFX_DWDAYSJLTJBB.ZAXLSQCJS
  is '治安巡逻社区采集数';
comment on column T_TJFX_DWDAYSJLTJBB.ZAXLNCCJS
  is '治安巡逻农村采集数';
comment on column T_TJFX_DWDAYSJLTJBB.DWAQJCS
  is '单位安全检查数';


-- Create table
create table T_TJFX_WEEKCJQK_YHZB
(
  ORGCODE      VARCHAR2(12),
  ORGNAME      VARCHAR2(120),
  PARENT_CODE  VARCHAR2(12),
  LEVE         NUMBER,
  TJYF         VARCHAR2(6),
  TJSJ         DATE,
  ZCJS         NUMBER,
  ONEZS        NUMBER,
  ONESQS       NUMBER,
  ONENCS       NUMBER,
  ONERHZFZS    NUMBER,
  ONERHZFSQS   NUMBER,
  ONERHZFNCS   NUMBER,
  ONEZAXLZS    NUMBER,
  ONEZAXLSQS   NUMBER,
  ONEZAXLNCS   NUMBER,
  TWOZS        NUMBER,
  TWOSQS       NUMBER,
  TWONCS       NUMBER,
  TWORHZFZS    NUMBER,
  TWORHZFSQS   NUMBER,
  TWORHZFNCS   NUMBER,
  TWOZAXLZS    NUMBER,
  TWOZAXLSQS   NUMBER,
  TWOZAXLNCS   NUMBER,
  THREEZS      NUMBER,
  THREESQS     NUMBER,
  THREENCS     NUMBER,
  THREERHZFZS  NUMBER,
  THREERHZFSQS NUMBER,
  THREERHZFNCS NUMBER,
  THREEZAXLZS  NUMBER,
  THREEZAXLSQS NUMBER,
  THREEZAXLNCS NUMBER,
  FOURZS       NUMBER,
  FOURSQS      NUMBER,
  FOURNCS      NUMBER,
  FOURRHZFZS   NUMBER,
  FOURRHZFSQS  NUMBER,
  FOURRHZFNCS  NUMBER,
  FOURZAXLZS   NUMBER,
  FOURZAXLSQS  NUMBER,
  FOURZAXLNCS  NUMBER,
  FIVEZS       NUMBER,
  FIVESQS      NUMBER,
  FIVENCS      NUMBER,
  FIVERHZFZS   NUMBER,
  FIVERHZFSQS  NUMBER,
  FIVERHZFNCS  NUMBER,
  FIVEZAXLZS   NUMBER,
  FIVEZAXLSQS  NUMBER,
  FIVEZAXLNCS  NUMBER,
  SIXZS        NUMBER,
  SIXSQS       NUMBER,
  SIXNCS       NUMBER,
  SIXRHZFZS    NUMBER,
  SIXRHZFSQS   NUMBER,
  SIXRHZFNCS   NUMBER,
  SIXZAXLZS    NUMBER,
  SIXZAXLSQS   NUMBER,
  SIXZAXLNCS   NUMBER,
  JWQZS        NUMBER,
  WWCRWJWQS    NUMBER,
  WWCZCJRWCS   NUMBER
);
-- Add comments to the table 
comment on table T_TJFX_WEEKCJQK_YHZB
  is '数据周采集情况汇总表';
-- Add comments to the columns 
comment on column T_TJFX_WEEKCJQK_YHZB.ORGCODE
  is '机构代码';
comment on column T_TJFX_WEEKCJQK_YHZB.ORGNAME
  is '机构名称';
comment on column T_TJFX_WEEKCJQK_YHZB.PARENT_CODE
  is '父类代码';
comment on column T_TJFX_WEEKCJQK_YHZB.LEVE
  is '层级';
comment on column T_TJFX_WEEKCJQK_YHZB.TJYF
  is '统计月份';
comment on column T_TJFX_WEEKCJQK_YHZB.TJSJ
  is '统计时间';
comment on column T_TJFX_WEEKCJQK_YHZB.ZCJS
  is '总采集数';
comment on column T_TJFX_WEEKCJQK_YHZB.ONEZS
  is '第一周采集总数';
comment on column T_TJFX_WEEKCJQK_YHZB.ONESQS
  is '第一周社区采集数';
comment on column T_TJFX_WEEKCJQK_YHZB.ONENCS
  is '第一周农村采集数';
comment on column T_TJFX_WEEKCJQK_YHZB.ONERHZFZS
  is '第一周入户走访采集总数';
comment on column T_TJFX_WEEKCJQK_YHZB.ONERHZFSQS
  is '第一周入户走访社区采集总数';
comment on column T_TJFX_WEEKCJQK_YHZB.ONERHZFNCS
  is '第一周入户走访农村采集总数';
comment on column T_TJFX_WEEKCJQK_YHZB.ONEZAXLZS
  is '第一周治安巡逻采集总数';
comment on column T_TJFX_WEEKCJQK_YHZB.ONEZAXLSQS
  is '第一周治安巡逻社区采集总数';
comment on column T_TJFX_WEEKCJQK_YHZB.ONEZAXLNCS
  is '第一周治安巡逻农村采集总数';
comment on column T_TJFX_WEEKCJQK_YHZB.TWOZS
  is '第二周采集总数';
comment on column T_TJFX_WEEKCJQK_YHZB.TWOSQS
  is '第二周社区采集数';
comment on column T_TJFX_WEEKCJQK_YHZB.TWONCS
  is '第二周农村采集数';
comment on column T_TJFX_WEEKCJQK_YHZB.TWORHZFZS
  is '第二周入户走访采集总数';
comment on column T_TJFX_WEEKCJQK_YHZB.TWORHZFSQS
  is '第二周入户走访社区采集总数';
comment on column T_TJFX_WEEKCJQK_YHZB.TWORHZFNCS
  is '第二周入户走访农村采集总数';
comment on column T_TJFX_WEEKCJQK_YHZB.TWOZAXLZS
  is '第二周治安巡逻采集总数';
comment on column T_TJFX_WEEKCJQK_YHZB.TWOZAXLSQS
  is '第二周治安巡逻社区采集总数';
comment on column T_TJFX_WEEKCJQK_YHZB.TWOZAXLNCS
  is '第二周治安巡逻农村采集总数';
comment on column T_TJFX_WEEKCJQK_YHZB.THREEZS
  is '第三周采集总数';
comment on column T_TJFX_WEEKCJQK_YHZB.THREESQS
  is '第三周社区采集数';
comment on column T_TJFX_WEEKCJQK_YHZB.THREENCS
  is '第三周农村采集数';
comment on column T_TJFX_WEEKCJQK_YHZB.THREERHZFZS
  is '第三周入户走访采集总数';
comment on column T_TJFX_WEEKCJQK_YHZB.THREERHZFSQS
  is '第三周入户走访社区采集总数';
comment on column T_TJFX_WEEKCJQK_YHZB.THREERHZFNCS
  is '第三周入户走访农村采集总数';
comment on column T_TJFX_WEEKCJQK_YHZB.THREEZAXLZS
  is '第三周治安巡逻采集总数';
comment on column T_TJFX_WEEKCJQK_YHZB.THREEZAXLSQS
  is '第三周治安巡逻社区采集总数';
comment on column T_TJFX_WEEKCJQK_YHZB.THREEZAXLNCS
  is '第三周治安巡逻农村采集总数';
comment on column T_TJFX_WEEKCJQK_YHZB.FOURZS
  is '第四周采集总数';
comment on column T_TJFX_WEEKCJQK_YHZB.FOURSQS
  is '第四周社区采集数';
comment on column T_TJFX_WEEKCJQK_YHZB.FOURNCS
  is '第四周农村采集数';
comment on column T_TJFX_WEEKCJQK_YHZB.FOURRHZFZS
  is '第四周入户走访采集总数';
comment on column T_TJFX_WEEKCJQK_YHZB.FOURRHZFSQS
  is '第四周入户走访社区采集总数';
comment on column T_TJFX_WEEKCJQK_YHZB.FOURRHZFNCS
  is '第四周入户走访农村采集总数';
comment on column T_TJFX_WEEKCJQK_YHZB.FOURZAXLZS
  is '第四周治安巡逻采集总数';
comment on column T_TJFX_WEEKCJQK_YHZB.FOURZAXLSQS
  is '第四周治安巡逻社区采集总数';
comment on column T_TJFX_WEEKCJQK_YHZB.FOURZAXLNCS
  is '第四周治安巡逻农村采集总数';
comment on column T_TJFX_WEEKCJQK_YHZB.FIVEZS
  is '第五周采集总数';
comment on column T_TJFX_WEEKCJQK_YHZB.FIVESQS
  is '第五周社区采集数';
comment on column T_TJFX_WEEKCJQK_YHZB.FIVENCS
  is '第五周农村采集数';
comment on column T_TJFX_WEEKCJQK_YHZB.FIVERHZFZS
  is '第五周入户走访采集总数';
comment on column T_TJFX_WEEKCJQK_YHZB.FIVERHZFSQS
  is '第五周入户走访社区采集总数';
comment on column T_TJFX_WEEKCJQK_YHZB.FIVERHZFNCS
  is '第五周入户走访农村采集总数';
comment on column T_TJFX_WEEKCJQK_YHZB.FIVEZAXLZS
  is '第五周治安巡逻采集总数';
comment on column T_TJFX_WEEKCJQK_YHZB.FIVEZAXLSQS
  is '第五周治安巡逻社区采集总数';
comment on column T_TJFX_WEEKCJQK_YHZB.FIVEZAXLNCS
  is '第五周治安巡逻农村采集总数';
comment on column T_TJFX_WEEKCJQK_YHZB.SIXZS
  is '第六周采集总数';
comment on column T_TJFX_WEEKCJQK_YHZB.SIXSQS
  is '第六周社区采集数';
comment on column T_TJFX_WEEKCJQK_YHZB.SIXNCS
  is '第六周农村采集数';
comment on column T_TJFX_WEEKCJQK_YHZB.SIXRHZFZS
  is '第六周入户走访采集总数';
comment on column T_TJFX_WEEKCJQK_YHZB.SIXRHZFSQS
  is '第六周入户走访社区采集总数';
comment on column T_TJFX_WEEKCJQK_YHZB.SIXRHZFNCS
  is '第六周入户走访农村采集总数';
comment on column T_TJFX_WEEKCJQK_YHZB.SIXZAXLZS
  is '第六周治安巡逻采集总数';
comment on column T_TJFX_WEEKCJQK_YHZB.SIXZAXLSQS
  is '第六周治安巡逻社区采集总数';
comment on column T_TJFX_WEEKCJQK_YHZB.SIXZAXLNCS
  is '第六周治安巡逻农村采集总数';
comment on column T_TJFX_WEEKCJQK_YHZB.JWQZS
  is '警务区总数';
comment on column T_TJFX_WEEKCJQK_YHZB.WWCRWJWQS
  is '未完成任务警务区数';
comment on column T_TJFX_WEEKCJQK_YHZB.WWCZCJRWCS
  is '未完成总采集任务次数';


-- Add/modify columns 
alter table T_TJFX_WEEKCJQK_YHZB modify ONEZS default 0;
alter table T_TJFX_WEEKCJQK_YHZB modify ONESQS default 0;
alter table T_TJFX_WEEKCJQK_YHZB modify ONENCS default 0;
alter table T_TJFX_WEEKCJQK_YHZB modify ONERHZFZS default 0;
alter table T_TJFX_WEEKCJQK_YHZB modify ONERHZFSQS default 0;
alter table T_TJFX_WEEKCJQK_YHZB modify ONERHZFNCS default 0;
alter table T_TJFX_WEEKCJQK_YHZB modify ONEZAXLZS default 0;
alter table T_TJFX_WEEKCJQK_YHZB modify ONEZAXLSQS default 0;
alter table T_TJFX_WEEKCJQK_YHZB modify ONEZAXLNCS default 0;
alter table T_TJFX_WEEKCJQK_YHZB modify TWOZS default 0;
alter table T_TJFX_WEEKCJQK_YHZB modify TWOSQS default 0;
alter table T_TJFX_WEEKCJQK_YHZB modify TWONCS default 0;
alter table T_TJFX_WEEKCJQK_YHZB modify TWORHZFZS default 0;
alter table T_TJFX_WEEKCJQK_YHZB modify TWORHZFSQS default 0;
alter table T_TJFX_WEEKCJQK_YHZB modify TWORHZFNCS default 0;
alter table T_TJFX_WEEKCJQK_YHZB modify TWOZAXLZS default 0;
alter table T_TJFX_WEEKCJQK_YHZB modify TWOZAXLSQS default 0;
alter table T_TJFX_WEEKCJQK_YHZB modify TWOZAXLNCS default 0;
alter table T_TJFX_WEEKCJQK_YHZB modify THREEZS default 0;
alter table T_TJFX_WEEKCJQK_YHZB modify THREESQS default 0;
alter table T_TJFX_WEEKCJQK_YHZB modify THREENCS default 0;
alter table T_TJFX_WEEKCJQK_YHZB modify THREERHZFZS default 0;
alter table T_TJFX_WEEKCJQK_YHZB modify THREERHZFSQS default 0;
alter table T_TJFX_WEEKCJQK_YHZB modify THREERHZFNCS default 0;
alter table T_TJFX_WEEKCJQK_YHZB modify THREEZAXLZS default 0;
alter table T_TJFX_WEEKCJQK_YHZB modify THREEZAXLSQS default 0;
alter table T_TJFX_WEEKCJQK_YHZB modify THREEZAXLNCS default 0;
alter table T_TJFX_WEEKCJQK_YHZB modify FOURZS default 0;
alter table T_TJFX_WEEKCJQK_YHZB modify FOURSQS default 0;
alter table T_TJFX_WEEKCJQK_YHZB modify FOURNCS default 0;
alter table T_TJFX_WEEKCJQK_YHZB modify FOURRHZFZS default 0;
alter table T_TJFX_WEEKCJQK_YHZB modify FOURRHZFSQS default 0;
alter table T_TJFX_WEEKCJQK_YHZB modify FOURRHZFNCS default 0;
alter table T_TJFX_WEEKCJQK_YHZB modify FOURZAXLZS default 0;
alter table T_TJFX_WEEKCJQK_YHZB modify FOURZAXLSQS default 0;
alter table T_TJFX_WEEKCJQK_YHZB modify FOURZAXLNCS default 0;
alter table T_TJFX_WEEKCJQK_YHZB modify FIVEZS default 0;
alter table T_TJFX_WEEKCJQK_YHZB modify FIVESQS default 0;
alter table T_TJFX_WEEKCJQK_YHZB modify FIVENCS default 0;
alter table T_TJFX_WEEKCJQK_YHZB modify FIVERHZFZS default 0;
alter table T_TJFX_WEEKCJQK_YHZB modify FIVERHZFSQS default 0;
alter table T_TJFX_WEEKCJQK_YHZB modify FIVERHZFNCS default 0;
alter table T_TJFX_WEEKCJQK_YHZB modify FIVEZAXLZS default 0;
alter table T_TJFX_WEEKCJQK_YHZB modify FIVEZAXLSQS default 0;
alter table T_TJFX_WEEKCJQK_YHZB modify FIVEZAXLNCS default 0;
alter table T_TJFX_WEEKCJQK_YHZB modify SIXZS default 0;
alter table T_TJFX_WEEKCJQK_YHZB modify SIXSQS default 0;
alter table T_TJFX_WEEKCJQK_YHZB modify SIXNCS default 0;
alter table T_TJFX_WEEKCJQK_YHZB modify SIXRHZFZS default 0;
alter table T_TJFX_WEEKCJQK_YHZB modify SIXRHZFSQS default 0;
alter table T_TJFX_WEEKCJQK_YHZB modify SIXRHZFNCS default 0;
alter table T_TJFX_WEEKCJQK_YHZB modify SIXZAXLZS default 0;
alter table T_TJFX_WEEKCJQK_YHZB modify SIXZAXLSQS default 0;
alter table T_TJFX_WEEKCJQK_YHZB modify SIXZAXLNCS default 0;
alter table T_TJFX_WEEKCJQK_YHZB modify JWQZS default 0;
alter table T_TJFX_WEEKCJQK_YHZB modify WWCRWJWQS default 0;
alter table T_TJFX_WEEKCJQK_YHZB modify WWCZCJRWCS default 0;
-- Add comments to the columns 
comment on column T_TJFX_WEEKCJQK_YHZB.ONEZS
  is '第一周基础数据采集总数';
comment on column T_TJFX_WEEKCJQK_YHZB.ONESQS
  is '第一周基础数据社区采集数';
comment on column T_TJFX_WEEKCJQK_YHZB.ONENCS
  is '第一周基础数据农村采集数';
comment on column T_TJFX_WEEKCJQK_YHZB.TWOZS
  is '第二周基础数据采集总数';
comment on column T_TJFX_WEEKCJQK_YHZB.TWOSQS
  is '第二周基础数据社区采集数';
comment on column T_TJFX_WEEKCJQK_YHZB.TWONCS
  is '第二周基础数据农村采集数';
comment on column T_TJFX_WEEKCJQK_YHZB.THREEZS
  is '第三周基础数据采集总数';
comment on column T_TJFX_WEEKCJQK_YHZB.THREESQS
  is '第三周基础数据社区采集数';
comment on column T_TJFX_WEEKCJQK_YHZB.THREENCS
  is '第三周基础数据农村采集数';
comment on column T_TJFX_WEEKCJQK_YHZB.FOURZS
  is '第四周基础数据采集总数';
comment on column T_TJFX_WEEKCJQK_YHZB.FOURSQS
  is '第四周基础数据社区采集数';
comment on column T_TJFX_WEEKCJQK_YHZB.FOURNCS
  is '第四周基础数据农村采集数';
comment on column T_TJFX_WEEKCJQK_YHZB.FIVEZS
  is '第五周基础数据采集总数';
comment on column T_TJFX_WEEKCJQK_YHZB.FIVESQS
  is '第五周基础数据社区采集数';
comment on column T_TJFX_WEEKCJQK_YHZB.FIVENCS
  is '第五周基础数据农村采集数';
comment on column T_TJFX_WEEKCJQK_YHZB.SIXZS
  is '第六周基础数据采集总数';
comment on column T_TJFX_WEEKCJQK_YHZB.SIXSQS
  is '第六周基础数据社区采集数';
comment on column T_TJFX_WEEKCJQK_YHZB.SIXNCS
  is '第六周基础数据农村采集数';

  
-- Add/modify columns 
alter table T_TJFX_DWDAYSJLTJBB add ZCJS number default 0;
-- Add comments to the columns 
comment on column T_TJFX_DWDAYSJLTJBB.ZS
  is '基础数据总数';
comment on column T_TJFX_DWDAYSJLTJBB.ZCJS
  is '总采集数';
  
  
-- Add/modify columns 
alter table T_TJFX_WEEKCJQK_YHZB add ONECJZS number default 0;
alter table T_TJFX_WEEKCJQK_YHZB add TWOCJZS number default 0;
alter table T_TJFX_WEEKCJQK_YHZB add THREECJZS number default 0;
alter table T_TJFX_WEEKCJQK_YHZB add FOURCJZS number default 0;
alter table T_TJFX_WEEKCJQK_YHZB add FIVECJZS number default 0;
alter table T_TJFX_WEEKCJQK_YHZB add SIXCJZS number default 0;
-- Add comments to the columns 
comment on column T_TJFX_WEEKCJQK_YHZB.ONECJZS
  is '第一周采集总数';
comment on column T_TJFX_WEEKCJQK_YHZB.TWOCJZS
  is '第二周采集总数';
comment on column T_TJFX_WEEKCJQK_YHZB.THREECJZS
  is '第三周采集总数';
comment on column T_TJFX_WEEKCJQK_YHZB.FOURCJZS
  is '第四周采集总数';
comment on column T_TJFX_WEEKCJQK_YHZB.FIVECJZS
  is '第五周采集总数';
comment on column T_TJFX_WEEKCJQK_YHZB.SIXCJZS
  is '第六周采集总数';

CREATE OR REPLACE TYPE MONTH_WEEK_LIST as object
(
  sn                  number(1),
  start_date          date,
  end_date            date,
  days                number
);
/

CREATE OR REPLACE TYPE TYPE_MONTH_WEEK_LIST as table of MONTH_WEEK_LIST;
/
create or replace function f_get_month_week_list(in_date varchar2 ) return  TYPE_MONTH_WEEK_LIST
        -- pipelined
        --as M_W_LIST MONTH_WEEK_LIST;
        as M_W_LIST TYPE_MONTH_WEEK_LIST:= TYPE_MONTH_WEEK_LIST();

   /*
    1:找出输入日期当月的第一天,
    2:计算当月第一天属于星期几,
    3:循环计算每周,
    4:判断当前计算周的最后一天是否超出当前月*/

   t_first_date date; --本月第一天
   t_week_num number;--给定日期属于周几
   t_week_enddate date;--每周最后一天,周六
   t_week_first date;--每周第一天,周日
   t_week_sn number;--本月第几周
   t_week_days number;--当前计算周有几天
   s_date date; --输入的系统时间
  begin
    s_date := to_date(in_date,'yyyymmdd');
    --获取本月第一天
    t_first_date :=  trunc(s_date, 'mm') ;
    --计算第一天属于周几
    t_week_num := to_char(t_first_date,'d');

    --计算第一周
    t_week_sn := 1;
    t_week_first := t_first_date;
    t_week_days := 7-t_week_num+1;
    t_week_enddate := t_first_date+t_week_days-1;
    M_W_LIST.extend;
    M_W_LIST(M_W_LIST.count):=MONTH_WEEK_LIST(t_week_sn,t_week_first,t_week_enddate,t_week_days);
   -- M_W_LIST:=MONTH_WEEK_LIST(t_week_sn,t_week_first,t_week_enddate,t_week_days);
   -- pipe row (M_W_LIST);

    for i in 2..6  loop
          t_week_sn := i;
          t_week_first := t_week_enddate+1 ;
          --如果每周第一天就超出当前月,刚直接结束
          if t_week_first>= trunc(last_day(s_date),'dd')+1  or t_week_first is null then
              t_week_first := null;
              t_week_days := 0  ;
              t_week_enddate := null ;
          else
                t_week_days := 7 ;
                t_week_enddate := t_week_first+t_week_days-1;
                --判断最后一天是否超出当前月,判断时间取下个月第一天
                if t_week_enddate> trunc(last_day(s_date),'dd')+1  then
                   --修改本月最后一周的结束时间
                   t_week_enddate:= trunc(last_day(s_date),'dd');
                   --重新计算最后一周的天数
                   t_week_days:=trunc(last_day(s_date),'dd') -trunc(t_week_first,'dd')+1;
                end if;
          end if;
          -- M_W_LIST:=MONTH_WEEK_LIST(t_week_sn,t_week_first,t_week_enddate,t_week_days);
          -- pipe row (M_W_LIST);
            M_W_LIST.extend;
           M_W_LIST(M_W_LIST.count):=MONTH_WEEK_LIST(t_week_sn,t_week_first,t_week_enddate,t_week_days);
      end loop;
    return M_W_LIST;
  end;
/

CREATE OR REPLACE PACKAGE SQJW_TJBB
AS
       --周采集情况统计表
       PROCEDURE P_TJBB_DWDAYSJLTJBB(V_TJQSSJ  DATE,V_TJJZSJ  DATE);
       
       --周采集情况汇总表
       PROCEDURE P_TJBB_WEEKCJQK_YHZ(V_CURRENTDATE DATE);
       
END SQJW_TJBB;
/
CREATE OR REPLACE PACKAGE BODY SQJW_TJBB IS
        --机构每天登记数据量统计表
        PROCEDURE P_TJBB_DWDAYSJLTJBB(V_TJQSSJ DATE,V_TJJZSJ  DATE)
        IS
              CURSOR ORG_CUR_LIST IS
                     SELECT ORGCODE, ORGNAME, PARENT_CODE, LEVE
                     FROM T_COMMON_ORGANIZATION_SJJS
                     WHERE LEVE=5;

              CURSOR PUP_ORG_LIST IS
                     SELECT ORGCODE, ORGNAME, PARENT_CODE, LEVE
                     FROM T_COMMON_ORGANIZATION_SJJS
                     WHERE LEVE<5 ORDER BY ORGCODE;

              TYPE TYPE_ORG_CUR_LIST IS TABLE OF ORG_CUR_LIST%ROWTYPE;
              ORGLIST           TYPE_ORG_CUR_LIST;

              TYPE TYPE_PUP_ORG_LIST IS TABLE OF PUP_ORG_LIST%ROWTYPE;
              PUPORGLIST        TYPE_PUP_ORG_LIST;
              V_TJSJ            DATE;
              V_TJRQ            VARCHAR2(8);
              V_ZS              NUMBER;
              V_CZRKS           NUMBER;
              V_LDRKS           NUMBER;
              V_JZRKS           NUMBER;
              V_WLHRKS          NUMBER;
              V_CYRYS           NUMBER;
              V_SYDWS           NUMBER;
              V_STXXS           NUMBER;
              V_FWXXS           NUMBER;
              V_JWRKS           NUMBER;
              V_RHZFZS          NUMBER;
              V_ZAXLCJZS        NUMBER;
              V_DWAQJCS         NUMBER;
              V_JCSJNCCJS       NUMBER;
              V_RHZFNCCJS       NUMBER;
              V_ZAXLNCCJS       NUMBER; 
              V_JCSJSQCJS       NUMBER;
              V_RHZFSQCJS       NUMBER;
              V_ZAXLSQCJS       NUMBER;
              V_ZCJS            NUMBER;
              V_JWQLB           VARCHAR2(1);  --0:社区警务 1：农村警务
              V_COUNT           NUMBER;
         BEGIN
            V_TJSJ := SYSDATE;
            V_TJRQ := TO_CHAR(V_TJQSSJ, 'YYYYMMDD');
            OPEN ORG_CUR_LIST;
            LOOP
                 FETCH ORG_CUR_LIST BULK COLLECT INTO ORGLIST LIMIT 1000;
                 EXIT WHEN ORGLIST.COUNT = 0 ;
                 FOR K IN ORGLIST.FIRST .. ORGLIST.LAST LOOP
                      --常住人口
                     SELECT COUNT(1) INTO V_CZRKS
                     FROM T_LSGL_RK_CZRK
                     WHERE DJDWDM=ORGLIST(K).ORGCODE
                           AND (ZXBS='0' OR ZXBS IS NULL)
                           AND DJSJ>=V_TJQSSJ
                           AND DJSJ<V_TJJZSJ;

                     --流动人口
                     SELECT COUNT(1) INTO V_LDRKS
                     FROM T_LSGL_RK_LDRKZZXX
                     WHERE DJDWDM=ORGLIST(K).ORGCODE
                           AND (ZXBS='0' OR ZXBS IS NULL)
                           AND DJSJ>=V_TJQSSJ
                           AND DJSJ<V_TJJZSJ;

                     --寄住人口
                     SELECT COUNT(1) INTO V_JZRKS
                     FROM T_LSGL_RK_JZRKXX
                     WHERE DJDWDM=ORGLIST(K).ORGCODE
                           AND (ZXBS='0' OR ZXBS IS NULL)
                           AND DJSJ>=V_TJQSSJ
                           AND DJSJ<V_TJJZSJ;

                     --未落户人口
                     SELECT COUNT(1) INTO V_WLHRKS
                     FROM T_LSGL_RK_WLHCZHK
                     WHERE DJDWDM=ORGLIST(K).ORGCODE
                           AND (ZXBS='0' OR ZXBS IS NULL)
                          AND DJSJ>=V_TJQSSJ
                           AND DJSJ<V_TJJZSJ;

                     --从业人员
                     SELECT COUNT(1) INTO V_CYRYS
                     FROM T_ZA_RY_CYRY
                     WHERE DJDWDM=ORGLIST(K).ORGCODE
                           AND (ZXBS='0' OR ZXBS IS NULL)
                           AND DJSJ>=V_TJQSSJ
                           AND DJSJ<V_TJJZSJ;

                     --实有单位
                     SELECT COUNT(1) INTO V_SYDWS
                     FROM T_ZA_JG_JBXX
                     WHERE DJDWDM=ORGLIST(K).ORGCODE
                           AND (ZXBS='0' OR ZXBS IS NULL)
                           AND DJSJ>=V_TJQSSJ
                           AND DJSJ<V_TJJZSJ;
                     
                     --实体信息数
                     SELECT COUNT(1) INTO V_STXXS
                     FROM T_COMMON_STXX
                     WHERE DJDWDM=ORGLIST(K).ORGCODE
                           AND (ZXBS='0' OR ZXBS IS NULL)
                           AND DJSJ>=V_TJQSSJ
                           AND DJSJ<V_TJJZSJ;

                     --房屋信息
                     SELECT COUNT(1) INTO V_FWXXS
                     FROM T_LSGL_FW_JBXX
                     WHERE DJDWDM=ORGLIST(K).ORGCODE
                           AND (ZXBS='0' OR ZXBS IS NULL)
                           AND DJSJ>=V_TJQSSJ
                           AND DJSJ<V_TJJZSJ;
                     
                     --境外人口
                     SELECT COUNT(1) INTO V_JWRKS
                     FROM T_LSGL_RK_JWRKXX
                     WHERE DJDWDM=ORGLIST(K).ORGCODE
                           AND (ZXBS='0' OR ZXBS IS NULL)
                           AND DJSJ>=V_TJQSSJ
                           AND DJSJ<V_TJJZSJ;
                     
                     V_ZS:=V_CZRKS + V_LDRKS + V_JZRKS + V_WLHRKS + V_CYRYS + V_SYDWS + V_STXXS + V_FWXXS + V_JWRKS;
                     
                     --入户走访总数
                     SELECT COUNT(1) INTO V_RHZFZS
                     FROM T_ZA_RHZF
                     WHERE DJDWDM=ORGLIST(K).ORGCODE
                           AND (CZBS <> '4' OR CZBS IS NULL)
                           AND DJSJ>=V_TJQSSJ
                           AND DJSJ<V_TJJZSJ;
                      
                     --治安巡逻总数
                     SELECT COUNT(1) INTO V_ZAXLCJZS
                     FROM T_AF_ZAXL
                     WHERE DJDWDM=ORGLIST(K).ORGCODE
                            AND ((CZBS <> '4' AND CZBS <> '3') OR CZBS IS NULL)
                            AND DJSJ>=V_TJQSSJ
                            AND DJSJ<V_TJJZSJ;
                            
                     --单位安全检查
                     SELECT COUNT(1) INTO V_DWAQJCS
                     FROM T_ZA_DW_AQJCXX
                     WHERE DJDWDM=ORGLIST(K).ORGCODE
                          AND ((CZBS <> '4' AND CZBS <> '3') OR CZBS IS NULL)
                          AND DJSJ>=V_TJQSSJ
                          AND DJSJ<V_TJJZSJ;
                     
                     V_ZCJS:= V_ZS + V_RHZFZS + V_ZAXLCJZS;
                    
                    --获取警务区类别
                    SELECT SFNCJWS INTO V_JWQLB
                    FROM T_COMMON_ORGANIZATION_SJJS S INNER JOIN 
                          T_COMMON_ORGANIZATION_OTHER OT ON S.ORGCODE=OT.ORGCODE
                    WHERE S.LEVE='5' AND S.ORGCODE=ORGLIST(K).ORGCODE;
                    
                    --农村警务
                    IF V_JWQLB = '1' THEN
                       V_JCSJNCCJS:=V_ZS;
                       V_RHZFNCCJS:=V_RHZFZS;
                       V_ZAXLNCCJS:=V_ZAXLCJZS;
                    --社区警务
                    ELSE
                       V_JCSJSQCJS:=V_ZS;
                       V_RHZFSQCJS:=V_RHZFZS;
                       V_ZAXLSQCJS:=V_ZAXLCJZS;
                    END IF;
                   
                     --是否存在数据
                     SELECT COUNT(1) INTO V_COUNT
                     FROM T_TJFX_DWDAYSJLTJBB
                     WHERE ORGCODE=ORGLIST(K).ORGCODE
                           AND TJRQ=V_TJRQ;

                     IF V_COUNT=0 THEN
                         INSERT INTO T_TJFX_DWDAYSJLTJBB
                           (ORGCODE, ORGNAME, LEVE, PARENT_CODE, TJRQ, TJSJ,
                            TJQSRQ, TJJZRQ, ZS, CZRKS, LDRKS, JZRKS, WLHRKS,
                            CYRYS, SYDWS,STXXS,FWXXS,ZCJS,
                            JWRKS,RHZFZS,ZAXLCJZS,DWAQJCS,
                            JCSJNCCJS,RHZFNCCJS,ZAXLNCCJS,
                            JCSJSQCJS,RHZFSQCJS,ZAXLSQCJS)
                         VALUES
                           (ORGLIST(K).ORGCODE, ORGLIST(K).ORGNAME, ORGLIST(K).LEVE, ORGLIST(K).PARENT_CODE,
                            V_TJRQ, V_TJSJ, TO_CHAR(V_TJQSSJ,'YYYYMMDD'), TO_CHAR(V_TJJZSJ,'YYYYMMDD'),
                            V_ZS, V_CZRKS, V_LDRKS, V_JZRKS, V_WLHRKS, V_CYRYS, V_SYDWS,V_STXXS,V_FWXXS,
                            V_ZCJS,V_JWRKS,V_RHZFZS,V_ZAXLCJZS,V_DWAQJCS,
                            V_JCSJNCCJS,V_RHZFNCCJS,V_ZAXLNCCJS,
                            V_JCSJSQCJS,V_RHZFSQCJS,V_ZAXLSQCJS);
                     ELSE
                          UPDATE T_TJFX_DWDAYSJLTJBB
                             SET
                                 ORGNAME = ORGLIST(K).ORGNAME,
                                 LEVE = ORGLIST(K).LEVE,
                                 PARENT_CODE = ORGLIST(K).PARENT_CODE,
                                 TJSJ = V_TJSJ,
                                 TJQSRQ = TO_CHAR(V_TJQSSJ,'YYYYMMDD'),
                                 TJJZRQ = TO_CHAR(V_TJJZSJ,'YYYYMMDD'),
                                 ZS = V_ZS,
                                 CZRKS = V_CZRKS,
                                 LDRKS = V_LDRKS,
                                 JZRKS = V_JZRKS,
                                 WLHRKS = V_WLHRKS,
                                 CYRYS = V_CYRYS,
                                 SYDWS = V_SYDWS,
                                 STXXS = V_STXXS,
                                 FWXXS = V_FWXXS,
                                 ZCJS = V_ZCJS,
                                 JWRKS = V_JWRKS,
                                 RHZFZS = V_RHZFZS,
                                 ZAXLCJZS = V_ZAXLCJZS,
                                 DWAQJCS = V_DWAQJCS,
                                 JCSJNCCJS = V_JCSJNCCJS,
                                 RHZFNCCJS = V_RHZFNCCJS,
                                 ZAXLNCCJS = V_ZAXLNCCJS,
                                 JCSJSQCJS = V_JCSJSQCJS,
                                 RHZFSQCJS = V_RHZFSQCJS,
                                 ZAXLSQCJS = V_ZAXLSQCJS
                           WHERE ORGCODE = ORGLIST(K).ORGCODE AND TJRQ = V_TJRQ;

                     END IF;

                 END LOOP;
                 COMMIT;
            END LOOP;
            --汇总上级单位
            OPEN PUP_ORG_LIST;
            LOOP
                 FETCH PUP_ORG_LIST BULK COLLECT INTO PUPORGLIST LIMIT 1000;
                 EXIT WHEN PUPORGLIST.COUNT=0;
                 FOR I IN PUPORGLIST.FIRST .. PUPORGLIST.LAST LOOP
                    SELECT NVL(SUM(ZS),0), NVL(SUM(CZRKS),0), NVL(SUM(LDRKS),0), NVL(SUM(JZRKS),0),NVL(SUM(WLHRKS),0),
                           NVL(SUM(CYRYS),0), NVL(SUM(SYDWS),0), NVL(SUM(STXXS),0),NVL(SUM(FWXXS),0),
                           NVL(SUM(JWRKS),0),NVL(SUM(RHZFZS),0), NVL(SUM(ZAXLCJZS),0),NVL(SUM(DWAQJCS),0),
                           NVL(SUM(JCSJNCCJS),0),NVL(SUM(RHZFNCCJS),0),NVL(SUM(ZAXLNCCJS),0),
                           NVL(SUM(JCSJSQCJS),0),NVL(SUM(RHZFSQCJS),0),NVL(SUM(ZAXLSQCJS),0),
                           NVL(SUM(V_ZCJS),0)
                           INTO V_ZS, V_CZRKS, V_LDRKS,V_JZRKS,V_WLHRKS,V_CYRYS,V_SYDWS,V_STXXS,V_FWXXS,
                                V_JWRKS,V_RHZFZS,V_ZAXLCJZS,V_DWAQJCS,V_JCSJNCCJS,V_RHZFNCCJS,V_ZAXLNCCJS,
                                V_JCSJSQCJS,V_RHZFSQCJS,V_ZAXLSQCJS,V_ZCJS
                    FROM T_TJFX_DWDAYSJLTJBB
                    WHERE TJRQ=V_TJRQ
                          AND LEVE=5
                          AND ORGCODE LIKE SUBSTR(PUPORGLIST(I).ORGCODE,1,2*PUPORGLIST(I).LEVE)||'%';

                    --是否存在数据
                     SELECT COUNT(1) INTO V_COUNT
                     FROM T_TJFX_DWDAYSJLTJBB
                     WHERE ORGCODE=PUPORGLIST(I).ORGCODE
                           AND TJRQ=V_TJRQ;

                     IF V_COUNT=0 THEN
                         INSERT INTO T_TJFX_DWDAYSJLTJBB
                           (ORGCODE, ORGNAME, LEVE, PARENT_CODE, TJRQ, TJSJ,
                            TJQSRQ, TJJZRQ, ZS, CZRKS, LDRKS, JZRKS, WLHRKS,
                            CYRYS, SYDWS,STXXS,FWXXS,ZCJS,
                            JWRKS,RHZFZS,ZAXLCJZS,DWAQJCS,
                            JCSJNCCJS,RHZFNCCJS,ZAXLNCCJS,
                            JCSJSQCJS,RHZFSQCJS,ZAXLSQCJS)
                         VALUES
                           (PUPORGLIST(I).ORGCODE, PUPORGLIST(I).ORGNAME, PUPORGLIST(I).LEVE, PUPORGLIST(I).PARENT_CODE,
                            V_TJRQ, V_TJSJ, TO_CHAR(V_TJQSSJ,'YYYYMMDD'), TO_CHAR(V_TJJZSJ,'YYYYMMDD'), V_ZS, V_CZRKS,
                            V_LDRKS, V_JZRKS, V_WLHRKS, V_CYRYS, V_SYDWS,V_STXXS,V_FWXXS,V_ZCJS,
                            V_JWRKS,V_RHZFZS,V_ZAXLCJZS,V_DWAQJCS,
                            V_JCSJNCCJS,V_RHZFNCCJS,V_ZAXLNCCJS,
                            V_JCSJSQCJS,V_RHZFSQCJS,V_ZAXLSQCJS);
                     ELSE
                          UPDATE T_TJFX_DWDAYSJLTJBB
                             SET
                                 ORGNAME = PUPORGLIST(I).ORGNAME,
                                 LEVE = PUPORGLIST(I).LEVE,
                                 PARENT_CODE = PUPORGLIST(I).PARENT_CODE,
                                 TJSJ = V_TJSJ,
                                 TJQSRQ = TO_CHAR(V_TJQSSJ,'YYYYMMDD'),
                                 TJJZRQ = TO_CHAR(V_TJJZSJ,'YYYYMMDD'),
                                 ZS = V_ZS,
                                 CZRKS = V_CZRKS,
                                 LDRKS = V_LDRKS,
                                 JZRKS = V_JZRKS,
                                 WLHRKS = V_WLHRKS,
                                 CYRYS = V_CYRYS,
                                 SYDWS = V_SYDWS,
                                 STXXS = V_STXXS,
                                 FWXXS = V_FWXXS,
                                 ZCJS = V_ZCJS,
                                 JWRKS = V_JWRKS,
                                 RHZFZS = V_RHZFZS,
                                 ZAXLCJZS = V_ZAXLCJZS,
                                 DWAQJCS = V_DWAQJCS,
                                 JCSJNCCJS = V_JCSJNCCJS,
                                 RHZFNCCJS = V_RHZFNCCJS,
                                 ZAXLNCCJS = V_ZAXLNCCJS,
                                 JCSJSQCJS = V_JCSJSQCJS,
                                 RHZFSQCJS = V_RHZFSQCJS,
                                 ZAXLSQCJS = V_ZAXLSQCJS
                           WHERE ORGCODE = PUPORGLIST(I).ORGCODE AND TJRQ = V_TJRQ;
                     END IF;
                 END LOOP;
                 COMMIT;
            END LOOP;
         END P_TJBB_DWDAYSJLTJBB;
         
         --周采集情况    
         PROCEDURE P_TJBB_WEEKCJQK_YHZ(V_CURRENTDATE DATE)
         IS
                CURSOR ORG_LIST IS
                     SELECT ORGCODE, ORGNAME, PARENT_CODE, LEVE
                     FROM T_COMMON_ORGANIZATION_SJJS
                     ORDER BY LEVE DESC;
                TYPE LISTTYPE IS TABLE OF ORG_LIST%ROWTYPE;
                LIST LISTTYPE;
                
                V_COUNT       NUMBER;
                V_WEEKNUM     NUMBER;
                V_QSRQ        DATE;
                V_JSRQ        DATE;
                V_ZCJS            NUMBER;
                V_TJYF            VARCHAR2(6);
                V_TJSJ            DATE;
                V_JWQZS           NUMBER;
                --第一周
                V_ONEZS       NUMBER;
                V_ONESQS      NUMBER;
                V_ONENCS      NUMBER;
                V_ONERHZFZS   NUMBER;
                V_ONERHZFSQS  NUMBER;
                V_ONERHZFNCS  NUMBER;
                V_ONEZAXLZS   NUMBER;
                V_ONEZAXLSQS  NUMBER;
                V_ONEZAXLNCS  NUMBER;
                
                --第二周
                V_TWOZS       NUMBER;
                V_TWOSQS      NUMBER;
                V_TWONCS      NUMBER;
                V_TWORHZFZS   NUMBER;
                V_TWORHZFSQS  NUMBER;
                V_TWORHZFNCS  NUMBER;
                V_TWOZAXLZS   NUMBER;
                V_TWOZAXLSQS  NUMBER;
                V_TWOZAXLNCS  NUMBER;
                
                --第三周
                V_THREEZS       NUMBER;
                V_THREESQS      NUMBER;
                V_THREENCS      NUMBER;
                V_THREERHZFZS   NUMBER;
                V_THREERHZFSQS  NUMBER;
                V_THREERHZFNCS  NUMBER;
                V_THREEZAXLZS   NUMBER;
                V_THREEZAXLSQS  NUMBER;
                V_THREEZAXLNCS  NUMBER;
                
                --第四周
                V_FOURZS       NUMBER;
                V_FOURSQS      NUMBER;
                V_FOURNCS      NUMBER;
                V_FOURRHZFZS   NUMBER;
                V_FOURRHZFSQS  NUMBER;
                V_FOURRHZFNCS  NUMBER;
                V_FOURZAXLZS   NUMBER;
                V_FOURZAXLSQS  NUMBER;
                V_FOURZAXLNCS  NUMBER;
                
                --第五周
                V_FIVEZS       NUMBER;
                V_FIVESQS      NUMBER;
                V_FIVENCS      NUMBER;
                V_FIVERHZFZS   NUMBER;
                V_FIVERHZFSQS  NUMBER;
                V_FIVERHZFNCS  NUMBER;
                V_FIVEZAXLZS   NUMBER;
                V_FIVEZAXLSQS  NUMBER;
                V_FIVEZAXLNCS  NUMBER;
                
                --第六周
                V_SIXZS       NUMBER;
                V_SIXSQS      NUMBER;
                V_SIXNCS      NUMBER;
                V_SIXRHZFZS   NUMBER;
                V_SIXRHZFSQS  NUMBER;
                V_SIXRHZFNCS  NUMBER;
                V_SIXZAXLZS   NUMBER;
                V_SIXZAXLSQS  NUMBER;
                V_SIXZAXLNCS  NUMBER;
                
                V_ONECJZS     NUMBER;
                V_TWOCJZS     NUMBER;
                V_THREECJZS   NUMBER;
                V_FOURCJZS    NUMBER;
                V_FIVECJZS    NUMBER;
                V_SIXCJZS     NUMBER;
                
                V_DAYS        NUMBER;
                
                V_ONEDAYS     NUMBER;  --是否有效周
                V_TWODAYS     NUMBER;
                V_THREEDAYS   NUMBER;
                V_FOURDAYS    NUMBER;
                V_FIVEDAYS    NUMBER;
                V_SIXDAYS     NUMBER;
                
                V_WWCRWJWQS           NUMBER;
                V_WWCZCJRWCS          NUMBER;
         BEGIN
                V_TJYF:= TO_CHAR(V_CURRENTDATE,'YYYYMM');
                V_TJSJ:=SYSDATE;
                OPEN ORG_LIST;
                LOOP
                     FETCH ORG_LIST BULK COLLECT INTO LIST LIMIT 1000;
                     EXIT WHEN LIST.COUNT = 0;
                     FOR I IN LIST.FIRST..LIST.LAST LOOP
                          --第一周数据统计
                           SELECT SN ,START_DATE,END_DATE ,DAYS INTO V_WEEKNUM,V_QSRQ,V_JSRQ,V_DAYS FROM TABLE(F_GET_MONTH_WEEK_LIST(TO_CHAR(V_CURRENTDATE,'YYYYMMDD'))) WHERE SN=1; 
                           IF V_DAYS > 0 THEN
                               IF V_DAYS > 3 THEN
                                  V_ONEDAYS:=1;  
                               ELSE
                                   V_ONEDAYS:=0;
                               END IF;
                               SELECT NVL(SUM(ZS),0),NVL(SUM(JCSJSQCJS),0),NVL(SUM(JCSJNCCJS),0),
                                        NVL(SUM(RHZFZS),0),NVL(SUM(RHZFSQCJS),0),NVL(SUM(RHZFNCCJS),0),
                                        NVL(SUM(ZAXLCJZS),0),NVL(SUM(ZAXLSQCJS),0),NVL(SUM(ZAXLNCCJS),0)
                                        INTO V_ONEZS,V_ONESQS,V_ONENCS,V_ONERHZFZS,V_ONERHZFSQS,
                                             V_ONERHZFNCS,V_ONEZAXLZS,V_ONEZAXLSQS,V_ONEZAXLNCS
                                 FROM T_TJFX_DWDAYSJLTJBB 
                                 WHERE ORGCODE=LIST(I).ORGCODE
                                        AND TJRQ>=TO_CHAR(V_QSRQ,'YYYYMMDD')
                                        AND TJRQ<=TO_CHAR(V_JSRQ,'YYYYMMDD');
                            ELSE
                                  V_ONEDAYS:=0;  
                                 SELECT 0,0,0,0,0,0, 0,0,0
                                        INTO V_ONEZS,V_ONESQS,V_ONENCS,V_ONERHZFZS,V_ONERHZFSQS,
                                             V_ONERHZFNCS,V_ONEZAXLZS,V_ONEZAXLSQS,V_ONEZAXLNCS
                                 FROM DUAL; 
                                   
                                      
                            END IF;        
                            --第二周数据统计
                            SELECT SN ,START_DATE,END_DATE ,DAYS INTO V_WEEKNUM,V_QSRQ,V_JSRQ,V_DAYS FROM TABLE(F_GET_MONTH_WEEK_LIST(TO_CHAR(V_CURRENTDATE,'YYYYMMDD'))) WHERE SN=2; 
                            IF V_DAYS > 0 THEN    
                                     
                                     IF V_DAYS > 3 THEN
                                        V_TWODAYS:=1;  
                                     ELSE
                                         V_TWODAYS:=0;
                                     END IF;
                                    SELECT NVL(SUM(ZS),0),NVL(SUM(JCSJSQCJS),0),NVL(SUM(JCSJNCCJS),0),
                                            NVL(SUM(RHZFZS),0),NVL(SUM(RHZFSQCJS),0),NVL(SUM(RHZFNCCJS),0),
                                            NVL(SUM(ZAXLCJZS),0),NVL(SUM(ZAXLSQCJS),0),NVL(SUM(ZAXLNCCJS),0)
                                            INTO V_TWOZS,V_TWOSQS,V_TWONCS,V_TWORHZFZS,V_TWORHZFSQS,
                                                 V_TWORHZFNCS,V_TWOZAXLZS,V_TWOZAXLSQS,V_TWOZAXLNCS
                                     FROM T_TJFX_DWDAYSJLTJBB 
                                     WHERE ORGCODE=LIST(I).ORGCODE
                                           AND TJRQ>=TO_CHAR(V_QSRQ,'YYYYMMDD')
                                            AND TJRQ<=TO_CHAR(V_JSRQ,'YYYYMMDD');
                              ELSE
                                    V_TWODAYS:=0;
                                     SELECT 0,0,0,0,0,0,0,0,0
                                            INTO V_TWOZS,V_TWOSQS,V_TWONCS,V_TWORHZFZS,V_TWORHZFSQS,
                                                 V_TWORHZFNCS,V_TWOZAXLZS,V_TWOZAXLSQS,V_TWOZAXLNCS
                                     FROM DUAL; 
                                   
                                      
                               END IF;         
                             --第三周数据统计
                            SELECT SN ,START_DATE,END_DATE ,DAYS INTO V_WEEKNUM,V_QSRQ,V_JSRQ,V_DAYS FROM TABLE(F_GET_MONTH_WEEK_LIST(TO_CHAR(V_CURRENTDATE,'YYYYMMDD'))) WHERE SN=3; 
                            IF V_DAYS > 0 THEN
                                  
                                   IF V_DAYS > 3 THEN
                                      V_THREEDAYS:=1;  
                                   ELSE
                                       V_THREEDAYS:=0;
                                   END IF;
                                   SELECT NVL(SUM(ZS),0),NVL(SUM(JCSJSQCJS),0),NVL(SUM(JCSJNCCJS),0),
                                          NVL(SUM(RHZFZS),0),NVL(SUM(RHZFSQCJS),0),NVL(SUM(RHZFNCCJS),0),
                                          NVL(SUM(ZAXLCJZS),0),NVL(SUM(ZAXLSQCJS),0),NVL(SUM(ZAXLNCCJS),0)
                                          INTO V_THREEZS,V_THREESQS,V_THREENCS,V_THREERHZFZS,V_THREERHZFSQS,
                                               V_THREERHZFNCS,V_THREEZAXLZS,V_THREEZAXLSQS,V_THREEZAXLNCS
                                   FROM T_TJFX_DWDAYSJLTJBB 
                                   WHERE ORGCODE=LIST(I).ORGCODE
                                          AND TJRQ>=TO_CHAR(V_QSRQ,'YYYYMMDD')
                                          AND TJRQ<=TO_CHAR(V_JSRQ,'YYYYMMDD');
                              ELSE
                                   V_THREEDAYS:=0;
                                   SELECT 0,0,0,0,0,0,0,0,0
                                          INTO V_THREEZS,V_THREESQS,V_THREENCS,V_THREERHZFZS,V_THREERHZFSQS,
                                             V_THREERHZFNCS,V_THREEZAXLZS,V_THREEZAXLSQS,V_THREEZAXLNCS
                                   FROM DUAL; 
                                    
                               END IF;   
                            --第四周数据统计
                           SELECT SN ,START_DATE,END_DATE ,DAYS INTO V_WEEKNUM,V_QSRQ,V_JSRQ,V_DAYS FROM TABLE(F_GET_MONTH_WEEK_LIST(TO_CHAR(V_CURRENTDATE,'YYYYMMDD'))) WHERE SN=4; 
                           IF V_DAYS > 0 THEN
                                   
                                  IF V_DAYS > 3 THEN
                                      V_FOURDAYS:=1;  
                                  ELSE
                                       V_FOURDAYS:=0;
                                  END IF;
                                  SELECT NVL(SUM(ZS),0),NVL(SUM(JCSJSQCJS),0),NVL(SUM(JCSJNCCJS),0),
                                          NVL(SUM(RHZFZS),0),NVL(SUM(RHZFSQCJS),0),NVL(SUM(RHZFNCCJS),0),
                                          NVL(SUM(ZAXLCJZS),0),NVL(SUM(ZAXLSQCJS),0),NVL(SUM(ZAXLNCCJS),0)
                                          INTO  V_FOURZS,
                                                V_FOURSQS,
                                                V_FOURNCS,
                                                V_FOURRHZFZS,
                                                V_FOURRHZFSQS,
                                                V_FOURRHZFNCS,
                                                V_FOURZAXLZS,
                                                V_FOURZAXLSQS,
                                                V_FOURZAXLNCS
                                   FROM T_TJFX_DWDAYSJLTJBB 
                                   WHERE ORGCODE=LIST(I).ORGCODE
                                          AND TJRQ>=TO_CHAR(V_QSRQ,'YYYYMMDD')
                                          AND TJRQ<=TO_CHAR(V_JSRQ,'YYYYMMDD');
                           ELSE
                                   V_FOURDAYS:=0;
                                   SELECT 0,0,0,0,0,0,0,0,0 
                                          INTO  V_FOURZS,V_FOURSQS,V_FOURNCS,V_FOURRHZFZS,V_FOURRHZFSQS,V_FOURRHZFNCS,V_FOURZAXLZS, V_FOURZAXLSQS,V_FOURZAXLNCS
                                   FROM DUAL; 
                                    
                            END IF;          
                            --第五周数据统计
                            SELECT SN ,START_DATE,END_DATE ,DAYS INTO V_WEEKNUM,V_QSRQ,V_JSRQ,V_DAYS FROM TABLE(F_GET_MONTH_WEEK_LIST(TO_CHAR(V_CURRENTDATE,'YYYYMMDD'))) WHERE SN=5; 
                            IF V_DAYS > 0 THEN
                                    
                                    IF V_DAYS > 3 THEN
                                      V_FIVEDAYS:=1;  
                                    ELSE
                                       V_FIVEDAYS:=0;
                                    END IF;
                                    SELECT NVL(SUM(ZS),0),NVL(SUM(JCSJSQCJS),0),NVL(SUM(JCSJNCCJS),0),
                                            NVL(SUM(RHZFZS),0),NVL(SUM(RHZFSQCJS),0),NVL(SUM(RHZFNCCJS),0),
                                            NVL(SUM(ZAXLCJZS),0),NVL(SUM(ZAXLSQCJS),0),NVL(SUM(ZAXLNCCJS),0)
                                            INTO  V_FIVEZS,
                                                  V_FIVESQS,
                                                  V_FIVENCS,
                                                  V_FIVERHZFZS,
                                                  V_FIVERHZFSQS,
                                                  V_FIVERHZFNCS,
                                                  V_FIVEZAXLZS,
                                                  V_FIVEZAXLSQS,
                                                  V_FIVEZAXLNCS
                                     FROM T_TJFX_DWDAYSJLTJBB 
                                     WHERE ORGCODE=LIST(I).ORGCODE
                                            AND TJRQ>=TO_CHAR(V_QSRQ,'YYYYMMDD')
                                            AND TJRQ<=TO_CHAR(V_JSRQ,'YYYYMMDD');     
                              ELSE
                                     V_FIVEDAYS:=0;
                                     SELECT 0,0,0,0,0,0,0,0,0
                                            INTO  V_FIVEZS,
                                                  V_FIVESQS,
                                                  V_FIVENCS,
                                                  V_FIVERHZFZS,
                                                  V_FIVERHZFSQS,
                                                  V_FIVERHZFNCS,
                                                  V_FIVEZAXLZS,
                                                  V_FIVEZAXLSQS,
                                                  V_FIVEZAXLNCS
                                     FROM DUAL; 
                                    
                            END IF;     
                            --第六周数据统计
                            SELECT SN ,START_DATE,END_DATE ,DAYS INTO V_WEEKNUM,V_QSRQ,V_JSRQ,V_DAYS FROM TABLE(F_GET_MONTH_WEEK_LIST(TO_CHAR(V_CURRENTDATE,'YYYYMMDD'))) WHERE SN=6; 
                            IF V_DAYS > 0 THEN
                               
                                  IF V_DAYS > 3 THEN
                                      V_SIXDAYS:=1;  
                                  ELSE
                                       V_SIXDAYS:=0;
                                  END IF;
                                  SELECT NVL(SUM(ZS),0),NVL(SUM(JCSJSQCJS),0),NVL(SUM(JCSJNCCJS),0),
                                          NVL(SUM(RHZFZS),0),NVL(SUM(RHZFSQCJS),0),NVL(SUM(RHZFNCCJS),0),
                                          NVL(SUM(ZAXLCJZS),0),NVL(SUM(ZAXLSQCJS),0),NVL(SUM(ZAXLNCCJS),0)
                                          INTO  V_SIXZS,
                                                V_SIXSQS,
                                                V_SIXNCS,
                                                V_SIXRHZFZS,
                                                V_SIXRHZFSQS,
                                                V_SIXRHZFNCS,
                                                V_SIXZAXLZS,
                                                V_SIXZAXLSQS,
                                                V_SIXZAXLNCS
                                   FROM T_TJFX_DWDAYSJLTJBB 
                                   WHERE ORGCODE=LIST(I).ORGCODE
                                          AND TJRQ>=TO_CHAR(V_QSRQ,'YYYYMMDD')
                                          AND TJRQ<=TO_CHAR(V_JSRQ,'YYYYMMDD');
                            ELSE
                                   V_SIXDAYS:=0;
                                   SELECT 0,0,0,0,0,0,0,0,0
                                          INTO  V_SIXZS,
                                                V_SIXSQS,
                                                V_SIXNCS,
                                                V_SIXRHZFZS,
                                                V_SIXRHZFSQS,
                                                V_SIXRHZFNCS,
                                                V_SIXZAXLZS,
                                                V_SIXZAXLSQS,
                                                V_SIXZAXLNCS
                                   FROM DUAL; 
                                    
                            END IF;          
                            
                             V_ONECJZS:=V_ONEZS +  V_ONERHZFZS + V_ONEZAXLZS;
                             V_TWOCJZS:=V_TWOZS + V_TWORHZFZS + V_TWOZAXLZS;
                             V_THREECJZS:=V_THREEZS + V_THREERHZFZS + V_THREEZAXLZS;
                             V_FOURCJZS:=V_FOURZS + V_FOURRHZFZS + V_FOURZAXLZS;
                             V_FIVECJZS:= V_FIVEZS + V_FIVERHZFZS + V_FIVEZAXLZS;
                             V_SIXCJZS:=V_SIXZS + V_SIXRHZFZS + V_SIXZAXLZS; 
                            
                             V_ZCJS:= V_ONECJZS + V_TWOCJZS + V_THREECJZS + V_FOURCJZS + V_FIVECJZS + V_SIXCJZS;
                                
                            --警务区总数
                            IF LIST(I).LEVE=5 THEN
                               SELECT COUNT(1) INTO V_JWQZS  FROM T_COMMON_ORGANIZATION_SJJS WHERE ORGCODE=LIST(I).ORGCODE AND LEVE=5;
                            ELSIF LIST(I).LEVE=4 THEN
                               SELECT COUNT(1) INTO V_JWQZS FROM T_COMMON_ORGANIZATION_SJJS WHERE ORGCODE LIKE SUBSTR(LIST(I).ORGCODE,1,8)||'31%' AND LEVE=5;
                            ELSE
                               SELECT COUNT(1) INTO V_JWQZS FROM T_COMMON_ORGANIZATION_SJJS WHERE ORGCODE LIKE SUBSTR(LIST(I).ORGCODE,1,2*F_GET_DWLEVE(LIST(I).ORGCODE))||'%' AND LEVE=5;
                            END IF;
                            
                            V_WWCRWJWQS:=0;
                            V_WWCZCJRWCS:=0;
                            --未完成任务警务区数
                            IF LIST(I).LEVE=5 THEN
                                IF (V_ONEDAYS=1 AND V_ONECJZS=0) 
                                    OR (V_TWODAYS=1 AND V_TWOCJZS=0) 
                                    OR (V_THREEDAYS=1 AND V_THREECJZS=0)
                                    OR (V_FOURDAYS=1 AND V_FOURCJZS=0)
                                    OR (V_FIVEDAYS=1 AND V_FIVECJZS=0)
                                    OR (V_SIXDAYS=1 AND V_SIXCJZS=0)
                                    THEN
                                   V_WWCRWJWQS:=1;
                                ELSE
                                    V_WWCRWJWQS:=0;
                                END IF;
                            ELSE
                                SELECT SUM(WWCRWJWQS) INTO V_WWCRWJWQS FROM T_TJFX_WEEKCJQK_YHZB 
                                WHERE ORGCODE LIKE SUBSTR(LIST(I).ORGCODE,1,2*F_GET_DWLEVE(LIST(I).ORGCODE))||'%'
                                      AND LEVE=5;
                            END IF;
                            
                            --未完成任务周次数 
                            IF LIST(I).LEVE=5 THEN
                               IF V_ONEDAYS=1 AND V_ONECJZS=0 THEN
                                  V_WWCZCJRWCS:=V_WWCZCJRWCS + 1;
                               END IF;
                               IF V_TWODAYS=1 AND V_TWOCJZS=0 THEN
                                  V_WWCZCJRWCS:=V_WWCZCJRWCS + 1;
                               END IF;
                               IF V_THREEDAYS=1 AND V_THREECJZS=0 THEN
                                  V_WWCZCJRWCS:=V_WWCZCJRWCS + 1;
                               END IF;
                               IF V_FOURDAYS=1 AND V_FOURCJZS=0 THEN
                                  V_WWCZCJRWCS:=V_WWCZCJRWCS + 1;
                               END IF;
                               IF V_FIVEDAYS=1 AND V_FIVECJZS=0 THEN
                                  V_WWCZCJRWCS:=V_WWCZCJRWCS + 1;
                               END IF;
                               IF V_SIXDAYS=1 AND V_SIXCJZS=0 THEN
                                  V_WWCZCJRWCS:=V_WWCZCJRWCS + 1;
                               END IF;
                            ELSE
                               SELECT SUM(WWCZCJRWCS) INTO V_WWCZCJRWCS FROM T_TJFX_WEEKCJQK_YHZB
                               WHERE ORGCODE LIKE SUBSTR(LIST(I).ORGCODE,1,2*F_GET_DWLEVE(LIST(I).ORGCODE))||'%'
                                      AND LEVE=5;
                            
                            END IF; 
                           
                            SELECT COUNT(1) INTO V_COUNT FROM T_TJFX_WEEKCJQK_YHZB WHERE ORGCODE=LIST(I).ORGCODE AND TJYF= V_TJYF;  
                            IF V_COUNT = 0 THEN 
                                    INSERT INTO T_TJFX_WEEKCJQK_YHZB
                                      (ORGCODE, ORGNAME, PARENT_CODE, LEVE, TJYF, TJSJ, ZCJS, 
                                       ONEZS, ONESQS, ONENCS, ONERHZFZS, ONERHZFSQS, ONERHZFNCS, ONEZAXLZS, ONEZAXLSQS, ONEZAXLNCS, 
                                       TWOZS, TWOSQS, TWONCS, TWORHZFZS, TWORHZFSQS, TWORHZFNCS, TWOZAXLZS, TWOZAXLSQS, TWOZAXLNCS, 
                                       THREEZS, THREESQS, THREENCS, THREERHZFZS, THREERHZFSQS, THREERHZFNCS, THREEZAXLZS, THREEZAXLSQS, THREEZAXLNCS, 
                                       FOURZS, FOURSQS, FOURNCS, FOURRHZFZS, FOURRHZFSQS, FOURRHZFNCS, FOURZAXLZS, FOURZAXLSQS, FOURZAXLNCS, 
                                       FIVEZS, FIVESQS, FIVENCS, FIVERHZFZS, FIVERHZFSQS, FIVERHZFNCS, FIVEZAXLZS, FIVEZAXLSQS, FIVEZAXLNCS, 
                                       SIXZS, SIXSQS, SIXNCS, SIXRHZFZS, SIXRHZFSQS, SIXRHZFNCS, SIXZAXLZS, SIXZAXLSQS, SIXZAXLNCS, 
                                       JWQZS, WWCRWJWQS, WWCZCJRWCS, ONECJZS, TWOCJZS, THREECJZS, FOURCJZS, FIVECJZS, SIXCJZS)
                                    VALUES
                                      (LIST(I).ORGCODE, LIST(I).ORGNAME, LIST(I).PARENT_CODE, LIST(I).LEVE, V_TJYF, V_TJSJ, V_ZCJS, 
                                      V_ONEZS, V_ONESQS, V_ONENCS, V_ONERHZFZS, V_ONERHZFSQS, V_ONERHZFNCS, V_ONEZAXLZS, V_ONEZAXLSQS, V_ONEZAXLNCS, 
                                      V_TWOZS, V_TWOSQS, V_TWONCS, V_TWORHZFZS, V_TWORHZFSQS, V_TWORHZFNCS, V_TWOZAXLZS, V_TWOZAXLSQS, V_TWOZAXLNCS, 
                                      V_THREEZS, V_THREESQS, V_THREENCS, V_THREERHZFZS, V_THREERHZFSQS, V_THREERHZFNCS, V_THREEZAXLZS, V_THREEZAXLSQS, V_THREEZAXLNCS, 
                                      V_FOURZS, V_FOURSQS, V_FOURNCS, V_FOURRHZFZS, V_FOURRHZFSQS, V_FOURRHZFNCS, V_FOURZAXLZS, V_FOURZAXLSQS, V_FOURZAXLNCS, 
                                      V_FIVEZS, V_FIVESQS, V_FIVENCS, V_FIVERHZFZS, V_FIVERHZFSQS, V_FIVERHZFNCS, V_FIVEZAXLZS, V_FIVEZAXLSQS, V_FIVEZAXLNCS, 
                                      V_SIXZS, V_SIXSQS, V_SIXNCS, V_SIXRHZFZS, V_SIXRHZFSQS, V_SIXRHZFNCS, V_SIXZAXLZS, V_SIXZAXLSQS, V_SIXZAXLNCS, 
                                      V_JWQZS, V_WWCRWJWQS, V_WWCZCJRWCS, V_ONECJZS, V_TWOCJZS, V_THREECJZS, V_FOURCJZS, V_FIVECJZS, V_SIXCJZS);
                                     
                            ELSE
                                    UPDATE T_TJFX_WEEKCJQK_YHZB
                                       SET ORGCODE = LIST(I).ORGCODE,
                                           ORGNAME = LIST(I).ORGNAME,
                                           PARENT_CODE = LIST(I).PARENT_CODE,
                                           LEVE = LIST(I).LEVE,
                                           TJYF = V_TJYF,
                                           TJSJ = V_TJSJ,
                                           ZCJS = V_ZCJS,
                                           ONEZS = V_ONEZS,
                                           ONESQS = V_ONESQS,
                                           ONENCS = V_ONENCS,
                                           ONERHZFZS = V_ONERHZFZS,
                                           ONERHZFSQS = V_ONERHZFSQS,
                                           ONERHZFNCS = V_ONERHZFNCS,
                                           ONEZAXLZS = V_ONEZAXLZS,
                                           ONEZAXLSQS = V_ONEZAXLSQS,
                                           ONEZAXLNCS = V_ONEZAXLNCS,
                                           TWOZS = V_TWOZS,
                                           TWOSQS = V_TWOSQS,
                                           TWONCS = V_TWONCS,
                                           TWORHZFZS = V_TWORHZFZS,
                                           TWORHZFSQS = V_TWORHZFSQS,
                                           TWORHZFNCS = V_TWORHZFNCS,
                                           TWOZAXLZS = V_TWOZAXLZS,
                                           TWOZAXLSQS = V_TWOZAXLSQS,
                                           TWOZAXLNCS = V_TWOZAXLNCS,
                                           THREEZS = V_THREEZS,
                                           THREESQS = V_THREESQS,
                                           THREENCS = V_THREENCS,
                                           THREERHZFZS = V_THREERHZFZS,
                                           THREERHZFSQS = V_THREERHZFSQS,
                                           THREERHZFNCS = V_THREERHZFNCS,
                                           THREEZAXLZS = V_THREEZAXLZS,
                                           THREEZAXLSQS = V_THREEZAXLSQS,
                                           THREEZAXLNCS = V_THREEZAXLNCS,
                                           FOURZS = V_FOURZS,
                                           FOURSQS = V_FOURSQS,
                                           FOURNCS = V_FOURNCS,
                                           FOURRHZFZS = V_FOURRHZFZS,
                                           FOURRHZFSQS = V_FOURRHZFSQS,
                                           FOURRHZFNCS = V_FOURRHZFNCS,
                                           FOURZAXLZS = V_FOURZAXLZS,
                                           FOURZAXLSQS = V_FOURZAXLSQS,
                                           FOURZAXLNCS = V_FOURZAXLNCS,
                                           FIVEZS = V_FIVEZS,
                                           FIVESQS = V_FIVESQS,
                                           FIVENCS = V_FIVENCS,
                                           FIVERHZFZS = V_FIVERHZFZS,
                                           FIVERHZFSQS = V_FIVERHZFSQS,
                                           FIVERHZFNCS = V_FIVERHZFNCS,
                                           FIVEZAXLZS = V_FIVEZAXLZS,
                                           FIVEZAXLSQS = V_FIVEZAXLSQS,
                                           FIVEZAXLNCS = V_FIVEZAXLNCS,
                                           SIXZS = V_SIXZS,
                                           SIXSQS = V_SIXSQS,
                                           SIXNCS = V_SIXNCS,
                                           SIXRHZFZS = V_SIXRHZFZS,
                                           SIXRHZFSQS = V_SIXRHZFSQS,
                                           SIXRHZFNCS = V_SIXRHZFNCS,
                                           SIXZAXLZS = V_SIXZAXLZS,
                                           SIXZAXLSQS = V_SIXZAXLSQS,
                                           SIXZAXLNCS = V_SIXZAXLNCS,
                                           JWQZS = V_JWQZS,
                                           WWCRWJWQS = V_WWCRWJWQS,
                                           WWCZCJRWCS = V_WWCZCJRWCS,
                                           ONECJZS = V_ONECJZS,
                                           TWOCJZS = V_TWOCJZS,
                                           THREECJZS = V_THREECJZS,
                                           FOURCJZS = V_FOURCJZS,
                                           FIVECJZS = V_FIVECJZS,
                                           SIXCJZS = V_SIXCJZS
                                     WHERE ORGCODE=LIST(I).ORGCODE AND TJYF= V_TJYF;                            
                            END IF; 
                            COMMIT;
                     END LOOP;
                END LOOP;
         END P_TJBB_WEEKCJQK_YHZ;
          
END SQJW_TJBB;
/
  