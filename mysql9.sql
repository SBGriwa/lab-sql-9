use sakila;

# Create a table rentals_may to store the data from rental table with information for the month of May.
show create table rental;

CREATE TABLE rentals_may  (
  `rental_id` int NOT NULL AUTO_INCREMENT,
  `rental_date` datetime NOT NULL,
  `inventory_id` mediumint unsigned NOT NULL,
  `customer_id` smallint unsigned NOT NULL,
  `return_date` datetime DEFAULT NULL,
  `staff_id` tinyint unsigned NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`rental_id`),
  UNIQUE KEY `rental_date` (`rental_date`,`inventory_id`,`customer_id`),
  KEY `idx_fk_inventory_id` (`inventory_id`),
  KEY `idx_fk_customer_id` (`customer_id`),
  KEY `idx_fk_staff_id` (`staff_id`),
  CONSTRAINT `fk_rental_may_customer` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_rental_may_inventory` FOREIGN KEY (`inventory_id`) REFERENCES `inventory` (`inventory_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_rental_may_staff` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`staff_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16050 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci


##insert into rentals_may
##select * from rental
where "2005-05-01" <= convert(rental_date, date) and convert(rental_date, date) < "2005-06-1";

#Insert values in the table rentals_may using the table rental, filtering values only for the month of May.

insert into rentals_may
select * from rental
where "2005-05-01" <= convert(rental_date, date) and convert(rental_date, date) < "2005-06-1";


#Create a table rentals_june to store the data from rental table with information for the month of June.
CREATE TABLE rentals_june (
  `rental_id` int NOT NULL AUTO_INCREMENT,
  `rental_date` datetime NOT NULL,
  `inventory_id` mediumint unsigned NOT NULL,
  `customer_id` smallint unsigned NOT NULL,
  `return_date` datetime DEFAULT NULL,
  `staff_id` tinyint unsigned NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`rental_id`),
  UNIQUE KEY `rental_date3` (`rental_date`,`inventory_id`,`customer_id`),
  KEY `idx_fk_inventory_id3` (`inventory_id`),
  KEY `idx_fk_customer_id3` (`customer_id`),
  KEY `idx_fk_staff_id3` (`staff_id`),
  CONSTRAINT `fk_rental_june_customer3` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_rental_june_inventory3` FOREIGN KEY (`inventory_id`) REFERENCES `inventory` (`inventory_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_rental_june_staff3` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`staff_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16056 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

#Insert values in the table rentals_june using the table rental, filtering values only for the month of June.
insert into rentals_june
select * from rental
where "2005-06-01" <= convert(rental_date, date) and convert(rental_date, date) < "2005-07-1";



#Check the number of rentals for each customer for May.
select customer_id, count(rental_id)  as cnt from rentals_may group by customer_id;


#Check the number of rentals for each customer for June.
select customer_id, count(rental_id) as cnt from rentals_june group by customer_id;
