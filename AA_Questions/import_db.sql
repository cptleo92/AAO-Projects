PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS question_follows;
DROP TABLE IF EXISTS replies;
DROP TABLE IF EXISTS question_likes;
DROP TABLE IF EXISTS questions;
DROP TABLE IF EXISTS users;

CREATE TABLE users (
  id INTEGER PRIMARY KEY,
  fname TEXT NOT NULL,
  lname TEXT NOT NULL  
);



CREATE TABLE questions (
  id INTEGER PRIMARY KEY,
  title TEXT NOT NULL,
  body TEXT NOT NULL,
  author_id INTEGER NOT NULL,

  FOREIGN KEY (author_id) REFERENCES users(id)
);



CREATE TABLE question_follows (
  id INTEGER PRIMARY KEY,
  user_id INTEGER NOT NULL,
  question_id INTEGER NOT NULL,

  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (question_id) REFERENCES questions(id)
);



CREATE TABLE replies (
  id INTEGER PRIMARY KEY,
  question_id INTEGER NOT NULL,
  parent_id INTEGER,
  user_id INTEGER NOT NULL,
  body NOT NULL,

  FOREIGN KEY (question_id) REFERENCES questions(id),
  FOREIGN KEY (parent_id) REFERENCES replies(id),
  FOREIGN KEY (user_id) REFERENCES users(id)
);



CREATE TABLE question_likes (
  id INTEGER PRIMARY KEY,
  user_id INTEGER NOT NULL,
  question_id INTEGER NOT NULL,


  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (question_id) REFERENCES questions(id)
);

INSERT INTO
  users (fname, lname)
VALUES 
  ('Leo', 'Cheng'),
  ('John', 'Smorg'),
  ('Cat', 'Choi'),
  ('Kendall', 'Roy');

INSERT INTO
  questions (title, body, author_id)
VALUES
  ('Help!', 'I can''t seem to fix my chess methods. Any ideas?', (SELECT id FROM users WHERE fname = 'Leo')),
  ('Bowling?', 'Anybody want to hit the lanes next weekend?', (SELECT id FROM users WHERE fname = 'John')),
  ('HOW TO INITIALIZE', 'PLEASE HELP I NEED HELP TO INITLIAZE PROJECT DUE TMRW I AM STRUGGLING', (SELECT id FROM users WHERE fname = 'Cat')),
  ('I am the greatest person in history', 'This is fact.', (SELECT id FROM users WHERE fname = 'Kendall')),
  ('Help!!', 'I have no idea how to do this', (SELECT id FROM users WHERE fname = 'Leo'));

INSERT INTO
  question_follows (user_id, question_id)
VALUES 
  ((SELECT id FROM users WHERE fname = 'Leo'), (SELECT id FROM questions WHERE title = 'Help!')),
  ((SELECT id FROM users WHERE fname = 'Leo'), (SELECT id FROM questions WHERE title = 'Help!!')),
  ((SELECT id FROM users WHERE fname = 'John'), (SELECT id FROM questions WHERE title = 'Bowling?')),
  ((SELECT id FROM users WHERE fname = 'Cat'), (SELECT id FROM questions WHERE title = 'HOW TO INITIALIZE')),
  ((SELECT id FROM users WHERE fname = 'Kendall'), (SELECT id FROM questions WHERE title = 'I am the greatest person in history')),
  ((SELECT id FROM users WHERE fname = 'Leo'), (SELECT id FROM questions WHERE title = 'I am the greatest person in history')),
  ((SELECT id FROM users WHERE fname = 'Cat'), (SELECT id FROM questions WHERE title = 'I am the greatest person in history'));

INSERT INTO
  replies (question_id, user_id, body)
VALUES
  ((SELECT id FROM questions WHERE title = 'I am the greatest person in history'), (SELECT id FROM users WHERE fname = 'Leo'), 'uhh what?'), 
  ((SELECT id FROM questions WHERE title = 'Bowling?'), (SELECT id FROM users WHERE fname = 'John'), 'anyone?');

INSERT INTO
  replies (question_id, user_id, body, parent_id)
VALUEs
  ((SELECT id FROM questions WHERE title = 'I am the greatest person in history'), (SELECT id FROM users WHERE fname = 'Kendall'), 'You heard me', (SELECT id FROM replies WHERE body = 'uhh what?')),
  ((SELECT id FROM questions WHERE title = 'I am the greatest person in history'), (SELECT id FROM users WHERE fname = 'Cat'), 'PLEASE HELP!!', (SELECT id FROM replies WHERE body = 'uhh what?')),
  ((SELECT id FROM questions WHERE title = 'Bowling?'), (SELECT id FROM users WHERE fname = 'Cat'), 'ME!', (SELECT id FROM replies WHERE body = 'anyone?')),
  ((SELECT id FROM questions WHERE title = 'Bowling?'), (SELECT id FROM users WHERE fname = 'Kendall'), 'I''m about to rock your world', (SELECT id FROM replies WHERE body = 'anyone?')),
  ((SELECT id FROM questions WHERE title = 'Bowling?'), (SELECT id FROM users WHERE fname = 'John'), ':D :D :D', 5);

INSERT INTO
  question_likes (user_id, question_id)
VALUES 
  ((SELECT id FROM users WHERE fname = 'Leo'), (SELECT id FROM questions WHERE title = 'Bowling?')),
  ((SELECT id FROM users WHERE fname = 'Cat'), (SELECT id FROM questions WHERE title = 'Bowling?')),
  ((SELECT id FROM users WHERE fname = 'Kendall'), (SELECT id FROM questions WHERE title = 'Bowling?')),
  ((SELECT id FROM users WHERE fname = 'Kendall'), (SELECT id FROM questions WHERE title = 'I am the greatest person in history'));
