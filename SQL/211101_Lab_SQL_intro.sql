use sakila;
#Explore tables by selecting all columns from each table or using the in built review features for your client.
#Select one column from a table. Get film titles.
select title from film;
#Select one column from a table and alias it.
select title as 'titles' from film;
#Get unique list of film languages under the alias language. Note that we are not asking you to obtain the language per each film, but this is a good time to think about how you might get that information in the future.
select name as 'language' from language;
#5.1 Find out how many stores does the company have?
select count(store_id) from store;
#5.2 Find out how many employees staff does the company have?
select count(staff_id) from staff;
#5.3 Return a list of employee first names only?
select first_name from staff;