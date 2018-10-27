CREATE TABLE bucket (
	bucket_id VARCHAR2(20 BYTE) NOT NULL,
	delivery_address VARCHAR2(20 BYTE),
	charge FLOAT(126),
	client_email VARCHAR2(20 BYTE) NOT NULL,
	transporter_transporter_id VARCHAR2(20 BYTE),truck_plate_nr VARCHAR2(20 BYTE),
	shelf_shelf_id VARCHAR2(20 BYTE)
);

CREATE UNIQUE INDEX bucket__idx ON
	bucket ( transporter_transporter_id ASC );

CREATE UNIQUE INDEX bucket__idxv1 ON
	bucket ( shelf_shelf_id ASC );

CREATE UNIQUE INDEX bucket__idxv2 ON
	bucket ( truck_plate_nr ASC );

ALTER TABLE bucket ADD CONSTRAINT bucket_pk PRIMARY KEY ( bucket_id );

CREATE TABLE client (
	email VARCHAR2(20 BYTE) NOT NULL,
	name VARCHAR2(20 BYTE),
	surname VARCHAR2(20 BYTE)
);

ALTER TABLE client ADD CONSTRAINT client_pk PRIMARY KEY ( email );

CREATE TABLE employee (
	employee_id VARCHAR2(20 BYTE) NOT NULL,
	position VARCHAR2(20 BYTE),
	name VARCHAR2(20 BYTE),
	surname VARCHAR2(20 BYTE),
	warehause_warehause_id VARCHAR2(20 BYTE)
);

ALTER TABLE employee ADD CONSTRAINT employee_pk PRIMARY KEY ( employee_id );
CREATE TABLE loading (
	loading_nr NUMBER NOT NULL,
	time DATE,
	loading_gate_gate_nr NUMBER NOT NULL
);

CREATE UNIQUE INDEX loading__idx ON
	loading ( loading_gate_gate_nr ASC );

ALTER TABLE loading ADD CONSTRAINT loading_pk PRIMARY KEY ( loading_nr );

CREATE TABLE loading_gate (
	gate_nr NUMBER NOT NULL,
	length NUMBER,
	width NUMBER,
	hight NUMBER,
	warehause_warehause_id VARCHAR2(20 BYTE) NOT NULL
);

ALTER TABLE loading_gate ADD CONSTRAINT loading_gate_pk PRIMARY KEY ( gate_nr );
CREATE TABLE shelf (
	shelf_id VARCHAR2(20 BYTE) NOT NULL,
	bearing_capacity NUMBER,
	length NUMBER,
	hight NUMBER,
	width NUMBER,
	warehause_warehause_id VARCHAR2(20 BYTE) NOT NULL,
	bucket_bucket_id VARCHAR2(20 BYTE)
);

CREATE UNIQUE INDEX shelf__idx ON
shelf ( bucket_bucket_id ASC );

ALTER TABLE shelf ADD CONSTRAINT shelf_pk PRIMARY KEY ( shelf_id );

CREATE TABLE supervising_tower (
	tower_id VARCHAR2(20 BYTE) NOT NULL,
	people_required NUMBER,
	sector VARCHAR2(20 BYTE),
	employee_employee_id VARCHAR2(20 BYTE) NOT NULL,
	warehause_warehause_id VARCHAR2(20 BYTE) NOT NULL
);

ALTER TABLE supervising_tower ADD CONSTRAINT supervising_tower_pk PRIMARY KEY ( tower_id );

CREATE TABLE transporter (
	transporter_id VARCHAR2(20 BYTE) NOT NULL,
	type VARCHAR2(20 BYTE),
	supervising_tower_tower_id VARCHAR2(20 BYTE) NOT NULL,
	bucket_bucket_id VARCHAR2(20 BYTE)
);

CREATE UNIQUE INDEX transporter__idx ON
	transporter ( bucket_bucket_id ASC );

ALTER TABLE transporter ADD CONSTRAINT transporter_pk PRIMARY KEY ( transporter_id );

CREATE TABLE truck (
	plate_nr VARCHAR2(20 BYTE) NOT NULL,
	capacity NUMBER,
	range NUMBER,
	loading_loading_nr NUMBER NOT NULL,
	bucket_bucket_id VARCHAR2(20 BYTE)
);

CREATE UNIQUE INDEX truck__idx ON
	truck ( bucket_bucket_id ASC );

CREATE UNIQUE INDEX truck__idxv1 ON
	truck ( loading_loading_nr ASC );

ALTER TABLE truck ADD CONSTRAINT truck_pk PRIMARY KEY ( plate_nr );

CREATE TABLE warehause (
	warehause_id VARCHAR2(20 BYTE) NOT NULL,
	location VARCHAR2(20 BYTE),
	capabilty NUMBER,
	type VARCHAR2(20 BYTE)
);

ALTER TABLE warehause ADD CONSTRAINT warehause_pk PRIMARY KEY ( warehause_id );

ALTER TABLE bucket
ADD CONSTRAINT bucket_client_fk FOREIGN KEY ( client_email )
REFERENCES client ( email );

ALTER TABLE bucket
ADD CONSTRAINT bucket_shelf_fk FOREIGN KEY ( shelf_shelf_id )
REFERENCES shelf ( shelf_id );

ALTER TABLE bucket
ADD CONSTRAINT bucket_transporter_fk FOREIGN KEY ( transporter_transporter_id )
REFERENCES transporter ( transporter_id );

ALTER TABLE bucket
ADD CONSTRAINT bucket_truck_fk FOREIGN KEY ( truck_plate_nr )
REFERENCES truck ( plate_nr );

ALTER TABLE employee
ADD CONSTRAINT employee_warehause_fk FOREIGN KEY ( warehause_warehause_id )
REFERENCES warehause ( warehause_id );

ALTER TABLE loading_gate
ADD CONSTRAINT loading_gate_warehause_fk FOREIGN KEY ( warehause_warehause_id )
REFERENCES warehause ( warehause_id );

ALTER TABLE loading
ADD CONSTRAINT loading_loading_gate_fk FOREIGN KEY ( loading_gate_gate_nr )
REFERENCES loading_gate ( gate_nr );

ALTER TABLE shelf
ADD CONSTRAINT shelf_bucket_fk FOREIGN KEY ( bucket_bucket_id )
REFERENCES bucket ( bucket_id );

ALTER TABLE shelf
ADD CONSTRAINT shelf_warehause_fk FOREIGN KEY ( warehause_warehause_id )
REFERENCES warehause ( warehause_id );

ALTER TABLE supervising_tower
ADD CONSTRAINT supervising_tower_employee_fk FOREIGN KEY ( employee_employee_id )
REFERENCES employee ( employee_id );

ALTER TABLE supervising_tower
ADD CONSTRAINT supervising_tower_warehause_fk FOREIGN KEY ( warehause_warehause_id )
REFERENCES warehause ( warehause_id );

ALTER TABLE transporter
ADD CONSTRAINT transporter_bucket_fk FOREIGN KEY ( bucket_bucket_id )
REFERENCES bucket ( bucket_id );
--
ALTER TABLE transporter
ADD CONSTRAINT transporter_supervising_tower_fk FOREIGN KEY ( supervising_tower_tower_id )
REFERENCES supervising_tower ( tower_id );

ALTER TABLE truck
ADD CONSTRAINT truck_bucket_fk FOREIGN KEY ( bucket_bucket_id )
REFERENCES bucket ( bucket_id );

ALTER TABLE truck
ADD CONSTRAINT truck_loading_fk FOREIGN KEY ( loading_loading_nr )
REFERENCES loading ( loading_nr);