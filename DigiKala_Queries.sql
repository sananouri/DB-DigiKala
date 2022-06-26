use digiDB;

-- Query 1: GetPhone -> RAM > A, price < B
create procedure GetPhone (@A int, @B int) as
begin
	select * 
	from product p
	inner join digitalProduct d
	on p.productKey = d.productKey
	inner join mobilePhone m 
	on d.code = m.productKey
	where p.price < @B and m.RAM > @A;
end

execute GetPhone @A = 4, @B = 10000;

-- Query 2: GetLaptop -> ASUS or lenovo, graphic >= A, weight < B
create procedure GetLaptop (@A int, @B int) as
begin
	select *
	from product p
	inner join digitalProduct d
	on p.productKey = d.productKey
	inner join  laptop l 
	on d.code = l.productKey
	where (p.brand = 'asus' or p.brand = 'Lenovo') and 
			d.weightValue < @B and l.graphic >= @A;
end

execute GetLaptop @A = 2, @B = 2;

-- Query 3: GetSortByPrice -> sort laptops based on number of sales
create procedure GetSortByPrice as
begin
	select p.numOfSales, p.brand, p.price
	from product p
	inner join digitalProduct d
	on p.productKey = d.productKey
	inner join  laptop l 
	on d.code = l.productKey
	order by p.numOfSales;	
end

execute GetSortByPrice;

-- Query 4: delAssembleCase -> delete where RAM < A, memory < B
create procedure delAssembleCase (@A int, @B int) as
begin
	delete 
	from product
	where product.productKey in (select p1.productKey
								 from product p1, digitalProduct d, computerAccessory c, assembledCase a
							     where p1.productKey = d.productKey and d.code = c.productKey and
										a.productKey = c.code and a.internal_memory < @B and RAM < @A);
end

select * from assembledCase;
execute delAssembleCase @A = 16, @B = 256;
select * from assembledCase;

-- Query 5: GetBestOffer -> best offer, 2 <= price <= 5
create procedure GetBestOffer as
begin
	select *
	from product p
	where outstanding_offer = 1 and price >= 2000 and price <= 5000;
end

execute GetBestOffer;

-- Query 6: CountByCPU -> number of laptops that are not Acer, CPU = corei7
create procedure CountByCPU as
begin
	select count(*)
	from product p
	inner join digitalProduct d
	on p.productKey = d.productKey
	inner join  laptop l 
	on d.code = l.productKey
	where l.CPU = 'core i7' and p.brand != 'acer';
end

execute CountByCPU;

select p.productKey, p.productName, p.price, p.brand, l.cpu
from product p
inner join digitalProduct d
on p.productKey = d.productKey
inner join  laptop l 
on d.code = l.productKey

-- Query 7: UpdatePhonesOffer -> update sale between 5 and 10 to no sale
create procedure UpdatePhonesOffer as
begin
	update product set promotion_status = 0, discount = 0
	where discount >= 5 and discount <= 10 and promotion_status = 1 and
			(product.productKey in (select p.productKey from product p
									inner join digitalProduct d
									on p.productKey = d.productKey
									inner join mobilePhone m 
									on d.code = m.productKey) or
			product.productKey in (select p.productKey from product p
									inner join digitalProduct d
									on p.productKey = d.productKey
									inner join mobileAccessory m 
									on d.code = m.productKey))
end

select * from product where discount >= 5 and discount <= 10 and promotion_status = 1;
execute UpdatePhonesOffer;
select * from product where productKey = 4 or productKey = 13;

-- Query 8: AveragePriceOfMonitor -> screen size > A, Brand = B
create procedure AveragePriceOfMonitor (@A int, @B varchar(255)) as
begin
	select avg(p.price)
	from product p
	inner join digitalProduct d
	on p.productKey = d.productKey
	inner join  computerAccessory c
	on d.code = c.productKey
	inner join  monitor m
	on m.productKey = c.code
	where d.size > @A and p.brand = @B;
end

execute AveragePriceOfMonitor @A = 27, @B = 'LG';

select p.productKey, p.price, p.brand, d.size
	from product p
	inner join digitalProduct d
	on p.productKey = d.productKey
	inner join  computerAccessory c
	on d.code = c.productKey
	inner join  monitor m
	on m.productKey = c.code

-- Query 9: CountPhoneByCameraAndRam -> resolution > A or B <= internal memory <= C
create procedure CountPhoneByCameraAndRam (@A int, @B int, @C int) as
begin
	select count(*)
	from mobilePhone m
	where m.resolution > @A or (m.internalMemory >= @B and m.internalMemory <= @C);
end

execute CountPhoneByCameraAndRam @A = 12, @B = 32, @C = 128;

select * from mobilePhone;

-- Query 10: FullPCPrice -> monitor + case + keyboard < 30
create view product_computerAccessory as (
	select c.code, p.price , p.brand
	from product p
	inner join digitalProduct d on p.productKey = d.productKey
	inner join  computerAccessory c on d.code = c.productKey
);

create procedure FullPCPrice (@A int) as
begin
	select m1.price + c1.price + k1.price as price,
			m1.brand as monitorBrand, c1.brand as caseBrand, k1.brand as keyboardBrand
	from product_computerAccessory m1
	inner join monitor m on m1.code = m.productKey,
	product_computerAccessory c1 
	inner join assembledCase c on c1.code = c.productKey,
	product_computerAccessory k1
	inner join keyboard k on k1.code = k.productKey
	where m1.price + k1.price + c1.price < @A;
