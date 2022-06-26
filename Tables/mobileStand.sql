use digiDB

create table mobileStand (
	chargable bit,
	wirelessCharge bit,
	rotation360 int,
	productKey int foreign key references mobileAccessory(code) on delete cascade
);

-----------mobileStand-------------------------
insert into mobileStand(productKey) 
values (11),
		(12),
		(13),
		(14),
		(15);