-- Add/modify columns 
alter table T_KHKP_KFXPZ add leve number;
-- Add comments to the columns 
comment on column T_KHKP_KFXPZ.leve
  is '级别';

  
-- Add/modify columns 
alter table T_KHKP_PAGETABLE add showplay varchar2(1);
alter table T_KHKP_PAGETABLE add leve number;
-- Add comments to the columns 
comment on column T_KHKP_PAGETABLE.showplay
  is '是否显示（1：显示    0 ：不显示）';
comment on column T_KHKP_PAGETABLE.leve
  is '级别';

UPDATE t_Khkp_Kfxpz SET leve = 5;  
UPDATE T_KHKP_PAGETABLE SET SHOWPLAY = '1', LEVE = 5;
commit;  
  