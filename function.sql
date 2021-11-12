SET search_path TO "MMN11", public;

CREATE OR REPLACE FUNCTION trigf1() RETURNS TRIGGER AS $$
DECLARE x INT;
BEGIN
	SELECT tid FROM player INTO x 
	WHERE NEW.pid = player.pid;
	IF (NEW.gdate,NEW.htid IN (SELECT gdate,htid FROM game WHERE gdate = NEW.gdate AND htid = NEW.htid)) 
	THEN
		IF (x IN (SELECT htid FROM game WHERE x = htid))
			THEN
			UPDATE game SET hscore = hscore + NEW.pscore
			WHERE htid = NEW.htid;
		ELSE 
			UPDATE game SET vscore = vscore + NEW.pscore
			WHERE vtid = NEW.vtid;
		RETURN NEW;
		END IF;
	ELSE 
		RAISE NOTICE 'Error Player not in the game';
		RETURN null;
	END IF;
END; 
$$ LANGUAGE plpgsql;