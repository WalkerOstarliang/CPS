CREATE OR REPLACE FUNCTION F_GET_CZRKNUMBER(V_ORGCODE VARCHAR2,V_LEVE VARCHAR2)
RETURN NUMBER
--参数 V_ORGCODE 用户机构代码  LEVE : 1：省级用户 2：市级用户 3：县级用户 4：派出所用户  5：社区民警
--获取常驻人口数量
AS
     V_NUMBER  NUMBER;
     V_LV      NUMBER;
BEGIN
       V_LV:=TO_NUMBER(V_LEVE);
       V_NUMBER:=0;
       IF V_LV=1 THEN
         SELECT COUNT(1) INTO V_NUMBER FROM T_LSGL_RK_CZRK;
       ELSIF V_LEVE>1 AND V_LV<5 THEN
           SELECT COUNT(1) INTO V_NUMBER
           FROM T_LSGL_RK_CZRK 
           WHERE DJDWDM LIKE SUBSTR(V_ORGCODE,1,2*V_LV)||'%' 
                 AND (ZXBS='0' OR ZXBS IS NULL);
       ELSE
           SELECT COUNT(1) INTO  V_NUMBER
           FROM T_LSGL_RK_CZRK 
           WHERE DJDWDM=V_ORGCODE 
                 AND (ZXBS='0' OR ZXBS IS NULL);
       END IF;   
       RETURN V_NUMBER;
END;
/
CREATE OR REPLACE FUNCTION F_GET_LDRKNUMBER(V_ORGCODE VARCHAR2,V_LEVE VARCHAR2)
RETURN NUMBER
--参数 V_ORGCODE 用户机构代码  LEVE : 1：省级用户 2：市级用户 3：县级用户 4：派出所用户  5：社区民警
--获取流动人口数量
AS
     V_NUMBER  NUMBER;
     V_LV      NUMBER;
BEGIN
       V_LV:=TO_NUMBER(V_LEVE);
       V_NUMBER:=0;
       
       IF V_LV=1 THEN
          SELECT COUNT(1) INTO V_NUMBER FROM T_LSGL_RK_LDRKZZXX;
       ELSIF V_LV>1 AND V_LV<5 THEN
          SELECT COUNT(1) INTO V_NUMBER 
          FROM T_LSGL_RK_LDRKZZXX 
          WHERE DJDWDM LIKE SUBSTR(V_ORGCODE,1,2*V_LV)||'%' 
                AND (ZXBS='0' OR ZXBS IS NULL);
       ELSE
          SELECT COUNT(1) INTO V_NUMBER
          FROM T_LSGL_RK_LDRKZZXX 
          WHERE ZRDWDM=V_ORGCODE 
                AND (ZXBS='0' OR ZXBS IS NULL);
       END IF;
        
       RETURN V_NUMBER;
END;
/

CREATE OR REPLACE FUNCTION F_GET_CZFWNUMBER(V_ORGCODE VARCHAR2,V_LEVE VARCHAR2)
RETURN NUMBER
--参数 V_ORGCODE 用户机构代码  LEVE : 1：省级用户 2：市级用户 3：县级用户 4：派出所用户  5：社区民警
--获取出租房屋数量
AS
     V_NUMBER  NUMBER;
     V_LV      NUMBER;
BEGIN
       V_LV:=TO_NUMBER(V_LEVE);
       V_NUMBER:=0;
       IF V_LV=1 THEN
          SELECT COUNT(1) INTO V_NUMBER 
          FROM T_LSGL_FW_JBXX 
          WHERE SFCZW='1';
       ELSIF V_LV>1 AND V_LV<5 THEN
           SELECT COUNT(1) INTO V_NUMBER 
           FROM T_LSGL_FW_JBXX 
           WHERE DJDWDM like SUBSTR(V_ORGCODE,1,2*V_LV)||'%' 
                 AND SFCZW='1' 
                 AND (ZXBS='0' OR ZXBS IS NULL );
       ELSE
          SELECT COUNT(1) INTO V_NUMBER 
          FROM T_LSGL_FW_JBXX 
          WHERE SSZRDWDM=V_ORGCODE 
                AND SFCZW='1' 
                AND (ZXBS='0' OR ZXBS IS NULL );
       END IF;
       RETURN V_NUMBER;
END;
/
CREATE OR REPLACE PROCEDURE P_update_data_to_gajg_bystid(v_stid varchar2,
                                                         v_sqdm varchar2)
--辖区情况统计过程
 AS
  v_org_code varchar2(12);
  v_org_name varchar2(120);
