Create type activity_enum as enum ('start', 'end');

Create table If Not Exists Activity (machine_id int, process_id int, activity_type activity_enum, timestamp float);
Truncate table Activity;
insert into Activity (machine_id, process_id, activity_type, timestamp) values ('0', '0', 'start', '0.712');
insert into Activity (machine_id, process_id, activity_type, timestamp) values ('0', '0', 'end', '1.52');
insert into Activity (machine_id, process_id, activity_type, timestamp) values ('0', '1', 'start', '3.14');
insert into Activity (machine_id, process_id, activity_type, timestamp) values ('0', '1', 'end', '4.12');
insert into Activity (machine_id, process_id, activity_type, timestamp) values ('1', '0', 'start', '0.55');
insert into Activity (machine_id, process_id, activity_type, timestamp) values ('1', '0', 'end', '1.55');
insert into Activity (machine_id, process_id, activity_type, timestamp) values ('1', '1', 'start', '0.43');
insert into Activity (machine_id, process_id, activity_type, timestamp) values ('1', '1', 'end', '1.42');
insert into Activity (machine_id, process_id, activity_type, timestamp) values ('2', '0', 'start', '4.1');
insert into Activity (machine_id, process_id, activity_type, timestamp) values ('2', '0', 'end', '4.512');
insert into Activity (machine_id, process_id, activity_type, timestamp) values ('2', '1', 'start', '2.5');
insert into Activity (machine_id, process_id, activity_type, timestamp) values ('2', '1', 'end', '5');

select * from activity;

WITH ProcessTimes AS (
    SELECT 
        a.machine_id,
        a.process_id,
        (b.timestamp - a.timestamp) AS process_time
    FROM 
        Activity a
    JOIN 
        Activity b
    ON 
        a.machine_id = b.machine_id AND 
        a.process_id = b.process_id AND 
        a.activity_type = 'start' AND 
        b.activity_type = 'end'
)
SELECT 
    machine_id,
    ROUND(AVG(process_time)::numeric, 3) AS processing_time
FROM 
    ProcessTimes
GROUP BY 
    machine_id;
		




