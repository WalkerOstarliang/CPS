create or replace function f_get_jlxdm(v_xzqh varchar2)
return varchar2
--bslx :标识位，0表示街巷名，1表示小区名
--v_xzqh 6位行政区划
as
       v_jlxdm    varchar2(17);
begin
      -- v_bslx:='0'--前台只进行街路巷的新增
       select substr(v_xzqh,1,4)||lpad(to_number(nvl(max(substr(a.dm,5,8)),'00000000')) +1,8,'0') into v_jlxdm
       from t_common_dzjlx a
       where a.dm like substr(v_xzqh,0,4)||'%';
       return v_jlxdm;
end;
/
create or replace function f_get_stbm(v_sqdm varchar2,v_jlxdm varchar2,v_xqmc varchar2)
return varchar2
as
       v_stbm     varchar2(24);
begin
       --前提,调用此方法之前可以肯定是不存在相同的实体数据
       --4:实体(地址)编码共30位,由"D"+行政区划(6位)+乡镇(3位)+所属社区(3位)+街路巷/小区(5位,最左边第一位标识是街路巷还是小区) +6位流水

       --

       if v_jlxdm is not null then
        --存在街路巷代码,  如果在同一社区下存在相同名称的街路巷那么针对实体只接使用最大流水号加1,如果不存在相同街路巷,则本街路从10001开始,实体流水从000001开始.
        
                      
            select nvl( (
               select  substr(a.stbm,1,17)||lpad(to_number((substr(a.stbm,18,6)))+1,6,'0')
                        from t_common_stxx  a
              where  stbm like v_sqdm||'%'  and a.jlxdm = v_jlxdm )
           ,substr(v_sqdm,1,12)||'10001000001' ) into v_stbm from dual ;           
       else
          --不存在街路项代码,如果在同一社区下存在相同名称的小区那么针对实体只接使用最大流水号加1,如果不存在相同小区,则小区本身要取最大流水号+1
          select nvl( (
               select  substr(a.stbm,1,17)||lpad(to_number((substr(a.stbm,18,6)))+1,6,'0')
                        from t_common_stxx  a
              where  stbm like v_sqdm||'%'  and a.XQZ = v_xqmc )
           ,substr(v_sqdm,1,12)||'00001000001' ) into v_stbm from dual ;

       end if;
       return 'D'||v_stbm;
end;
/
 
create or replace function f_get_dzbm(v_stid varchar2) 
return varchar2
--获取地址信息
as
       v_stbm     varchar2(24);              --实体编码
       v_dzbm     varchar2(30);              --地址编码
begin
       --找到对应的实体编号
       select stbm into v_stbm 
       from t_common_stxx 
       where id=v_stid;
       
       --找到最大的地址编号
       select v_stbm||lpad(to_number(nvl(max(to_number(substr(dzbm,25,6))),0)) + 1,6,'0') into v_dzbm
       from t_common_dzxx t 
       where t.stid=v_stid;
       return v_dzbm;
end;
/
