USE CB_System;

-- ⚡ Time-Based Analysis

-- Which time of day sees the highest number of successful bookings?
CREATE VIEW Time_Of_Day_Highest_Number_Of_Successful_Bookings AS
SELECT HOUR(TIME)AS HourOfDay,
COUNT(*)AS Success_Booking_Count
FROM bookings
WHERE Booking_Status='Success'
GROUP BY HourOfDay
ORDER BY  Success_Booking_Count DESC 
Limit 1;
 
SELECT * from Time_Of_Day_Highest_Number_Of_Successful_Bookings;

-- Which date had the highest revenue (Booking_Value)?
CREATE VIEW Date_Had_The_Highest_Revenue_Booking_Value AS
SELECT Date, SUM(Booking_Value) AS Total_Revenue
FROM bookings
GROUP BY Date
ORDER BY Total_Revenue DESC
LIMIT 1;

SELECT*FROM Date_Had_The_Highest_Revenue_Booking_Value;

-- What is the peak booking time for each vehicle type?
CREATE VIEW Peak_Booking_Time_For_Each_Vehicle_Type AS
SELECT Vehicle_Type,
HOUR(Date) AS HourOfDay,
COUNT(*) AS BookingCount
FROM bookings
GROUP BY HourOfDay,Vehicle_Type
ORDER BY Vehicle_Type,BookingCount DESC;

SELECT*FROM Peak_Booking_Time_For_Each_Vehicle_Type;


-- ⚡ Vehicle Type & Trip Analysis-- 

-- Creates a view to show average ride distance per vehicle type?
CREATE VIEW Ride_Distance_For_Each_Vehichal AS  -- 
SELECT Vehicle_Type,AVG(Ride_Distance)  -- Selects vehicle type and calculates average ride distance
as avg_distance FROM bookings Group By  Vehicle_Type;  -- Groups data by vehicle type to compute averages

SELECT * from Ride_Distance_For_Each_Vehichal;  -- Retrieves average distance per vehicle from the view

-- calculate average customer rating per vehicle type ?-- 
CREATE VIEW Avrage_Customer_Rating_Per_Vehicle_type AS  -- Creates a view to calculate average customer rating per vehicle type
SELECT Vehicle_Type, AVG(Customer_Rating) AS avrage_customer_rating  -- Selects vehicle type and calculates average customer rating
FROM bookings  -- From the bookings table
GROUP BY Vehicle_Type;  -- Grouped by vehicle type

SElECT * FROM Avrage_Customer_Rating_Per_Vehicle_type;  -- Retrieves average customer ratings from the view

-- find min and max driver ratings for 'Prime Sedan ?
CREATE VIEW Maximum_and_Minimum_driver_rating_for_prime_sedan_booking AS  -- Creates a view to find min and max driver ratings for 'Prime Sedan'
SELECT  MIN(Driver_Ratings) AS Minimum_Rating,  -- Selects minimum driver rating
MAX(Driver_Ratings)AS Maximum_Rating  -- Selects maximum driver rating
From bookings  WHERE Vehicle_Type='Prime Sedan';  -- Filters records where vehicle type is 'Prime Sedan'

SELECT*FROM Maximum_and_Minimum_driver_rating_for_prime_sedan_booking;  -- Retrieves min/max ratings for 'Prime Sedan' rides


-- ⚡ Location-Based Insights
-- Which pickup locations are most frequently used?
CREATE VIEW Pickup_Locations_Are_Most_Frequently_Used AS
SELECT Pickup_Location,
COUNT(*) AS Total_Bookings
FROM bookings
GROUP BY Pickup_Location
ORDER BY Pickup_Location DESC;

SElECT * FROM Pickup_Locations_Are_Most_Frequently_Used;

-- Which locations have the highest rate of cancellations?
CREATE VIEW Locations_have_The_Highest_Rate_Of_Cancellations AS
SELECT Pickup_Location,
COUNT(*) AS Total_Canceled
FROM bookings
WHERE Booking_Status LIKE 'Canceled%'
GROUP BY Pickup_Location
ORDER BY Total_Canceled DESC;
SElECT * FROM Locations_have_The_Highest_Rate_Of_Cancellations;


