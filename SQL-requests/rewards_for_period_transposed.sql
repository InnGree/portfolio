with dataset as (select c.agency_id
, c.since period_from
, c.until period_to
,  case when (d.bulk = True and d.withdraw_method = 'bank_account') then 'bulk-bank_account'
	when (d.bulk = True and d.withdraw_method = 'service_balance') then 'bulk-service_balance' 
	when ((d.bulk = False or d.bulk is null) and d.withdraw_method = 'bank_account') then 'notbulk-bank_account'
	when ((d.bulk = False or d.bulk is null) and d.withdraw_method = 'service_balance') then 'notbulk-service_balance'
	else d.withdraw_method end withdraw_method
, t.system_code
, t.turnover_amount turnover
, c.amount base_reward_amount
, d.amount total_reward_amount
, ad.amount additional_reward
, s.system_code additional_system_code
, s.amount additional_reward_by_system
from 
agency_commission c 
left join agency_turnovers t on t.agency_id = c.agency_id and c.since = t.since
left join dep_log d on c.id = d.commission_id
left join additional_commission ad on c.id = ad.base_commission_id  
left join additional_commission_by_system s on s.additional_commission_id  = ad.id  
where c.since >= date'2022-10-01' and c.until < date'2023-01-01' and c.amount > 0)
select d.agency_id
 , u.country country
 , d.period_from
 , d.period_to
 , d.withdraw_method
 , max(case when d.system_code = 'system_a' then d.turnover end) a_turnover 
 , max(case when d.system_code = 'system_b' then d.turnover end) b_turnover
 , max(case when d.system_code = 'system_c' then d.turnover end) c_turnover
 , max(case when d.additional_system_code = 'x reward' then d.additional_reward_by_system end) additional_reward_x
 , max(case when d.additional_system_code = 'y reward' then d.additional_reward_by_system end) additional_reward_y
 , d.base_reward_amount
 , d.additional_reward
 , d.total_reward_amount
from dataset d
left join user_group u on d.agency_id = u.id 
group by d.agency_id
 , u.country
 , d.period_from
 , d.period_to
 , d.withdraw_method
 , d.base_reward_amount
 , d.additional_reward
 , d.total_reward_amount
order by 4, 1