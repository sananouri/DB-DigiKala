use digiDB

create table powerBank (
	numOfPort int,
	capacity int,
	material varchar(255),
	outputCurrency int,
	powerDelivery bit,
	productKey int foreign key references mobileAccessory(code) on delete cascade
);

-----------powerBank-------------------------
insert into powerBank (numOfPort, capacity, productKey)
values (2,10,6),
		(1,4,7),
		(3,10,8),
		(2,7,9),
		(2,4,10);
