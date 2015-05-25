insert into t_khkp_kfxpz (KHLX, BT, KFGZ, SQL, FHZ, CLLJ)
values ('lsgl_xxzl', '信息质量', '总分：10分.<br/>
1、两实信息质量3分.<br/>
2、实有人口逻辑错误3分.<br/>
3、单位信息质量1分.<br/>
4、实体标注和地址关联3分。实体建筑未在PGIS地图上标注的，实有地址未与实体建筑关联的，每发现1条扣0.1分.', '{stxx:
select s.stmc, s.jlxmc, s.sqmc, ''实体未在PGIS地图标注'' as kfyy
  from t_common_stxx_kfsj s
where khlx = ''XXZL_STBZ_DZGL''
   and s.djdwdm = #[orgcode]
   and s.jsjd = #[tjjd]
   and to_char(s.jssj, ''yyyy-mm'') = #[tjyf];
}', '{stxx:stmc,jlxmc,sqmc,kfyy;}', '');

insert into t_khkp_pagetable (TABLENAME, TITLE, CLASS, STYLE, WIDTH, KHLX)
values ('stxx', '实体扣分', '', '', '', 'lsgl_xxzl');

insert into t_khkp_pagetablehead (TABLENAME, TITLE, ALIGN, STYLE, WIDTH, XH)
values ('stxx', '实体名称', '', 'text-align:center', '', 1);

insert into t_khkp_pagetablehead (TABLENAME, TITLE, ALIGN, STYLE, WIDTH, XH)
values ('stxx', '街路巷', '', 'text-align:center', '', 2);

insert into t_khkp_pagetablehead (TABLENAME, TITLE, ALIGN, STYLE, WIDTH, XH)
values ('stxx', '小区组', '', 'text-align:center', '', 3);

insert into t_khkp_pagetablehead (TABLENAME, TITLE, ALIGN, STYLE, WIDTH, XH)
values ('stxx', '扣分原因', '', 'text-align:center', '', 4);

commit;