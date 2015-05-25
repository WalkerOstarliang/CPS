create or replace function f_get_czfwzxbsms(fwid varchar2) return varchar2
--获取该房屋的出租屋信息的有效状态描述
 as
  v_fwid       varchar2(100);
  v_czfwzxbs   varchar2(1);
  v_czfwzxbsms varchar2(10);
begin
  v_fwid := fwid;
  v_czfwzxbs:=null;
  select max(nvl(fwzt,'0'))
    into v_czfwzxbs
    from t_lsgl_czfw_jbxx
   where fwbh = v_fwid
     and djsj =
         (select max(djsj) from t_lsgl_czfw_jbxx where fwbh = v_fwid)
     and djsj is not null;

  v_czfwzxbsms := '正常';
  if v_czfwzxbs = '0' or v_czfwzxbs is null then
    v_czfwzxbsms := '正常';
  end if;
  if v_czfwzxbs = '1' then
    v_czfwzxbsms := '注销';
  end if;
  return v_czfwzxbsms;
end;

/