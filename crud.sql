UPDATE "users" 
SET "weight" ="height"*100;

UPDATE "users"
SET "weight" =50
WHERE "firstName"='Mary';

UPDATE "users"
SET "weight" =95
WHERE "isMale"=true 
AND age("birthday")>=make_interval(45); 

UPDATE "users"
SET "weight" =63
WHERE "isMale"=true 
AND "height"<=1.7; 


UPDATE "users"
SET "weight" =88
WHERE "isMale"=false 
AND "height">2.0; 


UPDATE "users"
SET "email"='qwerty@gmail.com'
WHERE "id"=150;

SELECT * FROM "users";


--DELETE FROM "users"; удялить все ряды с использованием WHERE или без него
--TRUNCATE TABLE "users"; удялить все ряды 
--DROP TABLE "users"; полностью удаляет таблицу из БД


DELETE FROM "users"
WHERE "id"=13
RETURNING *;

UPDATE "users"
SET "weight"=100
WHERE "id"=163
RETURNING "id","weight";


UPDATE "users"
SET "lastName"='Pitt'
WHERE length("email")>25
RETURNING "id","lastName";

DELETE FROM "users"
WHERE "weight"=153 OR "height"=0.6
RETURNING "id","weight","height";

DELETE FROM "users"
WHERE "weight" IN (123,127,56,80)
RETURNING "id","weight","height";

