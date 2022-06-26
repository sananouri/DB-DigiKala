use digiDB

create table bagAndCover (
	material varchar(255),
	structure varchar(255),
	productKey int foreign key references mobileAccessory(code) on delete cascade
);

-----------bag&cover-------------------------
insert into bagAndCover(productKey) 
values (1),
		(2),
		(3),
		(4),
		(5);