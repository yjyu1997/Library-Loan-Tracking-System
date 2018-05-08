use test7;
insert into Patron values('p001', 'John','West' ,'1345 guloh st', '7866208403');
insert into Patron values('p002', 'James', 'Jones','1234 blue st', '7866208404');
insert into Patron values('p003', 'Lebron', 'James','1234 red st', '7856208304');

insert into Cat values('Children', '30', '1');
insert into Cat values('Adult', '14', '1');

insert into Item values('h001', 'The Blue Dream','Kobe Bryant' ,'Book', 'Children');
insert into Item values('h002', 'The Red Dream', 'Ultraman','Magazine', 'Adult');
insert into Item values('h003', 'The Blue Dream', 'The fisher','Movie', 'Children');

insert into ItemCopy values('h001', 'c001');
insert into ItemCopy values('h001', 'c002');
insert into ItemCopy values('h001', 'c003');
insert into ItemCopy values('h002', 'c001');
insert into ItemCopy values('h002', 'c002');
insert into ItemCopy values('h002', 'c003');
insert into ItemCopy values('h003', 'c001');
insert into ItemCopy values('h003', 'c002');
insert into ItemCopy values('h003', 'c003');
insert into ItemCopy values('h003', 'c004');


insert into Borrow values('b001','p001', 'h001', 'c001','2012-01-03', '2012-03-03', '0','good');
insert into Borrow values('b002','p001', 'h001', 'c002','2012-01-03', '2012-03-03', '0','damage');
insert into Borrow values('b003','p003', 'h003','c004', '2012-01-23', null, '0','loss');
insert into Borrow values('b004','p001', 'h003','c002', '2018-01-03', '2018-01-31', '0','good');
insert into Borrow values('b005','p002', 'h002','c001', '2018-01-03', null, '1','good');
insert into Borrow values('b006','p003', 'h003','c001', '2018-01-03', null, '1','loss');
insert into Borrow values('b007','p001', 'h002','c003', '2018-02-03', '2018-02-10', '0','good');
insert into Borrow values('b008','p003', 'h003','c003', '2018-03-03', null, '0','good');
insert into Borrow values('b009','p002', 'h002','c002', '2018-04-03', null, '0','good');
insert into Borrow values('b010','p002', 'h002','c003', '2018-04-13', null, '0','good');

insert into BorrowStatus values('b001','good');
insert into BorrowStatus values('b002','damage');
insert into BorrowStatus values('b003','loss');
insert into BorrowStatus values('b004','good');
insert into BorrowStatus values('b006','loss');
insert into BorrowStatus values('b007','good');



insert into Fine values('f001','b001','2012-03-03','YES',NULL,'30.00', null);
insert into Fine values('f002','b002', '2012-03-03','YES','damage','150.00',' overdued several days:30,found item cover damaged:120');
insert into Fine values('f003','b003','2012-03-21','YES','loss','223.89','late report:23.89, item loss: 200');
insert into Fine values('f004','b006','2018-04-06','NO','loss','178.99',null);

insert into Request values('r001','p001', 'h001','2','2011-03-06');
insert into Request values('r002','p003', 'h002','2','2018-05-06');

insert  into payment values('t001','f002','150.00','2012-03-06');
insert  into payment values('t002','f003','120.00','2012-03-21');
insert  into payment values('t003','f004','120.00','2018-04-10');
insert  into payment values('t004','f004','50.00','2018-04-15');



