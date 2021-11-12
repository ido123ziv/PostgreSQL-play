-- find for each team the best player 
SET search_path TO "MMN11", public;
SELECT player.tid,player.pname,SUM(points.pscore) as "Score"
FROM player,points
WHERE player.pid = points.pid 
GROUP BY player.pid
HAVING SUM(points.pscore) >= all (select SUM(points.pscore) as "Score"
				FROM player as P, points
				WHERE P.pid = points.pid and P.tid = player.tid
				GROUP BY P.pid)
