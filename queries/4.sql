-- get player count for each coach
SELECT cname as "Coach Name", count(distinct pid) as "Players Count"
FROM player,coach
WHERE player.tid = coach.tid and coach.status = 0
GROUP BY (cname)
