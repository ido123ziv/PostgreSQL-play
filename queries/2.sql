-- get all coaches that coach blue jersey teams
SELECT cname,t.nickname
FROM coach as c, team as t
WHERE t.color = 'Blue' AND c.tid = t.tid;

