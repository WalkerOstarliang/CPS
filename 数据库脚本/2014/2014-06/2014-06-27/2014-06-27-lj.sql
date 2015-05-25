
-- Create table
create table T_ZA_NB_DWJC
(
  ID        VARCHAR2(20) not null,
  JGBH      VARCHAR2(27) not null,
  DWLB      VARCHAR2(3) not null,
  DWMC      VARCHAR2(200),
  SSPCSDM   VARCHAR2(12),
  SSPCSMC   VARCHAR2(120),
  JCMJJH    VARCHAR2(20),
  JCMJXM    VARCHAR2(30),
  JCRQ      DATE,
  JCQKMS    VARCHAR2(500),
  XCZP      BLOB,
  YHZP      BLOB,
  YHMS      VARCHAR2(500),
  MJCLYJ    VARCHAR2(200),
  MJCL      VARCHAR2(500),
  MJZGQX    NUMBER,
  TJSLDJH   VARCHAR2(20),
  TJSLDXM   VARCHAR2(30),
  YHTJMJJH  VARCHAR2(20),
  YHTJMJXM  VARCHAR2(30),
  MJCLSJ    DATE,
  SLDSPYJ   VARCHAR2(200),
  SLDZGQX   NUMBER,
  SLDCL     VARCHAR2(500),
  SLDJH     VARCHAR2(20),
  SLDXM     VARCHAR2(30),
  SLDSPSJ   DATE,
  DJRJH     VARCHAR2(20),
  DJRXM     VARCHAR2(30),
  DJRSFZH   VARCHAR2(18),
  DJSJ      DATE,
  DJDWDM    VARCHAR2(12),
  DJDWMC    VARCHAR2(120),
  CZRXM     VARCHAR2(30),
  CZRJH     VARCHAR2(20),
  CZSJ      DATE,
  CZDWDM    VARCHAR2(12),
  CZDWMC    VARCHAR2(120),
  CZBS      VARCHAR2(2),
  SFSP      VARCHAR2(1),
  CZRSFZH   VARCHAR2(18),
  JZZD01    VARCHAR2(1),
  JZZD02    VARCHAR2(1),
  JZZD03    VARCHAR2(1),
  JZZD04    VARCHAR2(1),
  JZZD05    VARCHAR2(1),
  JZZD06    VARCHAR2(1),
  JZZD07    VARCHAR2(1),
  JZZD08    VARCHAR2(1),
  JZSP01    VARCHAR2(1),
  JZSP02    VARCHAR2(1),
  JZSP03    VARCHAR2(1),
  JZSP04    VARCHAR2(1),
  JZSP05    VARCHAR2(1),
  JZSP06    VARCHAR2(1),
  JZSP07    VARCHAR2(1),
  JZBJ02    VARCHAR2(1),
  JZBJ08    VARCHAR2(1),
  JZWF01    VARCHAR2(1),
  JZWF02    VARCHAR2(1),
  JZWF03    VARCHAR2(1),
  JZWF04    VARCHAR2(1),
  JZWF05    VARCHAR2(1),
  JZRF04    VARCHAR2(1),
  J1ZD01    VARCHAR2(1),
  J1ZD03    VARCHAR2(1),
  J1ZD04    VARCHAR2(1),
  J1ZD05    VARCHAR2(1),
  J1JF01    VARCHAR2(1),
  J1JF02    VARCHAR2(1),
  J1WF01    VARCHAR2(1),
  J1WF02    VARCHAR2(1),
  J1WF03    VARCHAR2(1),
  J1WF04    VARCHAR2(1),
  J1RF01    VARCHAR2(1),
  J1RF02    VARCHAR2(1),
  J1RF03    VARCHAR2(1),
  J1BA01    VARCHAR2(1),
  J1BA02    VARCHAR2(1),
  J1BA03    VARCHAR2(1),
  J1BA04    VARCHAR2(1),
  DZZD01    VARCHAR2(1),
  DZZD02    VARCHAR2(1),
  DZZD03    VARCHAR2(1),
  DZZD04    VARCHAR2(1),
  DZJF01    VARCHAR2(1),
  DZJF02    VARCHAR2(1),
  DZJF03    VARCHAR2(1),
  DZJF04    VARCHAR2(1),
  DZJF05    VARCHAR2(1),
  DZJF06    VARCHAR2(1),
  DZJF07    VARCHAR2(1),
  DZJF08    VARCHAR2(1),
  DZWF01    VARCHAR2(1),
  DZWF02    VARCHAR2(1),
  DZWF03    VARCHAR2(1),
  DZRF01    VARCHAR2(1),
  DZRF02    VARCHAR2(1),
  DZRF03    VARCHAR2(1),
  DZRF04    VARCHAR2(1),
  JZBA01    VARCHAR2(1),
  JZBA02    VARCHAR2(1),
  JZBA03    VARCHAR2(1),
  JZBA04    VARCHAR2(1),
  WSZD01    VARCHAR2(1),
  WSZD02    VARCHAR2(1),
  WSZD03    VARCHAR2(1),
  WSZD04    VARCHAR2(1),
  WSJS01    VARCHAR2(1),
  WSJS02    VARCHAR2(1),
  WSJS03    VARCHAR2(1),
  WSJS04    VARCHAR2(1),
  WSJS05    VARCHAR2(1),
  WSJS06    VARCHAR2(1),
  WSJS07    VARCHAR2(1),
  WSJS08    VARCHAR2(1),
  WSJS09    VARCHAR2(1),
  WSWF01    VARCHAR2(1),
  WSWF02    VARCHAR2(1),
  WSRF01    VARCHAR2(1),
  WSRF02    VARCHAR2(1),
  WSRF03    VARCHAR2(1),
  WSBA01    VARCHAR2(1),
  WSBA02    VARCHAR2(1),
  WSBA03    VARCHAR2(1),
  WSBA04    VARCHAR2(1),
  GXZD01    VARCHAR2(1),
  GXZD02    VARCHAR2(1),
  GXZD03    VARCHAR2(1),
  GXZD04    VARCHAR2(1),
  GXJF01    VARCHAR2(1),
  GXJF02    VARCHAR2(1),
  GXJF03    VARCHAR2(1),
  GXJF04    VARCHAR2(1),
  GXJF05    VARCHAR2(1),
  GXJF06    VARCHAR2(1),
  GXJF07    VARCHAR2(1),
  GXJF08    VARCHAR2(1),
  GXWF01    VARCHAR2(1),
  GXWF02    VARCHAR2(1),
  GXWF03    VARCHAR2(1),
  GXWF04    VARCHAR2(1),
  GXWF05    VARCHAR2(1),
  GXWF06    VARCHAR2(1),
  GXRF01    VARCHAR2(1),
  GXRF02    VARCHAR2(1),
  GXRF03    VARCHAR2(1),
  GXRF04    VARCHAR2(1),
  GXBA01    VARCHAR2(1),
  GXBA02    VARCHAR2(1),
  GXBA03    VARCHAR2(1),
  GXBA04    VARCHAR2(1),
  JRZD01    VARCHAR2(1),
  JRZD02    VARCHAR2(1),
  JRZD03    VARCHAR2(1),
  JRZD04    VARCHAR2(1),
  JRZD05    VARCHAR2(1),
  JRZD06    VARCHAR2(1),
  JRZD07    VARCHAR2(1),
  JRJF01    VARCHAR2(1),
  JRJF02    VARCHAR2(1),
  JRJF03    VARCHAR2(1),
  JRJF04    VARCHAR2(1),
  JRJF05    VARCHAR2(1),
  JRJF06    VARCHAR2(1),
  JRJF07    VARCHAR2(1),
  JRJF08    VARCHAR2(1),
  JRJF09    VARCHAR2(1),
  JRJF10    VARCHAR2(1),
  JRJF11    VARCHAR2(1),
  JRJF12    VARCHAR2(1),
  JRJF13    VARCHAR2(1),
  JRJF14    VARCHAR2(1),
  JRWF01    VARCHAR2(1),
  JRWF02    VARCHAR2(1),
  JRWF03    VARCHAR2(1),
  JRWF04    VARCHAR2(1),
  JRWF05    VARCHAR2(1),
  JRWF06    VARCHAR2(1),
  JRRF01    VARCHAR2(1),
  JRRF02    VARCHAR2(1),
  JRRF03    VARCHAR2(1),
  JRRF04    VARCHAR2(1),
  JR_JZBA01 VARCHAR2(1),
  JR_JZBA02 VARCHAR2(1),
  JR_JZBA03 VARCHAR2(1),
  JR_JZBA04 VARCHAR2(1),
  JZRF01    VARCHAR2(1),
  JZRF02    VARCHAR2(1),
  JZRF03    VARCHAR2(1),
  DZBA01    VARCHAR2(1),
  DZBA02    VARCHAR2(1),
  DZBA03    VARCHAR2(1),
  DZBA04    VARCHAR2(1),
  YHZD01    VARCHAR2(1),
  YHZD02    VARCHAR2(1),
  YHZD03    VARCHAR2(1),
  YHJF01    VARCHAR2(1),
  YHJF02    VARCHAR2(1),
  YHJF04    VARCHAR2(1),
  YHJF05    VARCHAR2(1),
  YHJF06    VARCHAR2(1),
  YHWF01    VARCHAR2(1),
  YHWF02    VARCHAR2(1),
  YHRF01    VARCHAR2(1),
  YHRF02    VARCHAR2(1),
  YHRF03    VARCHAR2(1),
  YH_JZBA01 VARCHAR2(1),
  YH_JZBA02 VARCHAR2(1),
  YH_JZBA03 VARCHAR2(1),
  YH_JZBA04 VARCHAR2(1),
  JYZD01    VARCHAR2(1),
  JYZD02    VARCHAR2(1),
  JYZD03    VARCHAR2(1),
  JYZD04    VARCHAR2(1),
  JYZD05    VARCHAR2(1),
  JYZD06    VARCHAR2(1),
  JYZD07    VARCHAR2(1),
  JYZD08    VARCHAR2(1),
  JYZD09    VARCHAR2(1),
  JYSP01    VARCHAR2(1),
  JYSP02    VARCHAR2(1),
  JYSP03    VARCHAR2(1),
  JYSP04    VARCHAR2(1),
  JYSP05    VARCHAR2(1),
  JYSP06    VARCHAR2(1),
  JYSP07    VARCHAR2(1),
  JYSP08    VARCHAR2(1),
  JYBJ01    VARCHAR2(1),
  JYBJ02    VARCHAR2(1),
  JYBJ03    VARCHAR2(1),
  JYBJ04    VARCHAR2(1),
  JYBJ05    VARCHAR2(1),
  JYWF01    VARCHAR2(1),
  JYWF02    VARCHAR2(1),
  JYWF03    VARCHAR2(1),
  JYWF04    VARCHAR2(1),
  JYRF01    VARCHAR2(1),
  JYRF02    VARCHAR2(1),
  JY_JZBA01 VARCHAR2(1),
  JY_JZBA02 VARCHAR2(1),
  JY_JZBA03 VARCHAR2(1),
  JY_JZBA04 VARCHAR2(1),
  ZBZD01    VARCHAR2(1),
  ZBZD02    VARCHAR2(1),
  ZBZD03    VARCHAR2(1),
  ZBZD04    VARCHAR2(1),
  ZBZD05    VARCHAR2(1),
  ZBSP01    VARCHAR2(1),
  ZBSP02    VARCHAR2(1),
  ZBSP03    VARCHAR2(1),
  ZBSP04    VARCHAR2(1),
  ZBSP05    VARCHAR2(1),
  ZBSP06    VARCHAR2(1),
  ZBSP07    VARCHAR2(1),
  ZBBJ01    VARCHAR2(1),
  ZBBJ02    VARCHAR2(1),
  ZBBJ03    VARCHAR2(1),
  ZBBJ04    VARCHAR2(1),
  ZBBJ05    VARCHAR2(1),
  ZBBJ06    VARCHAR2(1),
  ZBWF01    VARCHAR2(1),
  ZBWF02    VARCHAR2(1),
  ZBWF03    VARCHAR2(1),
  ZBWF04    VARCHAR2(1),
  ZBRF01    VARCHAR2(1),
  ZBRF02    VARCHAR2(1),
  SC_JZBA01 VARCHAR2(1),
  SC_JZBA02 VARCHAR2(1),
  SC_JZBA03 VARCHAR2(1),
  SC_JZBA04 VARCHAR2(1),
  WHZD01    VARCHAR2(1),
  WHZD02    VARCHAR2(1),
  WHZD03    VARCHAR2(1),
  WHZD04    VARCHAR2(1),
  WHJF01    VARCHAR2(1),
  WHJF02    VARCHAR2(1),
  WHJF03    VARCHAR2(1),
  WHJF04    VARCHAR2(1),
  WHJF05    VARCHAR2(1),
  WHJF06    VARCHAR2(1),
  WHWF01    VARCHAR2(1),
  WHWF02    VARCHAR2(1),
  WHRF01    VARCHAR2(1),
  WHRF02    VARCHAR2(1),
  WHRF03    VARCHAR2(1),
  WHRF04    VARCHAR2(1),
  WHRF05    VARCHAR2(1),
  WH_JZBA01 VARCHAR2(1),
  WH_JZBA02 VARCHAR2(1),
  WH_JZBA03 VARCHAR2(1),
  WH_JZBA04 VARCHAR2(1),
  XXZD01    VARCHAR2(1),
  XXZD02    VARCHAR2(1),
  XXZD03    VARCHAR2(1),
  XXZD04    VARCHAR2(1),
  XXZD05    VARCHAR2(1),
  XXZD06    VARCHAR2(1),
  XXJF01    VARCHAR2(1),
  XXJF02    VARCHAR2(1),
  XXJF03    VARCHAR2(1),
  XXJF04    VARCHAR2(1),
  XXWF01    VARCHAR2(1),
  XXWF02    VARCHAR2(1),
  XXWF03    VARCHAR2(1),
  XXWF04    VARCHAR2(1),
  XXWF05    VARCHAR2(1),
  XXRF01    VARCHAR2(1),
  XXRF02    VARCHAR2(1),
  XX_JZBA01 VARCHAR2(1),
  XX_JZBA02 VARCHAR2(1),
  XX_JZBA03 VARCHAR2(1),
  XX_JZBA04 VARCHAR2(1)
);
-- Add comments to the table 
comment on table T_ZA_NB_DWJC
  is '内保单位检查';
