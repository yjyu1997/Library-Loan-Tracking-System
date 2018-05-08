use test2;

select it_id, count(it_id) as C_no
from borrow
where p_id = 'p001'
group by it_id;

