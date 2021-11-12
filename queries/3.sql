-- get all winning teams
SELECT nickname as "Winning Team", gdate, htid
FROM team as t, game as g
WHERE (t.tid = g.htid and hscore > vscore) OR (t.tid = g.vtid and hscore < vscore)