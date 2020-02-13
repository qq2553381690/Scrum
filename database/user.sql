drop database if exists springmvc;

create database springmvc;

use springmvc;

create table t_user
(
   id int primary key auto_increment,
   username varchar(50),
   password varchar(50),
   phone varchar(50),
   address varchar(50)
)engine=Innodb default charset=utf8;