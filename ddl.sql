drop table if exists  ORDER_SMARTPHONES;
drop table if exists  PURCHASE_ORDER;
drop sequence if exists PURCHASE_ORDER_ID_SEQ;
drop table if exists  APP_USER;
drop sequence if exists APP_USER_ID_SEQ;
drop table if exists  SMARTPHONE;
drop sequence if exists SMARTPHONE_ID_SEQ;
drop table if exists  BRAND;
drop sequence if exists BRAND_ID_SEQ;

create table BRAND
(
    ID   INTEGER primary key,
    NAME VARCHAR(255) not null
);
create sequence BRAND_ID_SEQ START WITH 1 INCREMENT BY 1;

INSERT INTO PUBLIC.BRAND (ID, NAME) VALUES (nextval('BRAND_ID_SEQ'), 'XIAOMI');
INSERT INTO PUBLIC.BRAND (ID, NAME) VALUES (nextval('BRAND_ID_SEQ'), 'Apple');
INSERT INTO PUBLIC.BRAND (ID, NAME) VALUES (nextval('BRAND_ID_SEQ'), 'Honor');
INSERT INTO PUBLIC.BRAND (ID, NAME) VALUES (nextval('BRAND_ID_SEQ'), 'Samsung');

create table SMARTPHONE
(
    ID          INTEGER        primary key,
    CPU         VARCHAR(255)   not null,
    DESCRIPTION VARCHAR(255),
    GPU         VARCHAR(255)   not null,
    MODEL_NAME  VARCHAR(255)   not null,
    PRICE       DECIMAL(19, 2) not null,
    RAM         INTEGER        not null,
    ROM         INTEGER        not null,
    BRAND_ID    BIGINT         not null references BRAND (ID)
);
create sequence SMARTPHONE_ID_SEQ START WITH 1 INCREMENT BY 1;

INSERT INTO PUBLIC.SMARTPHONE (ID, CPU, DESCRIPTION, GPU, MODEL_NAME, PRICE, RAM, ROM, BRAND_ID) VALUES (nextval('SMARTPHONE_ID_SEQ'), 'Snapdragon 420', 'Lorem Ipsum', 'auf 223', 'A2 Lite', 12990.00, 4, 64, 1);
INSERT INTO PUBLIC.SMARTPHONE (ID, CPU, DESCRIPTION, GPU, MODEL_NAME, PRICE, RAM, ROM, BRAND_ID) VALUES (nextval('SMARTPHONE_ID_SEQ'), 'M1', 'Lorem Ipsum', 'auf 223', 'SE 2020', 44590.00, 3, 64, 2);
INSERT INTO PUBLIC.SMARTPHONE (ID, CPU, DESCRIPTION, GPU, MODEL_NAME, PRICE, RAM, ROM, BRAND_ID) VALUES (nextval('SMARTPHONE_ID_SEQ'), 'Snapdragon 420', 'Lorem Ipsum', 'auf 223', 'POCO F3', 12990.00, 4, 256, 1);
INSERT INTO PUBLIC.SMARTPHONE (ID, CPU, DESCRIPTION, GPU, MODEL_NAME, PRICE, RAM, ROM, BRAND_ID) VALUES (nextval('SMARTPHONE_ID_SEQ'), 'M1', 'Lorem Ipsum', 'auf 223', 'iPhone 11', 44590.00, 4, 128, 2);
INSERT INTO PUBLIC.SMARTPHONE (ID, CPU, DESCRIPTION, GPU, MODEL_NAME, PRICE, RAM, ROM, BRAND_ID) VALUES (nextval('SMARTPHONE_ID_SEQ'), 'Snapdragon 420', 'Lorem Ipsum', 'auf 223', 'MI 9T', 12990.00, 4, 128, 1);
INSERT INTO PUBLIC.SMARTPHONE (ID, CPU, DESCRIPTION, GPU, MODEL_NAME, PRICE, RAM, ROM, BRAND_ID) VALUES (nextval('SMARTPHONE_ID_SEQ'), 'Snapdragon 640', 'Lorem Ipsum', 'auf 223', 'Honor 30i', 44590.00, 3, 128, 3);

create table APP_USER
(
    ID          INTEGER      primary key,
    USER_NAME   VARCHAR(255) not null unique,
    PASSWORD    VARCHAR(255) not null,
    USER_ROLE   VARCHAR(255) not null
);
create sequence APP_USER_ID_SEQ START WITH 1 INCREMENT BY 1;

INSERT INTO PUBLIC.APP_USER (ID, USER_NAME, PASSWORD, USER_ROLE) VALUES (nextval('APP_USER_ID_SEQ'),'user', '$2y$12$ZVZhwzHdQtiwnMiKJy7MBOz3Hc7Dd2R3zNGR8OjAy5Gv55tiUuStS', 'USER');
INSERT INTO PUBLIC.APP_USER (ID, USER_NAME, PASSWORD, USER_ROLE) VALUES (nextval('APP_USER_ID_SEQ'),'admin', '$2y$12$tqCFxPbjqq9DdOhCneFFJ./eTtG9BBJsqtqISVSkFkEY06z/GPau6', 'ADMIN');


create table PURCHASE_ORDER
(
    ID         INTEGER        primary key,
    FULL_PRICE DECIMAL(19, 2) not null,
    NUMBER     VARCHAR(255)   not null,
    STATUS     VARCHAR(255)   not null,
    USER_ID    BIGINT         references APP_USER (ID)
);
create sequence PURCHASE_ORDER_ID_SEQ START WITH 1 INCREMENT BY 1;

create table ORDER_SMARTPHONES
(
    SMARTPHONE_ID BIGINT not null references SMARTPHONE (ID),
    ORDER_ID      BIGINT not null references PURCHASE_ORDER (ID)
);