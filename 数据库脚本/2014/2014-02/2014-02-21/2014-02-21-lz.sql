CREATE OR REPLACE VIEW V_LSGL_WLHCZRK_FWGL AS
SELECT WL.*,FW.FWID,FW.DZID,FW.FWMC,f_get_dzmc(FW.DZID) AS DZMC
FROM V_LSGL_RK_WLHCZHK WL LEFT JOIN T_LSGL_RKFW_GL GL ON GL.RKFWGLID=WL.RKFWGLID
           LEFT JOIN T_LSGL_FW_JBXX FW ON FW.FWID=GL.FWID
           left join t_common_dzxx dz on dz.dzid=gl.dzid;
           
           
           
           -- Add/modify columns 
alter table T_LSGL_RK_JBXX modify XM null;