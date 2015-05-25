update t_common_dictionary set mc =  '一类' where zdlb = 'KHKP_PCSDJ' and dm = '1';
update t_common_dictionary set mc  = '二类' where zdlb = 'KHKP_PCSDJ' and dm = '2';
update t_common_dictionary set mc  = '三类' where zdlb = 'KHKP_PCSDJ' and dm = '3';
commit;