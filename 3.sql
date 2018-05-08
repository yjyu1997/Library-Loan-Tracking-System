


create view overdue
as
select  b.b_id, b.p_id, b.it_id, b.copy_id,b.b_date, b.Renew_Times,floor(TO_NUMBER(sysdate  - b.b_date)) - (c.period * (b.Renew_Times + 1)) as over 
from item i, borrow b, cat c, itemcopy o
where c.it_cat = i.it_cat
and i.it_id = b.it_id
and i.it_id = o.it_id
and b. copy_id = o.copy_id
and b.c_status = 'good'
and floor(TO_NUMBER(sysdate  - b.b_date)) > (c.period * (b.Renew_Times + 1))
and b.r_date is null;




create view Unpaid
as select b.p_id, f.f_id,f.b_id, f.amount
from borrow b, fine f 
where b.b_id = f.b_id
and  not exists (select p.f_id from payment as p where f.f_id = p.f_id);


/*Fine owed by a Patron */
create view FinebyPatron
as
select b.p_id, sum(f.amount) as Total
from borrow b, fine f 
where b.b_id = f.b_id
group by b.p_id;

create view PaymentbyPatron
as
select b.p_id, sum(p.p_amount) as Total
from borrow b, fine f, Payment p
where b.b_id = f.b_id
and f.f_id = p.f_id
group by b.p_id;

create view P_Balance
as
select a.p_id,a.total - b.total as balance
from finebypatron a , Paymentbypatron b 
where a.p_id = b.p_id;

create view Patronfine
as
select finebypatron.p_id, finebypatron.total as Fine, paymentbypatron.total as payment, p_balance.balance
from finebypatron
left join paymentbypatron
on finebypatron.p_id = paymentbypatron.p_id
left join p_balance
on finebypatron.p_id = p_balance.p_id;

/* */
create view ab
as
select b.it_id, b.copy_id, b.c_status
from borrow b
where b.b_id = s.b_id
and b.c_status in ('loss', 'damage');


create view payment_detail
as
select payment.t_id, payment.f_id,payment.p_amount,payment.p_date,fine.issue_date, 
fine.overdue, fine.f_type,fine.amount,borrow.p_id,fine.b_id,borrow.it_id,borrow.copy_id,
borrow.b_date,borrow.r_date,borrow.renew_times
from payment
    left join fine
     on fine.f_id = payment.f_id
    left join borrow
    on fine.b_id = borrow.b_id;
    
create view fine_detail
as
select f.f_id,f.issue_date, f.overdue,  f.f_type, f.amount, b.b_id, b.p_id, b.it_id, b.copy_id,b.b_date,b.r_date, b.renew_times
from fine f
left join borrow b
on f.b_id = b.b_id;

create view copynum
as
select it_id, count(copy_id) as num
from itemcopy
group by it_id;

create view checked_detail
as
select b.b_id,b.p_id,b.it_id, b.copy_id ,b.renew_times,datediff(current_date(), b.b_date) as period
from borrow b
where 
b.r_date is null
and
not exists(select  s.b_id from Borrowstatus s where b.b_id = s.b_id) ;
/*oracle
create view checked_detail
as
select b.b_id,b.p_id,b.it_id, b.copy_id ,b.renew_times,floor(TO_NUMBER(sysdate  - b.b_date)) as period
from borrow b
where 
b.r_date is null
and
b.c_status = 'good';
*/

 /*oracle*/
 create view itemchecked
as
 select b.it_id,b.it_name,b.author,b.it_type, b.it_cat, count(a.copy_id) as checkedout
from checked_detail a, item b
where a.it_id = b.it_id
group by (b.it_id,b.it_name,b.author,b.it_type, b.it_cat)
 ;
 
 create view q2
as
 select patron.p_id,patron.p_fname,patron.p_lname,patron.address,patron.tel, overdue.b_id,overdue.over
    from patron  join overdue
    on patron.p_id = overdue.p_id;
 

 /*oracle*/
 create view q9
 as 
 select a.p_id, b.it_id,b.it_name,b.author,b.it_type, b.it_cat, count(a.copy_id) as checkedout
from checked_detail a, item b
where a.it_id = b.it_id
and a.renew_times != 0
group by (a.p_id,b.it_id,b.it_name,b.author,b.it_type, b.it_cat)
 ;
