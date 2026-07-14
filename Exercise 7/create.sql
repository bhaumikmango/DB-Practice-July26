CREATE TABLE room(
id SERIAL PRIMARY KEY,
name VARCHAR(80),
theme VARCHAR(50),
status VARCHAR(30),
default_timer_duration_seconds BIGINT,
low_time_warning_seconds BIGINT
);

CREATE TABLE device(
id SERIAL PRIMARY KEY,
name VARCHAR(50),
type VARCHAR(20),
status VARCHAR(20),
room_id INT REFERENCES room(id)
);

CREATE TABLE puzzle(
id SERIAL PRIMARY KEY,
name VARCHAR(50),
sequence_order INT,
clue_limit INT,
room_id INT REFERENCES room(id)
);

CREATE TABLE clue(
id SERIAL PRIMARY KEY,
clue_content VARCHAR(400),
clue_type VARCHAR(25),
puzzle_id INT REFERENCES puzzle(id)
);

CREATE TABLE game_master(
id SERIAL PRIMARY KEY,
name VARCHAR(100),
status VARCHAR(20)
);

CREATE TABLE session(
id SERIAL PRIMARY KEY,
status VARCHAR(20),
total_time_seconds BIGINT,
remaining_time_seconds BIGINT,
room_id INT REFERENCES room(id),
gm_id INT REFERENCES game_master(id)
);

CREATE TABLE clue_dispatch(
id SERIAL PRIMARY KEY,
session_id INT REFERENCES session(id),
puzzle_id INT REFERENCES puzzle(id),
sent_by INT REFERENCES game_master(id),
sent_at TIMESTAMP,
sent_clue INT REFERENCES clue(id)
);

CREATE TABLE session_puzzle_state(
puzzle_id INT,
session_id INT,
CONSTRAINT sps_id PRIMARY KEY (session_id, puzzle_id),
FOREIGN KEY (puzzle_id) REFERENCES puzzle(id),
FOREIGN KEY (session_id) REFERENCES session(id),
stage_status VARCHAR(30),
clues_used_so_far INT,
force_override VARCHAR(10)
);

CREATE TABLE emergency_stop(
id SERIAL PRIMARY KEY,
used_by INT REFERENCES game_master(id),
used_at TIMESTAMP,
reason VARCHAR(100)
);

CREATE TABLE emergency_stop_effect(
stop_id INT,
session_id INT,
CONSTRAINT es_id PRIMARY KEY (session_id, stop_id),
FOREIGN KEY (stop_id) REFERENCES emergency_stop(id),
FOREIGN KEY (session_id) REFERENCES session(id),
remaining_session_time_seconds BIGINT
);

CREATE TABLE activity_log(
id SERIAL PRIMARY KEY,
occurence_time TIMESTAMP,
message_text VARCHAR(100),
message_source VARCHAR(30),
session_id INT REFERENCES session(id),
gm_id INT REFERENCES game_master(id)
);