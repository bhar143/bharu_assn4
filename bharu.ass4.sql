create table Passenger(Passenger_name varchar(20),Category varchar(8),Gender varchar(1),
Boarding_City varchar(20),Destination_City varchar(20),Distance int,Bus_Type varchar(10));

create table Price(Bus_Type varchar(10),Distance int,Price int);

insert into Passenger(Passenger_Name,Category,Gender,Boarding_City,Destination_City,
Distance,Bus_Type)values("Sejal","AC","F","Bengaluru","Chennai",350,"Sleeper");
insert into Passenger(Passenger_Name,Category,Gender,Boarding_City,Destination_City,
Distance,Bus_Type)values("Anmol","Non-AC","M","Mumbai","Hyderabad",700,"Sitting");
insert into Passenger(Passenger_Name,Category,Gender,Boarding_City,Destination_City,
Distance,Bus_Type)values("Pallavi","AC","F","Panaji","Bengaluru",600,"Sleeper");
insert into Passenger(Passenger_Name,Category,Gender,Boarding_City,Destination_City,
Distance,Bus_Type)values("Khusboo","AC","F","Chennai","Mumbai",1500,"Sleeper");
insert into Passenger(Passenger_Name,Category,Gender,Boarding_City,Destination_City,
Distance,Bus_Type)values("Udit","Non-AC","M","Trivandrum","Panaji",1000,"Sleeper");
insert into Passenger(Passenger_Name,Category,Gender,Boarding_City,Destination_City,
Distance,Bus_Type)values("Ankur","AC","M","Nagpur","Hyderabad",500,"Sitting");
insert into Passenger(Passenger_Name,Category,Gender,Boarding_City,Destination_City,
Distance,Bus_Type)values("Hemant","Non-AC","M","Panaji","Mumbai",700,"Sleeper");
insert into Passenger(Passenger_Name,Category,Gender,Boarding_City,Destination_City,
Distance,Bus_Type)values("Manish","Non-AC","M","Hyderabad","Bengaluru",500,"Sitting");
insert into Passenger(Passenger_Name,Category,Gender,Boarding_City,Destination_City,
Distance,Bus_Type)values("Piyush","AC","M","Pune","Nagpur",700,"Sitting");


insert into Price(Bus_Type,Distance,Price)values("Sleeper",350,770);
insert into Price(Bus_Type,Distance,Price)values("Sleeper",500,1100);
insert into Price(Bus_Type,Distance,Price)values("Sleeper",600,1320);
insert into Price(Bus_Type,Distance,Price)values("Sleeper",700,1540);
insert into Price(Bus_Type,Distance,Price)values("Sleeper",1000,2200);
insert into Price(Bus_Type,Distance,Price)values("Sleeper",1200,2640);
insert into Price(Bus_Type,Distance,Price)values("Sleeper",350,434);
insert into Price(Bus_Type,Distance,Price)values("Sitting",500,620);
insert into Price(Bus_Type,Distance,Price)values("Sitting",500,620);
insert into Price(Bus_Type,Distance,Price)values("Sitting",600,744);
insert into Price(Bus_Type,Distance,Price)values("Sitting",700,868);
insert into Price(Bus_Type,Distance,Price)values("Sitting",1000,1240);
insert into Price(Bus_Type,Distance,Price)values("Sitting",1200,1488);
insert into Price(Bus_Type,Distance,Price)values("Sitting",1500,1860);

--- 3) How many females and how many male passengers travelled for a minimum distance of 600 KM s?


select count(case when (Gender) = 'F' then 1 end) female from passenger where Distance >= 600;


--- 4) Find the minimum ticket price for Sleeper Bus.

select min(Price) from price where Bus_Type = 'Sleeper';


--- 5)select passenger name whose names start with character 'S'.

select * from passenger where Passenger_Name like 'S%';


--- 6)Calculate price charged for each passenger displaying Passenger name,Boarding City,Destination City,Bus_Type,Price in the output.

select Passenger_Name,p1.Boarding_City,p1.Destination_City,p1.Bus_Type,p2.Price from 
passenger p1,price p2 where p1.Distance = p2.Distance and p1.Bus_Type = p2.Bus_Type;


--- 7) What is the passenger name and his/her ticket price who travelled in Sitting bus for a distance of 1000KM s.

select p1.Passenger_Name,p1.Boarding_City,p1.Destination_City,p1.Bus_Type,p2.Price FROM passenger  p1 inner join price  p2 
on  p1.Distance =  1000 and p1.Bus_Type = "Sitting"  and p2.Distance = 1000 and p2.Bus_Type = "Sitting" ;

--- 8) What will be the Sitting and Sleeper bus charge for Pallavi to travel Bangalore to Panaji?

select distinct p1.Passenger_Name,p1.Boarding_City ,p1.Destination_City ,p2.Bus_Type,p2.Price from passenger p1 inner join 
price p2 where Passenger_Name = 'Pallavi'and   p1.Distance = p2.Distance ;

--- 9) List the distance from the "Passenger" table which are unique(non-repeated distances) in descending order.

select distinct Distance from passenger order by Distance desc;

--- 10) Display the passenger name and percentage of distance travelled by that passenger from the total distance travelled by all passengers without using user variables.

select  Passenger_name,Distance  * 100.0 /  (select sum(Distance)  from passenger) from passenger  ;

--- 11) Display the distance,price in the three categories in table Price.
 a) Expensive if the cost is more than 1000 .
 b)Average Cost if the cost is less than 1000 and greater than 500.
 c) Cheap otherwise.
 
 
 select  Distance,Price ,
 case
 when  Price > 1000 then 'Expensive'
 when Price > 500 then 'Average Cost'
else 'Less price'
end as 'chrges' from price;





















