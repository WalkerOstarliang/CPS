-- Create table
create table T_NBGL_WYXQFA
(
  orgcode VARCHAR2(12),
  wyxqid  VARCHAR2(25),
  wyxqmc  VARCHAR2(200),
  wygs    VARCHAR2(200),
  fas     NUMBER,
  tjrq    DATE,
  jssj    DATE
);
-- Add comments to the columns 
comment on column T_NBGL_WYXQFA.orgcode
  is '单位代码';
comment on column T_NBGL_WYXQFA.wyxqid
  is '物业小区ID';
comment on column T_NBGL_WYXQFA.wyxqmc
  is '物业小区名称';
comment on column T_NBGL_WYXQFA.wygs
  is '物业公司';
comment on column T_NBGL_WYXQFA.fas
  is '发案数';
  comment on column T_NBGL_WYXQFA.tjrq
  is '统计日期';
comment on column T_NBGL_WYXQFA.jssj
  is '计算时间';
  
CREATE OR REPLACE PROCEDURE P_EXEC_WYXQFAQS
--物业小区发案前十
 AS
BEGIN
	INSERT INTO t_nbgl_wyxqfa VALUE
		SELECT wyxq.ssjwqdm AS orgcode,
			   wyxq.id AS wyxqid,
			   wyxq.xqmc AS wyxqmc,
			   wyxq.wygs AS wygs,
			   nvl(fa.sl, 0) AS fas,
			   trunc(SYSDATE - 1, 'dd') AS tjrq,
			   SYSDATE AS jssj
		  FROM t_za_wyxq wyxq
		  LEFT JOIN (SELECT aj.fadddm，count(1) AS sl
					   FROM gawlzf.T_XSZAGLFX@to_cs_zfba_sc_vip aj,
							gawlzf.T_ajjbxxb@to_cs_zfba_sc_vip  jbxx
					  WHERE faddflag = '2'
						AND aj.actflag != '4'
						AND jbxx.anjianbianhao = aj.anjianbianhao
						AND fadddm IS NOT NULL
						AND fadddm != '9999999999999999999999'
						AND fadddm != '999999999999999999999999999'
						AND fadddm != 'JG999999999999999999'
						AND fadddm != 'JG9999999999999999999999999'
						AND trunc(to_date(jbxx.lianriqi, 'yyyymmddhh24miss'),
								  'dd') = trunc(SYSDATE - 1, 'dd')
						AND aj.anjianleixing = '1'
					  GROUP BY aj.fadddm) fa
			ON wyxq.id = fa.fadddm
		 WHERE wyxq.ywwygs = '1'
		   AND wyxq.zxbs = '0';
	COMMIT;
END P_EXEC_WYXQFAQS;
/

-- Create table
create table T_NBGL_WYXQFATJ
(
  orgcode VARCHAR2(12),
  orgname VARCHAR2(200),
  qjs     NUMBER,
  rsdq    NUMBER,
  dqjdc   NUMBER,
  dqmtc   NUMBER,
  dqddc   NUMBER,
  dqcncw  NUMBER,
  dq      NUMBER,
  zs      NUMBER,
  tjrq    DATE,
  jssj    DATE
);
-- Add comments to the columns 
comment on column T_NBGL_WYXQFATJ.orgcode
  is '单位代码';
comment on column T_NBGL_WYXQFATJ.orgname
  is '单位名称';
comment on column T_NBGL_WYXQFATJ.qjs
  is '抢劫抢夺';
comment on column T_NBGL_WYXQFATJ.rsdq
  is '入室盗窃';
comment on column T_NBGL_WYXQFATJ.dqjdc
  is '盗窃机动车';
comment on column T_NBGL_WYXQFATJ.dqmtc
  is '盗窃摩托车';
comment on column T_NBGL_WYXQFATJ.dqddc
  is '盗窃电动车';
comment on column T_NBGL_WYXQFATJ.dqcncw
  is '盗窃车内财物';
comment on column T_NBGL_WYXQFATJ.dq
  is '盗窃';
comment on column T_NBGL_WYXQFATJ.zs
  is '总数';
comment on column T_NBGL_WYXQFATJ.tjrq
  is '统计日期';
comment on column T_NBGL_WYXQFATJ.jssj
  is '计算时间';
