SELECT * FROM world.country;
select Code, Name, Population, HeadOfState from world.country;
select Code, Name, Population, HeadOfState from world.country where Population < 8000;
select Code, Name, Population, HeadOfState from world.country where Code = 'IND';
select * from world.country where Code = 'IND';

SELECT Code, Name, IndepYear, Population, Continent, GovernmentForm FROM world.country WHERE  Continent = "Asia" and GovernmentForm = "Republic";
SELECT Code, Name, IndepYear, Population, Continent, GovernmentForm FROM world.country WHERE  Continent = "Asia" or IndepYear = 1991;
SELECT Code, Name, IndepYear, Population, Continent, GovernmentForm FROM world.country WHERE not GovernmentForm = "Republic";

SELECT * FROM world.country WHERE GovernmentForm like "%UK%";
SELECT * FROM world.country WHERE Continent like "North%";
SELECT * FROM world.country WHERE GovernmentForm like "%Netherlands";

SELECT * FROM world.country LIMIT 5;
SELECT * FROM world.country ORDER BY Population desc LIMIT 6;
SELECT * FROM world.country LIMIT 3,6;

ALTER TABLE world.country ADD Email varchar(40);
ALTER TABLE world.country MODIFY Email varchar(90);
ALTER TABLE world.country Rename COLUMN Email TO CodeNumber;
ALTER TABLE world.country DROP COLUMN CodeNumber;
ALTER TABLE world.country RENAME TO world.Country_name;

INSERT INTO  world.country (Code, IndepYear) VALUES ("AHG",1917);
UPDATE world.country SET IndepYear = 1916 WHERE Code = "AHG";
DELETE FROM world.country WHERE Code = "AHG";
DELETE FROM world.country WHERE Code = "null";


SELECT * FROM world.country;

SELECT * FROM world.country ORDER BY Name asc;
SELECT * FROM world.country ORDER BY Name desc;
SELECT * FROM world.country ORDER BY Population desc;


SELECT * FROM world.country where IndepYear BETWEEN 1900 and 1947;


SELECT *FROM world.country WHERE Continent in ("Europe","Asia");
SELECT *FROM world.country WHERE Continent not in ("Europe","Asia");
SELECT *FROM world.country WHERE Continent in ("Europe","Asia") and GovernmentForm in("Republic");
SELECT *FROM world.country WHERE Continent not in ("Europe","Asia") and GovernmentForm not in("Republic");


SELECT * FROM world.country;
SELECT concat(Code," - " ,Code2) as Code3 FROM world.country;
SELECT concat_ws(" - ", Name, IndepYear, Population) as Country_Population FROM world.country;
SELECT length(Population) as digitCount from world.country;
SELECT upper(Name) as Name FROM world.country;
SELECT lower(Name) as Name FROM world.country;
SELECT left(GovernmentForm, 4) as GovernmentForm FROM world.country;
SELECT right(GovernmentForm, 4) as GovernmentForm FROM world.country;
SELECT mid(GovernmentForm, 1,8) as GovernmentForm FROM world.country;


SELECT * FROM world.country;
select sum(Population)as Total from world.country;
select count(Population) from world.country;
select avg(GNP) from world.country;
select max(Population) from world.country;
select min(Population) from world.country;
select truncate(LifeExpectancy, 0) from world.country;
select truncate(LifeExpectancy, 1) from world.country;
select ceil(LifeExpectancy) from world.country;
select floor(LifeExpectancy) from world.country;


SELECT * FROM world.country;
select Name, Population,
case 
	when Population = 0 then "Null Value"
    else "Valid data"
end as Population_details from world.country;

select Name, Capital,
case
	when Capital >= 1000 then "Big Coutry"
    when Capital <= 500 then "Small Country"
	else "Avg Coutry"
end as BigOrSmall from world.country;



SELECT * FROM world.country;
select Continent, count(Population) from world.country group by Continent;
select Continent, count(Population) from world.country group by Continent order by count(Population) asc;


SELECT * FROM world.country;
select Continent, count(Region) from world.country group by Continent  having count(Region) > 20;


create view count_Of_Name as
select Continent, count(GovernmentForm) from world.country 
group by Continent;


Delimiter &&
create procedure get_data()
begin
	select * from world.country;
end &&
Delimiter ;
call classicmode.get_data();
