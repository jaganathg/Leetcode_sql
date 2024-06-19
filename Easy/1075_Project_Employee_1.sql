

select  round(avg(e.experience_years), 2) as average_years, p.project_id
from employee e
join project p on p.employee_id = e.employee_id
group by p.project_id
order by average_years asc;