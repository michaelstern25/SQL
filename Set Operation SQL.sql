select FirstName, Department from employee2
union
select FirstName, Department from employee1;


select FirstName, Department from employee2
where FirstName in (select FirstName from employee1);


select FirstName, Department from employee2
where FirstName not in (select FirstName from employee1);


