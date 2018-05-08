
select * from copynum;
where it_id = ' ';

select p.* , o.b_id,o.over from
patron p
 join overdue o
on p.p_id = o.p_id;

select * from patronfine;
where p_id = ' ' ;

select p_id as Patron, t_id as Transaction_no, f_id as Fine_no,overdue,f_type, p_amount as Amount,p_date as Date
from payment_detail
where p_id =' ';

select it_id,copy_id,renew_times,over
from overdue;
where over >=  ;


select * from request
where rq_date >= current_date();

select sum(f.amount) as Fine  from fine f
where f.issue_date between '2012-03-01' and '2012-03-31'
;  
select sum(p.p_amount) as payment
from payment p
where p.p_date between '2012-03-01' and '2012-03-31';

select * from cat;

select * from itemchecked;

insert into Request values('r002','p003', 'h002','2','2018-05-06');



create view q2
as
 select patron.p_id,patron.p_fname,patron.p_lname,patron.address,patron.tel, overdue.b_id,overdue.over
    from patron  join overdue
    on patron.p_id = overdue.p_id;