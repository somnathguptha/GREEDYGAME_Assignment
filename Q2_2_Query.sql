use greedygame;
create view reward as (
select total_payout_in_paise,total_revenue_in_paise,app_id,re.reward_id from q2_rewards_details as re inner join q2_user_offer_completion as oc on
re.reward_id=oc.reward_id); 
select * from reward;
select sum(total_payout_in_paise),sum(total_revenue_in_paise),app_id from reward group by app_id;