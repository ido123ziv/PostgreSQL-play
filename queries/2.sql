-- get all coaches that coach blue jersey teams
SELECT cname,t.nickname
FROM "MMN11".coach as c, "MMN11".team as t
WHERE t.color = 'Blue' AND c.tid = t.tid;