-- Add comments to the columns 
comment on column T_ZA_NB_DWJC.ID
  is '主键ID';
comment on column T_ZA_NB_DWJC.JGBH
  is '机构编号';
comment on column T_ZA_NB_DWJC.DWLB
  is '单位类别';
comment on column T_ZA_NB_DWJC.DWMC
  is '单位名称';
comment on column T_ZA_NB_DWJC.SSPCSDM
  is '所属派出所代码';
comment on column T_ZA_NB_DWJC.SSPCSMC
  is '所属派出所名称';
comment on column T_ZA_NB_DWJC.JCMJJH
  is '检查民警警号';
comment on column T_ZA_NB_DWJC.JCMJXM
  is '检查民警姓名';
comment on column T_ZA_NB_DWJC.JCRQ
  is '检查日期';
comment on column T_ZA_NB_DWJC.JCQKMS
  is '检查情况描述';
comment on column T_ZA_NB_DWJC.XCZP
  is '现场照片';
comment on column T_ZA_NB_DWJC.YHZP
  is '隐患照片';
comment on column T_ZA_NB_DWJC.YHMS
  is '隐患描述';
comment on column T_ZA_NB_DWJC.MJCLYJ
  is '民警处理意见';
comment on column T_ZA_NB_DWJC.MJCL
  is '民警处理';
