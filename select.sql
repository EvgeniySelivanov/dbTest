SELECT * from "users";
SELECT "firstName","lastName", "email", "isMale" from "users";

SELECT "firstName","lastName", "email", "isMale" 
FROM "users"
WHERE "isMale"=false;


SELECT * 
FROM "users"
WHERE "id"%2=0; 



SELECT "firstName","lastName", "id", "isMale" 
FROM "users"
WHERE "isMale"=true
AND "id"%2=1;

SELECT  "id","firstName",
"lastName", "isMale" 
FROM "users"
WHERE "firstName" IN ('Fred','Tom','Alex','Hanna');

SELECT  "id","firstName",
"lastName", "isMale" 
FROM "users"
WHERE "id">220 AND "id"<230;

SELECT  "id","firstName",
"lastName", "isMale" 
FROM "users"
WHERE "id" BETWEEN 220 AND 230;



SELECT  "id","firstName",
"lastName", "isMale","height" 
FROM "users"
WHERE "isMale"=true AND "height" BETWEEN 1.75 AND 1.95;


SELECT  "id","firstName",
 "isMale", extract("years" from age("birthday"))
FROM "users";


SELECT  "id","firstName",
 "isMale","birthday"
FROM "users"
WHERE age("birthday")<make_interval(30);


SELECT  "id","firstName",
 "isMale","birthday"
FROM "users"
WHERE age("birthday")BETWEEN  make_interval(25) AND make_interval(27);

--1
SELECT  "firstName",
 "isMale","birthday"
FROM "users"
WHERE "isMale"=false AND age("birthday")>make_interval(18);

--2
SELECT  "firstName",
 "isMale","birthday","height"
FROM "users"
WHERE "isMale"=true 
AND age("birthday")>=make_interval(18) 
AND "height">1.85;
--3
SELECT  "firstName",
 "isMale","birthday","email"
FROM "users"
WHERE "isMale"=true 
AND age("birthday")>=make_interval(50);

--4
SELECT "firstName", "birthday"
FROM "users"
WHERE extract("day" from "birthday")=13;

--5
SELECT "firstName", "birthday"
FROM "users"
WHERE extract("month" from "birthday")=3;

--6
SELECT "firstName","email"
FROM "users"
WHERE "firstName" IN ('Alex','John') ;


SELECT "id","firstName","email" AS "почта"
FROM "users"
LIMIT 5 OFFSET 25;

SELECT "id","firstName","email"
FROM "users" AS "u"
WHERE "id" BETWEEN 130 AND 140;

SELECT "id","firstName"||' '||"lastName" AS "fullName"
FROM "users" ;

SELECT "id",concat("firstName",' ',"lastName") AS "fullName"
FROM "users" ;

SELECT "id",concat("firstName",' ',"lastName") AS "fullName"
FROM "users" 
WHERE length(concat("firstName",' ',"lastName"))<=8;



SELECT "id",concat("firstName",' ',"lastName") AS "fullName","email"
FROM "users" 
WHERE "isMale"=true AND length(concat("firstName",' ',"lastName"))
BETWEEN 10 AND 15;

SELECT * 
FROM
(SELECT "id",concat("firstName",' ',"lastName") AS "fullName",
length(concat("firstName",' ',"lastName")) AS "length"
FROM "users" 
) AS "LENGHT_FN"

WHERE "LENGHT_FN".length<=8;