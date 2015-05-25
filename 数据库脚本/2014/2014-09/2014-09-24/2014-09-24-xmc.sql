create or replace function f_get_stbm(v_sqdm  varchar2,
                                      v_jlxdm varchar2,
                                      v_xqmc  varchar2) return varchar2 as
  v_stbm varchar2(24);
  t_max_stbm_jlx varchar2(5);
  t_max_stbm_xqbh varchar2(5);
  t_max_stbm_lsh varchar2(6);
begin
  --前提,调用此方法之前可以肯定是不存在相同的实体数据
  --4:实体(地址)编码共30位,由"D"+行政区划(6位)+乡镇(3位)+所属社区(3位)+街路巷/小区(5位,
  --最左边第一位标识是街路巷还是小区) +6位流水

  --12位社区代码430382100001 + 5位街路巷小区代码00001 + 6位流水号000001
  --街路巷代码不为空
  if v_jlxdm is not null then
    --存在街路巷代码,  如果在同一社区下存在相同名称的街路巷那么针对实体只接使用最大流水号加1,如果不存在相同街路巷,则本街路从10001开始,实体流水从000001开始.
    --如果存在相同的街路巷,则找出相同的.

    --获取5位街路巷代码
    select lpad(nvl(max(to_number(substr(a.stbm, 14, 5))),0),5,'0') into t_max_stbm_jlx
    from t_common_stxx a
    where sqdm = v_sqdm and jlxdm=v_jlxdm;

    --不存在街路巷对应编码
    if t_max_stbm_jlx='00000' then
       select lpad(nvl(max(to_number(substr(a.stbm, 14, 5))),1) + 1,5,'0') into t_max_stbm_jlx
       from t_common_stxx a
       where sqdm = v_sqdm;
    end if;

    --获取最大流水号
    select lpad(nvl(max(to_number((substr(a.stbm, 19, 6)))),1) + 1,6,'0') into t_max_stbm_lsh
    from t_common_stxx a
    where stbm like  'D'||v_sqdm||t_max_stbm_jlx||'%' ;-- sqdm = v_sqdm  and jlxdm=v_jlxdm;

    v_stbm:=v_sqdm ||t_max_stbm_jlx||t_max_stbm_lsh;

  else
      --不存在街路项代码,
      --如果在同一社区下存在相同名称的小区那么针对实体只接使用最大流水号加1,
      --如果不存在相同小区,则小区本身要取最大流水号+1
      --如果存在相同的小区名,则找出相同的.

      --获取5位小区编号
      select to_char(nvl(max(to_number(substr(a.stbm, 14, 5))),'10000')) into t_max_stbm_xqbh
      from t_common_stxx a
      where sqdm = v_sqdm and xqz=v_xqmc;

      --不存在小区，
      if t_max_stbm_xqbh='10000' then
            select to_char(nvl(max(to_number(substr(a.stbm, 14, 5))),10000) + 1) into t_max_stbm_xqbh
            from t_common_stxx a
            where sqdm = v_sqdm;
      end if;

      --获取最大流水号
     select lpad(nvl(max(to_number(substr(a.stbm, 19, 6))),0) + 1,6,'0') into t_max_stbm_lsh
     from t_common_stxx a
     where stbm like  'D'||v_sqdm||t_max_stbm_xqbh||'%' ; --sqdm = v_sqdm and xqz=v_xqmc;
     v_stbm:=v_sqdm||t_max_stbm_xqbh||t_max_stbm_lsh;
  end if;
  return 'D' || v_stbm;
end;
/
