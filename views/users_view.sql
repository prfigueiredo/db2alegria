CREATE VIEW vwUsers AS
SELECT user_id_int AS Identification,
       name AS user_name,
       birth_date,
       email,
       plan_active AS plan,
FROM user
