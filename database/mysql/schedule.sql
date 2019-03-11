-- SET GLOBAL EVENt_scheduler=1;临时

-- show VARIABLES like '%event_sche%';

-- [mysqld]
-- event_scheduler=ON //这一行加入mysqld标签下--永久

/*
use winjean;
create procedure test_proce()
begin
	update t_user set `password` = 'winjean';
end
*/

/*
-- 定时任务 second,minute,hour,day,week(周),quarter(季度),month,year

create event second_event
on schedule every 1 second
on completion preserve disable
do call test_proce();
*/

-- alter event second_event on completion preserve enable;
-- alter event second_event on completion preserve disable;

SELECT event_name,event_definition,interval_value,interval_field,status FROM information_schema.EVENTS;