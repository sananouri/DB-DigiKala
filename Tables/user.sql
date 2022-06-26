use digiDB

create table userTable (
	mobile char(10) primary key,
	email varchar(255),
	username varchar(255),
	credit_card_number int,
	user_address varchar(255)
);

-----------user-----------
insert into userTable (mobile) 
values ('1234567890'),
		('2345678901'),
		('3456789012'),
		('4567890123'),
		('5678901234');