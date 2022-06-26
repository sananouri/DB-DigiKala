use digiDB

create table mobilePhone (
	model varchar(255),
	networkConnection varchar(255),
	OStype varchar(255),
	OSversion varchar(255),
	resolution int,
	technology varchar(255),
	RAM int,
	internalMemory int,
	productKey int foreign key references digitalProduct(code) on delete cascade
);

-----------mobilePhone-------------------------
insert into mobilePhone (OStype, OSversion, resolution, RAM, internalMemory, productKey)
values ('Android', '8', 13, 8, 128, 16),
		('Android', '8', 48, 8, 64, 17),
		('iOS', '14', 12, 6, 256, 18),
		('iOS', '14', 12, 4, 128, 19),
		('Android', '8', 64, 6, 64, 20);