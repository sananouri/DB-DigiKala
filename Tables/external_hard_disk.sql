use digiDB

create table external_hard_disk (
	capacity int,
	water_proof bit,
	shock_proof bit,
	productKey int foreign key references data_storage_hardware(code) on delete cascade
);

--------------external_hard_disk -----------
insert into external_hard_disk (productKey) 
values(1),
		(2),
		(3),
		(4),
		(5);