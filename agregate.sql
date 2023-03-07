SELECT * FROM "users";

SELECT max ("weight") FROM "users";
SELECT min("height") FROM "users";
SELECT avg ("height") FROM "users";
SELECT sum ("weight") FROM "users";
SELECT count("weight") FROM "users";


SELECT count(*), "isMale","firstName"
FROM "users"
WHERE "isMale"=false
GROUP BY "isMale","firstName"
LIMIT 5;

--1 кількість чоловіків та жінок
SELECT count(*), "isMale"
FROM "users"
GROUP BY "isMale";


--2 середній зріст  чоловіків та жінок
SELECT avg("height") ,"isMale"
FROM "users"
GROUP BY "isMale";


--3 кількість людей, які народилися у 1982
SELECT count(*) ,extract(years from "birthday") AS "YEAR"
FROM "users"
WHERE extract("year" from "birthday")=1982
GROUP BY "YEAR";


--4 кількість і стать людей з прізвищем Pitt
SELECT count(*) ,"lastName","isMale"
FROM "users"
WHERE "lastName"='Pitt'
GROUP BY "lastName","isMale";


--5 -кількість людей, які народилися 04 липня
SELECT count(*) ,extract ("day" from "birthday")=8 AS "DAY",extract ("month" from "birthday")=9 AS "MONTH"
FROM "users"
WHERE extract ("day" from "birthday")=8 
AND  extract ("month" from "birthday")=9
GROUP BY "DAY","MONTH";


--6 загальна вага всіх з іменем Alex
SELECT sum("weight") ,"firstName"
FROM "users"
WHERE "firstName"='Alex'
GROUP BY "firstName";


--7 загальна вага чоловіків зі зростом вище 1.95
SELECT sum("weight") ,"isMale"
FROM "users"
WHERE "isMale"=true AND "height">1.95
GROUP BY "isMale";


--8 кількість жінок з однаковими прізвищами
SELECT count(*) ,"lastName","isMale"
FROM "users"
WHERE "isMale"=false
GROUP BY "lastName","isMale";


--9 --кількість чоловіків, які народилися влітку

SELECT count(*) AS "summer male","isMale"
FROM "users"
WHERE extract ("month" from "birthday") BETWEEN 6 AND 8  AND "isMale"=true
GROUP BY "isMale";
--10 середня вага чоловіків 1975 року народження

SELECT avg("weight"), extract ("year" from "birthday") AS "year","isMale"
FROM "users"
WHERE  "isMale"=true AND extract ("year" from "birthday")=1975
GROUP BY "isMale","year";
