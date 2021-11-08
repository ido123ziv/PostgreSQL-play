-- first query, get all players with rating gt than 3 in team 2
SELECT pname
FROM "MMN11".player
WHERE rating > 3 AND tid = 2;

-- get all coaches that coach blue jersey teams
SELECT cname,t.nickname
FROM "MMN11".coach as c, "MMN11".team as t
WHERE t.color = 'Blue' AND c.tid = t.tid;

