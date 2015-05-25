--人员视图
CREATE OR REPLACE VIEW V_LSGL_RK_JBXX AS
SELECT "RYBH","XM","XMPY","SFZH","XB","GJ","MZ","CSRQ","BMCH","BYZK","YWM","WHCD","ZJZL","ZJHM",
"ZZMM","HYZK","SG","XX","ZZXY","ZC","LXDH","FWCS","ZYDM","ZW","SF","JG","RYSX","RYLB","HJDQH","HJDXZ","QTZZSSXQ",
"QTZZXZ","ZZSSXQ","ZZXZ","SSGAJGJGDM","SSGAJGJGMC","SSPCSDM","SSPCSMC","ZRDWDM","ZRDWMC","ZRMJXM","RN",zrdwdm1,zrdwdm2,zrdwdm3,zrdwdm4
FROM (
SELECT JBXX.RYBH,
       JBXX.XM,
       JBXX.XMPY,
       JBXX.SFZH,
       JBXX.XB,
       JBXX.GJ,
       JBXX.MZ,
       TO_CHAR(JBXX.CSRQ,'YYYY-MM-DD') AS CSRQ,
       JBXX.BMCH,
       JBXX.BYZK,
       JBXX.YWM,
       JBXX.WHCD,
       JBXX.ZJZL,
       JBXX.ZJHM,
       JBXX.ZZMM,
       JBXX.HYZK,
       JBXX.SG,
       JBXX.XX,
       JBXX.ZZXY,
       JBXX.ZC,
       JBXX.LXDH,
       JBXX.FWCS,
       JBXX.ZYDM,
       JBXX.ZW,
       JBXX.SF,
       JBXX.JG,
       JBXX.RYSX,
       JBXX.RYLB,
       CZRK.HJDQH,
       CZRK.HJDXZ,
       CZRK.QTZZSSXQ,
       CZRK.QTZZXZ,
       CZRK.ZZSSXQ,
       CZRK.ZZXZ,
       CZRK.SSGAJGJGDM,
       CZRK.SSGAJGJGMC,
       CZRK.SSPCSDM,
       CZRK.SSPCSMC,
       CZRK.ZRDWDM,
       CZRK.ZRDWMC,
       CZRK.ZRMJXM,
       ldrk.zrdwdm as zrdwdm1,
       jwrk.zrdwdm as zrdwdm2,
       jzrk.zrdwdm as zrdwdm3,
       wlhrk.zrdwdm as zrdwdm4,
       ROW_NUMBER() OVER(PARTITION BY JBXX.RYBH ORDER BY DJSJ DESC) AS RN
  FROM T_LSGL_RK_JBXX JBXX
  LEFT JOIN T_LSGL_RK_CZRK CZRK ON JBXX.RYBH=CZRK.RYBH
  left join t_lsgl_rk_ldrkzzxx ldrk on ldrk.rybh = jbxx.rybh
  left join t_lsgl_rk_jwrkxx jwrk on jwrk.rybh = jbxx.rybh
  left join t_lsgl_rk_jzrkxx jzrk on jzrk.rybh = jbxx.rybh
  left join t_lsgl_rk_wlhczhk wlhrk on wlhrk.rybh = jbxx.rybh
  WHERE CZRK.ZXBS <> '1' OR CZRK.ZXBS IS NULL
  )
  WHERE RN=1;

  
 --统计报表
 create or replace type dwtj as object

(
     name varchar2(200) , --单位名称
     code varchar2(20),  -- 单位代码
     zs number,    --单位总数
     tzhy number,  --特种行业数
     ggcs number,  -- 公共场所
     qsydw number,   --企事业单位
     wxwpdw number, --危险物品单位
     swfwcs number, --上网服务场所
     swdw number --涉外单位

);

create or replace type pcsjl as object
(
       code varchar2(20),          --单位代码
       name varchar2(200),         --单位名称
       pcss number,                --派出所数量
       mjs number                  --民警数
);

