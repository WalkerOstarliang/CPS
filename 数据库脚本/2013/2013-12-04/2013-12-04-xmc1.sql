-- Add/modify columns 
alter table T_LSGL_RK_JWRKXX rename column SSQHBH to SSSQBH;

update  ptgl.td_sm_function
set path='/xtgl/pcs/toPcsglPage.action'
where function_id='SQJW1000001263'

commit;