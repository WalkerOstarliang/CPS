-- Add/modify columns 
alter table T_KHKP_JFZ add pm number;
-- Add comments to the columns 
comment on column T_KHKP_JFZ.pm
  is '排名';
