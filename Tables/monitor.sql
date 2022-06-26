use digiDB

create table monitor (
	hasSpeaker bit,
	panelType varchar(255),
	background_lighting varchar(255),
	display varchar(255),
	resolution int,
	response_rate int,
	productKey int foreign key references computerAccessory(code) on delete cascade
);

--------------monitor------------------------
insert into monitor (resolution, productKey)
values (100,6),
		(200,7),
		(70,8),
		(80,9),
		(110,10);