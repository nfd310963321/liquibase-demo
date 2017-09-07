--liquibase formatted sql
--changeset huangxin:v0.0.0.1-1
CREATE table sms_send_info(
id int primary key auto_increment
);
CREATE TABLE sms_send_log (
  ID int primary key auto_increment,
  NAME VARCHAR(255) NULL
);
--rollback DROP table sms_send_info;
--rollback DROP TABLE sms_send_log;

--changeset huangxin:v0.0.0.1-2
CREATE table sms_send_info1(
id int primary key auto_increment
);
CREATE TABLE sms_send_log1 (
  ID int primary key auto_increment,
  NAME VARCHAR(255) NULL
);
--rollback DROP table sms_send_info1;
--rollback DROP TABLE sms_send_log1;