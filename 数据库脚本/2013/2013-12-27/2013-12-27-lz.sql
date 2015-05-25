create or replace view v_lsgl_fw_jbxx as
select fw.fwid,st.id as stid,st.stbm,st.stmc,st.xzqh,st.xzqhmc,st.jdxzdm,st.jdxzmc,st.sqdm,st.sqmc,st.jlxdm,st.jlxmc,
       st.mph,st.xqz,st.ldxz,st.stfl,st.dmcs,st.dxcs,st.jzjg,st.kfs,st.wygldw,st.zbdw,st.xfdj,
       st.x,st.y,st.djdwdm,st.djdwmc,st.djrjh,st.djrxm,st.djsj,
       dz.dyh,dz.lch,dz.lchz,dz.fjh,dz.shhz,dz.dzid,dz.dzbm,
       dz.gxsj,dz.fsdz,dz.djrdwmc,
       dz.djrdwdm,dz.dzxzb,dz.dzyzb,dz.ydzbh
from t_common_stxx st inner join t_common_dzxx dz on st.id=dz.stid

join t_lsgl_fw_jbxx  fw on  fw.dzid =dz.dzid