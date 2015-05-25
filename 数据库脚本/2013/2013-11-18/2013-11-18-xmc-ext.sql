CREATE OR REPLACE VIEW V_LSGL_CZRK_FWGL AS
SELECT CK.*,FW.FWID,FW.DZID,FW.FWMC,dz.dzmc
FROM V_LSGL_RK_CZRK CK LEFT JOIN T_LSGL_RKFW_GL GL ON CK.RKFWGLID=GL.RKFWGLID
     LEFT JOIN T_LSGL_FW_JBXX FW ON FW.FWID=GL.FWID
     left join t_common_dzxx dz on dz.dzid=gl.dzid;

     
CREATE OR REPLACE VIEW V_LSGL_JWRK_FWGL AS
SELECT JW.*,FW.FWID,FW.DZID,FW.FWMC,dz.dzmc
FROM v_lsgl_rk_jwrkxx JW
     LEFT JOIN T_LSGL_RKFW_GL GL ON JW.RKFWGLID=GL.RKFWGLID
     LEFT JOIN T_LSGL_FW_JBXX FW ON FW.FWID=GL.FWID
     left join t_common_dzxx dz on dz.dzid=gl.dzid;



CREATE OR REPLACE VIEW V_LSGL_JZRK_FWGL AS
SELECT JZ.*,FW.FWID,FW.DZID,FW.FWMC,dz.dzmc
        FROM V_LSGL_RK_JZRKXX JZ LEFT JOIN T_LSGL_RKFW_GL GL ON JZ.RKFWGLID=GL.RKFWGLID
           LEFT JOIN T_LSGL_FW_JBXX FW ON FW.FWID=GL.FWID
            left join t_common_dzxx dz on dz.dzid=gl.dzid;
            
CREATE OR REPLACE VIEW V_LSGL_LDRK_FWGL AS
SELECT LK.*,FW.FWID,FW.DZID,FW.FWMC,dz.dzmc
FROM V_LSGL_RK_LDRK LK LEFT JOIN T_LSGL_RKFW_GL GL ON LK.RKFWGLID=GL.RKFWGLID
     LEFT JOIN T_LSGL_FW_JBXX FW ON FW.FWID=GL.FWID
      left join t_common_dzxx dz on dz.dzid=gl.dzid;
      
CREATE OR REPLACE VIEW V_LSGL_WLHCZRK_FWGL AS
SELECT WL.*,FW.FWID,FW.DZID,FW.FWMC,dz.dzmc
FROM V_LSGL_RK_WLHCZHK WL LEFT JOIN T_LSGL_RKFW_GL GL ON GL.RKFWGLID=WL.RKFWGLID
           LEFT JOIN T_LSGL_FW_JBXX FW ON FW.FWID=GL.FWID
           left join t_common_dzxx dz on dz.dzid=gl.dzid;
     
     
     
     
     
create or replace view v_lsgl_rk_syrk as
select czrk.czrkbh as rkid,czrk.rybh,czrk.zrdwdm,czrk.czdwdm,czrk.djdwdm,czrk.hjdqh,czrk.hjdxz
from t_lsgl_rk_czrk czrk

union all


select lk.ZZBH as rkid,lk.rybh,lk.zrdwdm,lk.czdwdm,lk.djdwdm,'' hjdqh,'' hjdxz
from t_lsgl_rk_ldrkzzxx lk

union all

select wlh.WLHRKBH as rkid,wlh.rybh,wlh.zrdwdm,wlh.czdwdm,wlh.djdwdm,'' hjdqh,'' hjdxz
from t_lsgl_rk_wlhczhk wlh

union all

select jw.JWBH as rkid,jw.rybh,jw.zrdwdm,jw.czdwdm,jw.djdwdm,'' hjdqh,'' hjdxz
from t_lsgl_rk_jwrkxx jw

union all

select jz.JZBH as rkid,jz.rybh,jz.zrdwdm,jz.czdwdm,jz.djdwdm,'' hjdqh,'' hjdxz
from t_lsgl_rk_jzrkxx jz;

     
     
     
  
     
     
     
     
     
     