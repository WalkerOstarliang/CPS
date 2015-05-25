-- Add/modify columns 
alter table T_LSGL_FW_JBXX add SFJWTDJ VARCHAR2(1) default '0';
-- Add comments to the columns 
comment on column T_LSGL_FW_JBXX.CZBS
  is '操作标示 1新增、2修改、3注销 、4：警务通修改';
comment on column T_LSGL_FW_JBXX.SFJWTDJ
  is '是否警务通登记 0：PC登记 1：警务通登记';

  
-- Add/modify columns 
alter table T_LSGL_CZFW_JBXX add SFJWTDJ VARCHAR2(1) default '0';
-- Add comments to the columns 
comment on column T_LSGL_CZFW_JBXX.SFJWTDJ
  is '是否警务通登记 0 ：否 1：是';
  