CREATE OR REPLACE PROCEDURE p_exec_wyxqfatj
--抢劫/抢夺  入室盗窃  盗窃机动车  盗窃摩托车  盗窃电动车  盗窃车内财物  盗窃
 AS
	CURSOR cur_list IS
		SELECT dw.orgcode,
			   dw.orgname,
			   nvl(qj, 0) AS qjs,
			   nvl(rsdq, 0) AS rsdqs,
			   nvl(dqjdc, 0) AS dqjdcs,
			   nvl(dqmtc, 0) AS dqmtcs,
			   nvl(dqddc, 0) AS dqddcs,
			   nvl(dqcncw, 0) AS dqcncws,
			   nvl(qtdq, 0) AS qtdq,
			   nvl(zs, 0) AS zs
		  FROM t_common_organization_sjjs dw,
			   (SELECT xq.ssjwqdm,
					   CASE
						   WHEN (aj.anjianleibie LIKE '0501%' AND
								aj.anjianleibie ! = '05100006') OR
								aj.anjianleibie LIKE '050400%' THEN
							COUNT(1)
						   ELSE
							0
					   END qj,
					   CASE
						   WHEN aj.anjianleibie = '050280' OR
								aj.anjianleibie LIKE '050202%' THEN
							COUNT(1)
						   ELSE
							0
					   END rsdq,
					   CASE
						   WHEN aj.anjianleibie = '050206' THEN
							COUNT(1)
						   ELSE
							0
					   END dqjdc,
					   CASE
						   WHEN aj.anjianleibie = '050207' THEN
							COUNT(1)
						   ELSE
							0
					   END dqmtc,
					   CASE
						   WHEN aj.anjianleibie = '050223' THEN
							COUNT(1)
						   ELSE
							0
					   END dqddc,
					   CASE
						   WHEN aj.anjianleibie = '050210' THEN
							COUNT(1)
						   ELSE
							0
					   END dqcncw,
					   CASE
						   WHEN aj.anjianleibie != '050280' AND
								aj.anjianleibie != '050206' AND
								aj.anjianleibie != '050207' AND
								aj.anjianleibie != '050223' AND
								aj.anjianleibie != '050210' AND
								aj.anjianleibie NOT LIKE '050202%' THEN
							COUNT(1)
						   ELSE
							0
					   END qtdq,
					   CASE
						   WHEN aj.anjianleibie IS NOT NULL THEN
							COUNT(1)
						   ELSE
							0
					   END zs
				  FROM gawlzf.T_XSZAGLFX@to_cs_zfba_sc_vip aj,
					   gawlzf.T_ajjbxxb@to_cs_zfba_sc_vip  ajjbxx,
					   t_za_wyxq                           xq
				 WHERE faddflag = '2'
				   AND fadddm IS NOT NULL
				   AND fadddm != '9999999999999999999999'
				   AND fadddm != '999999999999999999999999999'
				   AND fadddm != 'JG999999999999999999'
				   AND fadddm != 'JG9999999999999999999999999'
				   AND xq.id = aj.fadddm
				   AND aj.actflag != '4'
				   AND aj.anjianleixing = '1'
				   AND ajjbxx.anjianbianhao = aj.anjianbianhao
				   AND xq.zxbs = '0'
				   AND trunc(to_date(ajjbxx.lianriqi, 'yyyymmddhh24miss'),
							 'dd') = trunc(SYSDATE - 1, 'dd')
				 GROUP BY ssjwqdm, aj.anjianleibie) aj
		 WHERE aj.ssjwqdm(+) = dw.orgcode
		   AND dw.leve = 5;
	TYPE listtype IS TABLE OF cur_list%ROWTYPE;
	v_list listtype;
BEGIN
	OPEN cur_list;
	LOOP
		FETCH cur_list BULK COLLECT
			INTO v_list LIMIT 100;
		EXIT WHEN v_list.count = 0;
		FOR i IN v_list.first .. v_list.last LOOP
			BEGIN
				INSERT INTO t_nbgl_wyxqfatj
					(orgcode,
					 orgname,
					 qjs,
					 rsdq,
					 dqjdc,
					 dqmtc,
					 dqddc,
					 dqcncw,
					 dq,
					 zs,
					 tjrq,
					 jssj)
				VALUES
					(v_list(i).orgcode,
					 v_list(i).orgname,
					 v_list(i).qjs,
					 v_list(i).rsdqs,
					 v_list(i).dqjdcs,
					 v_list(i).dqmtcs,
					 v_list(i).dqddcs,
					 v_list(i).dqcncws,
					 v_list(i).qtdq,
					 v_list(i).zs,
					 trunc(sysdate -1 ,'dd'),
					 SYSDATE);
			END;
		END LOOP;
		COMMIT;
	END LOOP;
