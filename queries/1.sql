-- first query, get all players with rating gt than 3 in team 2
SELECT pname
FROM "MMN11".player
WHERE rating > 3 AND tid = 2;
