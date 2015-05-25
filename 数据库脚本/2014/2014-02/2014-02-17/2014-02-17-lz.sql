-- Add/modify columns 
alter table T_LSGL_RK_JHSY add rybh varchar2(20);
-- Add comments to the columns 
comment on column T_LSGL_RK_JHSY.rybh
  is '人员编号';
  
  
  
  
  
insert into t_common_dictionary values('800125','ZDY_JHSYYQ','计划生育孕情','0','无孕','','','1','');
insert into t_common_dictionary values('800126','ZDY_JHSYYQ','计划生育孕情','1','已孕','','','1','');
insert into t_common_dictionary values('800127','ZDY_JHSYYQ','计划生育孕情','2','政策内','','','1','');
insert into t_common_dictionary values('800128','ZDY_JHSYYQ','计划生育孕情','3','政策外','','','1','');

insert into t_common_dictionary values('800130','ZDY_BYJYCS','避孕节育措施','0','无措施','','','1','');
insert into t_common_dictionary values('800131','ZDY_BYJYCS','避孕节育措施','1','上环','','','1','');
insert into t_common_dictionary values('800132','ZDY_BYJYCS','避孕节育措施','2','结扎','','','1','');
insert into t_common_dictionary values('800133','ZDY_BYJYCS','避孕节育措施','3','皮埋','','','1','');
insert into t_common_dictionary values('800134','ZDY_BYJYCS','避孕节育措施','4','避孕药,短效口服避孕药','','','1','');
insert into t_common_dictionary values('800135','ZDY_BYJYCS','避孕节育措施','5','其他','','','1','');
commit;  