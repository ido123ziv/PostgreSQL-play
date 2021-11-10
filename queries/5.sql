-- get player that played at least 3 games and never recieved grade less than 10
SELECT pname as "Player", player.rating as "Rating"
FROM player,points
WHERE player.pid = points.pid
GROUP BY (points.pid, pname, rating)
HAVING count(player.pid = points.pid) > 3 and MIN(points.pscore) > 10
