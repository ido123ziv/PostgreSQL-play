-- get all winning teams
SET search_path TO "MMN11", public;
SELECT nickname as "Winning Team", gdate, htid
FROM "MMN11".team as t, "MMN11".game as g
WHERE (t.tid = g.htid and hscore > vscore) OR (t.tid = g.vtid and hscore < vscore)