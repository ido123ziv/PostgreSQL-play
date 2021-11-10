-- Database: postgres
--creating 5 basic tables team, player, coach, game, points:
SET search_path TO "MMN11", public;
CREATE TABLE IF NOT EXISTS "MMN11".team(
	tid int,
	nickname varchar(20),
	color varchar(10),
	PRIMARY KEY(tid)
);

CREATE TABLE IF NOT EXISTS "MMN11".player(
	pid int,
	pname varchar(20),
	address varchar(30),
	phone numeric(10,0),
	rating int,
	tid int REFERENCES "MMN11".team(tid),
	PRIMARY KEY (pid)
);

CREATE TABLE IF NOT EXISTS "MMN11".coach(
	cid int,
	PRIMARY KEY(cid),
	cname varchar(20),
	address varchar(30),
	phone numeric(10,0),
	status int,
	tid int REFERENCES "MMN11".team(tid)
);

CREATE TABLE IF NOT EXISTS "MMN11".game(
	gdate date,
	htid int  REFERENCES "MMN11".team(tid),
	vtid int  REFERENCES "MMN11".team(tid),
	PRIMARY KEY (gdate, htid),
	hscore int DEFAULT 0,
	vscore int DEFAULT 0
);

CREATE TABLE IF NOT EXISTS "MMN11".points(
	pid int REFERENCES "MMN11".player(pid),
	gdate date,
	htid int, 
	foreign key (htid, gdate) references "MMN11".game(htid , gdate),
	PRIMARY KEY (pid,gdate,htid),
	pscore int
);

