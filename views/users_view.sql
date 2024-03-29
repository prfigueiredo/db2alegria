--INSERT INTO MOVIE_DB.USERS (PREFERENCES_ID, PLAN_ID, NAME, BIRTH_DATE, EMAIL, PASSWORD, PLAN_ACTIVE) VALUES (1, 1, 'USER 1', CURRENT_DATE, 'MAIL', 'PASSWORD', TRUE);
--INSERT INTO MOVIE_DB.USERS (PREFERENCES_ID, PLAN_ID, NAME, BIRTH_DATE, EMAIL, PASSWORD, PLAN_ACTIVE) VALUES (1, 1, 'USER 2', CURRENT_DATE, 'MAIL', 'PASSWORD', TRUE);
--INSERT INTO MOVIE_DB.USERS (PREFERENCES_ID, PLAN_ID, NAME, BIRTH_DATE, EMAIL, PASSWORD, PLAN_ACTIVE) VALUES (1, 1, 'USER 3', CURRENT_DATE, 'MAIL', 'PASSWORD', FALSE);

--Retorna o valor pago pelo usuário, se o usuário está com o plano inativo o valor é 0.00
CREATE OR REPLACE VIEW MOVIE_DB.VALOR_PAGO_USUARIO AS
SELECT U.NAME AS "Usuário",
	CASE
        WHEN U.PLAN_ACTIVE = TRUE THEN P.PRICE
        ELSE 0.00
	END AS "Valor pago"
FROM MOVIE_DB.USERS U
INNER JOIN MOVIE_DB.PLANS P ON U.PLAN_ID = P.PLAN_ID;