comment on column T_ZA_NB_DWJC.MJZGQX
  is '民警整改期限';
comment on column T_ZA_NB_DWJC.TJSLDJH
  is '提交所领导警号';
comment on column T_ZA_NB_DWJC.TJSLDXM
  is '提交所领导姓名';
comment on column T_ZA_NB_DWJC.YHTJMJJH
  is '隐患提交民警警号';
comment on column T_ZA_NB_DWJC.YHTJMJXM
  is '隐患提交民警姓名';
comment on column T_ZA_NB_DWJC.MJCLSJ
  is '民警处理时间';
comment on column T_ZA_NB_DWJC.SLDSPYJ
  is '所领导审批意见';
comment on column T_ZA_NB_DWJC.SLDZGQX
  is '所领导整改期限';
comment on column T_ZA_NB_DWJC.SLDCL
  is '所领导处理';
comment on column T_ZA_NB_DWJC.SLDJH
  is '所领导警号';
comment on column T_ZA_NB_DWJC.SLDXM
  is '所领导姓名';
comment on column T_ZA_NB_DWJC.SLDSPSJ
  is '所领导审批时间';
comment on column T_ZA_NB_DWJC.DJRJH
  is '登记人警号';
comment on column T_ZA_NB_DWJC.DJRXM
  is '登记人姓名';
comment on column T_ZA_NB_DWJC.DJRSFZH
  is '登记人身份证';
comment on column T_ZA_NB_DWJC.DJSJ
  is '登记时间';
comment on column T_ZA_NB_DWJC.DJDWDM
  is '登记单位代码';
comment on column T_ZA_NB_DWJC.DJDWMC
  is '登记单位名称';
comment on column T_ZA_NB_DWJC.CZRXM
  is '操作人姓名';
comment on column T_ZA_NB_DWJC.CZRJH
  is '操作人警号';
comment on column T_ZA_NB_DWJC.CZSJ
  is '操作时间';
comment on column T_ZA_NB_DWJC.CZDWDM
  is '操作单位代码';
comment on column T_ZA_NB_DWJC.CZDWMC
  is '操作单位名称';
comment on column T_ZA_NB_DWJC.CZBS
  is '操作标识';
comment on column T_ZA_NB_DWJC.SFSP
  is '是否审批（1：已审批 0：未审批）';
comment on column T_ZA_NB_DWJC.CZRSFZH
  is '操作人身份证';
comment on column T_ZA_NB_DWJC.JZZD01
  is '（内保重点单位）制定和落实内部治安保卫制度';
comment on column T_ZA_NB_DWJC.JZZD02
  is '（内保重点单位）制定单位内部治安突发事件处置紧急预案';
comment on column T_ZA_NB_DWJC.JZZD03
  is '（内保重点单位）组织开展紧急预案演练';
comment on column T_ZA_NB_DWJC.JZZD04
  is '（内保重点单位）设置治安保卫机构';
comment on column T_ZA_NB_DWJC.JZZD05
  is '（内保重点单位）配备专职保卫人员';
comment on column T_ZA_NB_DWJC.JZZD06
  is '（内保重点单位）落实内部治安保卫工作责任制';
comment on column T_ZA_NB_DWJC.JZZD07
  is '（内保重点单位）对员工安全防范培训';
comment on column T_ZA_NB_DWJC.JZZD08
  is '（内保重点单位）人员、物品、车辆出入登记手续';
comment on column T_ZA_NB_DWJC.JZSP01
  is '（内保重点单位）重点要害部位安装入侵报警系统';
comment on column T_ZA_NB_DWJC.JZSP02
  is '（内保重点单位）重点要害部位安装的入侵报警系统与市局110联网';
comment on column T_ZA_NB_DWJC.JZSP03
  is '（内保重点单位）重点要害部位安装视频监控';
comment on column T_ZA_NB_DWJC.JZSP04
  is '（内保重点单位）视频监控图像';
comment on column T_ZA_NB_DWJC.JZSP05
  is '（内保重点单位）回放图像质量';
comment on column T_ZA_NB_DWJC.JZSP06
  is '（内保重点单位）图像存储时间满足规定的30天期限要求';
comment on column T_ZA_NB_DWJC.JZSP07
  is '（内保重点单位）监控录制时间24小时';
comment on column T_ZA_NB_DWJC.JZBJ02
  is '（内保重点单位）重点区域安装周界报警';
comment on column T_ZA_NB_DWJC.JZBJ08
  is '（内保重点单位）主要出入口门禁系统';
comment on column T_ZA_NB_DWJC.JZWF01
  is '（内保重点单位）重点要害部位出入口防盗门';
comment on column T_ZA_NB_DWJC.JZWF02
  is '（内保重点单位）重点要害部位防盗窗';
comment on column T_ZA_NB_DWJC.JZWF03
  is '（内保重点单位）财务室防盗门';
comment on column T_ZA_NB_DWJC.JZWF04
  is '（内保重点单位）财务室防盗窗';
comment on column T_ZA_NB_DWJC.JZWF05
  is '（内保重点单位）财务室保险箱是否与墙面或地面固定';
comment on column T_ZA_NB_DWJC.JZRF04
  is '（内保重点单位）重点要害部位值守力量是否到位';
comment on column T_ZA_NB_DWJC.J1ZD01
  is '（内保一般单位）制定和落实内部治安保卫制度';
