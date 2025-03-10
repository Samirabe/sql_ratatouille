

/* 
SQL server Class final exam
Samira Besharatian
12/1403
*/

--- let's see what we got here

		select * from Chef_table
		select * from Food_chef_table
		select * from Food_table
		select * from Restaurant_chef_table
		select * from Restaurant_table

----ok

		--select r.restaurant_title,ch.chef_title,f.food_title
		--from Food_table f
		--left join Food_chef_table fch on f.food_id=fch.food_id
		--left join Chef_table ch on fch.chef_id=ch.chef_id
		--join Restaurant_table r on f.restaurant_id=r.restaurant_id
		--order by r.restaurant_title

		-----> Result: (nashod :( 7 row report )

		--Gaggan	Thomas Keller	Steak
		--Gaggan	NULL	Sushi
		--Noma	Gordon Ramsay	Pasta Alfredo
		--Noma	Julia Child	Pasta Alfredo
		--Noma	NULL	Chocolate Dessert
		--Noma	NULL	Pizza
		--Per Se	Alain Ducasse	Flamenco

--- lets try to write it with union 

		select  r.restaurant_title, c.chef_title, f.food_title
		from Restaurant_chef_table rc
		join Restaurant_table r on rc.restaurant_id = r.restaurant_id
		join Chef_table c on rc.chef_id = c.chef_id
		left join Food_chef_table fc on c.chef_id = fc.chef_id
		left join Food_table f on fc.food_id = f.food_id and f.restaurant_id = r.restaurant_id 

		union

		select r.restaurant_title, c.chef_title, f.food_title
		from Food_table f
		left join Food_chef_table fc on f.food_id = fc.food_id
		left join Chef_table c on fc.chef_id = c.chef_id
		join    Restaurant_table r on f.restaurant_id = r.restaurant_id
		order by restaurant_title, chef_title, food_title;

		/* Result  : 10 row
		Gaggan	NULL	Sushi
		Gaggan	Gordon Ramsay	NULL
		Gaggan	Thomas Keller	Steak
		Noma	NULL	Chocolate Dessert
		Noma	NULL	Pizza
		Noma	Gordon Ramsay	Pasta Alfredo
		Noma	Julia Child	Pasta Alfredo
		Noma	Martin Berasategui	NULL
		Per Se	Alain Ducasse	Flamenco
		Per Se	Thomas Keller	NULL
		*/