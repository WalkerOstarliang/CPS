insert  into t_common_dictionary values('800022','ZDY_XZJB','行政级别','1','正处','','','1','');
insert  into t_common_dictionary values('800023','ZDY_XZJB','行政级别','2','副处','','','1','');
insert  into t_common_dictionary values('800024','ZDY_XZJB','行政级别','3','正科','','','1','');
insert  into t_common_dictionary values('800025','ZDY_XZJB','行政级别','4','副科','','','1','');
insert  into t_common_dictionary values('800026','ZDY_XZJB','行政级别','5','科员','','','1','');




 insert  into t_common_dictionary values('800027','ZDY_ZW','职务','1','所长','','','1','');
    insert  into t_common_dictionary values('800028','ZDY_ZW','职务','2','副所长','','','1','');
    insert  into t_common_dictionary values('800029','ZDY_ZW','职务','3','教导员','','','1','');
    insert  into t_common_dictionary values('800030','ZDY_ZW','职务','4','中队长','','','1','');
    insert  into t_common_dictionary values('800031','ZDY_ZW','职务','5','民警','','','1','');
    
    
    
    
      insert  into t_common_dictionary values('800032','ZDY_PCSJB','级别','1','股级','','','1','');
    insert  into t_common_dictionary values('800033','ZDY_PCSJB','级别','2','副科','','','1','');
    insert  into t_common_dictionary values('800034','ZDY_PCSJB','级别','3','正科','','','1','');
    insert  into t_common_dictionary values('800035','ZDY_PCSJB','级别','4','副处','','','1','');
    
    insert  into t_common_dictionary values('800036','ZDY_PCSDJ','等级','1','一级','','','1','');
    insert  into t_common_dictionary values('800037','ZDY_PCSDJ','等级','2','二级','','','1','');
    insert  into t_common_dictionary values('800038','ZDY_PCSDJ','等级','3','三级','','','1','');
    insert  into t_common_dictionary values('800039','ZDY_PCSDJ','等级','4','四级','','','1','');
    
    
       insert  into t_common_dictionary values('800040','ZDY_PCSLB','类别','1','城区所','','','1','');
      insert  into t_common_dictionary values('800041','ZDY_PCSLB','类别','2','城关所','','','1','');
       insert  into t_common_dictionary values('800042','ZDY_PCSLB','类别','3','建制镇所','','','1','');
        insert  into t_common_dictionary values('800043','ZDY_PCSLB','类别','4','建制乡所','','','1','');
         insert  into t_common_dictionary values('800044','ZDY_PCSLB','类别','5','水上所','','','1','');
          insert  into t_common_dictionary values('800045','ZDY_PCSLB','类别','6','治安所','','','1','');
          
commit;

-- Create sequence 
create sequence T_COMMON_ORGANIZATION_FJ_ID
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;


    