comment on column T_ZA_NB_DWJC.J1ZD03
  is '（内保一般单位）落实内部治安保卫工作责任制';
comment on column T_ZA_NB_DWJC.J1ZD04
  is '（内保一般单位）落实员工安全防范培训教育';
comment on column T_ZA_NB_DWJC.J1ZD05
  is '（内保一般单位）人员物品出入登记手续';
comment on column T_ZA_NB_DWJC.J1JF01
  is '（内保一般单位）重点要害部位安装视频监控或入侵报警系统';
comment on column T_ZA_NB_DWJC.J1JF02
  is '（内保一般单位）视频监控或入侵报警系统运转正常';
comment on column T_ZA_NB_DWJC.J1WF01
  is '（内保一般单位）重点要害部位出入口防盗门';
comment on column T_ZA_NB_DWJC.J1WF02
  is '（内保一般单位）重点要害部位防盗窗';
comment on column T_ZA_NB_DWJC.J1WF03
  is '（内保一般单位）财务室防盗门';
comment on column T_ZA_NB_DWJC.J1WF04
  is '（内保一般单位）财务室防盗窗';
comment on column T_ZA_NB_DWJC.J1RF01
  is '（内保一般单位）配备足够数量的安保人员';
comment on column T_ZA_NB_DWJC.J1RF02
  is '（内保一般单位）进行上岗前培训和定期开展培训';
comment on column T_ZA_NB_DWJC.J1RF03
  is '（内保一般单位）配备使用防卫器械和报警装备';
comment on column T_ZA_NB_DWJC.J1BA01
  is '（内保一般单位）保安员全部持《保安员证》上岗';
comment on column T_ZA_NB_DWJC.J1BA02
  is '（内保一般单位）定期开展教育、培训';
comment on column T_ZA_NB_DWJC.J1BA03
  is '（内保一般单位）保安员是否着符合要求的保安员服装上岗';
comment on column T_ZA_NB_DWJC.J1BA04
  is '（内保一般单位）保安员是否认真履职，有较强的安全防范意识';
comment on column T_ZA_NB_DWJC.DZZD01
  is '（内保党政机关）制定和落实内部治安保卫制度及工作责任制';
comment on column T_ZA_NB_DWJC.DZZD02
  is '（内保党政机关）制定突发事件处置紧急预案并组织开展演练';
comment on column T_ZA_NB_DWJC.DZZD03
  is '（内保党政机关）落实员工安全防范培训教育';
comment on column T_ZA_NB_DWJC.DZZD04
  is '（内保党政机关）门卫实行人员物品出入查验登记手续';
comment on column T_ZA_NB_DWJC.DZJF01
  is '（内保党政机关）机关大院主要出入口安装视频监控';
comment on column T_ZA_NB_DWJC.DZJF02
  is '（内保党政机关）重点要害部位安装视频监控和入侵报警';
comment on column T_ZA_NB_DWJC.DZJF03
  is '（内保党政机关）公共部门主要通道安装视频监控';
comment on column T_ZA_NB_DWJC.DZJF04
  is '（内保党政机关）车库（地下车库）安装视频监控装置';
comment on column T_ZA_NB_DWJC.DZJF05
  is '（内保党政机关）设置周界报警装置';
comment on column T_ZA_NB_DWJC.DZJF06
  is '（内保党政机关）设置监控中心，对重要防护部位24小时实时报警';
comment on column T_ZA_NB_DWJC.DZJF07
  is '（内保党政机关）重点要害部位、办公大楼出入口安装门禁控制装置';
comment on column T_ZA_NB_DWJC.DZJF08
  is '（内保党政机关）视频监控和回放图像质量、图像存储时间、监控录制时间达标情况';
comment on column T_ZA_NB_DWJC.DZWF01
  is '（内保党政机关）机关大院出入口安装门禁门';
comment on column T_ZA_NB_DWJC.DZWF02
  is '（内保党政机关）重点要害部位出入口安装防盗门';
comment on column T_ZA_NB_DWJC.DZWF03
  is '（内保党政机关）重点要害部位安装防盗门、防盗窗';
comment on column T_ZA_NB_DWJC.DZRF01
  is '（内保党政机关）设置治安保卫机构并配备专职保卫人员';
comment on column T_ZA_NB_DWJC.DZRF02
  is '（内保党政机关）出入口设值班室、专职门卫';
comment on column T_ZA_NB_DWJC.DZRF03
  is '（内保党政机关）配备使用防卫器械和报警装备';
comment on column T_ZA_NB_DWJC.DZRF04
  is '（内保党政机关）设置保卫力量巡逻巡更设备';
comment on column T_ZA_NB_DWJC.JZBA01
  is '（内保重点单位）保安员全部持《保安员证》上岗';
comment on column T_ZA_NB_DWJC.JZBA02
  is '（内保重点单位）定期开展教育、培训';
comment on column T_ZA_NB_DWJC.JZBA03
  is '（内保重点单位）保安员是否着符合要求的保安员服装上岗';
comment on column T_ZA_NB_DWJC.JZBA04
  is '（内保重点单位）保安员是否认真履职，有较强的安全防范意识';
comment on column T_ZA_NB_DWJC.WSZD01
  is '（内保卫生系统）制定和落实内部治安保卫制度及工作责任制';
comment on column T_ZA_NB_DWJC.WSZD02
  is '（内保卫生系统）制定突发事件处置紧急预案并组织开展演练';
comment on column T_ZA_NB_DWJC.WSZD03
  is '（内保卫生系统）落实员工安全防范培训教育';
comment on column T_ZA_NB_DWJC.WSZD04
  is '（内保卫生系统）设立警务室';
comment on column T_ZA_NB_DWJC.WSJS01
  is '（内保卫生系统）医院出入口及主要通道安装视频监控';
comment on column T_ZA_NB_DWJC.WSJS02
  is '（内保卫生系统）停车场或地下机动车库通往地面的出口处安装视频监控';
comment on column T_ZA_NB_DWJC.WSJS03
  is '（内保卫生系统）挂号、收费或现金结算处安装视频监控';
comment on column T_ZA_NB_DWJC.WSJS04
  is '（内保卫生系统）门急诊输液室、急诊抢救室、重症监护室安装视频监控';
comment on column T_ZA_NB_DWJC.WSJS05
  is '（内保卫生系统）药库房和放射源或剧毒麻醉药品存放地安装视频监控及入侵报警系统';
comment on column T_ZA_NB_DWJC.WSJS06
  is '（内保卫生系统）电梯、配电间、贵重仪器设备存放地安装视频监控';
comment on column T_ZA_NB_DWJC.WSJS07
  is '（内保卫生系统）病区过道走廊以及医患沟通部门安装视频监控';
comment on column T_ZA_NB_DWJC.WSJS08
  is '（内保卫生系统）重症监护室、院长办公室安装门禁装置';
comment on column T_ZA_NB_DWJC.WSJS09
  is '（内保卫生系统）设置安防控制中心，图像回放质量、图像存储时间、监控录制时间均应达标';
