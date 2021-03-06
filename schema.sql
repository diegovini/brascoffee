CREATE TABLE BEVERAGE (
	id serial NOT NULL,
	description VARCHAR(100) NOT NULL,
	cost DECIMAL NOT NULL,
	CONSTRAINT BEVERAGE_pk PRIMARY KEY (id)
) WITH (
  OIDS=FALSE
);



CREATE TABLE CONDIMENT (
	id serial NOT NULL,
	description VARCHAR(100) NOT NULL,
	cost DECIMAL NOT NULL,
	CONSTRAINT CONDIMENT_pk PRIMARY KEY (id)
) WITH (
  OIDS=FALSE
);



CREATE TABLE ORDERS (
	id serial NOT NULL,
	beverage_id integer NOT NULL,
	final_price DECIMAL NOT NULL,
	user_id integer NOT NULL,
	CONSTRAINT ORDERS_pk PRIMARY KEY (id)
) WITH (
  OIDS=FALSE
);



CREATE TABLE ORDERS_CONDIMENT (
	id serial NOT NULL,
	condiment_id serial NOT NULL,
	order_id serial NOT NULL,
	CONSTRAINT ORDERS_CONDIMENT_pk PRIMARY KEY (id)
) WITH (
  OIDS=FALSE
);



CREATE TABLE USER_ACCOUNT (
	id serial NOT NULL,
	username VARCHAR(100) NOT NULL,
	password VARCHAR(60) NOT NULL,
	CONSTRAINT USER_ACCOUNT_pk PRIMARY KEY (id)
) WITH (
  OIDS=FALSE
);



CREATE TABLE ROLES (
	id serial NOT NULL,
	name varchar(100) NOT NULL,
	CONSTRAINT ROLES_pk PRIMARY KEY (id)
) WITH (
  OIDS=FALSE
);



CREATE TABLE USER_ACCOUNT_ROLES (
	user_account_id serial NOT NULL,
	role_id serial NOT NULL,
	CONSTRAINT USER_ACCOUNT_ROLES_pk PRIMARY KEY (user_account_id,role_id)
) WITH (
  OIDS=FALSE
);





ALTER TABLE ORDERS ADD CONSTRAINT ORDERS_fk0 FOREIGN KEY (beverage_id) REFERENCES BEVERAGE(id);
ALTER TABLE ORDERS ADD CONSTRAINT ORDERS_fk1 FOREIGN KEY (user_id) REFERENCES USER_ACCOUNT(id);

ALTER TABLE ORDERS_CONDIMENT ADD CONSTRAINT ORDERS_CONDIMENT_fk0 FOREIGN KEY (condiment_id) REFERENCES CONDIMENT(id);
ALTER TABLE ORDERS_CONDIMENT ADD CONSTRAINT ORDERS_CONDIMENT_fk1 FOREIGN KEY (order_id) REFERENCES ORDERS(id);



ALTER TABLE USER_ACCOUNT_ROLES ADD CONSTRAINT USER_ACCOUNT_ROLES_fk0 FOREIGN KEY (user_account_id) REFERENCES USER_ACCOUNT(id);
ALTER TABLE USER_ACCOUNT_ROLES ADD CONSTRAINT USER_ACCOUNT_ROLES_fk1 FOREIGN KEY (role_id) REFERENCES ROLES(id);




INSERT INTO BEVERAGE VALUES(1,'BLACK COFFEE',2.75);
INSERT INTO BEVERAGE VALUES(2,'Pingado',1.00);

INSERT INTO CONDIMENT VALUES(1,'Milk',1.5);
INSERT INTO CONDIMENT VALUES(2,'Chantilly',2.2);


INSERT INTO USER_ACCOUNT VALUES (1,'ADMIN','$2b$10$7HW0SvfmOuZGoRb03JpwL.5pu3/cCRli8Ip6/NsZbwESfVGss.Ss2');
INSERT INTO USER_ACCOUNT VALUES (2,'USER','$2b$10$7HW0SvfmOuZGoRb03JpwL.5pu3/cCRli8Ip6/NsZbwESfVGss.Ss2');

INSERT INTO ROLES VALUES (1,'ADMIN');
INSERT INTO ROLES VALUES (2,'USER');

INSERT INTO USER_ACCOUNT_ROLES VALUES(1,1);
INSERT INTO USER_ACCOUNT_ROLES VALUES(1,2);
INSERT INTO USER_ACCOUNT_ROLES VALUES(2,2);

INSERT INTO ORDERS VALUES(1,1,4.25,1);
INSERT INTO ORDERS VALUES(2,2,1,1);

INSERT INTO ORDERS_CONDIMENT VALUES(1,1,1);

