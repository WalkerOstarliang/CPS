CREATE OR REPLACE FUNCTION F_GET_STXXNEWNUMBER(V_ORGCODE VARCHAR2, V_STARTDATE DATE, V_ENDDATE DATE,V_BZLX VARCHAR2) RETURN NUMBER
--获取指定时间内实体信息新增的数量\
--标注类型 0 ：全部 1：已标注 2：未标注
AS
       V_LEVE     NUMBER;  --机构级别  1：省 2:市3：县4：所 5：警务区/市
       V_DZS      NUMBER;  --地址数
BEGIN
      V_LEVE:=F_GET_DWLEVE(V_ORGCODE);

      V_DZS := 0;
      IF V_LEVE = 1 THEN
          IF V_STARTDATE IS NOT NULL AND V_ENDDATE IS NOT NULL THEN
             IF V_BZLX='1' THEN
                   SELECT COUNT(1) INTO V_DZS
                   FROM T_COMMON_STXX DZ
                   WHERE DJSJ>=V_STARTDATE AND DJSJ<=V_ENDDATE 
                         AND X IS NOT NULL AND Y IS NOT NULL;
             ELSIF V_BZLX='2' THEN
                   SELECT COUNT(1) INTO V_DZS
                   FROM T_COMMON_STXX DZ
                   WHERE DJSJ>=V_STARTDATE AND DJSJ<=V_ENDDATE 
                         AND (X IS NULL OR Y IS NULL);           
             ELSE
                   SELECT COUNT(1) INTO V_DZS
                   FROM T_COMMON_STXX DZ
                   WHERE DJSJ>=V_STARTDATE AND DJSJ<=V_ENDDATE;
             END IF;
          ELSE
             IF V_BZLX='1' THEN
                   SELECT COUNT(1) INTO V_DZS
                   FROM T_COMMON_STXX DZ
                   WHERE X IS NOT NULL AND Y IS NOT NULL;
             ELSIF V_BZLX='2' THEN
                   SELECT COUNT(1) INTO V_DZS
                   FROM T_COMMON_STXX DZ
                   WHERE X IS NULL OR Y IS NULL;           
             ELSE
                   SELECT COUNT(1) INTO V_DZS
                   FROM T_COMMON_STXX DZ;
             END IF;
            
          END IF;

      ELSIF V_LEVE = 2 THEN
            IF V_STARTDATE IS NOT NULL AND V_ENDDATE IS NOT NULL THEN
                IF V_BZLX='1' THEN
                      SELECT COUNT(1) INTO V_DZS
                      FROM T_COMMON_STXX DZ
                      WHERE DZ.DJDWDM LIKE SUBSTR(V_ORGCODE,1,4)||'%'
                             AND DJSJ>=V_STARTDATE AND DJSJ<=V_ENDDATE
                               AND X IS NOT NULL AND Y IS NOT NULL;
                               
                ELSIF V_BZLX='2' THEN
                      SELECT COUNT(1) INTO V_DZS
                      FROM T_COMMON_STXX DZ
                      WHERE DZ.DJDWDM LIKE SUBSTR(V_ORGCODE,1,4)||'%'
                             AND DJSJ>=V_STARTDATE AND DJSJ<=V_ENDDATE
                              AND (X IS NULL OR Y IS NULL); 
                              
                ELSE 
                       SELECT COUNT(1) INTO V_DZS
                       FROM T_COMMON_STXX DZ
                       WHERE DZ.DJDWDM LIKE SUBSTR(V_ORGCODE,1,4)||'%'
                              AND DJSJ>=V_STARTDATE AND DJSJ<=V_ENDDATE;
                END IF;
               
            ELSE
                IF V_BZLX='1' THEN
                       SELECT COUNT(1) INTO V_DZS
                        FROM T_COMMON_STXX DZ
                        WHERE DZ.DJDWDM LIKE SUBSTR(V_ORGCODE,1,4)||'%'
                               AND X IS NOT NULL AND Y IS NOT NULL;
                               
                ELSIF V_BZLX='2' THEN
                       SELECT COUNT(1) INTO V_DZS
                        FROM T_COMMON_STXX DZ
                        WHERE DZ.DJDWDM LIKE SUBSTR(V_ORGCODE,1,4)||'%'
                              AND (X IS NULL OR Y IS NULL); 
                              
                ELSE 
                        SELECT COUNT(1) INTO V_DZS
                        FROM T_COMMON_STXX DZ
                        WHERE DZ.DJDWDM LIKE SUBSTR(V_ORGCODE,1,4)||'%';  
                            
                END IF;    
       
            END IF;
      ELSIF V_LEVE = 3 THEN
           IF V_STARTDATE IS NOT NULL AND V_ENDDATE IS NOT NULL THEN
                IF V_BZLX='1' THEN
                       SELECT COUNT(1) INTO V_DZS
                       FROM T_COMMON_STXX DZ
                       WHERE DZ.DJDWDM LIKE SUBSTR(V_ORGCODE,1,6)||'%'
                             AND DJSJ>=V_STARTDATE AND DJSJ<=V_ENDDATE
                               AND X IS NOT NULL AND Y IS NOT NULL;
                               
                ELSIF V_BZLX='2' THEN
                      SELECT COUNT(1) INTO V_DZS
                     FROM T_COMMON_STXX DZ
                     WHERE DZ.DJDWDM LIKE SUBSTR(V_ORGCODE,1,6)||'%'
                           AND DJSJ>=V_STARTDATE AND DJSJ<=V_ENDDATE
                              AND (X IS NULL OR Y IS NULL); 
                              
                ELSE 
                        SELECT COUNT(1) INTO V_DZS
                         FROM T_COMMON_STXX DZ
                         WHERE DZ.DJDWDM LIKE SUBSTR(V_ORGCODE,1,6)||'%'
                               AND DJSJ>=V_STARTDATE AND DJSJ<=V_ENDDATE
                              AND DJSJ>=V_STARTDATE AND DJSJ<=V_ENDDATE;
                END IF;
            
           ELSE
                IF V_BZLX='1' THEN
                       SELECT COUNT(1) INTO V_DZS
                        FROM T_COMMON_STXX DZ
                        WHERE DZ.DJDWDM LIKE SUBSTR(V_ORGCODE,1,6)||'%'
                               AND X IS NOT NULL AND Y IS NOT NULL;
                               
                ELSIF V_BZLX='2' THEN
                       SELECT COUNT(1) INTO V_DZS
                        FROM T_COMMON_STXX DZ
                        WHERE DZ.DJDWDM LIKE SUBSTR(V_ORGCODE,1,6)||'%'
                              AND (X IS NULL OR Y IS NULL); 
                              
                ELSE 
                        SELECT COUNT(1) INTO V_DZS
                        FROM T_COMMON_STXX DZ
                        WHERE DZ.DJDWDM LIKE SUBSTR(V_ORGCODE,1,6)||'%';    
                            
                END IF;    
               
           END IF;
      ELSIF V_LEVE = 4 THEN
            IF V_STARTDATE IS NOT NULL AND V_ENDDATE IS NOT NULL THEN
                IF V_BZLX='1' THEN
                       SELECT COUNT(1) INTO V_DZS
                       FROM T_COMMON_STXX DZ
                       WHERE DZ.DJDWDM LIKE SUBSTR(V_ORGCODE,1,8)||'%'
                             AND DJSJ>=V_STARTDATE AND DJSJ<=V_ENDDATE
                               AND X IS NOT NULL AND Y IS NOT NULL;
                               
                ELSIF V_BZLX='2' THEN
                      SELECT COUNT(1) INTO V_DZS
                     FROM T_COMMON_STXX DZ
                     WHERE DZ.DJDWDM LIKE SUBSTR(V_ORGCODE,1,8)||'%'
                           AND DJSJ>=V_STARTDATE AND DJSJ<=V_ENDDATE
                              AND (X IS NULL OR Y IS NULL); 
                              
                ELSE 
                        SELECT COUNT(1) INTO V_DZS
                         FROM T_COMMON_STXX DZ
                         WHERE DZ.DJDWDM LIKE SUBSTR(V_ORGCODE,1,8)||'%'
                               AND DJSJ>=V_STARTDATE AND DJSJ<=V_ENDDATE
                              AND DJSJ>=V_STARTDATE AND DJSJ<=V_ENDDATE;
                END IF;
             
            ELSE 
                 IF V_BZLX='1' THEN
                       SELECT COUNT(1) INTO V_DZS
                        FROM T_COMMON_STXX DZ
                        WHERE DZ.DJDWDM LIKE SUBSTR(V_ORGCODE,1,8)||'%' 
                               AND X IS NOT NULL AND Y IS NOT NULL;
                               
                ELSIF V_BZLX='2' THEN
                       SELECT COUNT(1) INTO V_DZS
                        FROM T_COMMON_STXX DZ
                        WHERE DZ.DJDWDM LIKE SUBSTR(V_ORGCODE,1,8)||'%'
                              AND (X IS NULL OR Y IS NULL); 
                              
                ELSE 
                        SELECT COUNT(1) INTO V_DZS
                        FROM T_COMMON_STXX DZ
                        WHERE DZ.DJDWDM LIKE SUBSTR(V_ORGCODE,1,8)||'%';    
                            
                END IF;    
              
            END IF;
      ELSIF V_LEVE = 5 THEN
           IF V_STARTDATE IS NOT NULL AND V_ENDDATE IS NOT NULL THEN
                IF V_BZLX='1' THEN
                       SELECT COUNT(1) INTO V_DZS
                       FROM T_COMMON_STXX DZ
                       WHERE DZ.DJDWDM = V_ORGCODE
                             AND DJSJ>=V_STARTDATE AND DJSJ<=V_ENDDATE
                               AND X IS NOT NULL AND Y IS NOT NULL;
                               
                ELSIF V_BZLX='2' THEN
                      SELECT COUNT(1) INTO V_DZS
                     FROM T_COMMON_STXX DZ
                     WHERE DZ.DJDWDM = V_ORGCODE
                           AND DJSJ>=V_STARTDATE AND DJSJ<=V_ENDDATE
                              AND (X IS NULL OR Y IS NULL); 
                              
                ELSE 
                        SELECT COUNT(1) INTO V_DZS
                         FROM T_COMMON_STXX DZ
                         WHERE DZ.DJDWDM = V_ORGCODE
                               AND DJSJ>=V_STARTDATE AND DJSJ<=V_ENDDATE;
                END IF;  
           
            
           ELSE
               IF V_BZLX='1' THEN
                       SELECT COUNT(1) INTO V_DZS
                        FROM T_COMMON_STXX DZ
                        WHERE DZ.DJDWDM = V_ORGCODE
                               AND X IS NOT NULL AND Y IS NOT NULL;
                               
                ELSIF V_BZLX='2' THEN
                       SELECT COUNT(1) INTO V_DZS
                        FROM T_COMMON_STXX DZ
                        WHERE DZ.DJDWDM = V_ORGCODE
                              AND (X IS NULL OR Y IS NULL); 
                              
                ELSE 
                        SELECT COUNT(1) INTO V_DZS
                        FROM T_COMMON_STXX DZ
                        WHERE DZ.DJDWDM = V_ORGCODE;
                            
                END IF;    
           END IF;
      END IF;
      RETURN V_DZS;
END;
