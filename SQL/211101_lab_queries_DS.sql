use bank;
select client_id from client where district_id=1 limit 5;
select client_id from client where district_id=72 ORDER BY client_id DESC LIMIT 1;
select amount from loan order by amount asc limit 3;
select distinct status from loan order by status asc;
select loan_id from loan order by payments desc limit 1;
select account_id, amount from loan order by account_id asc limit 5;
select account_id from loan where duration = 60 order by amount asc limit 5;
select distinct k_symbol from `order`where k_symbol <>" " order by k_symbol asc;
select order_id from bank.order where account_id=34;
select distinct account_id from bank.order where order_id>= 29540 and order_id<=29560 limit 4;
select amount from bank.order where account_to= 30067122;
select trans_id, trans.date, trans.type, amount from trans where account_id=793 order by `date` desc limit 10;
select district_id, count(client_id) from bank.client where district_id<10 group by district_id;
select `type`, count(card_id) as count_card_id from card;
#Using the loan table, print the top 10 account_ids based on the sum of all of their loan amount
select account_id from loan order by amounts desc limit 10;
