SELECT FirstName, Age,
CASE 
    When Age > 30 Then 'Old'
	when Age Between 27 And 30 Then 'Young'
	ELSE 'Baby'
End
FROM [SQL Tutorial].dbo.EmployeeDemographics
Where  Age is not Null
Order by Age



Select FirstName, LastName, JobTitle, Salary,
case
    When JobTitle = 'salesman' Then salary  + (salary * 0.07)
	Else salary + (salary * 0.1)
End as AfterRise
FROM [SQL Tutorial].dbo.EmployeeDemographics
Join [SQL Tutorial].dbo.EmployeeSalary
on EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
