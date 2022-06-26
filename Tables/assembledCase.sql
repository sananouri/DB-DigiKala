use digiDB

create table assembledCase (
	internal_memory int,
	RAM int,
	memoryType varchar(255),
	CPUproducer varchar(255),
	productKey int foreign key references computerAccessory(code) on delete cascade
);

--------assembledCase-----------
insert into assembledCase (internal_memory, RAM, productKey) 
values (256,64,11),
		(64,16,12),
		(128,4,13),
		(1024,32,14),
		(256,64,15);
