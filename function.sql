CREATE OR REPLACE FUNCTION trigf1() RETURNS TRIGGER AS $$
DECLARE x INT;
BEGIN
	SELECT tid FROM player AS P INTO x 
	WHERE NEW.pid = P.pid;
	IF (NEW.gdate IN (SELECT gdate FROM game WHERE gdate = NEW.gdate AND htid = NEW.htid)) 
	THEN
		IF (x IN (SELECT htid FROM game WHERE x = htid))
			THEN
			UPDATE game SET hscore = hscore + NEW.pscore
			WHERE htid = NEW.htid;
		ELSE 
			UPDATE game SET vscore = vscore + NEW.pscore
			WHERE vtid = NEW.vtid;
		END IF;
        RETURN NEW;
	ELSE 
		RAISE NOTICE 'Error Player not in the game';
		RETURN null;
	END IF;
END; 
$$ LANGUAGE plpgsql;