-- ⚡ Cancellation & Incomplete Rides
-- count the total number of bookings canceled by customers?
CREATE VIEW Total_Of_Cancle_Orders AS  -- Creates a view to count the total number of bookings canceled by customers
SELECT COUNT(*) FROM bookings  -- Counts all rows in the bookings table
WHERE Booking_Status='Canceled by Customer';  -- Filters only canceled bookings by customer

SELECT * FROM Total_Of_Cancle_Orders;  -- Retrieves total canceled bookings from the view

CREATE VIEW Rides_canceled_by_drivers_For_personal_and_car_releted_issues AS  -- Creates a view to count cancellations by driver due to personal/car issues
SELECT COUNT(*) FROM bookings  -- Counts all records in the bookings table
WHERE Canceled_Rides_by_Driver ='Personal & Car related issue';  -- Filters where cancellation reason is driver’s personal/car issue

SELECT * FROM Rides_canceled_by_drivers_For_personal_and_car_releted_issues;  -- Retrieves count from the above view

-- listing incomplete rides with reason?
CREATE VIEW Incomplete_Rides_Along_With_The_Reason AS  -- Creates a view listing incomplete rides with reason
SElECT Booking_ID ,Incomplete_Rides_Reason  -- Selects booking ID and its corresponding reason
FROM bookings   -- From the bookings table
WHERE Incomplete_Rides='Yes';  -- Filters only where the ride is marked incomplete

SElECT * FROM Incomplete_Rides_Along_With_The_Reason;  -- Retrieves all incomplete rides and reasons from the view


-- ⚡ Financial Analysis
-- sum of booking values of successful rides ?
CREATE VIEW Total_Of_Booking_Value_Of_Rides_Completed_Sucessfuly AS  -- Creates a view to 
SELECT SUM(Booking_Value)  -- Calculates the total booking value
FROM bookings  -- From bookings table
WHERE Booking_Status='Success';  -- Filters only successful bookings

SElECT * FROM Total_Of_Booking_Value_Of_Rides_Completed_Sucessfuly;  -- Retrieves total value of successful bookings

-- What is the average booking value per vehicle type?
CREATE VIEW The_Average_Booking_Value_Per_Vehicle_Type AS
SELECT Vehicle_Type,
AVG(Booking_Value)AS Avrage
FROM bookings
GROUP BY  Vehicle_Type;
SElECT * FROM The_Average_Booking_Value_Per_Vehicle_Type; 

-- What is the total revenue (sum of Booking_Value)?
CREATE VIEW Total_Revenue AS
SELECT SUM(Booking_Value) AS Total_Revenue FROM bookings;
SElECT * FROM Total_Revenue;

-- Which customer generated the highest total booking value?
CREATE VIEW Highest_Total_Booking_Value_BY_Customer AS
SELECT Customer_ID, 
SUM(Booking_Value) AS Total_Bookung_Value
FROM bookings 
GROUP BY Customer_ID
ORDER BY Total_Bookung_Value DESC;
SELECT*FROM Highest_Total_Booking_Value_BY_Customer;
-- ⚡ Payment Method Trends

-- show all rides paid using UPI?
CREATE VIEW All_Rides_Payment_Was_Made_By_UPI AS  -- Creates a view to show all rides paid using UPI
SElECT * FROM bookings   -- Selects all columns
WHERE Payment_Method='UPI';  -- Filters only UPI payment method

SElECT * FROM All_Rides_Payment_Was_Made_By_UPI;  -- Retrieves all rides paid via UPI from the view


-- ⚡ Advanced Insights (SQL/BI Ready)

-- show all successful bookings?
CREATE VIEW Sucessful_Booking AS  -- Creates a view to show all successful bookings
SELECT * FROM bookings  -- Selects all records
WHERE Booking_Status='Success';  -- Filters only successful bookings

SELECT * FROM Sucessful_Booking;  -- Retrieves successful bookings from the view

--  top 5 customers based on number of bookings?
CREATE VIEW top_5_Customers_Who_Booked_Highest_no_rides AS  -- 
SELECT Customer_ID,Count(Booking_ID) as total_rides  -- Selects customer ID and counts their bookings
FROM bookings GROUP BY Customer_ID  -- Groups records by customer ID
ORDER BY total_rides DESC LIMIT 5 ;  -- Orders by ride count in descending order and limits to top 5

SELECT* FROM top_5_Customers_Who_Booked_Highest_no_rides;  -- Retrieves top 5 customers with most rides from the view
