use digiDB

create table keyboard (
	connectionType varchar(255),
	portType varchar(255),
	hasMouse bit,
	has_mic_handsfreePort bit,
	water_proof bit,
	productKey int foreign key references computerAccessory(code) on delete cascade
);

-----------keyboard-----------
insert into keyboard (productKey) 
values (1),
		(2),
		(3),
		(4),
		(5);