CREATE OR REPLACE PACKAGE 
    lab_pack
AS 

procedure delete_info
    
    (UFO_id INTEGER,
     witness_name comment4.username%TYPE 
     ) ;

FUNCTION get_data(lon1 place4.longitude%type, lon2 place4.longitude%type, lat1 place4.latitude%TYPE, lat2 place4.latitude%TYPE)
    RETURN cursor_table PIPELINED;
END lab_pack;
/
CREATE OR REPLACE PACKAGE 
BODY 
lab_pack
AS 
procedure delete_info
    
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

FUNCTION get_data(lon1 place4.longitude%type, lon2 place4.longitude%type, lat1 place4.latitude%TYPE, lat2 place4.latitude%TYPE)
    RETURN cursor_table PIPELINED IS
    comment_text VARCHAR(1000);
    username VARCHAR(30);
    country VARCHAR(20);
    lon NUMBER(9,6);
    lat NUMBER(9,6);
    city VARCHAR(20);
    CURSOR cursor_test IS
        SELECT comment4.comment_text AS comment_text,
        comment4.username AS username,
        place4.country_name AS country,
        place4.longitude AS lon,
        place4.latitude AS lat,
        place4.city_name AS city
        FROM comment4
        JOIN event4
        USING(event_id)
        JOIN place4 
        ON (place4.latitude=event4.latitude AND place4.longitude=event4.longitude)
        where ((place4.longitude BETWEEN lon1 AND lon2) AND (place4.latitude BETWEEN lat1 AND lat2));
  
BEGIN  
   
  OPEN cursor_test;
  
  LOOP
    FETCH cursor_test INTO comment_text, username, country, lon, lat, city;
    EXIT WHEN cursor_test%NOTFOUND;
    PIPE ROW(
        view_type(
            comment_text,
            username, 
            country,
            lon,
            lat,
            city));
  END LOOP;
  CLOSE cursor_test;
END get_data;
END lab_pack;