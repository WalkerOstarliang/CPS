create or replace view v_common_user as
select user_id as userid,
       user_name as username,
       user_password as password,
       user_realname as realname,
       u.user_pinyin as realnamepy,
       user_mobiletel1 as mobile,
       user_hometel as telephone,
       user_idcard sfzh,
       remark2 as org_code,
       decode(user_isvalid,'2','1','0') as isvalid,
       last_update as createdate
from ptgl.td_sm_user u;

create or replace view v_common_orguser as
select org_id as orgid, user_id as userid, (select code from ptgl.td_sm_organization where org_id = o.org_id) as orgcode
 from ptgl.td_sm_orguser o;

 
create or replace view v_common_organization as
select org_id as orgid,
        code as orgcode,
        org_name as orgname,
        parent_id as parent_orgid ,
        (select code from ptgl.td_sm_organization t1 where t1.org_id=t.parent_id and rownum=1) as parent_code,
        remark5 as orgjc,
        '' as leve,
        t.creatingtime as createdate,
        org_sn as sn,
        (case remark6 when '0' then '1' else '0' end) as isyx,
        (case when t.org_name like '%派出所' then '1' else null end) as  ispcs
 from ptgl.td_sm_organization t;
 