create or replace type rwpf as object(
--任务派发
      code varchar2(20),    --单位代码
      name varchar2(200),   --单位名称
      zs number,            --总数
      yqs number,   --已签收
      wqs number,  --未签收
      yfk number,  --已反馈
      wfk number,  -- 未反馈
      ywc number, -- 已完成
      wwc number --未完成
);
create or replace type sjcj as object(
--数据采集
      code varchar2(20),  --单位代码
      name varchar2(200),  -- 单位名称
       czrk number,            --常住人口
       ldrk number,         --流动人口
       jwrk number,         --境外人口
       wlhrk  number,        --未落户人口
       jzrk number,        --寄住人口
       dz number,         --地址
       dw number,          --单位
       cyry number,          --从业人员
       fw number,             --房屋
       czw number            --出租屋

);
create or replace type xld as object
(
--巡逻队
  code  varchar2(20), --单位代码
  name  varchar2(200), -- 单位名称
  zs    number, --总数
  zzxld number, --专职巡逻队
  ywxld number, --义务巡逻队
  dys   number --队员数

)
;

create or replace type zdry as object
(
--重点人员
  code varchar2(20), --单位代码
  name varchar2(200), -- 单位名称
  zs   number, --总数
  zdry number, --重点人员
  jzdx number, --矫正对象
  gzdx number, --工作对象
  jsbr number, --精神病人
  swry number, --涉稳人员
  xdry number  --吸毒人员
)
;

create or replace type zdrytj as object
(
--重点人员
  code varchar2(20), --单位代码
  name varchar2(200), -- 单位名称
  zs   number, --总数
  zdry number, --重点人员
  jzdx number, --矫正对象
  gzdx number, --工作对象
  jsbr number, --精神病人
  swry number, --涉稳人员
  xdry number  --吸毒人员
);

create or replace type tab_dwtj is table of dwtj;

create or replace type tab_pcsjl is table of pcsjl;

create or replace type tab_rwpf is table of rwpf;

create or replace type tab_sjcj is table of sjcj;

create or replace type tab_xld is table of xld;

create or replace type tab_zdry is table of zdrytj;


 
 create or replace function f_get_xldnumberbylx(v_code varchar2,v_lx varchar2,v_lv number)
-- v_code:登陆用户的单位代码 v_lv:用户级别 1:省厅 2：市级 3：区县级 4：派出所级 5:社区民警级
return number
as
xlds number;
begin
     xlds := 0;
     if v_lv=1 then
        select count(1) into xlds from t_af_xldxx xld where xld.ssdwdm like substr(v_code,1,2)||'%' and xld.xldlx = v_lx  and (xld.cxbs = '1' or xld.cxbs is null);
     elsif v_lv = 2 then
        select count(1) into xlds from t_af_xldxx xld where xld.ssdwdm like substr(v_code,1,4)||'%' and xld.xldlx = v_lx  and (xld.cxbs = '1' or xld.cxbs is null);
     elsif v_lv = 3 then
           select count(1) into xlds from t_af_xldxx xld where xld.ssdwdm like substr(v_code,1,6)||'%' and xld.xldlx = v_lx  and (xld.cxbs = '1' or xld.cxbs is null);
     elsif v_lv = 4 then
            select count(1) into xlds from t_af_xldxx xld where xld.ssdwdm like substr(v_code,1,8)||'%' and xld.xldlx = v_lx  and (xld.cxbs = '1' or xld.cxbs is null);
     elsif v_lv = 5 then
           select count(1) into xlds  from t_af_xldxx xld where xld.ssdwdm = v_code and xld.xldlx = v_lx  and (xld.cxbs = '1' or xld.cxbs is null);
     end if;
     return xlds;
end;

