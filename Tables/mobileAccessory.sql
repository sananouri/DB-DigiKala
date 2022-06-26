use digiDB

create table mobileAccessory (
	code int primary key,
	usableFor varchar(255),
	productKey int foreign key references digitalProduct(code) on delete cascade
);

-----------bag&cover-------------------------
insert into mobileAccessory (code, usableFor, productKey)
values (1,'Samsung Galaxy A51',1),
		(2,'iPhone 11 Pro Max',2),
		(3,'Samsung Galaxy S5',3),
		(4,'Xiaomi Redmi Note 8 Pro',4),
		(5,'Samsung Galaxy S5',5);

-----------powerBank-------------------------
insert into mobileAccessory (code, usableFor, productKey)
values (6,null,6),
		(7,null,7),
		(8,null,8),
		(9,null,9),
		(10,null,10);

-----------mobileStand-------------------------
insert into mobileAccessory (code, usableFor, productKey)
values (11,null,11),
		(12,'LG',12),
		(13,'LG',13),
		(14,null,14),
		(15,null,15);