-- find the team that never won a game
SELECT *
FROM team
WHERE tid in (SELECT tid 
			FROM game, team
			WHERE (team.tid = game.htid AND game.hscore < game.vscore) 
			GROUP BY team.tid) AND 
			tid not in (SELECT tid 
			FROM game, team
			WHERE (team.tid = game.vtid AND game.hscore < game.vscore) 
			GROUP BY team.tid)