create or replace function f_get_xldynumber(v_code varchar2,v_lv number)
-- v_code:登陆用户的单位代码 v_lv:用户级别 1:省厅 2：市级 3：区县级 4：派出所级 5:社区民警级
return number
as
xldys number;
begin
     xldys := 0;
     if v_lv=1 then
        select count(1) into xldys from t_af_xldyxx dy,t_af_xldxx xld where xld.xldbh = dy.xldbh and (xld.cxbs = 1 or xld.cxbs is null) and (dy.zgzt = '1'or dy.zgzt is null) and  xld.ssdwdm like substr(v_code,1,2)||'%';
     elsif v_lv = 2 then
        select count(1) into xldys from t_af_xldyxx dy,t_af_xldxx xld where xld.xldbh = dy.xldbh and (xld.cxbs = 1 or xld.cxbs is null) and (dy.zgzt = '1'or dy.zgzt is null) and  xld.ssdwdm like substr(v_code,1,4)||'%';
     elsif v_lv = 3 then
        select count(1) into xldys from t_af_xldyxx dy,t_af_xldxx xld where xld.xldbh = dy.xldbh and (xld.cxbs = 1 or xld.cxbs is null) and (dy.zgzt = '1'or dy.zgzt is null) and  xld.ssdwdm like substr(v_code,1,6)||'%';
     elsif v_lv = 4 then
        select count(1) into xldys from t_af_xldyxx dy,t_af_xldxx xld where xld.xldbh = dy.xldbh and (xld.cxbs = 1 or xld.cxbs is null) and (dy.zgzt = '1'or dy.zgzt is null) and  xld.ssdwdm like substr(v_code,1,8)||'%';
     elsif v_lv = 5 then
        select count(1) into xldys from t_af_xldyxx dy,t_af_xldxx xld where xld.xldbh = dy.xldbh and (xld.cxbs = 1 or xld.cxbs is null) and (dy.zgzt = '1'or dy.zgzt is null) and  xld.ssdwdm = v_code;
     end if;
     return xldys;
end;

create or replace function f_get_rwnumberbyfkzt(v_code varchar2,v_fkzt varchar2,v_lv number)
return number
as
rws number;
begin
rws := 0;
if v_lv = 1 then
   select count(1) into rws from t_gzgl_rwpfxx where czbz !='3' and rwfkzt = v_fkzt and djdwdm like substr(v_code,1,2)||'%';
elsif v_lv = 2 then
      select count(1) into rws from t_gzgl_rwpfxx where czbz !='3' and rwfkzt = v_fkzt and djdwdm like substr(v_code,1,4)||'%';
elsif v_lv = 3 then
      select count(1) into rws from t_gzgl_rwpfxx where czbz !='3' and rwfkzt = v_fkzt and djdwdm like substr(v_code,1,6)||'%';
elsif v_lv = 4 then
      select count(1) into rws from t_gzgl_rwpfxx where czbz !='3' and rwfkzt = v_fkzt and djdwdm like substr(v_code,1,8)||'%';
elsif v_lv = 5 then
      select count(1) into rws from t_gzgl_rwpfxx where czbz !='3' and rwfkzt = v_fkzt and djdwdm like  substr(v_code,1,10)||'%';
end if;
return rws;
end;

create or replace function 
 f_get_rwnumberbyqszt(v_code varchar2, v_qszt varchar2, v_lv number)
 return number as rws number;
begin
  rws := 0;
  if v_lv = 1 then
     select count(1) into rws from t_gzgl_rwpfxx rw where rw.czbz !='3' and rw.sfqs = v_qszt and rw.djdwdm like substr(v_code,1,2)||'%';
  elsif v_lv = 2 then
     select count(1) into rws from t_gzgl_rwpfxx rw where rw.czbz !='3' and rw.sfqs = v_qszt and rw.djdwdm like substr(v_code,1,4)||'%';
  elsif v_lv = 3 then
     select count(1) into rws from t_gzgl_rwpfxx rw where rw.czbz !='3' and rw.sfqs = v_qszt and rw.djdwdm like substr(v_code,1,6)||'%';
  elsif v_lv = 4 then
     select count(1) into rws from t_gzgl_rwpfxx rw where rw.czbz !='3' and rw.sfqs = v_qszt and rw.djdwdm like substr(v_code,1,8)||'%';
  elsif v_lv = 5 then
     select count(1) into rws from t_gzgl_rwpfxx rw where rw.czbz !='3' and rw.sfqs = v_qszt and rw.djdwdm like substr(v_code,1,10)||'%';
  end if;
  return rws;
end;

create or replace function f_get_rwnumberbywcqk(v_code varchar2,

                                                v_wcqk varchar2,
                                                v_lv number)
  return number as rws number;
