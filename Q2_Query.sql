use greedygame;
create view appidd as (
select app_id,started_at,completed_at,status from q2_users_signup as uoc join q2_user_offer_data as uod
on uoc.user_id=uod.user_id);

select * from appidd;
select status,app_id,count(status) from appidd group by app_id,status;