END;
/

CREATE OR REPLACE FUNCTION f_get_wyxqsyfa(v_code VARCHAR2, v_date DATE)
--获取上月物业小区发案
 RETURN NUMBER AS
	v_orgleve NUMBER;
	v_total   NUMBER;
BEGIN
	v_orgleve := f_get_dwleve(v_code);
	IF v_orgleve = 5 THEN
		SELECT nvl(zs, 0)
		  INTO v_total
		  FROM t_nbgl_wyxqfatj
		 WHERE jssj >= trunc(add_months(v_date, -1), 'mm')
		   AND jssj < trunc(v_date, 'mm')
		   AND orgcode = v_code;
	ELSE
		SELECT nvl(SUM(zs), 0)
		  INTO v_total
		  FROM t_nbgl_wyxqfatj
		 WHERE jssj >= trunc(add_months(v_date, -1), 'mm')
		   AND jssj < trunc(v_date, 'mm')
		   AND orgcode LIKE substr(v_code, 1, 2 * v_orgleve) || '%';
	END IF;
	RETURN v_total;
END f_get_wyxqsyfa;
/ 

-- Create table
create table T_NBGL_NBDWFA
(
  orgcode VARCHAR2(12),
  orgname VARCHAR2(120),
  pq      NUMBER,
  rsdq    NUMBER,
  qtdq    NUMBER,
  qj      NUMBER,
  qtaj    NUMBER,
  dzjg    NUMBER,
  gx      NUMBER,
  zxxx    NUMBER,
  wsxt    NUMBER,
  sc      NUMBER,
  qy      NUMBER,
  yh      NUMBER,
  sdyq    NUMBER,
  zdgc    NUMBER,
  qt      NUMBER,
  tjrq    DATE,
  jssj    DATE
);
-- Add comments to the columns 
comment on column T_NBGL_NBDWFA.orgcode
  is '单位代码';
comment on column T_NBGL_NBDWFA.orgname
  is '单位名称';
comment on column T_NBGL_NBDWFA.pq
  is '扒窃';
comment on column T_NBGL_NBDWFA.rsdq
  is '入室盗窃';
comment on column T_NBGL_NBDWFA.qtdq
  is '其他盗窃';  
comment on column T_NBGL_NBDWFA.qj
  is '抢劫';
comment on column T_NBGL_NBDWFA.qtaj
  is '其他案件';
comment on column T_NBGL_NBDWFA.dzjg
  is '党政机关';
comment on column T_NBGL_NBDWFA.gx
  is '高校';
comment on column T_NBGL_NBDWFA.zxxx
  is '总校学校';
comment on column T_NBGL_NBDWFA.wsxt
  is '卫生系统';
comment on column T_NBGL_NBDWFA.sc
  is '商场';
comment on column T_NBGL_NBDWFA.qy
  is '企业';
comment on column T_NBGL_NBDWFA.yh
  is '银行';
comment on column T_NBGL_NBDWFA.sdyq
  is '三点油气';
comment on column T_NBGL_NBDWFA.zdgc
  is '重点工程';
comment on column T_NBGL_NBDWFA.qt
  is '其他';
comment on column T_NBGL_NBDWFA.tjrq
  is '统计日期';
comment on column T_NBGL_NBDWFA.jssj
  is '计算时间';

 