begin
  rws := 0;
  if v_wcqk = '1' then --完成任务
    if v_lv = 1 then
       select count(1) into rws from t_gzgl_rwpfxx rw where rw.czbz !='3' and rw.rwwcqk = '1' and rw.djdwdm like substr(v_code,1,2)||'%';
    elsif v_lv = 2 then
          select count(1) into rws from t_gzgl_rwpfxx rw where rw.czbz !='3' and rw.rwwcqk = '1' and rw.djdwdm like substr(v_code,1,4)||'%';
    elsif v_lv = 3 then
          select count(1) into rws from t_gzgl_rwpfxx rw where rw.czbz !='3' and rw.rwwcqk = '1' and rw.djdwdm like substr(v_code,1,6)||'%';
    elsif v_lv = 4 then
          select count(1) into rws from t_gzgl_rwpfxx rw where rw.czbz !='3' and rw.rwwcqk = '1' and rw.djdwdm like substr(v_code,1,8)||'%';
    elsif v_lv = 5 then
          select count(1) into rws from t_gzgl_rwpfxx rw where rw.czbz !='3' and rw.rwwcqk = '1' and rw.djdwdm like substr(v_code,1,10)||'%';
    end if;
  else
    if v_lv = 1 then
       select count(1) into rws from t_gzgl_rwpfxx rw where rw.czbz !='3' and rw.rwwcqk != '1' and rw.djdwdm like substr(v_code,1,2)||'%';
    elsif v_lv = 2 then
          select count(1) into rws from t_gzgl_rwpfxx rw where rw.czbz !='3' and rw.rwwcqk != '1' and rw.djdwdm like substr(v_code,1,4)||'%';
    elsif v_lv = 3 then
          select count(1) into rws from t_gzgl_rwpfxx rw where rw.czbz !='3' and rw.rwwcqk != '1' and rw.djdwdm like substr(v_code,1,6)||'%';
    elsif v_lv = 4 then
          select count(1) into rws from t_gzgl_rwpfxx rw where rw.czbz !='3' and rw.rwwcqk != '1' and rw.djdwdm like substr(v_code,1,8)||'%';
    elsif v_lv = 5 then
          select count(1) into rws from t_gzgl_rwpfxx rw where rw.czbz !='3' and rw.rwwcqk != '1' and rw.djdwdm like substr(v_code,1,10)||'%';
    end if;
  end if;
  return rws;
end;

 
 
 
 
 create or replace function f_tjbj_dwtj(v_code varchar2, v_lv varchar2)
--统计报表：单位统计
 return tab_dwtj
  pipelined as
  v dwtj;

  type dw_cur is ref cursor;
  dwcur  dw_cur;
  name   varchar2(200); --单位名称
  code   varchar2(20); -- 单位代码
  zs     number; --单位总数
  tzhy   number; --特种行业数
  ggcs   number; -- 公共场所
  qsydw  number; --企事业单位
  wxwpdw number; --危险物品单位
  swfwcs number; --上网服务场所
  swdw   number; --涉外单位

  sql_str  varchar2(3000);
  sql_str2 varchar2(3000);
  sql_str3 varchar2(3000);
begin
  sql_str  := ' select xzqh.code, ' || 'xzqh.name,' ||
              ' f_get_dwnumber(xzqh.code, xzqh.lv) zs, ' ||
              ' f_get_dwnumberbyhylb(xzqh.code, xzqh.lv, ''01'') tzhy, ' ||
              ' f_get_dwnumberbyhylb(xzqh.code, xzqh.lv, ''02'') ggcs, ' ||
              ' f_get_dwnumberbyhylb(xzqh.code, xzqh.lv, ''03'') qsydw, ' ||
              ' f_get_dwnumberbyhylb(xzqh.code, xzqh.lv,''04'') wxwpdw, ' ||
              ' f_get_dwnumberbyhylb(xzqh.code, xzqh.lv,''05'') swfwcs, ' ||
              ' f_get_dwnumberbyhylb(xzqh.code, xzqh.lv, ''06'') swdw ' ||
              ' from (select org.orgcode code, org.orgjc name, level lv, ispcs ' ||
              ' from v_common_organization org ' ||
              ' connect by prior org.orgid = org.parent_orgid ' ||
              ' start with org.orgcode = ''430000000000'') xzqh ' ||
              'where 1 = 1 ';
  sql_str3 := 'order by xzqh.code';

  if v_lv = '1' then
    sql_str2 := ' and xzqh.code like substr(' || v_code ||
                ',1,2)||''%'' and substr(xzqh.code,3,2)!=''00'' and substr(xzqh.code,5,8)=''00000000'' ';
  elsif v_lv = '2' then
    sql_str2 := 'and xzqh.code like substr(' || v_code ||
                ',1,4)||''%'' and substr(xzqh.code,5,2)!=''00'' and substr(xzqh.code,7,6)=''000000'' ';
  elsif v_lv = '3' then
    sql_str2 := 'and xzqh.code like substr(' || v_code ||
                ',1,6)||''%'' and substr(xzqh.code,7,2)!=''00'' and xzqh.ispcs = ''1''  and substr(xzqh.code,9,4)=''0000'' ';
  elsif v_lv = '4' then
    sql_str2 := 'and xzqh.code like substr(' || v_code ||
                ',1,8)||''%'' and substr(xzqh.code,9,2)=''31'' and substr(xzqh.code,11,2)!=''00'' ';
  end if;

  open dwcur for sql_str || sql_str2 || sql_str3;
  loop
    fetch dwcur
      into code, name, zs, tzhy, ggcs, qsydw, wxwpdw, swfwcs, swdw;
    v := dwtj(name, code, zs, tzhy, ggcs, qsydw, wxwpdw, swfwcs, swdw);
    pipe row(v);
    exit When dwcur%NotFound;
  end loop;
  close dwcur;
  return;
