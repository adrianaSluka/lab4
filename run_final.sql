SET SERVEROUTPUT ON
--function
select * from table(lab_pack.get_data(-150, 150, -45, 90));

select * from user_event4;
select * from comment4;
select * from user4;
select * from event4;

--trigger
INSERT INTO user_event4
VALUES(3, NULL);
INSERT INTO comment4(comment_id, comment_text, event_id, username)
VALUES(6, '5678', 3, null)
INSERT INTO user_event4 (event_id, username)
VALUES (2, null);
INSERT INTO comment4 (comment_id, comment_text, event_id, username)
VALUES (5, 'username is unknown', 2, null);
INSERT INTO extra4 (shape, duration_sec, datetime, comment_id)
VALUES('triangle', 60 ,TO_TIMESTAMP('06/29/2011 17:30', 'MM/DD/YYYY HH24:MI') , 5 );

--procedure
exec lab_pack.delete_info(2, 'Bob');

select * from user_event4;
select * from comment4;
select * from user4;
select * from event4;
