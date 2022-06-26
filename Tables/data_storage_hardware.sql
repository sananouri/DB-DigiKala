use digiDB

create table data_storage_hardware (
	code int primary key,
	capacity int,
	water_proof bit,
	shock_proof bit,
	productKey int foreign key references computerAccessory(code) on delete cascade
);

--------------external_hard_disk -----------
insert into data_storage_hardware (code, productKey)
values (1,16),
		(2,17),
		(3,18),
		(4,19),
		(5,20);