--Select * 
--FROM [SQL Tutorial].dbo.EmployeeDemographics



--Select *
--from  [SQL Tutorial].dbo.EmployeeSalary

--Select *
--from [SQL Tutorial].dbo.EmployeeDemographics
--Full outer join [SQL Tutorial].dbo.EmployeeSalary
--ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID

--Insert into [SQL Tutorial].dbo.EmployeeDemographics VALUES
--(1011, 'Ryan', 'Howard', 26, 'Male'),
--(NULL, 'Holly', 'Flax', NULL, NULL),
--(1013, 'Darryl', 'Philbin', NULL, 'Male')


--Create Table WareHouseEmployeeDemographics 
--(EmployeeID int, 
--FirstName varchar(50), 
--LastName varchar(50), 
--Age int, 
--Gender varchar(50)
--)

--Insert into WareHouseEmployeeDemographics VALUES
--(1013, 'Darryl', 'Philbin', NULL, 'Male'),
--(1050, 'Roy', 'Anderson', 31, 'Male'),
--(1051, 'Hidetoshi', 'Hasagawa', 40, 'Male'),
--(1052, 'Val', 'Johnson', 31, 'Female')

--Select *
--from  [SQL Tutorial].dbo.wa

Select *
from [SQL Tutorial].dbo.EmployeeDemographics
Full outer join [SQL Tutorial].dbo.WareHouseEmployeeDemographics
ON EmployeeDemographics.EmployeeID = WareHouseEmployeeDemographics.EmployeeID