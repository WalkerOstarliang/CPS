-- Add/modify columns 
alter table T_ZA_RY_CYRY add PFSJ date;
-- Add comments to the columns 
comment on column T_ZA_RY_CYRY.PFSJ
  is '派发时间（派出所派发给社区的时间）';

  
-- Add/modify columns 
alter table T_COMMON_WTSJTJFX add CZFWXXS number;
-- Add comments to the columns 
comment on column T_COMMON_WTSJTJFX.CZFWXXS
  is '出租房屋信息数';

  
-- Create table
create table T_COMMON_WTSJTJFX_Week
(
  ID      VARCHAR2(30),
  ORGCODE VARCHAR2(12),
  ORGNAME VARCHAR2(120),
  TJYF    VARCHAR2(6),
  JSSJ    DATE,
  TJQSSJ  DATE,
  TJJZSJ  DATE,
  ZWTS    NUMBER,
  CZRKS   NUMBER,
  LDRKS   NUMBER,
  JZRKS   NUMBER,
  WLHRKS  NUMBER,
  STXXS   NUMBER,
  FWXXS   NUMBER,
  SYDWS   NUMBER,
  CYRYS   NUMBER,
  TJRQ    VARCHAR2(8),
  CZFWXXS NUMBER
);
-- Add comments to the table 
comment on table T_COMMON_WTSJTJFX_week
  is '问题数据统计分析';
-- Add comments to the columns 
comment on column T_COMMON_WTSJTJFX_week.ID
  is 'ID';
comment on column T_COMMON_WTSJTJFX_week.ORGCODE
  is '机构代码';
comment on column T_COMMON_WTSJTJFX_week.ORGNAME
  is '机构名称';
comment on column T_COMMON_WTSJTJFX_week.TJYF
  is '统计月份';
comment on column T_COMMON_WTSJTJFX_week.JSSJ
  is '计算时间';
comment on column T_COMMON_WTSJTJFX_week.TJQSSJ
  is '统计起始时间';
comment on column T_COMMON_WTSJTJFX_week.TJJZSJ
  is '统计结束时间';
comment on column T_COMMON_WTSJTJFX_week.ZWTS
  is '总问题数据数量';
comment on column T_COMMON_WTSJTJFX_week.CZRKS
  is '常住人口问题数据量';
comment on column T_COMMON_WTSJTJFX_week.LDRKS
  is '流动人口问题数据量';
comment on column T_COMMON_WTSJTJFX_week.JZRKS
  is '寄住人口问题数据量';
comment on column T_COMMON_WTSJTJFX_week.WLHRKS
  is '未落户人口问题数据量';
comment on column T_COMMON_WTSJTJFX_week.STXXS
  is '实体信息问题数据量';
comment on column T_COMMON_WTSJTJFX_week.FWXXS
  is '房屋信息问题数据量';
comment on column T_COMMON_WTSJTJFX_week.SYDWS
  is '实有单位问题数据量';
comment on column T_COMMON_WTSJTJFX_week.CYRYS
  is '从业人员问题数据量';
comment on column T_COMMON_WTSJTJFX_week.TJRQ
  is '统计日期';
comment on column T_COMMON_WTSJTJFX_week.CZFWXXS
  is '出租房屋信息数';
-- Create/Recreate indexes 
create index T_COMMON_WTSJTJFX_week_ORGCODE on T_COMMON_WTSJTJFX_week (ORGCODE);
create index T_COMMON_WTSJTJFX_week_TJJZSJ on T_COMMON_WTSJTJFX_week (TJJZSJ);
create index T_COMMON_WTSJTJFX_week_TJQSSJ on T_COMMON_WTSJTJFX_week (TJQSSJ);
create index T_COMMON_WTSJTJFX_week_TJRQ on T_COMMON_WTSJTJFX_week (TJRQ);
create index T_COMMON_WTSJTJFX_week_TJYF on T_COMMON_WTSJTJFX_week (TJYF)
  

CREATE OR REPLACE FUNCTION F_GET_CZFW_MAXDJSJ(V_FWBH VARCHAR2)
RETURN DATE
 
AS
       V_MAXDJSJ     DATE;
BEGIN
       SELECT MAX(DJSJ) INTO V_MAXDJSJ FROM T_LSGL_CZFW_JBXX WHERE FWBH=V_FWBH AND DJSJ IS NOT NULL;
       RETURN V_MAXDJSJ;
END;
/

CREATE OR REPLACE FUNCTION F_GET_DW_MAXDJSJ(V_DWMC VARCHAR2, V_DWDZ VARCHAR2)
RETURN DATE
 
AS
       V_MAXDJSJ     DATE;
BEGIN
       SELECT MAX(DJSJ) INTO V_MAXDJSJ FROM T_ZA_JG_JBXX WHERE DWMC=V_DWMC AND DWDZ=V_DWDZ;
       RETURN V_MAXDJSJ;
END;
/
CREATE OR REPLACE FUNCTION F_GET_CYRY_MAXDJSJ(V_JGBH VARCHAR2, V_SFZH VARCHAR2)
RETURN DATE
 
AS
       V_MAXDJSJ     DATE;
BEGIN
       SELECT MAX(DJSJ) INTO V_MAXDJSJ FROM T_ZA_RY_CYRY WHERE JGBH=V_JGBH AND SFZH=V_SFZH;
       RETURN V_MAXDJSJ;
END;
/


insert into t_common_wtsjtjfx_pz (ID, SJTYPE, QUERYSQL, SHOWFIELDS, SHOWFIELDNAMES)
values ('9', 'czfwxx', 'SELECT CZFWBH,CZFWBPBM,FZSFZH,FZXM,DJSJ
FROM T_LSGL_CZFW_JBXX
WHERE 1=1
 AND DJSJ>=TO_DATE(#[tjqssj],''YYYY-MM-DD HH24:MI:SS'')
 AND DJSJ<=TO_DATE(#[tjjzsj],''YYYY-MM-DD HH24:MI:SS'')
 AND DJDWDM=#[orgcode] 
 AND FWBH IN (
 SELECT FWBH
  FROM T_LSGL_CZFW_JBXX C INNER JOIN T_LSGL_FW_JBXX FW ON FW.FWID=C.FWBH
  WHERE FW.SFCZW=''1''
        AND C.DJSJ>=TO_DATE(#[tjqssj],''YYYY-MM-DD HH24:MI:SS'')
        AND C.DJSJ<=TO_DATE(#[tjjzsj],''YYYY-MM-DD HH24:MI:SS'')
        AND C.DJDWDM=#[orgcode]
  GROUP BY C.FWBH
  HAVING COUNT(1)>1
  )', 'CZFWBH,CZFWBPBM,FZSFZH,FZXM,DJSJ', '出租房编号,出租房屋标牌编码,房主身份证,房主姓名,登记时间');

commit;