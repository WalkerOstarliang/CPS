-- Add comments to the columns 
comment on column T_LSGL_CZFW_CZRXX.ZXBS
  is '注销标识 0：有效 1：注销';

  
update t_common_dictionary
set mc='企事业单位'
where zdlb='ZDY_HYLB' and dm='03';
commit;