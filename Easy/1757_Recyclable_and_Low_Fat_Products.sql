CREATE TYPE low_fats_type AS ENUM ('Y', 'N');
CREATE TYPE recyclable_type AS ENUM ('Y', 'N');

Create table If Not Exists Products (product_id int, low_fats low_fats_type, recyclable recyclable_type);
Truncate table Products;
insert into Products (product_id, low_fats, recyclable) values ('0', 'Y', 'N');
insert into Products (product_id, low_fats, recyclable) values ('1', 'Y', 'Y');
insert into Products (product_id, low_fats, recyclable) values ('2', 'N', 'Y');
insert into Products (product_id, low_fats, recyclable) values ('3', 'Y', 'Y');
insert into Products (product_id, low_fats, recyclable) values ('4', 'N', 'N');


select product_id 
from products
where low_fats = 'Y' and recyclable = 'Y';