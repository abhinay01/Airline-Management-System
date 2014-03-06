/* Airline Management System */

CREATE TABLE IF NOT EXISTS Person(
person_id int(11) NOT NULL AUTO_INCREMENT,
id_no varchar(32) NOT NULL,
id_type varchar(32) NOT NULL,
first_name varchar(45) NOT NULL,
last_name varchar(45) NOT NULL,
middle_initial char(1) NOT NULL,
gender varchar(32) DEFAULT NULL,
date_of_birth timestamp NOT NULL DEFAULT '2013-11-20 00:00:00',
contact_no varchar(45) NOT NULL,
address varchar(100) DEFAULT NULL,
city varchar(45) DEFAULT NULL,
state varchar(45) DEFAULT NULL,
zipcode varchar(10) DEFAULT NULL,
creation_date timestamp NOT NULL DEFAULT '2013-11-20 00:00:00',
created_by varchar(45) NOT NULL,
last_updated timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
last_updated_by varchar(45) NOT NULL,
username varchar(45) NOT NULL,
passWrd varchar(45) NOT NULL,
email varchar(45) NOT NULL,
PRIMARY KEY(person_id)
);

CREATE TABLE IF NOT EXISTS `traveller` (
  `traveller_id` int(11) NOT NULL AUTO_INCREMENT,
  `id_no` varchar(80) NOT NULL,  /* Restrict format xxx-xx-xxxx for ssn from code */
  `id_type` varchar(60) NOT NULL, /* SSN or passport */
	`person_id` int(10) DEFAULT NULL, 
  `creation_date` timestamp NOT NULL DEFAULT '2013-11-20 00:00:00',
  `created_by` varchar(45) NOT NULL,
  `last_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_updated_by` varchar(45) NOT NULL,
	PRIMARY KEY (`traveller_id`),
  UNIQUE KEY `identity` (`id_no`, `id_type`),
  FOREIGN KEY (`person_id`) references person(person_id)
  ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;


CREATE TABLE IF NOT EXISTS Employee (
  Employee_id varchar(15) NOT NULL,
  id_no varchar(32) NOT NULL,
  id_type varchar(32) NOT NULL,
  person_id int(10) DEFAULT NULL,
  creation_date timestamp NOT NULL DEFAULT '2013-11-20 00:00:00',
  created_by varchar(45) NOT NULL,
  last_updated timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  last_updated_by varchar(45) NOT NULL,
  work_description varchar(45),
  position varchar(45),
  hire_date date,
  end_date date,
  PRIMARY KEY (employee_id),
  UNIQUE KEY identity (id_no, id_type),
  FOREIGN KEY (person_id) references person(person_id)
  ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS `reservations` (
  `reservation_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
	`customer_id` int(10) NOT NULL,
  `no_of_people` int(10) unsigned NOT NULL,
  `type_of_journey` varchar(45) NOT NULL,  
  `status` varchar(32) NOT NULL DEFAULT 'InCheckout',
  `creation_date` timestamp NOT NULL DEFAULT '2013-11-20 00:00:00',
  `created_by` varchar(45) NOT NULL,
  `last_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `last_updated_by` varchar(45) NOT NULL,
  PRIMARY KEY (`reservation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `reservation_details` (
  `reservation_dtl_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `reservation_id` int(10) unsigned NOT NULL,
  `traveller_id` int(11) NOT NULL,
  `flight_id` varchar(45) NOT NULL,
  `seat_no` varchar(45) NOT NULL,
  `date_of_journey` timestamp NOT NULL DEFAULT '2013-12-01 00:00:00',
  `travel_class` varchar(45) NOT NULL,
  `price` float(10,2) DEFAULT 0.0,
  `tax` float(10,2) DEFAULT 0.0,
  `status` varchar(45) NOT NULL,
  `boarding_status` varchar(45) NOT NULL,
  `creation_date` timestamp NOT NULL DEFAULT '2013-11-20 00:00:00',
  `created_by` varchar(45) NOT NULL,
  `last_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_updated_by` varchar(45) NOT NULL,
  PRIMARY KEY (`reservation_dtl_id`),
    FOREIGN KEY (`traveller_id`) references traveller(traveller_id),
	  FOREIGN KEY (`reservation_id`) references reservations(reservation_id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;	

create table if not exists FlightDetails
(
Flight_Id int(11) AUTO_INCREMENT,
Flight_Number varchar(5),
Airline_Name varchar(50),
Depart_date DATE,
Flight_Source varchar(50),
Flight_Destination varchar(50),
Flight_Depart_Time varchar(8),
Flight_Arr_Time varchar(8),
Flight_fare varchar(10),
No_Of_Seats integer,
Crew_count int(11),
PRIMARY KEY(Flight_Id));

CREATE TABLE IF NOT EXISTS `payment` (
  `payId` int(11) NOT NULL,
  `ReservationId` int(11) DEFAULT NULL,
  `FlightId` int(11) DEFAULT NULL,
  `FlightNo` int(11) DEFAULT NULL,
  `PersonId` int(11) DEFAULT NULL,
  `PaymentDate` date DEFAULT NULL,
  `Amount` int(11) DEFAULT NULL,
  `PaymentType` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`payId`)
);