CREATE OR REPLACE PROCEDURE p_exec_nbdwfatj
--内保单位发案统计
 IS
	CURSOR cur_list IS
		SELECT org.orgcode,
			   org.orgname,
			   nvl(pq, 0) AS pq,
			   nvl(rsdq, 0) AS rsdq,
			   nvl(qtdq, 0) AS qtdq,
			   nvl(qj, 0) AS qj,
			   nvl(qtaj, 0) AS qtaj,
			   nvl(dzjg, 0) AS dzjg,
			   nvl(gx, 0) AS gx,
			   nvl(zxxx, 0) AS zxxx,
			   nvl(wsxt, 0) AS wsxt,
			   nvl(sc, 0) AS sc,
			   nvl(qy, 0) AS qy,
			   nvl(yh, 0) AS yh,
			   nvl(sdyq, 0) AS sdyq,
			   nvl(zdgc, 0) AS zdgc,
			   nvl(qt, 0) AS qt
		  FROM t_common_organization_sjjs org,
			   (SELECT a.djdwdm,
					   pq,
					   rsdq,
					   qtdq,
					   qj,
					   qtaj,
					   dzjg,
					   gx,
					   zxxx,
					   wsxt,
					   sc,
					   qy,
					   yh,
					   sdyq,
					   zdgc,
					   qt
				  FROM (SELECT djdwdm,
							   SUM(pq) AS pq,
							   SUM(rsdq) AS rsdq,
							   SUM(qtdq) AS qtdq,
							   SUM(qj) AS qj,
							   SUM(qt) AS qtaj
						  FROM (SELECT dw.djdwdm,
									   CASE
										   WHEN aj.anjianleibie LIKE '050201%' --扒窃
											THEN
											COUNT(1)
										   ELSE
											0
									   END pq,
									   CASE
										   WHEN aj.anjianleibie = '050280' OR
												aj.anjianleibie LIKE '050202%' --入室盗窃
											THEN
											COUNT(1)
										   ELSE
											0
									   END rsdq,
									   CASE
										   WHEN ((aj.anjianleibie LIKE '0502%' AND
												aj.anjianleibie NOT LIKE
												'050201%' AND aj.anjianleibie NOT LIKE
												'050202%' AND
												aj.anjianleibie NOT IN
												('050280', '050201')) OR
												aj.anjianleibie = '05100006') --其他盗窃
											THEN
											COUNT(1)
										   ELSE
											0
									   END qtdq,
									   CASE
										   WHEN (aj.anjianleibie LIKE '0501%' AND
												aj.anjianleibie ! = '05100006') OR
												aj.anjianleibie LIKE '050400%' THEN
											1
										   ELSE
											0
									   END qj, --抢劫抢夺
									   CASE
										   WHEN (aj.anjianleibie NOT LIKE
												'0502%' AND aj.anjianleibie NOT LIKE
												'050400%' AND aj.anjianleibie NOT LIKE
												'0501%') THEN
											1
										   ELSE
											0
									   END qt --其他
								  FROM gawlzf.T_XSZAGLFX@to_cs_zfba_sc_vip aj,
									   gawlzf.T_ajjbxxb@to_cs_zfba_sc_vip  ajjbxx，t_za_jg_jbxx dw
								 WHERE aj.anjianbianhao = ajjbxx.anjianbianhao
								   AND aj.faddflag = '1'
								   AND fadddm IS NOT NULL
								   AND aj.actflag != '4'
								   AND fadddm != 'JG9999999999999999999999999'
								   AND fadddm != 'JG999999999999999999'
								   AND dw.jgbh = aj.fadddm
								   AND aj.anjianleixing = '1'
								   AND dw.zxbs = '0'
								 GROUP BY aj.anjianleibie, djdwdm)
						 GROUP BY djdwdm) a,
					   (SELECT djdwdm,
							   dwfl,
							   CASE
								   WHEN dwfl = '001' THEN
									COUNT(1)
								   ELSE
									0
							   END dzjg, --党政机关
							   CASE
								   WHEN dwfl = '002' THEN
									COUNT(1)
								   ELSE
									0
							   END gx, --高校
							   CASE
								   WHEN dwfl = '003' THEN
									COUNT(1)
								   ELSE
									0
							   END zxxx, --中小学幼儿园
							   CASE
								   WHEN dwfl = '004' THEN
									COUNT(1)
								   ELSE
									0
							   END wsxt, --卫生系统
							   CASE
								   WHEN dwfl = '005' THEN
									COUNT(1)
								   ELSE
									0
							   END sc, --大型商场超市
							   CASE
								   WHEN dwfl = '006' THEN
									COUNT(1)
								   ELSE
									0
							   END qy, --大型企业
							   CASE
								   WHEN dwfl = '007' THEN
									COUNT(1)
								   ELSE
									0
							   END yh, --银行、金融机构
							   CASE
								   WHEN dwfl = '008' THEN
									COUNT(1)
								   ELSE
									0
							   END sdyq, --三电油气
							   CASE
								   WHEN dwfl = '009' THEN
									COUNT(1)
								   ELSE
									0
							   END zdgc, --重点工程
							   CASE
								   WHEN dwfl = '099' THEN
									COUNT(1)
								   ELSE
									0
							   END qt --其他
						  FROM gawlzf.T_XSZAGLFX@to_cs_zfba_sc_vip aj,
							   gawlzf.T_ajjbxxb@to_cs_zfba_sc_vip ajjbxx,
							   (SELECT hc.jgbh, hc.dwfl
								  FROM t_za_dwhc hc,
									   (SELECT jgbh, MAX(hcsj) AS hcsj
										  FROM t_za_dwhc
										 WHERE nbhc = '1'
										 GROUP BY jgbh) hc2
								 WHERE hc.jgbh = hc2.jgbh
								   AND hc.hcsj = hc2.hcsj) dw,
							   t_za_jg_jbxx dwjbxx
						 WHERE aj.anjianbianhao = ajjbxx.anjianbianhao
						   AND aj.faddflag = '1'
						   AND fadddm IS NOT NULL
						   AND aj.actflag != '4'
						   AND fadddm != 'JG9999999999999999999999999'
						   AND fadddm != 'JG999999999999999999'
						   AND dw.jgbh = aj.fadddm
						   AND dw.jgbh = dwjbxx.jgbh
						   AND aj.anjianleixing = '1'
						   AND trunc(to_date(ajjbxx.lianriqi,
											 'yyyymmddhh24miss'),
									 'dd') = trunc(SYSDATE - 1, 'dd')
						   AND dwjbxx.zxbs = '0'
						 GROUP BY djdwdm, dwfl) b
				 WHERE a.djdwdm = b.djdwdm) tj
		 WHERE org.orgcode = tj.djdwdm(+)
		   AND org.leve = 5;
	TYPE listtype IS TABLE OF cur_list%ROWTYPE;
	v_list listtype;
