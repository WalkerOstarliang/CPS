delete t_khkp_kfxpz;
commit;
insert into t_khkp_kfxpz (KHLX, BT, KFGZ, SQL, FHZ, CLLJ)
values ('lsgl_cjsl', '采集数量', '总分5分.<br>
基础信息（实有人口+地址+从业人员+实体+单位+出租屋）采集数量参照所属分局基数（基数=所属分县局当月采集总数/分局警务区数），达到基数计4分，每高于基数1个百分点0.04分，每低1个百分点扣0.04分。', '{sjcj:select
round(
((select sum(ss.jcsjzs) from t_khkp_jcsjcjsltj ss where ss.jwqdm like substr( #[orgcode],1,6) || ''%'' and ss.tjyf =  #[tjyf] and ss.jsjd =#[tjjd]) /
(select count(1) from T_COMMON_ORGANIZATION_SJJS ss where ss.orgcode like substr( #[orgcode],1,6) || ''%'' and ss.leve = 5)), 0) as js,
       sl.jcsjzs as zs,
       (sl.czrkzs + sl.jzrkzs + sl.ldrkzs + sl.wlhrks) as rk,
       sl.fwxxs as dz,
       sl.cyrys as cyry,
       sl.stxxs as st,
       sl.dwxxs as dw,
       sl.czfws as czw
  from t_khkp_jcsjcjsltj sl
  where sl.jsjd = #[tjjd]
  and sl.tjyf = #[tjyf]
  and sl.jwqdm = #[orgcode]
group by jcsjzs,czrkzs,jzrkzs,ldrkzs,wlhrks,fwxxs,cyrys,stxxs,dwxxs,czfws ;}', '{sjcj:js,zs,rk,dz,cyry,st,dw,czw;}', '');

insert into t_khkp_kfxpz (KHLX, BT, KFGZ, SQL, FHZ, CLLJ)
values ('lsgl_xxwh', '信息维护', '总分10分。<br/>
1、流动人口延期或主动注销2分。流动人口拟将居住期限到期提醒后，10天内未按规定延期或注销的，每发现1人扣0.05分。<br/>
2、流动人口系统自动注销1分。流动人口拟居住期限到期后仍未按规定延期或提醒的，系统30天后回自动注销该流动人口，自动注销时间所在月每发现一人扣0.05分。<br/>
3、从业人员提醒处理1分。单位从业人员采集，人员现住地属于本警务区被提醒后，5天内未按规定登记实有人口或反馈的，每发现1人扣0.1分。<br/>
4、常口异动提醒处理2分。常住人口出生、迁移、补录、注销异动提醒后，当月内未及时维护的，每发现1人扣0.1分。<br/>
5、境外人员提醒1分。境外人员临住登记信息被提醒后，当月内未及时维护的，每发现1人扣0.1分。<br/>
6、出租屋巡查2分。出租房屋每4个月至少登记1次巡查信息，未巡查而被提醒后10天未维护的，每发现1户扣0.3分。<br/>
7、出租房屋登记提醒处理1分。流动人口登记时，现住址被提醒为租赁房屋后，当月内未及时登记出租屋信息的，每发现1户扣0.3分。<br/>', '{rk:
select rk.xm,rk.sfzh,''流动人口'' as rysx,decode(ldrk.khlx,''LDRKYQCLDFZ'',''未延期或注销'',''LDRKZDZXJFZ'',''系统自动注销'') as kfyy
from t_lsgl_rk_ldrkzzxx_kfsj ldrk ,t_lsgl_rk_jbxx rk
where (ldrk.khlx = ''LDRKYQCLDFZ'' or ldrk.khlx = ''LDRKZDZXJFZ'') and ldrk.zrdwdm = #[orgcode] and rk.rybh = ldrk.rybh
and to_char(ldrk.jssj,''yyyymm'') =#[tjyf]
and ldrk.jsjd = #[tjjd]
and to_char(ldrk.jssj,''yyyymmdd'') = #[jssj]
union all (
select rk.xm,rk.sfzh,''从业人人员'' as rysx,''未登记或反馈'' as kfyy
from t_za_ry_cyry_kfsj cyry,t_lsgl_rk_jbxx rk
where cyry.khlx = ''CYRYTXWCL'' and  cyry.djdwdm = #[orgcode] and cyry.rybh = rk.rybh
and to_char(jssj,''yyyymm'') =#[tjyf]
and jsjd = #[tjjd]
and to_char(jssj,''yyyymmdd'') = #[jssj]
);
czfw:
select distinct fw.hzxm as fzxm,fw.hzsfzh as fzsfzh,czfw.czfwbpbm,decode(czfw.khlx,''CZFWXCF'',''出租屋未巡查登记'',''CZFWDJF'',''未及时登记出租屋信息'') as kfyy
from t_lsgl_fw_jbxx_kfsj fw,t_lsgl_czfw_jbxx_kfsj czfw
where (czfw.khlx = ''CZFWXCF'' or czfw.khlx = ''CZFWDJF'') and czfw.fwbh = fw.fwid and fw.sszrdwdm= #[orgcode]
and to_char(czfw.jssj,''yyyymm'') =#[tjyf]
and czfw.jsjd = #[tjjd]
and to_char(czfw.jssj,''yyyymmdd'') = #[jssj];
}', '{rk:xm,sfzh,rysx,kfyy;czfw:fzxm,fzsfzh,czfwbpbm,kfyy;}', '');

insert into t_khkp_kfxpz (KHLX, BT, KFGZ, SQL, FHZ, CLLJ)
values ('zdry_xfsjwh', '重点人员下发数据维护', '总分8分。<br>
1、首次重点人员信息2分。对首次下发到警务区的重点人员信息，当月未完成在控登记的，每发现一人扣0.3分。<br>
2、原有重点人员信息6分。对原有已在控登记的重点人员信息，当月未进行维护的，每发现一人扣0.1分。', '{zdryxfsjwh:
select distinct zdrybh,rk.xm as xm,zdry.sfzh,f_get_zdrylbbjmc(zdry.zdrylbbj) as zdrylb,
    decode(khlx,''ZDRYDTGK_XFSJWH_SC'',''首次下发未在控登记'',''ZDRYDTGK_XFSJWH_YY'',''本月未在控登记'') as kfyy
from t_zdry_gzdx_kfsj zdry,t_lsgl_rk_jbxx rk
where rk.sfzh = zdry.sfzh and sszrdwdm = #[orgcode] and (khlx = ''ZDRYDTGK_XFSJWH_SC'' or khlx = ''ZDRYDTGK_XFSJWH_YY'')
and to_char(jssj,''yyyymm'') =#[tjyf]
and jsjd = #[tjjd]
and to_char(jssj,''yyyymmdd'') = #[jssj];
}', '{zdryxfsjwh:zdrybh,xm,sfzh,zdrylb,kfyy;}', '');

insert into t_khkp_kfxpz (KHLX, BT, KFGZ, SQL, FHZ, CLLJ)
values ('zdry_wtqs', '委托签收管理', '总分6分。<br>
1、未按规定签收管理4分。对现管辖地发出的委托信息，系统提醒后，5天内未接管或退回的，每发现一人扣0.3分。<br>
2、按规定签收管理2分。对现管辖地发出的委托信息，系统提醒后，5天内予以接管、录入实有人口信息、登记在控信息的，每发现一人加0.3。', '{zdrywtqs:
select distinct zdrybh,rk.xm as xm,zdry.sfzh,f_get_zdrylbbjmc(zdry.zdrylbbj) as zdrylb,''未接管或退回'' as kfyy
from t_zdry_wtxx_kfsj wt,t_zdry_gzdx zdry,t_lsgl_rk_jbxx rk
where khlx = ''ZDRYDTGK_WTQSGL_WAGD''
and wt.sfzh = zdry.sfzh and wt.sfzh = rk.sfzh
and wt.jgdwdm = #[orgcode]
and to_char(jssj,''yyyymm'') =#[tjyf]
and jsjd = #[tjjd]
and to_char(jssj,''yyyymmdd'') = #[jssj];
}', '{zdrywtqs:zdrybh,xm,sfzh,zdrylb,kfyy;}', '');

insert into t_khkp_kfxpz (KHLX, BT, KFGZ, SQL, FHZ, CLLJ)
values ('zdry_zkdjzl', '重点人员在控登记质量', '总分6分。<br>
1、关系人质量2分。在控登记信息中，关系人信息、违法犯罪经历信息、所属类别和联系方式缺失的，每发现1人扣0.3分，失控人员不扣分。<br>
2、重点人员信息质量4分。在控登记信息中，发现重点人员经济来源、活动规律、家庭情况缺失的，每发现1人扣0.3分，失控人员不扣分。', '{zdryzkdjzl:
select distinct zdry.zdrybh,rk.xm as xm,zdry.sfzh,f_get_zdrylbbjmc(zdry.zdrylbbj) as zdrylb,''关系人、违法犯罪经历、所属类别、联系方式等信息缺失'' as kfyy
from t_zdry_xsbx_kfsj xsbx,t_zdry_gzdx zdry,t_lsgl_rk_jbxx rk
where xsbx.sfzh =zdry.sfzh and xsbx.sfzh = rk.sfzh
and xsbx.khlx = ''ZDRYDTGK_ZKDJZL_GXR'' and xsbx.hszrdwdm = #[orgcode]
and to_char(xsbx.jssj,''yyyymm'') =#[tjyf]
and xsbx.jsjd = #[tjjd]
and to_char(xsbx.jssj,''yyyymmdd'') = #[jssj];
}', '{zdryzkdjzl:zdrybh,xm,sfzh,zdrylb,kfyy;}', '');

insert into t_khkp_kfxpz (KHLX, BT, KFGZ, SQL, FHZ, CLLJ)
values ('aqff', '安全防范日常管理', '总分5分。<br>
1、盘查辖区10名以上可疑人员，每少一人扣0.5分。录入盘查信息中，姓名和身份证号不匹配的、无照片的、联系电话号码长度少于7位的，每人扣0.3分。<br>
2、通过盘查抓获在逃人员的，每抓获一人加1分，盘查发现非本派出所管辖的重点人员，每采集1人加0.3分。<br>
3、通过防范管理工作，对纳入警务区管控的重点人员，被治安处罚以上的，当月每人次加0.5分，被刑事处罚以上的，当月每人次加1分。<br>
4、两实人口采集，被治安处罚以上的，当月每人次加0.5分，被刑事处罚以上的，当月每人次加1分。', '{pc_cjsl:
SELECT distinct 10 as js,COUNT(DISTINCT T.PCDXSFZH) ycj
FROM T_AF_LMPCXX T
WHERE T.DJRDWDM =  #[orgcode]
AND T.DJSJ >= TRUNC(SYSDATE,''MM'');
pc_sjzl:
select distinct pcdxxm,pcdxsfzh,TO_CHAR(pcsj,''YYYY-MM-DD'') AS pcsj,''盘查信息质量'' as kfyy
from t_af_lmpcxx_kfsj
where djrdwdm = #[orgcode]
and khlx = ''AQFF_PCKYRY_BGF''
and to_char(jssj,''yyyymm'') =#[tjyf]
and jsjd = #[tjjd]
and to_char(jssj,''yyyymmdd'') = #[jssj];
}', '{pc_cjsl:js,ycj;pc_sjzl:pcdxxm,pcdxsfzh,pcsj,kfyy}', '');

insert into t_khkp_kfxpz (KHLX, BT, KFGZ, SQL, FHZ, CLLJ)
values ('fkrsdqa', '防控入室盗窃案件', '总分8分。<br>
入室盗窃案件环比持平计6分，每下降1起加0.2分，上升一起扣0.2分，当月零发案计8分。', '{rsdqaj:select distinct ssy, sy from t_ajjbxxb_sqjw_kfsj
where khlx = ''SD_FK_RSDQAJ'' and orgcode = #[orgcode]
and to_char(jssj,''yyyymm'') =#[tjyf]
and jsjd = #[tjjd]
and to_char(jssj,''yyyymmdd'') = #[jssj];
}', '{rsdqaj:ssy,sy;}', '');

insert into t_khkp_kfxpz (KHLX, BT, KFGZ, SQL, FHZ, CLLJ)
values ('lsgl_xxzl', '信息质量', '总分：10分.<br/>
1、两实信息质量3分.<br/>
2、实有人口逻辑错误3分.<br/>
3、单位信息质量1分.<br/>
4、实体标注和地址关联3分。实体建筑未在PGIS地图上标注的，实有地址未与实体建筑关联的，每发现1条扣0.1分.', '{stxx:
select distinct s.stmc, s.jlxmc, s.sqmc, ''实体未在PGIS地图标注'' as kfyy
  from t_common_stxx_kfsj s
where khlx = ''XXZL_STBZ_DZGL''
   and s.djdwdm = #[orgcode]
   and s.jsjd = #[tjjd]
   and to_char(s.jssj, ''yyyymm'') = #[tjyf]
   and to_char(s.jssj,''yyyymmdd'') = #[jssj];
}', '{stxx:stmc,jlxmc,sqmc,kfyy;}', '');

commit;