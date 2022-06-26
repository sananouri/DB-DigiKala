use digiDB

create table form (
	code int primary key identity(1,1),
	topic varchar(255),
	positive_points varchar(255),
	negative_points varchar(255),
	context varchar(255),
	includes_picture bit,
	suggest_to_others bit,
	productKey int foreign key references product(productKey) on delete cascade,
	user_mobile char(10) foreign key references userTable(mobile) on delete cascade
);

-----------form-----------
insert into form (includes_picture, productKey, user_mobile) 
values (1,24,'1234567890'),
		(1,7,'2345678901'),
		(0,32,'3456789012'),
		(0,32,'4567890123'),
		(0,7,'4567890123'),
		(0,7,'1234567890'),
		(0,32,'5678901234');