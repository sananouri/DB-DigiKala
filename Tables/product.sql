use digiDB

create table product (
	productKey int primary key,
	productName varchar(255),
	price int,
	instant_delivery bit,
	seller varchar(255),
	brand varchar(255),
	available int,
	numOfView int,
	numOfSales int,
	score int,
	promotion_status int,
	outstanding_offer bit,
	discount int
);

-----------mobileAccessory-------------------------
-----------bag&cover-------------------------
insert into product (productKey, productName, price, available, brand, numOfSales, promotion_status, outstanding_offer, discount) 
values (1,'bag&cover',100,10,'Armor',5,0,1,0),
		(2,'bag&cover',200,64,'Topics',20,1,0,40),
		(3,'bag&cover',350,12,'Joy room',70,0,1,0),
		(4,'bag&cover',170,53,'Other',10,1,0,10),
		(5,'bag&cover',500,6,'Topics',12,0,1,0);

-----------powerBank-------------------------
insert into product (productKey, productName, price, available, brand, numOfSales, promotion_status, outstanding_offer, discount) 
values (6,'powerBank',590,1,'Other',5,1,0,15),
		(7,'powerBank',760,5,'Miniso',30,1,0,23),
		(8,'powerBank',1200,30,'Xiaomi',25,0,0,0),
		(9,'powerBank',850,1,'iData',19,0,0,0),
		(10,'powerBank',1270,10,'Energize',9,0,0,0);

-----------mobileStand-------------------------
insert into product (productKey, productName, price, available, brand, numOfSales, promotion_status, outstanding_offer, discount) 
values (11,'mobileStand',49,84,'Unimot',14,0,0,0),
		(12,'mobileStand',59,67,'Other',58,1,0,14),
		(13,'mobileStand',10,93,'Other',104,1,0,7),
		(14,'mobileStand',54,55,'Other',76,0,0,0),
		(15,'mobileStand',5,74,'Other',564,2,0,9);

-----------mobilePhone-------------------------
insert into product (productKey, productName, price, available, brand, numOfSales, promotion_status, outstanding_offer, discount, instant_delivery) 
values (16,'Samsung Galaxy S5',15800,56,'Samsung',159,1,1,2,1),
		(17,'Samsung Galaxy A51',5400,126,'Samsung',742,0,1,0,1),
		(18,'iPhone 11 Pro Max',49500,410,'apple',562,2,0,7,1),
		(19,'iPhone 12 A2404',36000,740,'apple',261,0,0,0,0),
		(20,'Redmi Note 8 Pro m1906g7G',6980,326,'Xiaomi',54,1,0,4,0);

-----------laptop-------------------------
insert into product (productKey, productName, price, available, brand, numOfSales, promotion_status, outstanding_offer, discount)
values (21,'laptop',10000,97,'asus',100,2,1,50),
		(22,'laptop',15000,1,'acer',75,2,1,30),
		(23,'laptop',23000,26,'asus',80,2,1,10),
		(24,'laptop',60000,50,'apple',45,2,1,0),
		(25,'laptop',20000,0,'hp',33,2,1,0);

------------computerAccessory------------
------------keyboard---------------------
insert into product (productKey, productName, price, available, brand, numOfSales, promotion_status, outstanding_offer, discount)
values (26,'keyboard',5000,0,'green',11,2,1,0),
		(27,'keyboard',1000,1,'green',22,2,1,5),
		(28,'keyboard',1500,1,'TSCO',78,2,1,10),
		(29,'keyboard',3200,5,'TSCO',80,2,1,15),
		(30,'keyboard',2600,6,'VERITY',120,2,1,0);

--------------monitor------------------------
insert into product (productKey, productName, price, available, brand, numOfSales, promotion_status, outstanding_offer, discount)
values (31,'monitor',2000,7,'LG',134,2,0,11),
		(32,'monitor',3000,1,'LG',23,0,1,0),
		(33,'monitor',5000,2,'x-vision',40,1,1,0),
		(34,'monitor',6000,5,'asus',50,2,1,0),
		(35,'monitor',2500,1,'LG',47,1,1,0);

--------assembledCase-------------------------
insert into product (productKey, productName, price, available, brand, numOfSales, promotion_status, outstanding_offer, discount)
values (36,'assembledCase',55000,4,'GREEN',17,1,0,0),
		(37,'assembledCase',4000,1,'GREEN',8,2,1,0),
		(38,'assembledCase',7000,5,'DELL',99,2,1,5),
		(39,'assembledCase',9500,1,'TechZone',99,2,1,5),
		(40,'assembledCase',8000,0,'HP',21,1,0,0);

--------------data_storage_hardware--> external_hard_disk-----------
insert into product (productKey, productName, price, available, brand, numOfSales, promotion_status, outstanding_offer, discount)
values (41,'external_hard_disk',1000,6,'GREEN',1000,2,1,0),
		(42,'external_hard_disk',1500,1,'Western',290,1,1,0),
		(43,'external_hard_disk',2000,10,'DATA',310,2,0,0),
		(44,'external_hard_disk',2500,14,'GREEN',500,2,1,0),
		(45,'external_hard_disk',3000,1,'Western',400,1,0,0);