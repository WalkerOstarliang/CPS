create or replace function f_get_rylb(sfzh varchar2, fwid varchar2)
return varchar2
--sfzh：身份证号
--fwid：房屋ID
as
       v_rylb     varchar2(2);
       v_sfzh    varchar2(18);
       v_fwid    varchar2(30);
       v_hjdqh   varchar2(6);
       v_SSPCSDM varchar2(12);
       v_sszrdwdm varchar2(12);
       v_xzdqh   varchar2(6);
       v_rycount number;
begin
       v_sfzh:=sfzh;
       v_fwid:=fwid;

       --查找是否存在常住人口信息
       select count(1) into v_rycount from T_LSGL_RK_CZRK where sfzh=v_sfzh and RYZT<>'1' and (ZXBS='0' or zxbs is null);
       if v_rycount > 0 then
           --户籍地信息
           select SSPCSDM into v_SSPCSDM from T_LSGL_RK_CZRK where sfzh=v_sfzh and (ZXBS='0' or zxbs is null) and rownum=1;

           --现住地信息区划，派出所代码
           select SSZRDWDM into v_sszrdwdm from t_lsgl_fw_jbxx where fwid=v_fwid;

           if v_SSPCSDM is not null then
             --常口 在本派出所内
             if substr(v_SSPCSDM,1,8) = substr(v_sszrdwdm,1,8) then
                v_rylb := '1';
              --寄住人口 本市内人员
             elsif substr(v_SSPCSDM,1,4)=substr(v_sszrdwdm,1,4) then
                v_rylb := '5';
             --流动人口 跨设市区
             elsif substr(v_SSPCSDM,1,4) <> substr(v_sszrdwdm,1,4) then
                v_rylb := '2';
             else
                 v_rylb := '2';
             end if;
           else
             --流动人口
             v_rylb := '2';
           end if;
       --流动人口
       else
           v_rylb := '2';
       end if;
       return v_rylb;
end;
/