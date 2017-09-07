--liquibase formatted sql
--changeset huangxin:v0.0.0.1-1
CREATE table test(
id int primary key auto_increment
);
CREATE TABLE POC (
  ID int primary key auto_increment,
  NAME VARCHAR(255) NULL
);
--rollback DROP table test;
--rollback DROP TABLE POC;

--changeset huangxin:v0.0.0.1-2
INSERT INTO test VALUES(1);
INSERT INTO POC VALUES(1, 'Poc Test 2');
--rollback DELETE FROM test WHERE id=1;
--rollback DELETE FROM POC WHERE NAME in('Poc Test 2');

--changeset huangxin:v0.0.0.1-3
INSERT INTO test VALUES(2);
INSERT INTO POC VALUES(2, 'Poc Test 3');
--rollback DELETE FROM test WHERE id=2;
--rollback DELETE FROM POC WHERE NAME in('Poc Test 3');