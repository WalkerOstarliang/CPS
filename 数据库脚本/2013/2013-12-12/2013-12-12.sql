create or replace function f_get_dzxxxzqh(v_dzid varchar2) return varchar2
--获取地址信息行政区划
as
       v_dzxzqh   varchar2(6);
       v_stid     varchar2(6);
begin
       select stid into v_stid from t_common_dzxx where dzid=v_dzid;
       select xzqh into v_dzxzqh from t_common_stxx where id=v_stid;
       return v_dzxzqh;
end;
/

CREATE OR REPLACE VIEW V_LSGL_CZRK_FWGL AS
SELECT CK.*,FW.FWID,FW.DZID,FW.FWMC,F_GET_DZMC(FW.DZID) AS DZMC
FROM V_LSGL_RK_CZRK CK LEFT JOIN T_LSGL_RKFW_GL GL ON CK.RKFWGLID=GL.RKFWGLID
     LEFT JOIN T_LSGL_FW_JBXX FW ON FW.FWID=GL.FWID
     left join t_common_dzxx dz on dz.dzid=gl.dzid;

     
CREATE OR REPLACE VIEW V_LSGL_LDRK_FWGL AS
SELECT LK.*,FW.FWID,FW.DZID,FW.FWMC,fw.sfczw,f_get_dzmc(FW.DZID) AS DZMC
FROM V_LSGL_RK_LDRK LK LEFT JOIN T_LSGL_RKFW_GL GL ON LK.RKFWGLID=GL.RKFWGLID
     LEFT JOIN T_LSGL_FW_JBXX FW ON FW.FWID=GL.FWID
      left join t_common_dzxx dz on dz.dzid=gl.dzid;


CREATE OR REPLACE VIEW V_LSGL_JZRK_FWGL AS
SELECT JZ.*,FW.FWID,FW.DZID,FW.FWMC,fw.sfczw,f_get_dzmc(FW.DZID) AS DZMC
        FROM V_LSGL_RK_JZRKXX JZ LEFT JOIN T_LSGL_RKFW_GL GL ON JZ.RKFWGLID=GL.RKFWGLID
           LEFT JOIN T_LSGL_FW_JBXX FW ON FW.FWID=GL.FWID
            left join t_common_dzxx dz on dz.dzid=gl.dzid;
            
CREATE OR REPLACE VIEW V_LSGL_JWRK_FWGL AS
SELECT JW.*,FW.FWID,FW.DZID,FW.FWMC,f_get_dzmc(FW.DZID) AS DZMC
FROM v_lsgl_rk_jwrkxx JW
     LEFT JOIN T_LSGL_RKFW_GL GL ON JW.RKFWGLID=GL.RKFWGLID
     LEFT JOIN T_LSGL_FW_JBXX FW ON FW.FWID=GL.FWID
     left join t_common_dzxx dz on dz.dzid=gl.dzid;

     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
