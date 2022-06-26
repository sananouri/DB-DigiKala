use digiDB

create table digitalProduct (
	code int primary key,
	guaranted bit,
	size int,
	special_functions varchar(255),
	model varchar(255),
	weightValue int,
	productKey int foreign key references product(productKey) on delete cascade
);

-----------bag&cover-------------------------
insert into digitalProduct(code, guaranted, size, weightValue, productKey) 
values (1,1,7,3,1),
		(2,1,9,2,2),
		(3,0,6,1,3),
		(4,1,7,2,4),
		(5,1,7,2,5);

-----------powerBank-------------------------
insert into digitalProduct(code, guaranted, size, weightValue, productKey) 
values (6,1,3,10,6),
		(7,1,4,5,7),
		(8,1,3,7,8),
		(9,1,3,4,9),
		(10,1,4,4,10);

-----------mobileStand-------------------------
insert into digitalProduct(code, guaranted, size, weightValue, productKey) 
values (11,1,12,40,11),
		(12,1,5,15,12),
		(13,1,7,3,13),
		(14,1,19,6,14),
		(15,1,13,4,15);

-----------mobilePhone-------------------------
insert into digitalProduct(code, guaranted, size, weightValue, productKey) 
values (16,1,7,15,16),
		(17,1,7,14,17),
		(18,1,9,16,18),
		(19,1,9,16,19),
		(20,1,7,10,20);

----------laptop----------
insert into digitalProduct (code, guaranted, size, weightValue, productKey)
values (21,1,27,1.9,21),
		(22,1,27,2.1,22),
		(23,1,28,3,23),
		(24,1,27,2,24),
		(25,0,25,3,25);

------------computerAccessory------------
-----------------keyboad----------------------
insert into digitalProduct (code, guaranted, size, weightValue, productKey)
values (26,0,30,1,26),
		(27,1,29,1,27),
		(28,1,28,1,28),
		(29,1,28,1,29),
		(30,0,20,3,30);

--------------monitor------------------------
insert into digitalProduct (code, guaranted, size, weightValue, productKey)
values (31,0,19,2,31),
		(32,0,28,3,32),
		(33,0,26,1,33),
		(34,1,27,2,34),
		(35,1,30,4,35);

--------assembledCase-------------------------
insert into digitalProduct (code, guaranted, size, weightValue, productKey)
values (36,1,40,6,36),
		(37,1,45,5,37),
		(38,1,33,7,38),
		(39,0,40,8,39),
		(40,0,50,6,40);

--------------data_storage_hardware--> external_hard_disk-----------
insert into digitalProduct (code, guaranted, size, weightValue, productKey)
values (41,1,30,2,41),
		(42,0,29,1,42),
		(43,1,35,3,43),
		(44,1,29,2,44),
		(45,0,27,1,45);