comment on column T_ZA_NB_DWJC.WSWF01
  is '（内保卫生系统）医院周界封闭屏障应安装金属防护栏或实体墙';
comment on column T_ZA_NB_DWJC.WSWF02
  is '（内保卫生系统）药库房、剧毒精麻药品存放地、放射源、中心供氧站、配电间、挂号收费处、安防控制中心等部位应安装防盗门和金属防护栏';
comment on column T_ZA_NB_DWJC.WSRF01
  is '（内保卫生系统）设置与治安保卫任务相适应的治安保卫机构';
comment on column T_ZA_NB_DWJC.WSRF02
  is '（内保卫生系统）配备专职保卫人员';
comment on column T_ZA_NB_DWJC.WSRF03
  is '（内保卫生系统）安防控制中心有专人值守并做好值班记录';
comment on column T_ZA_NB_DWJC.WSBA01
  is '（内保卫生系统）保安员全部持《保安员证》上岗';
comment on column T_ZA_NB_DWJC.WSBA02
  is '（内保卫生系统）定期开展教育、培训';
comment on column T_ZA_NB_DWJC.WSBA03
  is '（内保卫生系统）保安员是否着符合要求的保安员服装上岗';
comment on column T_ZA_NB_DWJC.WSBA04
  is '（内保卫生系统）保安员是否认真履职，有较强的安全防范意识';
comment on column T_ZA_NB_DWJC.GXZD01
  is '（内保高校检查）制定和落实内部治安保卫制度及工作责任制';
comment on column T_ZA_NB_DWJC.GXZD02
  is '（内保高校检查）针对各类突发事件、灾害事件、安全事故等制定紧急处置预案';
comment on column T_ZA_NB_DWJC.GXZD03
  is '（内保高校检查）根据预案每年至少组织一次演练';
comment on column T_ZA_NB_DWJC.GXZD04
  is '（内保高校检查）落实师生及员工的安全防范培训教育';
comment on column T_ZA_NB_DWJC.GXJF01
  is '（内保高校检查）学校主要出入口安装视频监控';
comment on column T_ZA_NB_DWJC.GXJF02
  is '（内保高校检查）重点要害部位安装视频监控';
comment on column T_ZA_NB_DWJC.GXJF03
  is '（内保高校检查）重点要害部位安装入侵报警装置';
comment on column T_ZA_NB_DWJC.GXJF04
  is '（内保高校检查）校内公共部位主要通道安装视频监控';
comment on column T_ZA_NB_DWJC.GXJF05
  is '（内保高校检查）停车场、车库（地下车库）安装视频监控装置';
comment on column T_ZA_NB_DWJC.GXJF06
  is '（内保高校检查）设置监控中心并24小时值守';
comment on column T_ZA_NB_DWJC.GXJF07
  is '（内保高校检查）视频监控和回放图像质量清晰，监控24小时录像，存储时间不少于30天';
comment on column T_ZA_NB_DWJC.GXJF08
  is '（内保高校检查）学校所属的学生宿舍（公寓）出入口安装门禁系统';
comment on column T_ZA_NB_DWJC.GXWF01
  is '（内保高校检查）学校主要出入口安装防撞击金属门';
comment on column T_ZA_NB_DWJC.GXWF02
  is '（内保高校检查）学校主要出入口、主干道设置机动车减速装置';
comment on column T_ZA_NB_DWJC.GXWF03
  is '（内保高校检查）重点要害部位安装符合标准的防盗门、窗或金属护栏';
comment on column T_ZA_NB_DWJC.GXWF04
  is '（内保高校检查）财务室保险箱与墙面或地面固定';
comment on column T_ZA_NB_DWJC.GXWF05
  is '（内保高校检查）对供水、供电、供气、供热、供油等场所、部位设置相应的实体防护设施';
comment on column T_ZA_NB_DWJC.GXWF06
  is '（内保高校检查）对高台、楼梯、水域等易发生坠落、踩踏、溺水等安全事故的场所、部位设置警示标志和相应的防护设施';
comment on column T_ZA_NB_DWJC.GXRF01
  is '（内保高校检查）设置专职安全保卫机构';
comment on column T_ZA_NB_DWJC.GXRF02
  is '（内保高校检查）配备专职保卫力量和保安人员';
comment on column T_ZA_NB_DWJC.GXRF03
  is '（内保高校检查）主要出入口保安（门卫）人员24小时在岗';
comment on column T_ZA_NB_DWJC.GXRF04
  is '（内保高校检查）主要出入口保安（门卫）人员对外来人员、车辆实行登记、确认、查验管理';
comment on column T_ZA_NB_DWJC.GXBA01
  is '（内保高校检查）保安员全部持《保安员证》上岗';
comment on column T_ZA_NB_DWJC.GXBA02
  is '（内保高校检查）定期开展教育、培训';
comment on column T_ZA_NB_DWJC.GXBA03
  is '（内保高校检查）保安员是否着符合要求的保安员服装上岗';
comment on column T_ZA_NB_DWJC.GXBA04
  is '（内保高校检查）保安员是否认真履职，有较强的安全防范意识';
comment on column T_ZA_NB_DWJC.JRZD01
  is '(银行、金融机构-内保民警)制定和落实内部治安保卫制度';
comment on column T_ZA_NB_DWJC.JRZD02
  is '(银行、金融机构-内保民警)制定单位内部治安突发事件处置紧急预案';
comment on column T_ZA_NB_DWJC.JRZD03
  is '(银行、金融机构-内保民警)组织开展紧急预案演练';
comment on column T_ZA_NB_DWJC.JRZD04
  is '(银行、金融机构-内保民警)设置治安保卫机构';
comment on column T_ZA_NB_DWJC.JRZD05
  is '(银行、金融机构-内保民警)配备专职保卫人员或兼职保卫人员';
comment on column T_ZA_NB_DWJC.JRZD06
  is '(银行、金融机构-内保民警)落实内部治安保卫工作责任制';
comment on column T_ZA_NB_DWJC.JRZD07
  is '(银行、金融机构-内保民警)对员工安全防范培训';
comment on column T_ZA_NB_DWJC.JRJF01
  is '(银行、金融机构-内保民警)营业网点大厅、库包交接视频监控全覆盖';
comment on column T_ZA_NB_DWJC.JRJF02
  is '(银行、金融机构-内保民警)营业网点出入口现金和非现金区域安装视频监控（含隐蔽探头）';
comment on column T_ZA_NB_DWJC.JRJF03
  is '(银行、金融机构-内保民警)营业网点大厅、出入口、现金区域、沿街门窗安装入侵报警';
comment on column T_ZA_NB_DWJC.JRJF04
  is '(银行、金融机构-内保民警)现金和非现金柜台安装紧急按钮';
comment on column T_ZA_NB_DWJC.JRJF05
  is '(银行、金融机构-内保民警)自助银行应安装环境、门外、现金装填区域视频监控';
comment on column T_ZA_NB_DWJC.JRJF06
  is '(银行、金融机构-内保民警)自助银行能实现报警图像、声音、对讲广播等信息的远程传输和监控功能';
