-- Database: postgres
--creating 5 basic tables team, player, coach, game, points:
CREATE TABLE IF NOT EXISTS team(
	tid int,
	nickname varchar(20),
	color varchar(10),
	PRIMARY KEY(tid)
);

CREATE TABLE IF NOT EXISTS player(
	pid int,
	pname varchar(20),
	address varchar(30),
	phone numeric(10,0),
	rating int,
	tid int REFERENCES team(tid),
	PRIMARY KEY (pid)
);

CREATE TABLE IF NOT EXISTS coach(
	cid int,
	PRIMARY KEY(cid),
	cname varchar(20),
	address varchar(30),
	phone numeric(10,0),
	status int,
	tid int REFERENCES team(tid)
);

CREATE TABLE IF NOT EXISTS game(
	gdate date,
	htid int  REFERENCES team(tid),
	vtid int  REFERENCES team(tid),
	PRIMARY KEY (gdate, htid),
	hscore int DEFAULT 0,
	vscore int DEFAULT 0
);

CREATE TABLE IF NOT EXISTS points(
	pid int REFERENCES player(pid),
	gdate date,
	htid int, 
	foreign key (htid, gdate) references game(htid , gdate),
	PRIMARY KEY (pid,gdate,htid),
	pscore int
);

