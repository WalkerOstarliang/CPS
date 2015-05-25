-- Add/modify columns 
alter table T_LSGL_RKFW_GL modify RYBH null;
alter table T_LSGL_RKFW_GL add SFZH VARCHAR2(20);
-- Add comments to the columns 
comment on column T_LSGL_RKFW_GL.SFZH
  is '身份证号';
  
commit;


insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'JG_DWLB', '单位类别', '1452', '行政单位', '1400', '行政单位', '1', null);

commit;


-- Add/modify columns 
alter table T_ZA_DXHDXX add CGDZ VARCHAR2(120);
alter table T_ZA_DXHDXX add HDQY VARCHAR2(1000);
alter table T_ZA_DXHDXX add XL VARCHAR2(300);
-- Add comments to the columns 
comment on column T_ZA_DXHDXX.CGDZ
  is '场馆地址';
comment on column T_ZA_DXHDXX.HDQY
  is '活动区域';
comment on column T_ZA_DXHDXX.XL
  is '线路';
  
commit;

update t_common_dictionary
set parent_dm='0';
where zdlb='ZDY_FWLB';
commit;


insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'ZDY_FWLB', '房屋类别', '07', '商住楼', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'ZDY_FWLB', '房屋类别', '08', '高层建筑', '', '', '1', null);
  
  
insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'ZDY_FWYT', '房屋用途', '51', '餐馆', '5', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'ZDY_FWYT', '房屋用途', '52', '茶酒楼', '5', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'ZDY_FWYT', '房屋用途', '53', '宾旅馆', '5', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'ZDY_FWYT', '房屋用途', '54', '商铺', '5', '', '1', null);

commit;

 
 -- Drop columns 
alter table T_LSGL_CZFW_CZXX drop column JGDWDM;
alter table T_LSGL_CZFW_CZXX add CZRLX VARCHAR2(1);
alter table T_LSGL_CZFW_CZXX add CZZT VARCHAR2(1);
-- Add comments to the columns 
comment on column T_LSGL_CZFW_CZXX.CZRLX
  is '承租人类型 1：单位租凭 2：个人租凭';
comment on column T_LSGL_CZFW_CZXX.CZZT
  is '承租状态 1：正常 2：退租';