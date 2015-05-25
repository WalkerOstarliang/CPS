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
								   AND trunc(to_date(ajjbxx.lianriqi,
													 'yyyymmddhh24miss'),
											 'dd') = trunc(SYSDATE - 1, 'dd')
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
					 trunc(SYSDATE - 1, 'dd'),
					 SYSDATE);
			END;
		END LOOP;
		COMMIT;
	END LOOP;
END;
/


-- Alter table 
alter table T_ZA_DWHC
  storage
  (
    next 1
  )
;
-- Create/Recreate indexes 
create index index_jgbh on T_ZA_DWHC (jgbh);
create index index_hcsj on T_ZA_DWHC (hcsj);