BEGIN

  --查询单位信息
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
         st.jdxzdm = (select dm
                        from t_common_hnxzqh
                       where dm = substr(v_sqdm, 0, 9) || '000'),
         st.jdxzmc = (select jc
                        from t_common_hnxzqh
                       where dm = substr(v_sqdm, 0, 9) || '000'),
         st.sqmc   = (select jc from t_common_hnxzqh dm where dm.dm = sqdm),
         st.gxsj=sysdate,
         st.czsj=sysdate 
   where id = v_stid;
  commit;

  --更新实体下面的地址

  update t_common_dzxx dz
     set dz.djrdwdm = v_org_code, 
         dz.djrdwmc = v_org_name, 
         dz.sqdm = v_sqdm,
         dz.GXSJ=sysdate
   where dz.stid = v_stid;
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
         fw.sspcsdm  = substr(v_org_code, 0, 8) || '0000',
         fw.sspcsmc  = (select orgname
                          from v_common_organization
                         where orgcode = substr(v_org_code, 0, 8) || '0000'
                           and isyx = '1'
                           and rownum = 1),
         fw.czsj=sysdate
   where fw.dzid in (select dzid from t_common_dzxx dz where stid = v_stid);
  commit;

  --更新出租房
  update t_lsgl_czfw_jbxx cz
     set cz.djdwdm = v_org_code, 
         cz.djdwmc = v_org_name,
         cz.czsj=sysdate
   where cz.fwbh in
         (select fwid
            from t_lsgl_fw_jbxx fw
           where fw.dzid in
                 (select dzid from t_common_dzxx dz where stid = v_stid));
  commit;

  --更新常住人口
  update t_lsgl_rk_czrk ck
    set ck.djdwdm   = v_org_code,
         ck.djdwmc   = v_org_name,
         ck.zrdwdm   = v_org_code,
         ck.zrdwmc   = v_org_name,
         ck.czdwdm   = v_org_code,
         ck.czdwmc   = v_org_name,
         ck.hjsssqbh = v_sqdm,
         ck.czsj=sysdate
   where ck.rkfwglid in
       (select gl.rkfwglid
            from t_lsgl_rkfw_gl gl, t_lsgl_fw_jbxx fw
          where gl.fwid = fw.fwid
            and gl.DZID in
                 (select dzid from t_common_dzxx dz where stid = v_stid));
  commit;

  --更新流动人口
  update t_lsgl_rk_ldrkzzxx lk
     set lk.djdwdm = v_org_code,
         lk.djdwmc = v_org_name,
         lk.zrdwdm = v_org_code,
         lk.zrdwmc = v_org_name,
         lk.czdwdm = v_org_code,
         lk.czdwmc = v_org_name,
         lk.sssqbh = v_sqdm,
         lk.czsj=sysdate
   where lk.rkfwglid in
         (select gl.rkfwglid
            from t_lsgl_rkfw_gl gl, t_lsgl_fw_jbxx fw
           where gl.fwid = fw.fwid
             and gl.DZID in
                 (select dzid from t_common_dzxx dz where stid = v_stid));
  commit;
  --更新寄住人口
  update t_lsgl_rk_jzrkxx jk
     set jk.djdwdm = v_org_code,
         jk.djdwmc = v_org_name,
         jk.zrdwdm = v_org_code,
         jk.zrdwmc = v_org_name,
         jk.czdwdm = v_org_code,
         jk.czdwmc = v_org_name,
         jk.sssqbh = v_sqdm,
         jk.czsj=sysdate
   where jk.rkfwglid in
         (select gl.rkfwglid
            from t_lsgl_rkfw_gl gl, t_lsgl_fw_jbxx fw
           where gl.fwid = fw.fwid
             and gl.DZID in
                 (select dzid from t_common_dzxx dz where stid = v_stid));
  commit;

  --更新未落户人口
  update t_lsgl_rk_wlhczhk wk
     set wk.djdwdm = v_org_code,
         wk.djdwmc = v_org_name,
         wk.zrdwdm = v_org_code,
         wk.zrdwmc = v_org_name,
         wk.czdwdm = v_org_code,
         wk.czdwmc = v_org_name,
         wk.sssqbh = v_sqdm,
         wk.czsj=sysdate
   where wk.rkfwglid in
         (select gl.rkfwglid
            from t_lsgl_rkfw_gl gl, t_lsgl_fw_jbxx fw
           where gl.fwid = fw.fwid
             and gl.DZID in
                 (select dzid from t_common_dzxx dz where stid = v_stid));
  commit;

  --更新单位信息
  update t_za_jg_jbxx dw
     set dw.djdwdm    = v_org_code,
         dw.djdwmc    = v_org_name,
         dw.ZRDWPCSDM = v_org_code,
         dw.ZRDWPCSMC = v_org_name,
         dw.czdwdm    = v_org_code,
         dw.czdwmc    = v_org_name,
         dw.sssqdm    = v_sqdm,
         dw.czsj=sysdate
   where jgbh in
         (select gl.jgbh
            from t_lsgl_dwfw_gl gl
           where gl.dzid in
                 (select dzid from t_common_dzxx dz where stid = v_stid));
  commit;

  --更新从业人员
  update t_za_ry_cyry cy
     set cy.djdwdm = v_org_code,
         cy.djdwmc = v_org_name,
         cy.czdwdm = v_org_code,
         cy.czdwmc = v_org_name,
         cy.czsj=sysdate
   where cy.jgbh in
         (select gl.jgbh
            from t_lsgl_dwfw_gl gl
           where gl.dzid in
                 (select dzid from t_common_dzxx dz where stid = v_stid));
  commit;
END;
/

