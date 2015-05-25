insert into t_common_dictionary values(seq_common.nextval , 'ZDY_XQZGBZW','小区组干部职务','10','小组长','','','1','');
insert into t_common_dictionary values(seq_common.nextval , 'ZDY_XQZGBZW','小区组干部职务','11','会计','','','1','');
insert into t_common_dictionary values(seq_common.nextval , 'ZDY_XQZGBZW','小区组干部职务','99','其他','','','1','');
commit;

-- Add/modify columns 
alter table T_AF_SQGBXX modify sssqbh VARCHAR2(25);
alter table T_AF_SQGBXX add lx varchar2(1) default 1;
-- Add comments to the columns 
comment on column T_AF_SQGBXX.lx
  is '1:社区干部 2：小区组干部';