end

execute FullPCPrice @A = 30000;

-- Query 11: GetCaseAndCoverEndOffer -> promotiom status = 0, os of mobile = android8
create procedure GetCaseAndCoverEndOffer as
begin
	select p.productKey, p.productName, p.promotion_status, m.usableFor, 
			mobile.OStype, mobile.OSversion
	from product p
	inner join digitalproduct d on p.productKey = d.productKey
	inner join mobileAccessory m on m.productKey = d.code
	inner join bagAndCover b on b.productKey = m.code,
	product p1
	inner join digitalproduct d1 on p1.productKey = d1.productKey
	inner join mobilePhone mobile on d1.code = mobile.productKey
	where mobile.OStype = 'Android' and mobile.OSversion = 8 and
			m.usableFor = p1.productName and p.promotion_status = 0;
end

execute GetCaseAndCoverEndOffer;

-- Query 12: GetPowerBank -> delete powerBank 5<=capacity<=10, (numOfPort < 3 or price > 200)
create procedure GetPowerBank as
begin
	delete from product
	where product.productKey in (select p.productKey from product p
									inner join digitalProduct d
									on p.productKey = d.productKey
									inner join mobileAccessory m 
									on d.code = m.productKey
									inner join powerBank pow 
									on m.code = pow.productKey
									where pow.capacity >= 5 and pow.capacity <= 10
									and (pow.numOfPort < 3 or p.price > 200));
end

select p.productKey, pow.capacity, pow.numOfPort, p.price
from product p
inner join digitalProduct d on p.productKey = d.productKey
inner join mobileAccessory m on d.code = m.productKey
inner join powerBank pow on m.code = pow.productKey;

execute GetPowerBank;

select p.productKey, pow.capacity, pow.numOfPort, p.price
from product p
inner join digitalProduct d on p.productKey = d.productKey
inner join mobileAccessory m on d.code = m.productKey
inner join powerBank pow on m.code = pow.productKey;

-- Query 13: SumPriceLaptopAndPhone -> price of laptop + mobile, not the same drand
										--mobile instant delivery, laptop RAM > A
create procedure SumPriceLaptopAndPhone (@A int) as
begin
	select laptop.price + mobile.price as sumPrice
	from product laptop
	inner join digitalProduct d1 on laptop.productKey = d1.productKey
	inner join  laptop l on d1.code = l.productKey,
	product mobile
	inner join digitalProduct d2 on mobile.productKey = d2.productKey
	inner join mobilePhone m on d2.code = m.productKey
	where laptop.brand != mobile.brand and mobile.instant_delivery = 1 and l.RAM > @A;
end

select laptop.price as laptopPrice, mobile.price as mobilePrice, mobile.instant_delivery,
			l.RAM, laptop.brand as laptopBrand, mobile.brand as mobileBrand
	from product laptop
	inner join digitalProduct d1 on laptop.productKey = d1.productKey
	inner join  laptop l on d1.code = l.productKey,
	product mobile
	inner join digitalProduct d2 on mobile.productKey = d2.productKey
	inner join mobilePhone m on d2.code = m.productKey

execute SumPriceLaptopAndPhone @A = 6;

-- Query 14: UpdateLaptopPrice -> A percent off on laptops more expensive than B
create procedure UpdateLaptopPrice (@A int, @B int) as
begin
	update product set price = (price * (100-@A))/100, promotion_status = 1, discount = @A
	where product.productKey in (select p.productKey
								 from product p
								 inner join digitalProduct d
								 on p.productKey = d.productKey
								 inner join  laptop l 
								 on d.code = l.productKey
								 where p.price > @B);
end

select p.productKey, p.promotion_status, p.price, p.discount from product p
inner join digitalProduct d on p.productKey = d.productKey
inner join  laptop l on d.code = l.productKey

execute UpdateLaptopPrice @A = 10, @B = 30000;

select p.productKey, p.promotion_status, p.price, p.discount from product p
inner join digitalProduct d on p.productKey = d.productKey
inner join  laptop l on d.code = l.productKey

-- Query 15: ShowCom -> product, less than 2 opinions or opinion includes pic
create procedure ShowCom as
begin
	select *
	from product p
	where p.productKey not in (select f.productKey from form f 
								where p.productKey = f.productKey and f.includes_picture = 0 and
								(select count(*) from form f where p.productKey = f.productKey) >= 2);
										
end

select * from form;
execute ShowCom;

-- Query 16: Update20Percent -> 20 percent off on products with availability 1
create procedure Update20Percent as
begin
	update product set price *= 0.8, promotion_status = 1, discount = 20
	where product.available = 1;
end

select price, promotion_status, discount from product where available = 1;
execute Update20Percent;
select price, promotion_status, discount from product where available = 1;

-- Query 17: delS5Case -> delete covers for Samsung S5
create procedure delS5Case as
begin
	delete from product
	where product.productKey in (select p.productKey from product p
								inner join digitalProduct d
								on p.productKey = d.productKey
								inner join mobileAccessory m 
								on d.code = m.productKey
								inner join bagAndCover b 
								on b.productKey = m.code
								where m.usableFor = 'Samsung Galaxy S5')
end

select * from mobileAccessory m inner join bagAndCover b on b.productKey = m.code;
execute delS5Case;
select * from mobileAccessory m inner join bagAndCover b on b.productKey = m.code;