end;
 
 create or replace function f_tjbj_pcsjltj(v_code varchar2, v_lv varchar2)
--统计报表：派出所警力统计
 return tab_pcsjl
  pipelined as
  v pcsjl;

  type pcsjl_cur is ref cursor;
  pcsjlcur pcsjl_cur;
  code     varchar2(20); --单位代码
  name     varchar2(200); --单位名称
  pcss     number; --派出所数量
  mjs      number; --民警数

  sql_str  varchar2(3000);
  sql_str2 varchar2(3000);
  sql_str3 varchar2(3000);
begin
  sql_str  := ' select xzqh.code, ' || 'xzqh.name,' ||
              ' f_get_pcsnumber(xzqh.code,xzqh.lv) pcss, ' ||
              ' f_get_mjsnumber(xzqh.code,xzqh.lv) mjs ' ||
              ' from (select org.orgcode code, org.orgjc name, level lv, ispcs ' ||
              ' from v_common_organization org ' ||
              ' connect by prior org.orgid = org.parent_orgid  ' ||
              ' start with org.orgcode = ''430000000000'') xzqh ' ||
              ' where 1 = 1 ';
  sql_str3 := 'order by xzqh.code';

  if v_lv = '1' then
    sql_str2 := ' and xzqh.code like substr(' || v_code ||
                ',1,2)||''%'' and substr(xzqh.code,3,2)!=''00'' and substr(xzqh.code,5,8)=''00000000'' ';
  elsif v_lv = '2' then
    sql_str2 := 'and xzqh.code like substr(' || v_code ||
                ',1,4)||''%'' and substr(xzqh.code,5,2)!=''00'' and substr(xzqh.code,7,6)=''000000'' ';
  elsif v_lv = '3' then
    sql_str2 := 'and xzqh.code like substr(' || v_code ||
                ',1,6)||''%'' and substr(xzqh.code,7,2)!=''00'' and xzqh.ispcs = ''1''  and substr(xzqh.code,9,4)=''0000'' ';
  elsif v_lv = '4' then
    sql_str2 := 'and xzqh.code like substr(' || v_code ||
                ',1,8)||''%'' and substr(xzqh.code,9,2)=''31'' and substr(xzqh.code,11,2)!=''00'' ';
  end if;

  open pcsjlcur for sql_str || sql_str2 || sql_str3;
  loop
    fetch pcsjlcur
      into code, name, pcss, mjs;
    v := pcsjl(code, name, pcss, mjs);
    pipe row(v);
    exit When pcsjlcur%NotFound;
  end loop;
  close pcsjlcur;
  return;
end;
 
 
 create or replace function f_tjbj_rwpftj(v_code varchar2, v_lv varchar2)
--统计报表：任务完成情况统计
 return tab_rwpf
  pipelined as
  v rwpf;

  type rwpf_cur is ref cursor;
  rwpfcur rwpf_cur;
  code    varchar2(20); --单位代码
  name    varchar2(200); --单位名称
  zs      number; --总数
  yqs     number; --已签收
  wqs     number; --未签收
  yfk     number; --已反馈
  wfk     number; -- 未反馈
  ywc     number; -- 已完成
  wwc     number; --未完成

  sql_str  varchar2(3000);
  sql_str2 varchar2(3000);
  sql_str3 varchar2(3000);
