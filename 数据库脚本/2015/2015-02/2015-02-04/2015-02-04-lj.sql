-- 先检查数据库上是否已经有该函数了，如果没有再新增，长沙数据库上都已经有了，外地部署，需要增加。
create or replace function f_getdzid_by_rybh(v_rybh varchar2)
  return varchar2
-- 根据人员编号返回地址ID（dzid）
 as
  v_dzid    varchar2(20); --返回的地址id
  v_ckdjsj  date; --常口登记时间
  v_jkdjsj  date; --寄口登记时间
  v_lkdjsj  date; --流口登记时间
  v_wlhdjsj date; --未落户登记时间
begin

  select max(ck.djsj)
    into v_ckdjsj
    from t_lsgl_rk_czrk ck
   where ck.rybh = v_rybh
     and ck.djsj = (select max(czrk.djsj)
                      from t_lsgl_rk_czrk czrk
                     where czrk.rybh = v_rybh);

  select max(jz.djsj)
    into v_jkdjsj
    from t_lsgl_rk_jzrkxx jz
   where jz.rybh = v_rybh
     and jz.djsj = (select max(jzrk.djsj)
                      from t_lsgl_rk_jzrkxx jzrk
                     where jzrk.rybh = v_rybh);

  select max(lk.djsj)
    into v_lkdjsj
    from t_lsgl_rk_ldrkzzxx lk
   where lk.rybh = v_rybh
     and lk.djsj = (select max(ldrk.djsj)
                      from t_lsgl_rk_ldrkzzxx ldrk
                     where ldrk.rybh = v_rybh);

  select max(wlh.djsj)
    into v_wlhdjsj
    from t_lsgl_rk_wlhczhk wlh
   where wlh.rybh = v_rybh
     and wlh.djsj = (select max(wlhrk.djsj)
                       from t_lsgl_rk_wlhczhk wlhrk
                      where wlhrk.rybh = v_rybh);
  -- v_ckdjsj  v_jkdjsj  v_lkdjsj   v_wlhdjsj
  if v_ckdjsj is null then 
     select to_date('19000101000000','yyyymmddhh24miss') into v_ckdjsj from dual;
  end if;  
   if v_jkdjsj is null then 
     select to_date('19000101000000','yyyymmddhh24miss') into v_jkdjsj from dual;
  end if;  
   if v_lkdjsj is null then 
     select to_date('19000101000000','yyyymmddhh24miss') into v_lkdjsj from dual;
  end if;  
   if v_wlhdjsj is null then 
     select to_date('19000101000000','yyyymmddhh24miss') into v_wlhdjsj from dual;
  end if;    
  
  if v_ckdjsj = v_jkdjsj and v_ckdjsj = v_lkdjsj and v_ckdjsj = v_wlhdjsj then
     v_dzid := '';
  end if;
                  
  -- 1. v_ckdjsj
  if v_ckdjsj is not null  and v_ckdjsj > v_jkdjsj and v_ckdjsj > v_lkdjsj and
     v_ckdjsj > v_wlhdjsj then
    begin
      select max(gl.dzid)
        into v_dzid
        from t_lsgl_rkfw_gl gl
       where gl.rkfwglid = (select max(rkfwglid)
                              from t_lsgl_rk_czrk v_ck
                             where v_ck.rybh = v_rybh
                               and v_ck.djsj = v_ckdjsj);
    end;
  end if;
  -- 2. v_jkdjsj
  if v_jkdjsj is not null  and v_jkdjsj > v_ckdjsj and v_jkdjsj > v_lkdjsj and
     v_jkdjsj > v_wlhdjsj then
    begin
      select max(gl.dzid)
        into v_dzid
        from t_lsgl_rkfw_gl gl
       where gl.rkfwglid = (select max(rkfwglid)
                              from t_lsgl_rk_jzrkxx v_jk
                             where v_jk.rybh = v_rybh
                               and v_jk.djsj = v_jkdjsj);
    end;
  end if;
   -- 3. v_lkdjsj
  if v_lkdjsj is not null  and v_lkdjsj > v_ckdjsj and v_lkdjsj > v_jkdjsj and
     v_lkdjsj > v_wlhdjsj then
    begin
      select max(gl.dzid)
        into v_dzid
        from t_lsgl_rkfw_gl gl
       where gl.rkfwglid = (select max(rkfwglid)
                              from t_lsgl_rk_ldrkzzxx v_lk
                             where v_lk.rybh = v_rybh
                               and v_lk.djsj = v_lkdjsj);
    end;
  end if;
   -- 4. v_wlhdjsj
  if v_wlhdjsj is not null and v_wlhdjsj > v_ckdjsj and v_wlhdjsj > v_jkdjsj and
     v_wlhdjsj > v_lkdjsj then
    begin
      select max(gl.dzid)
        into v_dzid
        from t_lsgl_rkfw_gl gl
       where gl.rkfwglid = (select max(rkfwglid)
                              from t_lsgl_rk_wlhczhk v_wlh
                             where v_wlh.rybh = v_rybh
                               and v_wlh.djsj = v_wlhdjsj);
    end;
  end if;
 if v_dzid is null then
     return '';
 end if;
  return v_dzid;
end;
/