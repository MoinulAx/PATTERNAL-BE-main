\c patternal_dev;

-- Create a function to update the updated_at column for the users table
CREATE OR REPLACE FUNCTION update_user_timestamp()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = NOW();
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Create a trigger for the users table
CREATE TRIGGER update_user_timestamp_trigger
BEFORE UPDATE ON users
FOR EACH ROW
EXECUTE FUNCTION update_user_timestamp();


-- Create a generic function for the created_at column
CREATE OR REPLACE FUNCTION set_created_at_timestamp()
RETURNS TRIGGER AS $$
BEGIN
    NEW.created_at = NOW();
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Create triggers for each table that requires automatic created_at updates
-- CREATE TRIGGER set_created_at_journal_entries
-- BEFORE INSERT ON journal_entries
-- FOR EACH ROW
-- EXECUTE FUNCTION set_created_at_timestamp();

-- CREATE TRIGGER set_created_at_meditation_sessions
-- BEFORE INSERT ON meditation_sessions
-- FOR EACH ROW
-- EXECUTE FUNCTION set_created_at_timestamp();

CREATE TRIGGER set_created_at_father_activity_logs
BEFORE INSERT ON father_activity_logs
FOR EACH ROW
EXECUTE FUNCTION set_created_at_timestamp();

CREATE TRIGGER set_created_at_resources
BEFORE INSERT ON resources
FOR EACH ROW
EXECUTE FUNCTION set_created_at_timestamp();

