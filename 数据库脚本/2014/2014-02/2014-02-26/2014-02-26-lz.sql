insert into t_common_dictionary values(T_COMMON_DICTIONARY_ID.Nextval,'ZDY_FJLB','辅警类别','1','流口协管员','','','1','');
insert into t_common_dictionary values(T_COMMON_DICTIONARY_ID.Nextval,'ZDY_FJLB','辅警类别','2','治安巡防队员','','','1','');
commit;

-- Add/modify columns 
alter table T_COMMON_ORGANIZATION_FJ add fjlb varchar2(2);
-- Add comments to the columns 
comment on column T_COMMON_ORGANIZATION_FJ.fjlb
  is '辅警类别  1流口协管员、2治安巡防队员';
  
  
  
  
CREATE OR REPLACE FUNCTION F_GET_SFZHBYRYBH(v_rybh VARCHAR2) RETURN varchar2
--根据rybh查询sfzh
AS
       v_sfzh    VARCHAR2(20);
BEGIN
       SELECT sfzh INTO v_sfzh FROM t_lsgl_rk_jbxx where rybh = v_rybh;
       RETURN v_sfzh;
END;
/


-- Create/Recreate indexes 
create index t_lsgl_fw_jbxx_hzsfzh on T_LSGL_FW_JBXX (hzsfzh)
  tablespace TS_IDX_SQJW
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );