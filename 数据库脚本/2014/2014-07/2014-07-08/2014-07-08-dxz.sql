CREATE OR REPLACE FUNCTION f_get_Dwyjys(v_jgbh VARCHAR2, v_dwfl VARCHAR2)
    RETURN VARCHAR2 AS
    --否 计数  （否的数量为0：绿色，否的数量大于1且小于等于2 ：黄色，否的数量大于等于3 ：红色）
    v_count NUMBER;
    -- 预警颜色
    v_color VARCHAR2(20);

BEGIN
    v_count := 0;
    v_color := '';
    IF v_dwfl = '001' THEN
        SELECT nvl(length(REPLACE(jc.bs, '1', '')), 0)
          INTO v_count
          FROM (SELECT (DZZD01 || DZZD02 || DZZD03 || DZZD04 || DZJF01 ||
                       DZJF02 || DZJF03 || DZJF04 || DZJF05 || DZJF06 ||
                       DZJF07 || DZJF08 || DZWF01 || DZWF02 || DZWF03 ||
                       DZRF01 || DZRF02 || DZRF03 || DZRF04 || DZBA01 ||
                       DZBA02 || DZBA03 || DZBA04) AS bs
                  FROM t_za_jg_jbxx dw, t_za_nb_dwjc jc
                 WHERE dw.jgbh = jc.jgbh
                   AND dw.zxbs = '0'
                   AND dw.jgbh = v_jgbh
                   AND jc.djsj IS NOT NULL
                 ORDER BY jc.djsj DESC) jc
         WHERE rownum = 1;
    ELSIF v_dwfl = '002' THEN
        SELECT nvl(length(REPLACE(jc.bs, '1', '')), 0)
          INTO v_count
          FROM (SELECT (GXZD01 || GXZD02 || GXZD03 || GXZD04 || GXJF01 ||
                       GXJF02 || GXJF03 || GXJF04 || GXJF05 || GXJF06 ||
                       GXJF07 || GXJF08 || GXWF01 || GXWF02 || GXWF03 ||
                       GXWF04 || GXWF05 || GXWF06 || GXRF01 || GXRF02 ||
                       GXRF03 || GXRF04 || GXBA01 || GXBA02 || GXBA03 ||
                       GXBA04) AS bs
                  FROM t_za_jg_jbxx dw, t_za_nb_dwjc jc
                 WHERE dw.jgbh = jc.jgbh
                   AND dw.zxbs = '0'
                   AND dw.jgbh = v_jgbh
                   AND jc.djsj IS NOT NULL
                 ORDER BY jc.djsj DESC) jc
         WHERE rownum = 1;
    ELSIF v_dwfl = '003' THEN
        SELECT nvl(length(REPLACE(jc.bs, '1', '')), 0)
          INTO v_count
          FROM (SELECT (XXZD01 || XXZD02 || XXZD03 || XXZD04 || XXZD05 ||
                       XXZD06 || XXJF01 || XXJF02 || XXJF03 || XXJF04 ||
                       XXWF01 || XXWF02 || XXWF03 || XXWF04 || XXWF05 ||
                       XXRF01 || XXRF02 || XX_JZBA01 || XX_JZBA02 ||
                       XX_JZBA03 || XX_JZBA04) AS bs
                  FROM t_za_jg_jbxx dw, t_za_nb_dwjc jc
                 WHERE dw.jgbh = jc.jgbh
                   AND dw.zxbs = '0'
                   AND dw.jgbh = v_jgbh
                   AND jc.djsj IS NOT NULL
                 ORDER BY jc.djsj DESC) jc
         WHERE rownum = 1;
    ELSIF v_dwfl = '004' THEN
        SELECT nvl(length(REPLACE(jc.bs, '1', '')), 0)
          INTO v_count
          FROM (SELECT (WSZD01 || WSZD02 || WSZD03 || WSZD04 || WSJS01 ||
                       WSJS02 || WSJS03 || WSJS04 || WSJS05 || WSJS06 ||
                       WSJS07 || WSJS08 || WSJS09 || WSWF01 || WSWF02 ||
                       WSRF01 || WSRF02 || WSRF03 || WSBA01 || WSBA02 ||
                       WSBA03 || WSBA04) AS bs
                  FROM t_za_jg_jbxx dw, t_za_nb_dwjc jc
                 WHERE dw.jgbh = jc.jgbh
                   AND dw.zxbs = '0'
                   AND dw.jgbh = v_jgbh
                   AND jc.djsj IS NOT NULL
                 ORDER BY jc.djsj DESC) jc
         WHERE rownum = 1;
    ELSIF v_dwfl = '005' THEN
        SELECT nvl(length(REPLACE(jc.bs, '1', '')), 0)
          INTO v_count
          FROM (SELECT (ZBZD01 || ZBZD02 || ZBZD03 || ZBZD04 || ZBZD05 ||
                       ZBSP01 || ZBSP02 || ZBSP03 || ZBSP04 || ZBSP05 ||
                       ZBSP06 || ZBSP07 || ZBBJ01 || ZBBJ02 || ZBBJ03 ||
                       ZBBJ04 || ZBBJ05 || ZBBJ06 || ZBWF01 || ZBWF02 ||
                       ZBWF03 || ZBWF04 || ZBRF01 || ZBRF02 || SC_JZBA01 ||
                       SC_JZBA02 || SC_JZBA03 || SC_JZBA04) AS bs
                  FROM t_za_jg_jbxx dw, t_za_nb_dwjc jc
                 WHERE dw.jgbh = jc.jgbh
                   AND dw.zxbs = '0'
                   AND dw.jgbh = v_jgbh
                   AND jc.djsj IS NOT NULL
                 ORDER BY jc.djsj DESC) jc
         WHERE rownum = 1;
    ELSIF v_dwfl = '006' OR v_dwfl = '009' OR v_dwfl = '099' THEN
        SELECT nvl(length(REPLACE(jc.bs, '1', '')), 0)
          INTO v_count
          FROM (SELECT (JZZD01 || JZZD02 || JZZD03 || JZZD04 || JZZD05 ||
                       JZZD06 || JZZD07 || JZZD08 || JZSP01 || JZSP02 ||
                       JZSP03 || JZSP04 || JZSP05 || JZSP06 || JZSP07 ||
                       JZBJ02 || JZBJ08 || JZWF01 || JZWF02 || JZWF03 ||
                       JZWF04 || JZWF05 || JZRF04 || JZBA01 || JZBA02 ||
                       JZBA03 || JZBA04 || JZRF01 || JZRF02 || JZRF03) AS bs
                  FROM t_za_jg_jbxx dw, t_za_nb_dwjc jc
                 WHERE dw.jgbh = jc.jgbh
                   AND dw.zxbs = '0'
                   AND dw.jgbh = v_jgbh
                   AND jc.djsj IS NOT NULL
                 ORDER BY jc.djsj DESC) jc
         WHERE rownum = 1;
    ELSIF v_dwfl = '007' THEN
        SELECT nvl(length(REPLACE(jc.bs, '1', '')), 0)
          INTO v_count
          FROM (SELECT (JRZD01 || JRZD02 || JRZD03 || JRZD04 || JRZD05 ||
                       JRZD06 || JRZD07 || JRJF01 || JRJF02 || JRJF03 ||
                       JRJF04 || JRJF05 || JRJF06 || JRJF07 || JRJF08 ||
                       JRJF09 || JRJF10 || JRJF11 || JRJF12 || JRJF13 ||
                       JRJF14 || JRWF01 || JRWF02 || JRWF03 || JRWF04 ||
                       JRWF05 || JRWF06 || JRRF01 || JRRF02 || JRRF03 ||
                       JRRF04 || JR_JZBA01 || JR_JZBA02 || JR_JZBA03 ||
                       JR_JZBA04 || YHZD01 || YHZD02 || YHZD03 || YHJF01 ||
                       YHJF02 || YHJF04 || YHJF05 || YHJF06 || YHWF01 ||
                       YHWF02 || YHRF01 || YHRF02 || YHRF03 || YH_JZBA01 ||
                       YH_JZBA02 || YH_JZBA03 || YH_JZBA04) AS bs,
                       ROWNUM AS row_number
                  FROM t_za_jg_jbxx dw, t_za_nb_dwjc jc
                 WHERE dw.jgbh = jc.jgbh
                   AND dw.zxbs = '0'
                   AND dw.jgbh = v_jgbh
                   AND jc.djsj IS NOT NULL
                 ORDER BY jc.djsj DESC) jc
         WHERE rownum = 1;
    ELSIF v_dwfl = '008' THEN
        SELECT nvl(length(REPLACE(jc.bs, '1', '')), 0)
          INTO v_count
          FROM (SELECT (JYZD01 || JYZD02 || JYZD03 || JYZD04 || JYZD05 ||
                       JYZD06 || JYZD07 || JYZD08 || JYZD09 || JYSP01 ||
                       JYSP02 || JYSP03 || JYSP04 || JYSP05 || JYSP06 ||
                       JYSP07 || JYSP08 || JYBJ01 || JYBJ02 || JYBJ03 ||
                       JYBJ04 || JYBJ05 || JYWF01 || JYWF02 || JYWF03 ||
                       JYWF04 || JYRF01 || JYRF02 || JY_JZBA01 || JY_JZBA02 ||
                       JY_JZBA03 || JY_JZBA04) AS bs
                  FROM t_za_jg_jbxx dw, t_za_nb_dwjc jc
                 WHERE dw.jgbh = jc.jgbh
                   AND dw.zxbs = '0'
                   AND dw.jgbh = v_jgbh
                   AND jc.djsj IS NOT NULL
                 ORDER BY jc.djsj DESC) jc
         WHERE rownum = 1;
    END IF;

    IF v_count = 0 THEN
        v_color := 'green';
    ELSIF v_count >= 1 AND v_count <= 2 THEN
        v_color := 'yellow';
    ELSIF v_count >= 3 THEN
        v_color := 'red';
    END IF;
    RETURN v_color;
END;
/