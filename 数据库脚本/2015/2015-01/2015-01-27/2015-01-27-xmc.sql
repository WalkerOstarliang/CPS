CREATE OR REPLACE PROCEDURE P_update_data_to_gajg(v_sqdm varchar2)
--辖区情况统计过程
AS
  v_org_code varchar2(12);
  v_org_name varchar2(120);
BEGIN
  --查询警务区信息
  select t.ssjwsdm,
         (select orgname
            from v_common_organization
           where orgcode = t.ssjwsdm)
    into v_org_code, v_org_name
    from t_common_hnxzqh t
   where t.dm = v_sqdm;

  --更新实体
  update t_common_stxx st
     set st.DJDWDM = v_org_code,
         st.DJDWMC = v_org_name,
         st.CZDWDM = v_org_code,
         st.CZDWMC = v_org_name,
         st.xzqh = substr(v_sqdm,1,6),
         st.xzqhmc = (select mc from t_common_hnxzqh where dm=substr(v_sqdm,1,6)||'000000'),
         st.jdxzdm = (select parent_dm from t_common_hnxzqh where dm=v_sqdm),
         st.jdxzmc = (select JC from t_common_hnxzqh where dm=(select parent_dm from t_common_hnxzqh where dm=v_sqdm and rownum=1)),
         st.sqmc = (select jc from t_common_hnxzqh dm where dm.dm = v_sqdm),
         st.pcsdm = substr(v_org_code,1,8)||'0000',
         st.pcsmc = (select orgname from v_common_organization where orgcode=substr(v_org_code,1,8)||'0000' and rownum=1)
   where st.sqdm = v_sqdm;
  commit;

  --更新实体下面的地址

  update t_common_dzxx dz
     set dz.djrdwdm = v_org_code, dz.djrdwmc = v_org_name, dz.sqdm = v_sqdm
   where dz.stid in (select id
                       from t_common_stxx st
                      where st.DJDWDM = v_org_code
                        and st.sqdm = v_sqdm);
  commit;
  --更新房屋
  update t_lsgl_fw_jbxx fw
     set fw.djdwdm   = v_org_code,
         fw.djdwmc   = v_org_name,
         fw.sszrdwdm = v_org_code,
         fw.sszrdwmc = v_org_name,
         fw.czdwdm   = v_org_code,
         fw.czdwmc   = v_org_name,
         fw.sssq     = v_sqdm,
         fw.sspcsdm  = substr(v_org_code, 0, 8) || '0000'
   where fw.dzid in (select dzid
                       from t_common_dzxx dz
                      where dz.DJrDWDM = v_org_code
                        and dz.sqdm = v_sqdm);
  commit;

  --更新出租房
  update t_lsgl_czfw_jbxx cz
     set cz.djdwdm = v_org_code, cz.djdwmc = v_org_name
   where cz.fwbh in
         (select fwid from t_lsgl_fw_jbxx fw where fw.DJDWDM = v_org_code);
  commit;

  --更新常住人口

  update t_lsgl_rk_czrk ck
     set ck.djdwdm   = v_org_code,
         ck.djdwmc   = v_org_name,
         ck.zrdwdm   = v_org_code,
         ck.zrdwmc   = v_org_name,
         ck.czdwdm   = v_org_code,
         ck.czdwmc   = v_org_name,
         ck.hjsssqbh = v_sqdm
   where ck.rkfwglid in (select gl.rkfwglid
                           from t_lsgl_rkfw_gl gl, t_lsgl_fw_jbxx fw
                          where gl.fwid = fw.fwid
                            and fw.djdwdm = v_org_code
                            and fw.sssq = v_sqdm);

  commit;


  --更新流动人口
  update t_lsgl_rk_ldrkzzxx lk
     set lk.djdwdm = v_org_code,
         lk.djdwmc = v_org_name,
         lk.zrdwdm = v_org_code,
         lk.zrdwmc = v_org_name,
         lk.czdwdm = v_org_code,
         lk.czdwmc = v_org_name,
         lk.sssqbh = v_sqdm
   where lk.rkfwglid in (select gl.rkfwglid
                           from t_lsgl_rkfw_gl gl, t_lsgl_fw_jbxx fw
                          where gl.fwid = fw.fwid
                            and fw.djdwdm = v_org_code
                            and fw.sssq = v_sqdm);
  commit;
  --更新寄住人口
  update t_lsgl_rk_jzrkxx jk
   set jk.djdwdm = v_org_code,
         jk.djdwmc = v_org_name,
         jk.zrdwdm = v_org_code,
         jk.zrdwmc = v_org_name,
        jk.czdwdm = v_org_code,
         jk.czdwmc = v_org_name,
         jk.sssqbh = v_sqdm
   where jk.rkfwglid in (select gl.rkfwglid
                          from t_lsgl_rkfw_gl gl, t_lsgl_fw_jbxx fw
                         where gl.fwid = fw.fwid
                          and fw.djdwdm = v_org_code
                         and fw.sssq = v_sqdm);
  commit;

  --更新未落户人口
  update t_lsgl_rk_wlhczhk wk
     set wk.djdwdm = v_org_code,
         wk.djdwmc = v_org_name,
         wk.zrdwdm = v_org_code,
         wk.zrdwmc = v_org_name,
         wk.czdwdm = v_org_code,
         wk.czdwmc = v_org_name,
         wk.sssqbh = v_sqdm
   where wk.rkfwglid in (select gl.rkfwglid
                           from t_lsgl_rkfw_gl gl, t_lsgl_fw_jbxx fw
                          where gl.fwid = fw.fwid
                            and fw.djdwdm = v_org_code
                            and fw.sssq = v_sqdm);
  commit;

  --更新单位信息
  update t_za_jg_jbxx dw
     set dw.djdwdm    = v_org_code,
         dw.djdwmc    = v_org_name,
         dw.ZRDWPCSDM = v_org_code,
         dw.ZRDWPCSMC = v_org_name,
         dw.czdwdm    = v_org_code,
         dw.czdwmc    = v_org_name,
         dw.sssqdm    = v_sqdm
   where dw.jgbh in
         (select gl.jgbh
            from t_lsgl_dwfw_gl gl
           where gl.dzid in
                 (select dz.dzid from t_common_dzxx dz where dz.sqdm = v_sqdm));
  commit;

  --更新从业人员
  update t_za_ry_cyry cy
     set cy.djdwdm = v_org_code,
         cy.djdwmc = v_org_name,
         cy.czdwdm = v_org_code,
         cy.czdwmc = v_org_name
   where cy.jgbh in
         (select gl.jgbh
            from t_lsgl_dwfw_gl gl
            where gl.dzid in
                 (select dz.dzid from t_common_dzxx dz where dz.sqdm = v_sqdm));
  commit;

  --更新重点人员
  update t_zdry_gzdx zt set zt.DJDWMC = v_org_name ,zt.DJDWDM = v_org_code,
  SSZRDWDM = v_org_code , SSZRDWMC = v_org_name  where zt.SSXZSQ=v_sqdm;
  --更新重点人员托管信息
  update T_ZDRY_WTXX wt set wt.jgdwmc = v_org_name ,wt.jgdwdm = v_org_code where wt.XZSQDM=v_sqdm;
  commit;
END;
/