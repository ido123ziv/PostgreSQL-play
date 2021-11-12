SET search_path TO "MMN11", public;

CREATE OR REPLACE FUNCTION trigf1() RETURNS TRIGGER AS $$
DECLARE x INT;
BEGIN
	SELECT tid FROM "MMN11".player AS P INTO x 
	WHERE NEW.pid = P.pid;
	IF (NEW.gdate IN (SELECT gdate FROM "MMN11".game WHERE gdate = NEW.gdate AND htid = NEW.htid)) 
	THEN
		IF (x IN (SELECT htid FROM "MMN11".game WHERE x = htid))
			THEN
			UPDATE "MMN11".game SET hscore = hscore + NEW.pscore
			WHERE htid = NEW.htid;
		ELSE 
			UPDATE "MMN11".game SET vscore = vscore + NEW.pscore
			WHERE vtid = NEW.vtid;
		RETURN NEW;
		END IF;
	ELSE 
		RAISE NOTICE 'Error Player not in the game';
		RETURN null;
	END IF;
END; 
$$ LANGUAGE plpgsql;