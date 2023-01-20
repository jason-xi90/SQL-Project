
drop table if exists Sales_Invoice

create table Car (
	Car_ID SERIAL primary key,
	Serial_number INTEGER not null,
	Make VARCHAR(100),
	Model VARCHAR(100),
	Year_made NUMERIC(4,0),
    Car_for_Sale BOOLEAN
);

insert into Car values (
	12345,
	112233,
	'BMW',
	'X3',
	2023,
	TRUE
),
(
	54321,
	332211,
	'Lexus',
	'RX',
	2022,
	TRUE
);

create table Customer_info (
	Customer_ID SERIAL primary key,
	Last_name VARCHAR(100),
	First_name VARCHAR(100),
	Phone_number NUMERIC(10,0),
    Customer_address VARCHAR(100),
    City VARCHAR(100),
	Zip_code NUMERIC(5,0)
);

insert into Customer_info values (
	11111,
	'Jackson',
	'Hugh',
	1112223333,
	'123 Main St',
	12345
),
(
	54321,
	'Washington',
	'John',
	1234567890,
	'234 Front St',
	54321
);

create table Service (
	Service_ID SERIAL primary key,
	Servicename VARCHAR(100),
	Hourly_rate NUMERIC(3,0)
);

insert into Service values (
	67890,
	'Alignment',
	111
),
(
	23253,
	'Tire',
	100
);

create table Parts (
	Parts_ID SERIAL primary key,
	Part_number INTEGER not null,
	Part_description VARCHAR(100),
    Purchase_price NUMERIC(6,0),
    Retail_price NUMERIC(6,0)
);

insert into Parts values (
	12345,
	345,
	'Tire',
	300,
	350
),
(
	23259,
	578,
	'Rotor',
	500,
	600
);

create table Mechanics (
	Mechanic_ID SERIAL primary key,
	Last_name VARCHAR(100),
    First_name VARCHAR(100)
);

insert into Mechanics values (
	43536,
	'Allen',
	'Woody'
),
(
	70687,
	'Anderson',
	'Jesse'
);

create table Salespersons (
	Salesperson_ID SERIAL primary key,
	Last_name VARCHAR(100),
    First_name VARCHAR(100)
);

insert into Salespersons values (
	655,
	'Taney',
	'Roger'
),
(
	789,
	'Smith',
	'Jesse'
);

create table Service_Ticket (
	Service_ticket_ID SERIAL primary key,
	Service_ticket_number INTEGER not null,
	Date_received DATE,
    Comments VARCHAR(100),
    Date_returned DATE,
    car_id SERIAL,
    customer_id SERIAL,
	foreign key(car_id) references Car(car_id),
	foreign key(customer_id) references Customer_info(customer_id)
);

insert into Service_Ticket values (
	9876643,
	345435378,
	'2022-12-16',
	'No comment',
	'2022-12-18',
	12345,
	11111
),
(
	76707890,
	34534535,
	'2023-1-2',
	'Good job',
	'2023-1-5',
	54321,
	54321
);

create table Parts_used (
	Parts_Used_ID SERIAL primary key,
	Number_used INTEGER not null,
    Price NUMERIC(3,0),
    Parts_ID SERIAL,
    Service_ticket_ID SERIAL,
    foreign key(Parts_ID) references Parts(Parts_ID),
	foreign key(Service_ticket_ID) references Service_Ticket(Service_ticket_ID)
);

insert into Parts_used values (
	345435,
	31,
	100,
	12345,
	9876643
),
(
	345356,
	39,
	120,
	23259,
	76707890
);

create table Service_Mechanic (
	Service_Mechanic_ID SERIAL primary key,
	Hours_spent Float,
    Comments VARCHAR(100),
    Rate VARCHAR(100),
    Mechanic_ID SERIAL,
    Service_ticket_ID SERIAL,
    Service_ID SERIAL,
    foreign key(Mechanic_ID) references Mechanics(Mechanic_ID),
	foreign key(Service_ticket_ID) references Service_Ticket(Service_ticket_ID),
    foreign key(Service_ID) references Service(Service_ID)
);

insert into Service_Mechanic values (
	354365,
	1.5,
	'No comment',
	'Good',
	43536,
	9876643,
	67890
),
(
	365467,
	3,
	'Needs work',
	'Average',
	70687,
	76707890,
	23253
);

create table Sales_Invoice (
	Invoice_ID SERIAL primary key,
	Invoice_number INTEGER not null,
    Sales_date DATE,
    Car_ID SERIAL,
    Customer_ID SERIAL,
    Salesperson_ID SERIAL,
    foreign key(Car_ID) references Car(Car_ID),
	foreign key(Customer_ID) references Customer_info(Customer_ID),
    foreign key(Salesperson_ID) references Salespersons(Salesperson_ID)
);

insert into Sales_Invoice values (
	26547,
	457658,
	'2022-12-31',
	12345,
	11111,
	655
),
(
	34365,
	13429,
	'2023-1-2',
	54321,
	54321,
	789
);