BEGIN
	OPEN cur_list;
	LOOP
		FETCH cur_list BULK COLLECT
			INTO v_list LIMIT 100;
		EXIT WHEN v_list.count = 0;
		FOR i IN v_list.first .. v_list.last LOOP
			BEGIN
				INSERT INTO t_nbgl_nbdwfa
					(orgcode,
					 orgname,
					 pq,
					 rsdq,
					 qtdq,
					 qj,
					 qtaj,
					 dzjg,
					 gx,
					 zxxx,
					 wsxt,
					 sc,
					 qy,
					 yh,
					 sdyq,
					 zdgc,
					 qt,
					 tjrq,
					 jssj)
				VALUES
					(v_list(i).orgcode,
					 v_list(i).orgname,
					 v_list(i).pq,
					 v_list(i).rsdq,
					 v_list(i).qtdq,
					 v_list(i).qj,
					 v_list(i).qtaj,
					 v_list(i).dzjg,
					 v_list(i).gx,
					 v_list(i).zxxx,
					 v_list(i).wsxt,
					 v_list(i).sc,
					 v_list(i).qy,
					 v_list(i).yh,
					 v_list(i).sdyq,
					 v_list(i).zdgc,
					 v_list(i).qt,
					 trunc(sysdate - 1 ,'dd'),
					 SYSDATE);
			END;
		END LOOP;
		COMMIT;
	END LOOP;
END;
/

-- Create table
create table T_NBGL_ZDDWFA
(
  jgbh VARCHAR2(27),
  dwmc VARCHAR2(200),
  pq   NUMBER,
  rsdq NUMBER,
  qtdq NUMBER,
  qj   NUMBER,
  qt   NUMBER,
  jssj DATE,
  tjrq DATE
);
-- Add comments to the columns 
comment on column T_NBGL_ZDDWFA.jgbh
  is '机构编号';
comment on column T_NBGL_ZDDWFA.dwmc
  is '单位名称';
comment on column T_NBGL_ZDDWFA.pq
  is '扒窃';
comment on column T_NBGL_ZDDWFA.rsdq
  is '入室盗窃';
comment on column T_NBGL_ZDDWFA.qtdq
  is '其他盗窃';
comment on column T_NBGL_ZDDWFA.qj
  is '抢劫抢夺';
comment on column T_NBGL_ZDDWFA.qt
  is '其他案件';
comment on column T_NBGL_ZDDWFA.jssj
  is '计算时间';
