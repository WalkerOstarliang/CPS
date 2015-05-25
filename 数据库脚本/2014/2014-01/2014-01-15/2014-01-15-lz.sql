-- Add/modify columns 
alter table T_COMMON_STXX add czrjh varchar2(6);
alter table T_COMMON_STXX add czrxm varchar2(30);
alter table T_COMMON_STXX add czdwdm varchar2(12);
alter table T_COMMON_STXX add czdwmc varchar2(120);
alter table T_COMMON_STXX add czsj date;
alter table T_COMMON_STXX add zxbs varchar2(1);
-- Add comments to the columns 
comment on column T_COMMON_STXX.czrjh
  is '操作人警号';
comment on column T_COMMON_STXX.czrxm
  is '操作人姓名';
comment on column T_COMMON_STXX.czdwdm
  is '操作单位代码';
comment on column T_COMMON_STXX.czdwmc
  is '操作单位名称';
comment on column T_COMMON_STXX.czsj
  is '操作时间';
comment on column T_COMMON_STXX.zxbs
  is '注销标识';
  
  
  -- Add comments to the columns 
comment on column T_COMMON_STXX.ZXBS
  is '注销标识   0 注销   1未注销';
  
  
  
  
  create or replace view v_common_dzxx as
select st.id as stid,st.stbm,st.stmc,st.xzqh,st.xzqhmc,st.jdxzdm,st.jdxzmc,st.sqdm,st.sqmc,st.jlxdm,st.jlxmc,
       st.mph,st.xqz,st.ldxz,st.stfl,st.dmcs,st.dxcs,st.jzjg,st.kfs,st.wygldw,st.zbdw,st.xfdj,
       st.x,st.y,st.djdwdm,st.djdwmc,st.djrjh,st.djrxm,st.djsj,st.zxbs,
       dz.dyh,dz.lch,dz.lchz,dz.fjh,dz.shhz,dz.dzid,dz.dzbm,
       dz.gxsj,dz.fsdz,dz.djrdwmc,
       dz.djrdwdm,dz.dzxzb,dz.dzyzb,dz.ydzbh
from t_common_stxx st inner join t_common_dzxx dz on st.id=dz.stid;