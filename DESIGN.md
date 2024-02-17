# Design Document

By Sahithi Jagarlamudi

Video overview: <https://www.youtube.com/watch?v=Hnhd0ZSYdX8>

## Scope

The database for CS50 SQL includes all entities necessary to facilitate the process of creating, verifying user information and booking travel and stay facilities. As such, included in the database's scope is:

* For creating new user account to make use of facilities
* For verifying the already existing user account information
* For travelling user can choose one of the mode available like by flight,bus,taxi,bike
* For each mode we have the information stored on user choosen option
* If user want to book hotel there is information like hotel name,hotel address,start and end dates
* Out of scope are elements like databse of available real time information of flights,hotel,bus,bike,car.

## Functional Requirements

This database will support:

* CRUD operations for staff and company
* Tracking all versions of user booking travel and stay, including individual or chain of both travel and stay
* Adding multiple modes of choice in travel to users

Note that in this iteration, the system will not support real time information regarding the schema.

## Representation

Entities are captured in SQLite tables with the following schema.

### Entities

The database includes the following entities:

#### New_account

The `new_account` table includes:

* `id`, which specifies the unique ID for the user as an `INTEGER`. This column thus has the `PRIMARY KEY` constraint applied.
* `first_name`, which specifies the user's first name as `TEXT`, given `TEXT` is appropriate for name fields.
* `last_name`, which specifies the user's last name. `TEXT` is used for the same reason as `first_name`.
* `email`, which specifies the user's mail as `TEXT` and has `UNIQUE` constraint applied.
* `password`, which specifies the user's password required to login into account, `TEXT` is appropriate as it can have combination of numerical and characters.
* `time`, which specifies when the user created the account. Timestamps in SQLite can be conveniently stored as `NUMERIC`, per SQLite documentation at <https://www.sqlite.org/datatype3.html>. The default value for the `time` attribute is the current timestamp, as denoted by `DEFAULT CURRENT_TIMESTAMP`.

#### Verify_account

The `verify_account` table includes:

* `id`, which specifies the unique ID for the user as an `INTEGER`. This column thus has the `PRIMARY KEY` constraint applied.
* `customer_id`, which is the ID of the user who created an acocunt as an `INTEGER`. This column thus has the `FOREIGN KEY` constraint applied, referencing the `id` column in the `new_account` table to ensure data integrity.
* `email`, which specifies the user's mail as `TEXT`.
* `password`, which specifies the user's password required to login into account, `TEXT` is appropriate as it can have combination of numerical and characters.
* `time`, which specifies when the user login to the account.The default value for the `time` attribute is the current timestamp, as denoted by `DEFAULT CURRENT_TIMESTAMP`.

#### Travel_booking

The `travel_booking` table includes:

* `travel_booking_id`, which specifies the unique ID for the travel booking as an `INTEGER`. This column thus has the `PRIMARY KEY` constraint applied.
* `customer_id`, which is the ID of the user who created an acocunt as an `INTEGER`. This column thus has the `FOREIGN KEY` constraint applied, referencing the `id` column in the `new_account` table to ensure data integrity.
* `date`, which specifies the date for travel. `DATE` is used for this entity.
* `time`, which specifies the time for travel. `TIME` is used for this entity.
* `booking_time`, which specifies the time at which booking took place.The default value for the `booking_time` attribute is the current timestamp, as denoted by `DEFAULT CURRENT_TIMESTAMP`.
* `start`, which specifies the start location of the travel. `TEXT` is used for this entity.
* `destination`, which specifies the destination location of the travel. `TEXT` is used for this entity.
* `mode_travel`, which specifies the mode by which the user choose to travel. `TEXT` is used for this entity. `CHECK` is used for the given options like flight,bus,taxi etc.

All columns are required and hence have the `NOT NULL` constraint applied where a `PRIMARY KEY` or `FOREIGN KEY` constraint is not.

#### Flight

The `flight` table includes:

* `id`, which specifies the unique ID for the user to travel by flight an `INTEGER`. This column thus has the `PRIMARY KEY` constraint applied.
* `travel_booking_id`, which is the ID of the user who booked travel facility as an `INTEGER`. This column thus has the `FOREIGN KEY` constraint applied, referencing the `id` column in the `travel_booking` table to ensure data integrity.
* `airport_name`, which specifies the airport name by which user choose to travel. `TEXT` is used for this entity.
* `flight_name`, which specifies the flight company name for the travel. `TEXT` is used for this entity.
* `flight_no`, which specifies the flight number. `INTEGER` is used to specify this entity.
* `seat_no`, which specifies the seat number in the flight. `INTEGER` is used to specify this entity.

All columns are required and hence have the `NOT NULL` constraint applied where a `PRIMARY KEY` or `FOREIGN KEY` constraint is not.

#### Bus

The `bus` table includes:

* `id`, which specifies the unique ID for the user to travel by bus an `INTEGER`. This column thus has the `PRIMARY KEY` constraint applied.
* `travel_booking_id`, which is the ID of the user who booked travel facility as an `INTEGER`. This column thus has the `FOREIGN KEY` constraint applied, referencing the `id` column in the `travel_booking` table to ensure data integrity.
* `bus_station_name`, which specifies the bus station name for the travel. `TEXT` is used for this entity.
* `bus_no`, which specifies the bus number. `INTEGER` is used to specify this entity.
* `seat_no`, which specifies the seat number in the bus. `INTEGER` is used to specify this entity.

