INSERT INTO country4(country_name)
VALUES ('USA');
INSERT INTO country4(country_name)
VALUES ('England');
INSERT INTO country4(country_name)
VALUES ('Australia');

INSERT INTO location4(city_name, country_name)
VALUES ('Adrian','USA');
INSERT INTO location4(city_name, country_name)
VALUES ('Chester','England');
INSERT INTO location4(city_name, country_name)
VALUES ('Burnie','Australia');

INSERT INTO place4(latitude, longitude, city_name, country_name)
VALUES(41.893,-84.065 , 'Adrian', 'USA');
INSERT INTO place4(latitude, longitude, city_name, country_name)
VALUES(53.2, -2.916, 'Chester', 'England');
INSERT INTO place4(latitude, longitude, city_name, country_name)
VALUES(-41.056 ,145.903 , 'Burnie', 'Australia');

INSERT INTO event4(event_id, longitude, latitude)
VALUES( 1,-84.065 ,41.893 );
INSERT INTO event4(event_id, longitude, latitude)
VALUES( 2,-2.916,53.2 );
INSERT INTO event4(event_id, longitude, latitude)
VALUES( 3,145.903 ,-41.056 );

INSERT INTO user4(username)
VALUES('Bob');
INSERT INTO user4(username)
VALUES('Igor');
INSERT INTO user4(username)
VALUES('Adriana');
INSERT INTO user4 (username)
VALUES ('unknown');

INSERT INTO user_event4(event_id, username)
VALUES(1 ,'Bob');
INSERT INTO user_event4(event_id, username)
VALUES(2 ,'Igor');
INSERT INTO user_event4(event_id, username)
VALUES(3 ,'Bob');


INSERT INTO comment4(comment_id, comment_text, event_id, username)
VALUES( 1,'Triangular Object Sighted at Very Close Range',1 ,'Bob');
INSERT INTO comment4(comment_id, comment_text, event_id, username)
VALUES( 2,'Green/Orange circular disc over Chester', 2 ,'Igor');
INSERT INTO comment4(comment_id, comment_text, event_id, username)
VALUES( 3,'Orange light flies overhead and turns black as it passed silently.',3 ,'Bob');

INSERT INTO extra4(shape, duration_sec, datetime, comment_id)
VALUES('triangle', 60 ,TO_TIMESTAMP('06/29/2011 17:30', 'MM/DD/YYYY HH24:MI') , 1 );
INSERT INTO extra4(shape, duration_sec, datetime, comment_id)
VALUES('disc',720 ,TO_TIMESTAMP('09/12/2009 09:00', 'MM/DD/YYYY HH24:MI') , 2 );
INSERT INTO extra4(shape, duration_sec, datetime, comment_id)
VALUES('fireball', 3600 ,TO_TIMESTAMP('12/12/2012 12:12', 'MM/DD/YYYY HH24:MI') ,3 );