
select * from [dbo].[Employee_Salaries$]
-- group by the department and finding out the standard deviation and average 

with DepartmentStats as
(select department , stdev(salary) as standard_deviation, avg(Salary) as average
from [dbo].[Employee_Salaries$]
where Salary >=1000 
group by Department)
--select * from DepartmentStats

--looking at the outliers 
select emp.department , emp.salary , dt.standard_deviation, dt.average ,(emp.Salary-dt.average)/dt.standard_deviation as zscore 
from [dbo].[Employee_Salaries$] emp 
join DepartmentStats dt 
on emp.department= dt.department
where emp.salary >= 1000

--join the two table so we can select what we need 

with DepartmentStats as
(select department , 
		stdev(salary) as standard_deviation, 
		avg(Salary) as average
from [dbo].[Employee_Salaries$]
where Salary >=10000 
group by Department),

DepartmentOutliers as
(select emp.department,
		emp.salary ,
		dt.standard_deviation,
		dt.average ,
		(emp.Salary-dt.average)/dt.standard_deviation as zscore 
from [dbo].[Employee_Salaries$] emp 
join DepartmentStats dt 
on emp.department= dt.department
where emp.salary >= 10000
)
--finding coefficient of variation
 
select dt.department ,
		dt.standard_deviation,
		dt.average,
		dt.standard_deviation/dt.average as coeff_of_variation,
		sum(case when (do.zscore> 1.96 Or do.zscore <-1.96) then 1 else 0 end ) as outlier_count 
from DepartmentStats dt 
left join DepartmentOutliers do 
on dt.department = do.department 
group by dt.department , dt.standard_deviation, dt.average , dt.standard_deviation/dt.average 
order by dt.department 
--Creating departmentStats table DepartmentOutliers Table and then joining them 
-- Round the values the final query
with DepartmentStats as
(select department ,
		stdev(salary) as standard_deviation,
		avg(Salary) as average
from [dbo].[Employee_Salaries$]
where Salary >=10000 
group by Department),

DepartmentOutliers as
(select emp.department ,
		emp.salary ,
		dt.standard_deviation,
		dt.average ,
		(emp.Salary-dt.average)/dt.standard_deviation as zscore 
from [dbo].[Employee_Salaries$] emp 
join DepartmentStats dt 
on emp.department= dt.department
where emp.salary >= 10000
)
--finding coefficient of variation
 
select dt.department , 
	round(dt.standard_deviation,2) as standard_deviation, 
	round(dt.average, 2) as salary_avg ,
	round((dt.standard_deviation/dt.average),2 )*100 as coeff_of_variation,
	sum(case when (do.zscore > 1.96 Or do.zscore <-1.96) then 1 else 0 end) as outlier_count 
from DepartmentStats dt 
left join DepartmentOutliers do 
on dt.department = do.department 
group by dt.department , dt.standard_deviation, dt.average , dt.standard_deviation/dt.average 
order by coeff_of_variation desc;