All columns are required and hence have the `NOT NULL` constraint applied where a `PRIMARY KEY` or `FOREIGN KEY` constraint is not.

#### Taxi

The `taxi` table includes:

* `id`, which specifies the unique ID for the user to travel by bus an `INTEGER`. This column thus has the `PRIMARY KEY` constraint applied.
* `travel_booking_id`, which is the ID of the user who booked travel facility as an `INTEGER`. This column thus has the `FOREIGN KEY` constraint applied, referencing the `id` column in the `travel_booking` table to ensure data integrity.
* `pickup_location`, which specifies the location address to pick up the user. `TEXT` is the used for this entity.
* `taxi_license`, which specifies the license of the taxi. `TEXT` is used for this as it can be combination of numerical and characters.
* `driver_name`, which specifies the name of the taxi driver. `TEXT` is used for this entity.

All columns are required and hence have the `NOT NULL` constraint applied where a `PRIMARY KEY` or `FOREIGN KEY` constraint is not.

#### Bike

The `bike` table includes:

* `id`, which specifies the unique ID for the user to travel by bus an `INTEGER`. This column thus has the `PRIMARY KEY` constraint applied.
* `travel_booking_id`, which is the ID of the user who booked travel facility as an `INTEGER`. This column thus has the `FOREIGN KEY` constraint applied, referencing the `id` column in the `travel_booking` table to ensure data integrity.
* `bike_location`, which specifies the address of the location where bike is situated. `TEXT` is used for this entity.
* `bike_license`, which specifies the license plate of the bike. `TEXT` is used for this as it can be combination of numerical and characters.

All columns are required and hence have the `NOT NULL` constraint applied where a `PRIMARY KEY` or `FOREIGN KEY` constraint is not.

#### Hotel booking for stay

The `hotel_stay_booking` table includes:

* `booking_id`, which specifies the unique ID for the hotel booking as an `INTEGER`. This column thus has the `PRIMARY KEY` constraint applied.
* `customer_id`, which is the ID of the user who created an acocunt as an `INTEGER`. This column thus has the `FOREIGN KEY` constraint applied, referencing the `id` column in the `new_account` table to ensure data integrity.
* `booking_time`, which specifies the time at which booking took place.The default value for the `booking_time` attribute is the current timestamp, as denoted by `DEFAULT CURRENT_TIMESTAMP`.
* `start_date`, which specifies the start date of the saty at hotel. `DATE` is used for this entity.
* `end_date`, which specifies the end date of the stay at hotel. `DATE`, which is `YYYY-MM-DD` format, same for `start_date` is used for this entity.
*`room_no`, which specifies the room number for the stay at hotel. `INTEGER` is used for this entity.
*`amount`, which specifies the sum of the money for the stay at the hotel. `INTEGER` is used for this entity.

All columns are required and hence have the `NOT NULL` constraint applied where a `PRIMARY KEY` or `FOREIGN KEY` constraint is not.

### Relationships

The below entity relationship diagram describes the relationships among the entities in the database.

[![](https://mermaid.ink/img/pako:eNqFkEEKgzAQRa8is9YLZN0bdBuQMRk1GJMSJ7ai3r0RpC2l1lkMw-f9z_BnUF4TCKBwMdgE7KXL0ji6l6iUj46zZSmKZc5GCqaeXqrYhUOeA45ky8r7zrgm8QrdIdx6TuzAOP0yfEXtntqapt0eqaZ_WBWHU4bxYc6DTEcf0HtDDj2FHo1ORc6bIoFb6kmCSKemGqNlCdKtCcXI_jo5BYJDpBziTSPT3j6IGu1A6xOPo4v-?type=png)](https://mermaid.live/edit#pako:eNqFkEEKgzAQRa8is9YLZN0bdBuQMRk1GJMSJ7ai3r0RpC2l1lkMw-f9z_BnUF4TCKBwMdgE7KXL0ji6l6iUj46zZSmKZc5GCqaeXqrYhUOeA45ky8r7zrgm8QrdIdx6TuzAOP0yfEXtntqapt0eqaZ_WBWHU4bxYc6DTEcf0HtDDj2FHo1ORc6bIoFb6kmCSKemGqNlCdKtCcXI_jo5BYJDpBziTSPT3j6IGu1A6xOPo4v-)

As detailed by the diagram:

*After creating an account the user can verify the account many times.
*An account is created for the specific mail and password, but can be verified many times.
*A user can book for travel and hotel stay many times.
*A user can choose any one mode of travel at a time.
*A user can book many times for travel and hotel stay and can change the mode for travel like by flight,bus,taxi,bike.

## Optimizations

It is also common practice for staff to concerned with viewing all users who created accounts. As such, an index is created on the `firstname`,`lastname` columns in the `new_account` table to speed the identification of users by name.

An index is also created on the `date`, `start`, `destination` columns in the `travel_booking` table to speed the search for list of users.

## Limitations

The current schema stores the information of a users choice whether travel by different modes and hotel stay.
But it lacks to check the real time information regarding the different modes of travel and hotel stay.
It still requires to develop to be able to function as a backend for a travel and stay booking website.
