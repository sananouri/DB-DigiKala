use digiDB

create table laptop (
	RAM int,
	graphic int, 
	internalMemory int,
	displaySize int,
	resolution int,
	OS varchar(255),
	GPUproduser varchar(255),
	CPU varchar(255),
	RAMtype varchar(255),
	touchScreen bit,
	productKey int foreign key references digitalProduct(code) on delete cascade
);

-----------laptop-------------------------
insert into laptop (RAM, graphic, internalMemory, resolution, CPU, productKey)
values (4,2,1,1920*1080,'celeron',21),
		(4,3,1,1920*1080,'core i7',22),
		(8,3,1,1920*1080,'core i7',23),
		(8,4,1,1920*1080,'core i3',24),
		(4,2,1,1920*1080,'core i5',25);