WITH customer_data AS (
  SELECT
    user_id,
    COUNT(DISTINCT offer_id) AS num_transactions,
    AVG(total_payout_in_paise) / 100.0 AS avg_sale,
    (DATE_TRUNC('day', MAX(last_login_at)) - DATE_TRUNC('day', MIN(created_at)) + 1) AS avg_lifespan
  FROM user_signup_data usd
  JOIN user_offer_completion_data uoc ON usd.user_id = uoc.user_id
  JOIN rewards_details rd ON uoc.offer_id = rd.offer_id AND uoc.reward_id = rd.reward_id
  GROUP BY user_id
)
SELECT
  utm_source,
  (avg_sale * num_transactions * avg_lifespan ) AS clv
FROM customer_data cd
JOIN user_signup_data usd ON cd.user_id = usd.user_id
GROUP BY utm_source;
