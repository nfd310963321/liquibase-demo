--liquibase formatted sql
--changeset huangxin:v0.0.0.2-1
CREATE table test1(
id int primary key auto_increment
);
CREATE TABLE POC1(
  ID int primary key auto_increment,
  NAME VARCHAR(255) NULL
);
--rollback DROP table test1;
--rollback DROP TABLE POC1;
