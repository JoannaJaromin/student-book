create table if not exists student_book.teachers (
id integer primary key generated by default as identity,
username varchar(20) not null,
password varchar(20) not null,
first_name varchar(20) not null,
last_name varchar(30) not null,
email varchar(30) not null
);