comment on column T_ZA_NB_DWJC.JRJF07
  is '(银行、金融机构-内保民警)自助银行安装紧急求助按钮或求助电话及防电信诈骗语音提示';
comment on column T_ZA_NB_DWJC.JRJF08
  is '(银行、金融机构-内保民警)自助银行现金装填区安装有、无线入侵报警';
comment on column T_ZA_NB_DWJC.JRJF09
  is '(银行、金融机构-内保民警)视频监控回放图像清晰，保存时间不少于30天，实现远程监控';
comment on column T_ZA_NB_DWJC.JRJF10
  is '(银行、金融机构-内保民警)自助设备视频监控系统具有自检功能，死机时能自动重启';
comment on column T_ZA_NB_DWJC.JRJF11
  is '(银行、金融机构-内保民警)自助设备电子屏幕显示必要的安全提示';
comment on column T_ZA_NB_DWJC.JRJF12
  is '(银行、金融机构-内保民警)离行式自助设备安装环境视频监控及防电信诈骗语音提示';
comment on column T_ZA_NB_DWJC.JRJF13
  is '(银行、金融机构-内保民警)离行式自助设备安装防撬和入侵报警装置';
comment on column T_ZA_NB_DWJC.JRJF14
  is '(银行、金融机构-内保民警)其他技防符合GA38-2004、GA745-2008规定';
comment on column T_ZA_NB_DWJC.JRWF01
  is '(银行、金融机构-内保民警)营业网点出入口防盗门 ';
comment on column T_ZA_NB_DWJC.JRWF02
  is '(银行、金融机构-内保民警)营业网点二层（含二层）以下防盗窗或防弹玻璃';
comment on column T_ZA_NB_DWJC.JRWF03
  is '(银行、金融机构-内保民警)自助设备与安装地面牢固连接';
comment on column T_ZA_NB_DWJC.JRWF04
  is '(银行、金融机构-内保民警)自助设备各种外接线缆有防护措施，接插件应置于封闭的刚性防护体内';
comment on column T_ZA_NB_DWJC.JRWF05
  is '(银行、金融机构-内保民警)离行式自助设备加钞区应在砖墙或钢质封闭区内';
comment on column T_ZA_NB_DWJC.JRWF06
  is '(银行、金融机构-内保民警)其他物防符合GA38-2004、GA745-2008规定';
comment on column T_ZA_NB_DWJC.JRRF01
  is '(银行、金融机构-内保民警)配备专职保卫人员';
comment on column T_ZA_NB_DWJC.JRRF02
  is '(银行、金融机构-内保民警)定期开展教育、培训';
comment on column T_ZA_NB_DWJC.JRRF03
  is '(银行、金融机构-内保民警)配备使用防卫器械和报警装备';
comment on column T_ZA_NB_DWJC.JRRF04
  is '(银行、金融机构-内保民警)保卫力量巡逻巡更设备';
comment on column T_ZA_NB_DWJC.JR_JZBA01
  is '(银行、金融机构-内保民警)保安员全部持《保安员证》上岗';
comment on column T_ZA_NB_DWJC.JR_JZBA02
  is '(银行、金融机构-内保民警)定期开展教育、培训 ';
comment on column T_ZA_NB_DWJC.JR_JZBA03
  is '(银行、金融机构-内保民警)保安员是否着符合要求的保安员服装上岗';
comment on column T_ZA_NB_DWJC.JR_JZBA04
  is '(银行、金融机构-内保民警)保安员是否认真履职，有较强的安全防范意识';
comment on column T_ZA_NB_DWJC.JZRF01
  is '（内保重点单位）配备足够数量的安保人员';
comment on column T_ZA_NB_DWJC.JZRF02
  is '（内保重点单位）进行上岗前培训和定期开展培训';
comment on column T_ZA_NB_DWJC.JZRF03
  is '（内保重点单位）配备使用防卫器械和报警装备';
comment on column T_ZA_NB_DWJC.DZBA01
  is '（内保党政机关）保安员全部持《保安员证》上岗';
comment on column T_ZA_NB_DWJC.DZBA02
  is '（内保党政机关）定期开展教育、培训';
comment on column T_ZA_NB_DWJC.DZBA03
  is '（内保党政机关）保安员是否着符合要求的保安员服装上岗';
comment on column T_ZA_NB_DWJC.DZBA04
  is '（内保党政机关）保安员是否认真履职，有较强的安全防范意识';
comment on column T_ZA_NB_DWJC.YHZD01
  is '(银行、金融机构-社区民警)单位内部治安突发事件处置紧急预案';
comment on column T_ZA_NB_DWJC.YHZD02
  is '(银行、金融机构-社区民警)组织开展紧急预案演练';
comment on column T_ZA_NB_DWJC.YHZD03
  is '(银行、金融机构-社区民警)组织员工安全保卫学习';
comment on column T_ZA_NB_DWJC.YHJF01
  is '(银行、金融机构-社区民警)营业网点门前和大厅安装视频监控';
comment on column T_ZA_NB_DWJC.YHJF02
  is '(银行、金融机构-社区民警)营业网点大厅安装入侵报警';
comment on column T_ZA_NB_DWJC.YHJF04
  is '(银行、金融机构-社区民警)营业网点出入口和沿街窗户安装入侵报警';
comment on column T_ZA_NB_DWJC.YHJF05
  is '(银行、金融机构-社区民警)自助银行应安装环境、门外视频监控';
comment on column T_ZA_NB_DWJC.YHJF06
  is '(银行、金融机构-社区民警)自助银行安装紧急求助按钮或求助电话及防电信诈骗语音提示';
comment on column T_ZA_NB_DWJC.YHWF01
  is '(银行、金融机构-社区民警)营业网点出入口防盗门';
comment on column T_ZA_NB_DWJC.YHWF02
  is '(银行、金融机构-社区民警)营业网点二层（含二层）以下防盗窗或防弹玻璃';
comment on column T_ZA_NB_DWJC.YHRF01
  is '(银行、金融机构-社区民警)配备专职（兼职）保卫人员';
comment on column T_ZA_NB_DWJC.YHRF02
  is '(银行、金融机构-社区民警)定期开展培训';
comment on column T_ZA_NB_DWJC.YHRF03
  is '(银行、金融机构-社区民警)配备使用防卫器械和报警装备';
comment on column T_ZA_NB_DWJC.YH_JZBA01
  is '(银行、金融机构-社区民警)保安员全部持《保安员证》上岗';
comment on column T_ZA_NB_DWJC.YH_JZBA02
  is '(银行、金融机构-社区民警)定期开展教育、培训 ';
comment on column T_ZA_NB_DWJC.YH_JZBA03
  is '(银行、金融机构-社区民警)保安员是否着符合要求的保安员服装上岗 ';
comment on column T_ZA_NB_DWJC.YH_JZBA04
  is '(银行、金融机构-社区民警)保安员是否认真履职，有较强的安全防范意识';
comment on column T_ZA_NB_DWJC.JYZD01
  is '(三电油气)成立安全防范领导小组';