comment on column T_NBGL_ZDDWFA.tjrq
  is '统计日期';
/
CREATE OR REPLACE PROCEDURE p_exec_zddwfatj IS
	--重点单位发案统计
	CURSOR cur_list IS
		SELECT dw.jgbh,
			   dw.dwmc,
			   nvl(pq, 0) AS pq,
			   nvl(rsdq, 0) AS rsdq,
			   nvl(qtdq, 0) AS qtdq,
			   nvl(qj, 0) AS qj,
			   nvl(qt, 0) AS qt
		  FROM ((SELECT dw.*
				   FROM t_za_jg_jbxx dw,
						t_za_dwhc hc,
						(SELECT jgbh, MAX(hcsj) AS hcsj
						   FROM t_za_dwhc
						  WHERE nbhc = '1'
						  GROUP BY jgbh) hc2
				  WHERE hc.jgbh = hc2.jgbh
					AND hc.hcsj = hc2.hcsj
					AND nbhc = '1'
					AND hc.zddwbz = '2'
					AND dw.jgbh = hc.jgbh
					AND dw.zxbs = '0')) dw,
			   (SELECT fadddm,
					   CASE
						   WHEN aj.anjianleibie LIKE '050201%' --扒窃
							THEN
							COUNT(1)
						   ELSE
							0
					   END pq,
					   CASE
						   WHEN aj.anjianleibie = '050280' OR
								aj.anjianleibie LIKE '050202%' --入室盗窃
							THEN
							COUNT(1)
						   ELSE
							0
					   END rsdq,
					   CASE
						   WHEN ((aj.anjianleibie LIKE '0502%' AND
								aj.anjianleibie NOT LIKE '050201%' AND
								aj.anjianleibie NOT LIKE '050202%' AND
								aj.anjianleibie NOT IN ('050280', '050201')) OR
								aj.anjianleibie = '05100006') --其他盗窃
							THEN
							COUNT(1)
						   ELSE
							0
					   END qtdq,
					   CASE
						   WHEN (aj.anjianleibie LIKE '0501%' AND
								aj.anjianleibie ! = '05100006') OR
								aj.anjianleibie LIKE '050400%' THEN
							1
						   ELSE
							0
					   END qj, --抢劫抢夺
					   CASE
						   WHEN (aj.anjianleibie NOT LIKE '0502%' AND
								aj.anjianleibie NOT LIKE '050400%' AND
								aj.anjianleibie NOT LIKE '0501%') THEN
							1
						   ELSE
							0
					   END qt --其他
				  FROM gawlzf.T_XSZAGLFX@to_cs_zfba_sc_vip aj,
					   gawlzf.T_ajjbxxb@to_cs_zfba_sc_vip  ajjbxx
				 WHERE aj.anjianbianhao = ajjbxx.anjianbianhao
				   AND aj.faddflag = '1'
				   AND fadddm IS NOT NULL
				   AND aj.actflag != '4'
				   AND fadddm != 'JG9999999999999999999999999'
				   AND fadddm != 'JG999999999999999999'
				   AND aj.anjianleixing = '1'
				   AND trunc(to_date(ajjbxx.lianriqi, 'yyyymmddhh24miss'),
							 'dd') = trunc(SYSDATE - 1, 'dd')
				 GROUP BY aj.anjianleibie, fadddm) tj
		 WHERE tj.fadddm(+) = dw.jgbh;
	TYPE type_list IS TABLE OF cur_list%ROWTYPE;
	v_list type_list;
BEGIN
	OPEN cur_list;
	LOOP
		FETCH cur_list BULK COLLECT
			INTO v_list LIMIT 100;
		EXIT WHEN v_list.count = 0;
		FOR i IN v_list.first .. v_list.last LOOP
			BEGIN
				INSERT INTO t_nbgl_zddwfa
					(jgbh, dwmc, pq, rsdq, qtdq, qj, qt, tjrq, jssj)
				VALUES
					(v_list(i).jgbh,
					 v_list(i).dwmc,
					 v_list(i).pq,
					 v_list(i).rsdq,
					 v_list(i).qtdq,
					 v_list(i).qj,
					 v_list(i).qt,
					 trunc(SYSDATE - 1, 'dd'),
					 SYSDATE);
			END;
		END LOOP;
		COMMIT;
	END LOOP;
END;
/




 
