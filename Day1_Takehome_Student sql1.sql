/* Prerequisites */
-- Use the Bank_Holidays and bank_inventory tables from Online_Day1_Inclass file to answer the below questions
CREATE TABLE Bank_Holidays
(
Holiday date,
Start_time timestamp,
End_time timestamp
);

CREATE TABLE Bank_Inventory
(
Product char(10),
Quantity int,
Price real,
Purchase_cost decimal(10,2),
Estimated_sale_price float(10)
);



desc Bank_Inventory;
desc Bank_Holidays;
ALTER TABLE Bank_Inventory ADD COLUMN Geo_Location varchar(20);
desc Bank_Inventory;
# Question 1:
# 1) Increase the length of geo_location size of 30 characters in the bank_inventory taBLE
alter table bank_Inventory modify Geo_Location varchar(30);


# Question 2:
# 2) Update  estimated_sale_price of bank_inventory table with an increase of 15%  when the quantity of product is more than 4.
UPDATE Bank_Inventory SET  estimated_sale_price = estimated_sale_price*1.15 where quantity>4;


# Question 3:
# 3) Insert below record by increasing 10% of estimated_sale_price to the given estimated_sale_price 
		-- Product : DailCard
		-- Quantity: 2 
		-- price : 380.00 
		-- Puchase_cost : 8500.87
		-- estimated_sale_price: 9000.00
INSERT INTO Bank_Inventory VALUES ('DailCard',2,380.00,8500.87,9000.00);



# Question 4:
# 4) Delete the records from bank_inventory when the difference of estimated_sale_price and 
-- Purchase_cost is less than 5% of estimated_sale_price 
DELETE FROM Bank_Inventory WHERE estimated_sale_price-Purchase_cost =0.15*estimated_sale_price;

# Question 5:
# 5) Update the end time of bank holiday to 2020-03-20 11:59:59 for the holiday on 2020-03-20
 UPDATE Bank_Holidays
SET  END_TIME ='2020-03-20 11:59:59'
WHERE  HOLIDAY='2020-03-20';
# Use tables cricket_1 and cricket_2 from Online_Day2_InClass to answer the queries. 

# Question 6:

# Q6.Extract Player_Id and Player_name of those columns where charisma is null.
CREATE TABLE cricket_2
(
Player_Id varchar(10),
Player_Name varchar(30),
Runs number(10),
charisma number(10)
);

SELECT Player_Id,Player_name
FROM cricket_2
WHERE charisma=NULL;


# Question 7:

# Q7.Write MySQL query to extract Player_Id , Player_Name , charisma where charisma is greater than 25.
SELECT Player_Id , Player_Name , charisma
FROM cricket_2
WHERE charisma>25;


# Question 8:

# Q8.Write MySQL query to extract Player_Id , Player_Name who scored fifty and above
SELECT Player_Id , Player_Name
FROM cricket_2
WHERE Runs>50;


# Question 9:

# Q9.Write MySQL query to extract Player_Id , Player_Name who have popularity in the range of 10 to 12.


# Question 10:

# Q10.Write MySQL query to extract Player_id, Player_Name where the Runs and Charisma both are greater than 50.