comment on column T_ZA_NB_DWJC.JYZD02
  is '(三电油气)值班守护制度';
comment on column T_ZA_NB_DWJC.JYZD03
  is '(三电油气)收费管理制度';
comment on column T_ZA_NB_DWJC.JYZD04
  is '(三电油气)现金管理制度';
comment on column T_ZA_NB_DWJC.JYZD05
  is '(三电油气)防范设施管理制度';
comment on column T_ZA_NB_DWJC.JYZD06
  is '(三电油气)处置突发事件预案';
comment on column T_ZA_NB_DWJC.JYZD07
  is '(三电油气)消防、安全生产(经营)制度 ';
comment on column T_ZA_NB_DWJC.JYZD08
  is '(三电油气)组织处置突发事件演练';
comment on column T_ZA_NB_DWJC.JYZD09
  is '(三电油气)对员工安全防范培训';
comment on column T_ZA_NB_DWJC.JYSP01
  is '(三电油气)加油(气)站出入口安装视频监控';
comment on column T_ZA_NB_DWJC.JYSP02
  is '(三电油气)收费处(现金存放室)IC卡充值安装视频监控';
comment on column T_ZA_NB_DWJC.JYSP03
  is '(三电油气)加油区、油库(罐)区等重要部位安装视频监控';
comment on column T_ZA_NB_DWJC.JYSP04
  is '(三电油气)视频监控图像';
comment on column T_ZA_NB_DWJC.JYSP05
  is '(三电油气)视频监控图像回放';
comment on column T_ZA_NB_DWJC.JYSP06
  is '(三电油气)监控录制时间24小时 ';
comment on column T_ZA_NB_DWJC.JYSP07
  is '(三电油气)图像存储时间满足规定的30天期限要求';
comment on column T_ZA_NB_DWJC.JYSP08
  is '(三电油气)视频监控是否与公安联网';
comment on column T_ZA_NB_DWJC.JYBJ01
  is '(三电油气)具备入侵条件的油库(罐)区入侵警报装置';
comment on column T_ZA_NB_DWJC.JYBJ02
  is '(三电油气)入侵警报装置与公安局110联网或与值班室联网';
comment on column T_ZA_NB_DWJC.JYBJ03
  is '(三电油气)重要部门入侵警报装置';
comment on column T_ZA_NB_DWJC.JYBJ04
  is '(三电油气)收费处、IC卡充值紧急报警按钮';
comment on column T_ZA_NB_DWJC.JYBJ05
  is '(三电油气)紧急报警按钮与公安110联网';
comment on column T_ZA_NB_DWJC.JYWF01
  is '(三电油气)收费处(现金存放室)IC卡充值出入口防盗门';
comment on column T_ZA_NB_DWJC.JYWF02
  is '(三电油气)收费柜台上方安装金属防护栏或防弹玻璃 ';
comment on column T_ZA_NB_DWJC.JYWF03
  is '(三电油气)收费处(现金存放室)IC卡充值窗口金属防护栏';
comment on column T_ZA_NB_DWJC.JYWF04
  is '(三电油气)油库(罐)区应对加、取油口等部位采取防破坏、防盗窃防护措施';
comment on column T_ZA_NB_DWJC.JYRF01
  is '(三电油气)配备专职保卫人员(1:聘请保安,2:聘请物业,3:自建防护力量)';
comment on column T_ZA_NB_DWJC.JYRF02
  is '(三电油气)佩戴防卫装备';
comment on column T_ZA_NB_DWJC.JY_JZBA01
  is '(三电油气)保安员全部持《保安员证》上岗';
comment on column T_ZA_NB_DWJC.JY_JZBA02
  is '(三电油气)定期开展教育、培训';
comment on column T_ZA_NB_DWJC.JY_JZBA03
  is '(三电油气)保安员是否着符合要求的保安员服装上岗 ';
comment on column T_ZA_NB_DWJC.JY_JZBA04
  is '(三电油气)保安员是否认真履职，有较强的安全防范意识';
comment on column T_ZA_NB_DWJC.ZBZD01
  is '(大型商场超市、金银珠宝店检查表)制定单位内部治安突发事件处置紧急预案';
comment on column T_ZA_NB_DWJC.ZBZD02
  is '(大型商场超市、金银珠宝店检查表)组织开展紧急预案演练 ';
comment on column T_ZA_NB_DWJC.ZBZD03
  is '(大型商场超市、金银珠宝店检查表)制定和落实内部治安保卫制度';
comment on column T_ZA_NB_DWJC.ZBZD04
  is '(大型商场超市、金银珠宝店检查表)落实内部治安保卫工作责任制';
comment on column T_ZA_NB_DWJC.ZBZD05
  is '(大型商场超市、金银珠宝店检查表)对员工安全防范培训';
comment on column T_ZA_NB_DWJC.ZBSP01
  is '(大型商场超市、金银珠宝店检查表)视频监控';
comment on column T_ZA_NB_DWJC.ZBSP02
  is '(大型商场超市、金银珠宝店检查表)门前环境视频监控';
comment on column T_ZA_NB_DWJC.ZBSP03
  is '(大型商场超市、金银珠宝店检查表)视频监控图像';
comment on column T_ZA_NB_DWJC.ZBSP04
  is '(大型商场超市、金银珠宝店检查表)视频监控图像回放';
comment on column T_ZA_NB_DWJC.ZBSP05
  is '(大型商场超市、金银珠宝店检查表)图像存储时间满足规定的30天期限要求';
comment on column T_ZA_NB_DWJC.ZBSP06
  is '(大型商场超市、金银珠宝店检查表)监控录制时间24小时';
comment on column T_ZA_NB_DWJC.ZBSP07
  is '(大型商场超市、金银珠宝店检查表)视频监控存在盲区';
comment on column T_ZA_NB_DWJC.ZBBJ01
  is '(大型商场超市、金银珠宝店检查表)入侵报警';
comment on column T_ZA_NB_DWJC.ZBBJ02
  is '(大型商场超市、金银珠宝店检查表)入侵报警存在盲区';
comment on column T_ZA_NB_DWJC.ZBBJ03
  is '(大型商场超市、金银珠宝店检查表)紧急报警按钮';
comment on column T_ZA_NB_DWJC.ZBBJ04
  is '(大型商场超市、金银珠宝店检查表)紧急报警按钮安装位置符合要求情况';
comment on column T_ZA_NB_DWJC.ZBBJ05
  is '(大型商场超市、金银珠宝店检查表)入侵报警与公安110联网';
comment on column T_ZA_NB_DWJC.ZBBJ06
  is '(大型商场超市、金银珠宝店检查表)紧急报警按钮与公安110联网';
comment on column T_ZA_NB_DWJC.ZBWF01
  is '(大型商场超市、金银珠宝店检查表)金银珠宝饰品柜台安装防砸玻璃';
comment on column T_ZA_NB_DWJC.ZBWF02
  is '(大型商场超市、金银珠宝店检查表)营业柜台有进出柜台门并上锁';
comment on column T_ZA_NB_DWJC.ZBWF03
  is '(大型商场超市、金银珠宝店检查表)夜间金银饰品存放专用保险箱';
