use digiDB

create table computerAccessory (
	code int primary key,
	hasUSBport bit,
	hasHTMLport bit,
	hasDVIport bit,
	productKey int foreign key references digitalProduct(code) on delete cascade
);

-----------keyboard-----------
insert into computerAccessory (code, productKey)
values (1,26),
		(2,27),
		(3,28),
		(4,29),
		(5,30);

--------------monitor------------------------
insert into computerAccessory (code, productKey)
values (6,31),
		(7,32),
		(8,33),
		(9,34),
		(10,35);

--------assembledCase-----------
insert into computerAccessory (code, productKey)
values (11,36),
		(12,37),
		(13,38),
		(14,39),
		(15,40);

--------------data_storage_hardware --> external_hard_disk -----------
insert into computerAccessory (code, productKey)
values (16,41),
		(17,42),
		(18,43),
		(19,44),
		(20,45);