begin
  sql_str  := ' select xzqh.code, ' || ' xzqh.name, ' ||
              ' f_get_rwnumberbyqszt(xzqh.code,''1'',xzqh.lv)+f_get_rwnumberbyqszt(xzqh.code,''0'',xzqh.lv) zs, ' ||
              ' f_get_rwnumberbyqszt(xzqh.code,''1'',xzqh.lv) yqs, ' ||
              ' f_get_rwnumberbyqszt(xzqh.code,''0'',xzqh.lv) wqs, ' ||
              ' f_get_rwnumberbyfkzt(xzqh.code,''1'',xzqh.lv) yfk, ' ||
              ' f_get_rwnumberbyfkzt(xzqh.code,''0'',xzqh.lv) wfk, ' ||
              ' f_get_rwnumberbywcqk(xzqh.code,''1'',xzqh.lv) ywc, ' ||
              ' f_get_rwnumberbywcqk(xzqh.code,''0'',xzqh.lv) wwc  ' ||
              ' from (select org.orgcode code, org.orgjc name, level lv, ispcs ' ||
              ' from v_common_organization org ' ||
              ' connect by prior org.orgid = org.parent_orgid ' ||
              ' start with org.orgcode = ''430000000000'') xzqh ' ||
              ' where 1 = 1 ';
  sql_str3 := 'order by xzqh.code';

  if v_lv = '1' then
    sql_str2 := ' and xzqh.code like substr(' || v_code ||
                ',1,2)||''%'' and substr(xzqh.code,3,2)!=''00'' and substr(xzqh.code,5,8)=''00000000'' ';
  elsif v_lv = '2' then
    sql_str2 := 'and xzqh.code like substr(' || v_code ||
                ',1,4)||''%'' and substr(xzqh.code,5,2)!=''00'' and substr(xzqh.code,7,6)=''000000'' ';
  elsif v_lv = '3' then
    sql_str2 := 'and xzqh.code like substr(' || v_code ||
                ',1,6)||''%'' and substr(xzqh.code,7,2)!=''00'' and xzqh.ispcs = ''1''  and substr(xzqh.code,9,4)=''0000'' ';
  elsif v_lv = '4' then
    sql_str2 := 'and xzqh.code like substr(' || v_code ||
                ',1,8)||''%'' and substr(xzqh.code,9,2)=''31'' and substr(xzqh.code,11,2)!=''00'' ';
  end if;

  open rwpfcur for sql_str || sql_str2 || sql_str3;
  loop
    fetch rwpfcur
      into code, name, zs, yqs, wqs, yfk, wfk, ywc, wwc;
    v := rwpf(code, name, zs, yqs, wqs, yfk, wfk, ywc, wwc);
    pipe row(v);
    exit When rwpfcur%NotFound;
  end loop;
  close rwpfcur;
  return;
end;
 
 create or replace function f_tjbj_sjcjtj(v_code varchar2, v_lv varchar2)
--统计报表：任务完成情况统计
 return tab_sjcj
  pipelined as
  v sjcj;

  type sjcj_cur is ref cursor;
  sjcjcur sjcj_cur;
  code    varchar2(20); --单位代码
  name    varchar2(200); --单位名称
  czrk    number; --常住人口
  ldrk    number; --流动人口
  jwrk    number; --境外人口
  wlhrk   number; --未落户人口
  jzrk    number; --寄住人口
  dz      number; --地址
  dw      number; --单位
  cyry    number; --从业人员
  fw      number; --房屋
  czw     number; --出租屋

  sql_str  varchar2(3000);
  sql_str2 varchar2(3000);
  sql_str3 varchar2(3000);
