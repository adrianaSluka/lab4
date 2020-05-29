CREATE OR REPLACE TRIGGER witness_trigger 
    BEFORE INSERT ON comment4
    FOR EACH ROW
BEGIN
    IF :new.username IS NULL THEN
        :new.username := 'unknown'; 
    end if;
END;
/
CREATE OR REPLACE TRIGGER witness_trigger2 
    BEFORE INSERT ON user_event4
    FOR EACH ROW
BEGIN
    IF :new.username IS NULL THEN
        :new.username := 'unknown'; 
    end if;
END;
/

