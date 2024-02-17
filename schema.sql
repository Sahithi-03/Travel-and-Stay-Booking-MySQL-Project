--To create an account
CREATE TABLE "new_account" (
    "id" INTEGER,
    "firstname" TEXT NOT NULL,
    "lastname" TEXT NOT NULL,
    "email" TEXT NOT NULL UNIQUE,
    "password" TEXT NOT NULL,
    "time" NUMERIC NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY("id")
);

--To verify account
CREATE TABLE "verify_account" (
    "id" INTEGER,
    "customer_id" INTEGER,
    "email" TEXT,
    "password" TEXT,
    "time" NUMERIC NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY ("id"),
    FOREIGN KEY ("customer_id") REFERENCES "new_account"("id")
);

--To book travel
CREATE TABLE "travel_booking" (
    "travel_booking_id" INTEGER,
    "customer_id" INTEGER,
    "date" DATE NOT NULL,
    "time" TIME NOT NULL,
    "booking_time" NUMERIC NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "start" TEXT NOT NULL,
    "destination" TEXT NOT NULL,
    "mode_travel" TEXT NOT NULL CHECK ("mode_travel" IN("flight","bus","taxi","bike")),
    PRIMARY KEY("travel_booking_id"),
    FOREIGN KEY ("customer_id") REFERENCES "new_account"("id")
);

--To book travel through flight
CREATE TABLE "flight" (
    "id" INTEGER,
    "travel_booking_id" INTEGER,
    "airport_name" TEXT NOT NULL,
    "flight_name" TEXT NOT NULL,
    "flight_no" INTEGER NOT NULL,
    "seat_no" INTEGER NOT NULL,
    PRIMARY KEY("id"),
    FOREIGN KEY ("travel_booking_id") REFERENCES "travel_booking"("travel_booking_id")
);

--To book travel through bus
CREATE TABLE "bus" (
    "id" INTEGER,
    "travel_booking_id" INTEGER,
    "bus_station_name" TEXT NOT NULL,
    "bus_no" INTEGER NOT NULL,
    "seat_no" INTEGER NOT NULL,
    PRIMARY KEY("id"),
    FOREIGN KEY ("travel_booking_id") REFERENCES "travel_booking"("travel_booking_id")
);

--To travel through taxi
CREATE TABLE "taxi" (
    "id" INTEGER,
    "travel_booking_id" INTEGER,
    "pickup_location" TEXT NOT NULL,
    "taxi_license" TEXT NOT NULL,
    "driver_name" TEXT NOT NULL,
    PRIMARY KEY("id"),
    FOREIGN KEY ("travel_booking_id") REFERENCES "travel_booking"("travel_booking_id")
);

--To travel through bike
CREATE TABLE "bike" (
    "id" INTEGER,
    "travel_booking_id" INTEGER,
    "bike_location" TEXT NOT NULL,
    "bike_license" INTEGER NOT NULL,
    PRIMARY KEY("id"),
    FOREIGN KEY ("travel_booking_id") REFERENCES "travel_booking"("travel_booking_id")
);

--To book for stay
CREATE TABLE "hotel_stay_booking" (
    "booking_id" INTEGER,
    "customer_id" INTEGER,
    "booking_time" NUMERIC NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "name_of_hotel" TEXT NOT NULL,
    "address" TEXT NOT NULL,
    "start_date" DATE NOT NULL,
    "end_date" DATE NOT NULL,
    "room_no" INTEGER NOT NULL,
    "amount" INTEGER NOT NULL,
    PRIMARY KEY("booking_id"),
    FOREIGN KEY ("customer_id") REFERENCES "new_account"("id")
);

--To speed the searches in the vast data
CREATE INDEX "user_search" ON "new_account" ("firstname","lastname");
CREATE INDEX "travel_search" ON "travel_booking"("date","start","destination");
