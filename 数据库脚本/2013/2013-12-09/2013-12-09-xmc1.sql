-- Add/modify columns 
alter table T_COMMON_DZXX rename column STBM to STID;
-- Add comments to the columns 
comment on column T_COMMON_DZXX.STID
  is '实体ID';

  
  -- Drop columns 
alter table T_COMMON_DZXX drop column DZMC;
alter table T_COMMON_DZXX drop column SSXQDM;
alter table T_COMMON_DZXX drop column JDXZDM;
alter table T_COMMON_DZXX drop column SQDM;
alter table T_COMMON_DZXX drop column JLXDM;
alter table T_COMMON_DZXX drop column JLXMC;
alter table T_COMMON_DZXX drop column MPH;
alter table T_COMMON_DZXX drop column XQZ;
alter table T_COMMON_DZXX drop column LDH;
alter table T_COMMON_DZXX drop column STMC;
  

  
  -- Add/modify columns 
alter table T_COMMON_DZXX modify STID varchar2(24);
alter table T_COMMON_DZXX add LCHZ varchar2(1);
alter table T_COMMON_DZXX add SHHZ varchar2(1);
-- Add comments to the columns 
comment on column T_COMMON_DZXX.LCHZ
  is '楼层后缀';
comment on column T_COMMON_DZXX.SHHZ
  is '室号后缀';
  
  
create or replace view v_common_dzxx
as
select st.id,st.stbm,st.xzqh,st.xzqhmc,st.jdxzdm,st.jdxzmc,st.sqdm,st.sqmc,st.jlxdm,st.jlxmc,
       st.mph,st.xqz,st.ldxz,st.stfl,st.dmcs,st.dxcs,st.jzjg,st.kfs,st.wygldw,st.zbdw,st.xfdj,
       st.x,st.y,st.djdwdm,st.djdwmc,st.djrjh,st.djrxm,st.djsj,
       dz.dyh,dz.lch,dz.lchz,dz.fjh,dz.shhz,dz.dzid,dz.dzbm,dz.gxsj
from t_common_stxx st left join t_common_dzxx dz on st.id=dz.stid
  


  