begin
  sql_str  := ' select xzqh.code, ' || ' xzqh.name, ' ||
              ' f_get_czrknumber(xzqh.code, xzqh.lv) czrk,' ||
              ' f_get_ldrknumber(xzqh.code, xzqh.lv) ldrk,' ||
              ' f_get_jwrknumber(xzqh.code, xzqh.lv) jwrk,' ||
              ' f_get_wlhnumber(xzqh.code, xzqh.lv) wlhrk,' ||
              ' f_get_jzrknumber(xzqh.code, xzqh.lv) jzrk,' ||
              ' f_get_dznumber(xzqh.code, xzqh.lv) dz,' ||
              ' f_get_dwnumber(xzqh.code, xzqh.lv) dw,' ||
              ' f_get_cyrynumber(xzqh.code, xzqh.lv) cyry,' ||
              ' f_get_fwnumber(xzqh.code, xzqh.lv) fw,' ||
              ' f_get_czfwnumber(xzqh.code, xzqh.lv) czw' ||
              ' from (select org.orgcode code, org.orgjc name, level lv, ispcs ' ||
              ' from v_common_organization org ' ||
              ' connect by prior org.orgid = org.parent_orgid ' ||
              ' start with org.orgcode = ''430000000000'') xzqh ' ||
              ' where 1 = 1 ';
  sql_str3 := ' order by xzqh.code';

  if v_lv = '1' then
    sql_str2 := ' and xzqh.code like substr(' || v_code ||
                ',1,2)||''%'' and substr(xzqh.code,3,2)!=''00'' and substr(xzqh.code,5,8)=''00000000'' ';
  elsif v_lv = '2' then
    sql_str2 := 'and xzqh.code like substr(' || v_code ||
                ',1,4)||''%'' and substr(xzqh.code,5,2)!=''00'' and substr(xzqh.code,7,6)=''000000'' ';
  elsif v_lv = '3' then
    sql_str2 := 'and xzqh.code like substr(' || v_code ||
                ',1,6)||''%'' and substr(xzqh.code,7,2)!=''00'' and xzqh.ispcs = ''1''  and substr(xzqh.code,9,4)=''0000'' ';
  elsif v_lv = '4' then
    sql_str2 := 'and xzqh.code like substr(' || v_code ||
                ',1,8)||''%'' and substr(xzqh.code,9,2)=''31'' and substr(xzqh.code,11,2)!=''00'' ';
  end if;

  open sjcjcur for sql_str || sql_str2 || sql_str3;
  loop
    fetch sjcjcur
      into code, name, czrk, ldrk, jwrk, wlhrk, jzrk, dz, dw, cyry, fw, czw;
    v := sjcj(code,
              name,
              czrk,
              ldrk,
              jwrk,
              wlhrk,
              jzrk,
              dz,
              dw,
              cyry,
              fw,
              czw);
    pipe row(v);
    exit When sjcjcur%NotFound;
  end loop;
  close sjcjcur;
  return;
end;
 
 
 create or replace function f_tjbj_xldtj(v_code varchar2, v_lv varchar2)
--统计报表：巡逻队统计
 return tab_xld
  pipelined as
  v xld;

  type xld_cur is ref cursor;
  xldcur xld_cur;

  code  varchar2(20); --单位代码
  name  varchar2(200); -- 单位名称
  zs    number; --总数
  zzxld number; --专职巡逻队
  ywxld number; --义务巡逻队
  dys   number; --队员数

  sql_str  varchar2(3000);
  sql_str2 varchar2(3000);
  sql_str3 varchar2(3000);
begin
  sql_str  := ' select xzqh.code, ' || ' xzqh.name, ' ||
              ' f_get_xldnumberbylx(xzqh.code,''0'',xzqh.lv)+f_get_xldnumberbylx(xzqh.code,''1'',xzqh.lv) zs, ' ||
              ' f_get_xldnumberbylx(xzqh.code,''0'',xzqh.lv) zzxld, ' ||
              ' f_get_xldnumberbylx(xzqh.code,''1'',xzqh.lv) ywxld, ' ||
              ' f_get_xldynumber(xzqh.code,xzqh.lv) dys ' ||
              ' from (select org.orgcode code, org.orgjc name, level lv, ispcs ' ||
              ' from v_common_organization org ' ||
              ' connect by prior org.orgid = org.parent_orgid ' ||
              ' start with org.orgcode = ''430000000000'') xzqh ' ||
              ' where 1 = 1 ';
  sql_str3 := ' order by xzqh.code';

  if v_lv = '1' then
    sql_str2 := ' and xzqh.code like substr(' || v_code ||
                ',1,2)||''%'' and substr(xzqh.code,3,2)!=''00'' and substr(xzqh.code,5,8)=''00000000'' ';
  elsif v_lv = '2' then
    sql_str2 := 'and xzqh.code like substr(' || v_code ||
                ',1,4)||''%'' and substr(xzqh.code,5,2)!=''00'' and substr(xzqh.code,7,6)=''000000'' ';
  elsif v_lv = '3' then
    sql_str2 := 'and xzqh.code like substr(' || v_code ||
                ',1,6)||''%'' and substr(xzqh.code,7,2)!=''00'' and xzqh.ispcs = ''1''  and substr(xzqh.code,9,4)=''0000'' ';
  elsif v_lv = '4' then
    sql_str2 := 'and xzqh.code like substr(' || v_code ||
                ',1,8)||''%'' and substr(xzqh.code,9,2)=''31'' and substr(xzqh.code,11,2)!=''00'' ';
  end if;

  open xldcur for sql_str || sql_str2 || sql_str3;
  loop
    fetch xldcur
      into code, name, zs, zzxld, ywxld, dys;
    v := xld(code, name, zs, zzxld, ywxld, dys);
    pipe row(v);
    exit When xldcur%NotFound;
  end loop;
  close xldcur;
  return;
