-- Add/modify columns 
alter table T_ZA_RY_CYRY add jzdsqdm varchar2(20);
alter table T_ZA_RY_CYRY add jzdsqmc varchar2(120);
-- Add comments to the columns 
comment on column T_ZA_RY_CYRY.jzdsqdm
  is '居住地社区代码';
comment on column T_ZA_RY_CYRY.jzdsqmc
  is '居住地名称';
  
  
  
  
create or replace view v_za_ry_cyry as
select
    cyry.cyrybh,
    cyry.rybh,
    cyry.jgbh,
    cyry.bmmc,
    cyry.gzly,
    cyry.pynx,
    cyry.zw as zwlb,
    cyry.sjhm,
    cyry.qtlxdh,
    cyry.zsqk,
    cyry.pxzh,
    cyry.pxzs,
    cyry.zdfwdxlb,
    cyry.bwcs,
    cyry.kzcs,
    cyry.zygx,
    cyry.zywt,
    cyry.jcqk,
    cyry.bz,
    cyry.zxyy,
    cyry.zxbs,
    cyry.zxrq,
    cyry.czrxm,
    cyry.czdwdm,
    to_char(cyry.czsj,'yyyy-mm-dd HH24:mi:ss') as czsj,
    cyry.czbs,
    cyry.djdwdm,
    cyry.djdwmc,
    cyry.djrxm,
    to_char(cyry.djsj,'yyyy-mm-dd HH24:mi:ss') as djsj,
    cyry.czdwmc,
    to_char(cyry.lzsj,'yyyy-mm-dd') as lzsj,
    to_char(cyry.rzsj,'yyyy-mm-dd') as rzsj,
    cyry.cyryygh,
    cyry.xzdz,
    cyry.xm,
    cyry.xb,
    cyry.sfzh,
    cyry.csrq,
    cyry.mz,
    cyry.bmch,
    cyry.sfabry,
    cyry.rkfwglid,
    (select DWMC from t_za_jg_jbxx jg where jg.jgbh=cyry.jgbh) as dwmc,
    (select hylb from t_za_jg_jbxx jg where jg.jgbh=cyry.jgbh) as hylb,
    cyry.djrjh,
    cyry.czrjh,
    cyry.XZDJWQ,
    (select orgname from v_common_organization where orgcode=cyry.XZDJWQ and rownum=1) as xzdjwqmc,
    cyry.FKRXM,
    cyry.FKDWDM,
    cyry.FKDWMC,
    cyry.FKSJ,
    cyry.FKNR,
    rkjbxx.xzzzrq,
    rkjbxx.sspcsdm,
    cyry.jzdsqdm,
     cyry.jzdsqmc
from t_za_ry_cyry cyry,t_lsgl_rk_jbxx rkjbxx where cyry.rybh = rkjbxx.rybh;


create or replace function f_get_rysx(sfzh varchar2, rysx varchar2,opertype varchar2)
return varchar2
--生成新的人员属性
--rybh :人员编号
--rysx ： 新的人员属性
--opertype：操作类型 I表示插入 ，D 表示删除
as
       v_rysx     varchar2(12);
       v_sfzh     varchar2(120);
       v_opertype varchar2(1);
       v_oldrysx  varchar2(120);
       v_newrysx  varchar2(120);
begin
       v_sfzh:=sfzh;
       v_rysx:=rysx;
       v_opertype:=opertype;
       v_newrysx:='';

       select rysx into v_oldrysx from t_lsgl_rk_jbxx where sfzh=v_sfzh and rownum=1;
       if v_rysx is not null then
           --做插入更新
           if v_opertype = 'I' then
             if v_oldrysx is null then
                v_oldrysx := '000000000000000000000000000000000000000000000000000000000000';
                v_newrysx:=substr(v_oldrysx,1,v_rysx-1)||'1'||substr(v_oldrysx,v_rysx+1,60);
             elsif instr(v_oldrysx,v_rysx) <= 0 then
                v_newrysx:=substr(v_oldrysx,1,v_rysx-1)||'1'||substr(v_oldrysx,v_rysx+1,60);
             else
                v_newrysx:=v_oldrysx;
             end if;
           --做删除更新
           elsif v_opertype='D' then
               v_newrysx:=substr(v_oldrysx,1,v_rysx-1)||'0'||substr(v_oldrysx,v_rysx+1,60);
               if instr(v_newrysx,',')=1 then
                  v_newrysx:=substr(v_newrysx,2);
               end if;
           end if;
       else
          v_newrysx:=v_oldrysx;
       end if;
       return v_newrysx;
end;

--重点人员派发信息
-- Create table
create table T_ZDRY_RYPF
(
  ID     VARCHAR2(20) not null,
  ZDRYBH VARCHAR2(12),
  PFRXM  VARCHAR2(30),
  PFRJH  VARCHAR2(12),
  PFDWDM VARCHAR2(12),
  PFDWMC VARCHAR2(120),
  PFDWDJ VARCHAR2(2),
  MBDWDM VARCHAR2(12),
  MBDWMC VARCHAR2(120)
);
-- Add comments to the columns 
comment on column T_ZDRY_RYPF.ID
  is '主键ID';
comment on column T_ZDRY_RYPF.ZDRYBH
  is '重点人员编号';
comment on column T_ZDRY_RYPF.PFRXM
  is '派发人姓名';
comment on column T_ZDRY_RYPF.PFRJH
  is '派发人警号';
comment on column T_ZDRY_RYPF.PFDWDM
  is '派发单位代码';
comment on column T_ZDRY_RYPF.PFDWMC
  is '派发单位名称';
comment on column T_ZDRY_RYPF.PFDWDJ
  is '派发单位级别';
comment on column T_ZDRY_RYPF.MBDWDM
  is '目标单位代码';
comment on column T_ZDRY_RYPF.MBDWMC
  is '目标单位名称';
-- Create/Recreate primary, unique and foreign key constraints 
alter table T_ZDRY_RYPF
  add primary key (ID);
  
  -- Create sequence 
create sequence SEQ_ZDRYPF_ID
minvalue 10000000000000000001
maxvalue 99999999999999999999
start with 10000000000000000001
increment by 1
cache 20;

  