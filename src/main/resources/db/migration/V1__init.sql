CREATE SCHEMA IF NOT EXISTS student_book;

CREATE TABLE IF NOT EXISTS student_book.students (
                                                     id integer PRIMARY KEY GENERATED BY DEFAULT AS IDENTITY,
                                                     first_name varchar(20) NOT NULL,
                                                     last_name varchar(30) NOT NULL,
                                                     email varchar(30) NOT NULL
);

CREATE TABLE IF NOT EXISTS student_book.subjects (
                                                     id integer PRIMARY KEY GENERATED BY DEFAULT AS IDENTITY,
                                                     subject_name varchar(20) NOT NULL
);

CREATE TABLE IF NOT EXISTS student_book.grades (
                                                   id integer PRIMARY KEY GENERATED BY DEFAULT AS IDENTITY,
                                                   student_id integer REFERENCES student_book.students(id),
                                                   subject_id integer REFERENCES student_book.subjects(id),
                                                   grade integer NOT NULL
);

TRUNCATE student_book.students CASCADE;
INSERT INTO student_book.students (id, first_name, last_name, email)
VALUES
(1,'Jan', 'Kowalski', 'jan.kowalski@twojmail.com'),
(2,'Patryk', 'Nowak', 'patryk.nowak@skrzyneczka.pl'),
(3,'Barbara', 'Kwiatek', 'kwiatuszek@twojmail.com');

TRUNCATE student_book.subjects CASCADE;
INSERT INTO student_book.subjects (id,subject_name)
VALUES
(1,'Matematyka'),
(2,'Język Polski'),
(3,'Język Angielski'),
(4,'Historia'),
(5,'Biologia');

TRUNCATE student_book.grades CASCADE;
INSERT INTO student_book.grades (id, student_id, subject_id, grade)
VALUES
(1,1,1,5),
(2,1,2,3),
(3,1,5,4),
(4,2,3,2),
(5,2,4,2),
(6,2,1,3),
(7,3,1,1),
(8,3,2,5),
(9,2,4,3);

ALTER SEQUENCE student_book.students_id_seq RESTART WITH 4;

ALTER SEQUENCE student_book.subjects_id_seq RESTART WITH 6;

ALTER SEQUENCE student_book.grades_id_seq RESTART WITH 10;