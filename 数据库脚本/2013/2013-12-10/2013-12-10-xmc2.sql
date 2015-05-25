create or replace view v_common_dzxx as
select st.id as stid,st.stbm,st.stmc,st.xzqh,st.xzqhmc,st.jdxzdm,st.jdxzmc,st.sqdm,st.sqmc,st.jlxdm,st.jlxmc,
       st.mph,st.xqz,st.ldxz,st.stfl,st.dmcs,st.dxcs,st.jzjg,st.kfs,st.wygldw,st.zbdw,st.xfdj,
       st.x,st.y,st.djdwdm,st.djdwmc,st.djrjh,st.djrxm,st.djsj,
       dz.dyh,dz.lch,dz.lchz,dz.fjh,dz.shhz,dz.dzid,dz.dzbm,dz.gxsj,dz.fsdz,dz.djrdwmc,dz.djrdwdm,dz.dzxzb,dz.dzyzb
from t_common_stxx st inner join t_common_dzxx dz on st.id=dz.stid;

create or replace function f_get_dzmc(v_dzid varchar2) return varchar2
--通过地址ID获取地址名称
as
       v_stid     varchar2(24);
       v_dzmc     varchar2(1000);
       v_xzqhmc   varchar2(120);
       v_jdxzmc   varchar2(120);
       v_sqmc     varchar2(120);
       v_jlxmc      varchar2(120);
       v_mph      varchar2(20);
       v_xqz      varchar2(100);
       v_ldxz     varchar2(120);
       v_dyhmc    varchar2(10);
       v_lcmc     varchar2(50);
       v_fjh      varchar2(50);                    
begin
       
       select stid into v_stid from t_common_dzxx dz where dz.dzid=v_dzid;
       
       select st.xzqhmc,st.jdxzmc,st.sqmc,st.jlxmc,st.mph,st.xqz,st.ldxz 
              into v_xzqhmc,v_jdxzmc,v_sqmc,v_jlxmc,v_mph,v_xqz,v_ldxz
       from t_common_stxx st 
       where st.id=v_stid; 
       
       select (select mc from t_common_dictionary where zdlb='ZDY_DYH' and dm=dz.dyh),
              dz.lch||(select mc from t_common_dictionary where zdlb='ZDY_LCHZ' and dm=dz.lchz),
              dz.fjh||(select mc from t_common_dictionary where zdlb='ZDY_SHHZ' and dm=dz.shhz)
              into v_dyhmc,v_lcmc,v_fjh
       from t_common_dzxx dz  
       where dz.dzid=v_dzid;
       v_dzmc:=v_xzqhmc||v_jdxzmc||v_sqmc||v_jlxmc||v_mph||v_xqz||v_ldxz||v_dyhmc||v_lcmc||v_fjh;
       return v_dzmc;
end;
/