comment on column T_ZA_NB_DWJC.ZBWF04
  is '(大型商场超市、金银珠宝店检查表)保险箱与地面或墙面固定';
comment on column T_ZA_NB_DWJC.ZBRF01
  is '(大型商场超市、金银珠宝店检查表)配备专职或兼职保卫人员';
comment on column T_ZA_NB_DWJC.ZBRF02
  is '(大型商场超市、金银珠宝店检查表)配备防护装备';
comment on column T_ZA_NB_DWJC.SC_JZBA01
  is '(大型商场超市、金银珠宝店检查表)保安员全部持《保安员证》上岗';
comment on column T_ZA_NB_DWJC.SC_JZBA02
  is '(大型商场超市、金银珠宝店检查表)定期开展教育、培训';
comment on column T_ZA_NB_DWJC.SC_JZBA03
  is '(大型商场超市、金银珠宝店检查表)保安员是否着符合要求的保安员服装上岗';
comment on column T_ZA_NB_DWJC.SC_JZBA04
  is '(大型商场超市、金银珠宝店检查表)保安员是否认真履职，有较强的安全防范意识';
comment on column T_ZA_NB_DWJC.WHZD01
  is '(文化部门)制定和落实内部治安保卫制度及工作责任制';
comment on column T_ZA_NB_DWJC.WHZD02
  is '(文化部门)制定突发事件处置紧急预案并组织开展演练';
comment on column T_ZA_NB_DWJC.WHZD03
  is '(文化部门)落实员工安全防范培训教育';
comment on column T_ZA_NB_DWJC.WHZD04
  is '(文化部门)门卫实行人员物品出入查验登记手续';
comment on column T_ZA_NB_DWJC.WHJF01
  is '(文化部门)单位主要出入口及通道安装视频监控';
comment on column T_ZA_NB_DWJC.WHJF02
  is '(文化部门)车库（地下车库）安装视频监控装置';
comment on column T_ZA_NB_DWJC.WHJF03
  is '(文化部门)单位重点要害部位安装视频监控和入侵报警';
comment on column T_ZA_NB_DWJC.WHJF04
  is '(文化部门)设置周界报警装置';
comment on column T_ZA_NB_DWJC.WHJF05
  is '(文化部门)设置监控中心，对重要防护部位24小时实时报警';
comment on column T_ZA_NB_DWJC.WHJF06
  is '(文化部门)视频监控和回放图像质量、图像存储时间、监控录制时间达标情况';
comment on column T_ZA_NB_DWJC.WHWF01
  is '(文化部门)单位出入口安装门禁门';
comment on column T_ZA_NB_DWJC.WHWF02
  is '(文化部门)重点要害部位出入口安装防盗门、防盗窗';
comment on column T_ZA_NB_DWJC.WHRF01
  is '(文化部门)设置与治安保卫任务相适应的治安保卫机构';
comment on column T_ZA_NB_DWJC.WHRF02
  is '(文化部门)配备专职保卫人员';
comment on column T_ZA_NB_DWJC.WHRF03
  is '(文化部门)单位出入口设值班室、配专职门卫';
comment on column T_ZA_NB_DWJC.WHRF04
  is '(文化部门)配备使用防卫器械和报警装备 ';
comment on column T_ZA_NB_DWJC.WHRF05
  is '(文化部门)设置保卫力量巡逻巡更设备';
comment on column T_ZA_NB_DWJC.WH_JZBA01
  is '(文化部门)保安员全部持《保安员证》上岗';
comment on column T_ZA_NB_DWJC.WH_JZBA02
  is '(文化部门)定期开展教育、培训';
comment on column T_ZA_NB_DWJC.WH_JZBA03
  is '(文化部门)保安员是否着符合要求的保安员服装上岗';
comment on column T_ZA_NB_DWJC.WH_JZBA04
  is '(文化部门)保安员是否认真履职，有较强的安全防范意识';
comment on column T_ZA_NB_DWJC.XXZD01
  is '(中小学幼儿园检查表)校园封闭式管理是否落实到位';
comment on column T_ZA_NB_DWJC.XXZD02
  is '(中小学幼儿园检查表)门卫制度是否严格执行';
comment on column T_ZA_NB_DWJC.XXZD03
  is '(中小学幼儿园检查表)是否制定保卫制度';
comment on column T_ZA_NB_DWJC.XXZD04
  is '(中小学幼儿园检查表)上学、放学时段单位护校人员是否到岗';
comment on column T_ZA_NB_DWJC.XXZD05
  is '(中小学幼儿园检查表)预案与演练是否制定和开展';
comment on column T_ZA_NB_DWJC.XXZD06
  is '(中小学幼儿园检查表)校园周边巡防力量是否到位';
comment on column T_ZA_NB_DWJC.XXJF01
  is '(中小学幼儿园检查表)护卫装备是否配备齐全（两种以上）';
comment on column T_ZA_NB_DWJC.XXJF02
  is '(中小学幼儿园检查表)110联网紧急报警系统是否安装';
comment on column T_ZA_NB_DWJC.XXJF03
  is '(中小学幼儿园检查表)视频监控安装情况';
comment on column T_ZA_NB_DWJC.XXJF04
  is '(中小学幼儿园检查表)周界报警安装情况';
comment on column T_ZA_NB_DWJC.XXWF01
  is '(中小学幼儿园检查表)主要出入口安装金属防护门';
comment on column T_ZA_NB_DWJC.XXWF02
  is '(中小学幼儿园检查表)重要部位安装符合国家标准的防盗门';
comment on column T_ZA_NB_DWJC.XXWF03
  is '(中小学幼儿园检查表)重要部位窗户安装金属防护栏';
comment on column T_ZA_NB_DWJC.XXWF04
  is '(中小学幼儿园检查表)事故易发部位设置防护设施和警示标志';
comment on column T_ZA_NB_DWJC.XXWF05
  is '(中小学幼儿园检查表)供水、供电、供气、供热等部位设置实体防护装置';
comment on column T_ZA_NB_DWJC.XXRF01
  is '(中小学幼儿园检查表)配备专职保卫人员';
comment on column T_ZA_NB_DWJC.XXRF02
  is '(中小学幼儿园检查表)定期开展教育和培训';
comment on column T_ZA_NB_DWJC.XX_JZBA01
  is '(中小学幼儿园检查表)保安员全部持《保安员证》上岗';
comment on column T_ZA_NB_DWJC.XX_JZBA02
  is '(中小学幼儿园检查表)定期开展教育、培训';
comment on column T_ZA_NB_DWJC.XX_JZBA03
  is '(中小学幼儿园检查表)保安员是否着符合要求的保安员服装上岗';
comment on column T_ZA_NB_DWJC.XX_JZBA04
  is '(中小学幼儿园检查表)保安员是否认真履职，有较强的安全防范意识';
-- Create/Recreate primary, unique and foreign key constraints 
alter table T_ZA_NB_DWJC
  add primary key (ID)
  using index 
  tablespace TS_DT_SQJW
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

