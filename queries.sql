-- Find customers start and destination
SELECT "start","destination"
FROM "travel_booking"
WHERE "customer_id" IN (
    SELECT "id"
    FROM "new_account"
    WHERE "first_name" = 'Amelia'
    AND "last_name" = 'Zacakart'
);

-- Find mode of travel for given dates
SELECT "mode_travel"
FROM "travel_booking"
WHERE "date" IN ('2023-09-09','2022-09-09','2023-10-11','2023-11-22');

-- Find flight name,date,time for a customer id
SELECT "flight"."flight_name","travel_booking"."date","travel_booking"."time"
FROM "travel_booking" JOIN "flght" ON "flight"."travel_booking_id"="travel_booking"."travel_booking_id"
WHERE "travel_booking"."customer_id"=12;

-- Add a new user
INSERT INTO "new_account" ("firstname", "lastname", "email", "password")
VALUES ('Purple', 'Hacyinth', 'purplehacynith@gmail.com', 'pphy#123');

INSERT INTO "new_account" ("firstname", "lastname", "email", "password")
VALUES ('Ramesh', 'Verma', 'Rameshverma83@gmail.com', 'RMV#833');
