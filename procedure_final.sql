SET SERVEROUTPUT ON;

CREATE OR REPLACE procedure delete_info
    
    (UFO_id INTEGER,
     witness_name comment4.username%TYPE 
     ) IS
    comment_id_id   comment4.comment_id%TYPE;
    comment_id_name comment4.username%TYPE;
    BEGIN
    DELETE FROM extra4
    WHERE comment_id IN (SELECT comment_id
                        FROM comment4
                        WHERE event_id=UFO_id OR username=witness_name);

    delete from comment4
    where event_id=UFO_id OR username=witness_name;
    delete from user_event4
    where event_id=UFO_id OR username=witness_name;
    delete from event4
    where event_id=UFO_id;
    delete from user4
    where username=witness_name;
    exception 
    WHEN no_data_found THEN
       dbms_output.put_line('ERROR'); 
       dbms_output.put_line('there is no such event or user'); 
       dbms_output.put_line('check your parameters'); 
    END delete_info;