end;
 
 
 create or replace function f_tjbj_zdrytj(v_code varchar2, v_lv varchar2)
--统计报表：重点人员统计
 return tab_zdry
  pipelined as
  v zdrytj;

  type zdry_cur is ref cursor;
  zdrycur zdry_cur;

  code varchar2(20); --单位代码
  name varchar2(200); -- 单位名称
  zs   number; --总数
  zdry number; --重点人员
  jzdx number; --矫正对象
  gzdx number; --工作对象
  jsbr number; --精神病人
  swry number; --涉稳人员
  xdry number; --吸毒人员

  sql_str  varchar2(3000);
  sql_str2 varchar2(3000);
  sql_str3 varchar2(3000);
begin
  sql_str  := ' select xzqh.code, ' || ' xzqh.name, ' ||
              ' f_get_zdrynumber(xzqh.code, xzqh.lv) zs, ' ||
              ' f_get_zdrynumberbydxlb(xzqh.code, xzqh.lv,''1'') zdry, ' ||
              ' f_get_zdrynumberbydxlb(xzqh.code, xzqh.lv,''2'') jzdx, ' ||
              ' f_get_zdrynumberbydxlb(xzqh.code, xzqh.lv,''3'') gzdx, ' ||
              ' f_get_zdrynumberbydxlb(xzqh.code, xzqh.lv,''4'') jsbr, ' ||
              ' f_get_zdrynumberbydxlb(xzqh.code, xzqh.lv,''5'') swry, ' ||
              ' f_get_zdrynumberbydxlb(xzqh.code, xzqh.lv,''6'') xdry ' ||
              ' from (select org.orgcode code, org.orgjc name, level lv, ispcs ' ||
              ' from v_common_organization org ' ||
              ' connect by prior org.orgid = org.parent_orgid ' ||
              ' start with org.orgcode = ''430000000000'') xzqh ' ||
              ' where 1 = 1 ';
  sql_str3 := ' order by xzqh.code';

  if v_lv = '1' then
    sql_str2 := ' and xzqh.code like substr(' || v_code ||
                ',1,2)||''%'' and substr(xzqh.code,3,2)!=''00'' and substr(xzqh.code,5,8)=''00000000'' ';
  elsif v_lv = '2' then
    sql_str2 := 'and xzqh.code like substr(' || v_code ||
                ',1,4)||''%'' and substr(xzqh.code,5,2)!=''00'' and substr(xzqh.code,7,6)=''000000'' ';
  elsif v_lv = '3' then
    sql_str2 := 'and xzqh.code like substr(' || v_code ||
                ',1,6)||''%'' and substr(xzqh.code,7,2)!=''00'' and xzqh.ispcs = ''1''  and substr(xzqh.code,9,4)=''0000'' ';
  elsif v_lv = '4' then
    sql_str2 := 'and xzqh.code like substr(' || v_code ||
                ',1,8)||''%'' and substr(xzqh.code,9,2)=''31'' and substr(xzqh.code,11,2)!=''00'' ';
  end if;

  open zdrycur for sql_str || sql_str2 || sql_str3;
  loop
    fetch zdrycur
      into code, name, zs, zdry, jzdx, gzdx, jsbr, swry, xdry;
    v := zdrytj(code, name, zs, zdry, jzdx, gzdx, jsbr, swry, xdry);
    pipe row(v);
    exit When zdrycur%NotFound;
  end loop;
  close zdrycur;
  return;
end;
 