#  Car-Booking Analysis – Personal SQL Project

This project focuses on analyzing a car booking dataset using SQL and Excel to extract insights around customer behavior, revenue trends, vehicle usage, and booking performance metrics.

---

##  Project Overview

The analysis was conducted using raw booking data containing fields like booking ID, customer ID, vehicle type, booking status, payment method, timestamps, ride distance, and customer/driver ratings.

### 🔧 Tools Used
- **SQL** (MySQL): For querying, grouping, filtering, and creating views
- **Excel**: For filtering

---

##  Key Insights & Questions Answered

###  Time-Based Analysis
- Which time of day sees the highest number of successful bookings?
- What is the peak booking time for each vehicle type?
- Which date had the highest revenue (Booking_Value)?

### 🚗 Vehicle Type & Trip Analysis
- What is the  average customer rating per vehicle type 
- What are the maximum and minimum driver ratings for Prime Sedan bookings?
-what is average ride distance per vehicle type?
### 📍 Location-Based Insights
- Which pickup locations are most frequently used?
- Which locations have the highest rate of cancellations?

### ❌ Cancellation & Incomplete Rides
- How many rides were canceled by customers?
- count cancellations by driver due to personal/car issues?
- What are the top reasons for incomplete rides?

### 💰 Financial Analysis
- What is the total revenue (sum of booking value)?
- What is the average booking value per vehicle type?
- Which customer generated the highest total booking value?

### 💳 Payment Method Trends
- How many rides were paid via UPI?
- Which payment method is most popular?

---

## 📁 Project Structure

```
📦 Car-Booking-Analysis/
│
├── 📄 README.md
├── 📄 car_booking_analysis.sql      # All SQL views and queries with comments
```

---

##  What I Learned

 Gained extensive hands-on experience in writing complex SQL queries using clauses like `GROUP BY`, `ORDER BY`, `WHERE` to extract meaningful insights from raw transactional booking data.  
- Applied aggregate functions such as `SUM`, `AVG`, and `COUNT` to calculate key metrics like total revenue, average ride distance, and customer activity patterns.

- Learned how to create and manage SQL views to simplify and modularize repetitive query logic for reuse across multiple analyses.  
- Used these views to efficiently structure results around business-focused KPIs such as peak booking hours, top customers, cancellation frequency, and payment trends.

- Implemented advanced SQL logic to rank and segment customers based on ride count and total spend using grouping, ordering, and filtering techniques.  
- Solved real-world use cases like identifying the top 5 highest-paying customers and determining peak hours by vehicle type.

- Developed a strong understanding of how to transform raw, unstructured transactional data into clean, usable datasets by applying filtering, case handling, and formatting.  
- Used this structured data to uncover actionable insights that support decisions related to fleet optimization, location-based strategy, and customer experience.

- Enhanced proficiency in using SQL as a tool for business insight generation, focusing on understanding user behavior, operational challenges, and revenue patterns.  
- Measured metrics like cancellation rates per location, average driver and customer ratings, and booking trends by payment method.

---

##  How to Use

1. Clone this repo and open `car_booking_analysis.sql` in MySQL or any SQL editor.
2. Run each query step-by-step or as a whole to generate insights.

---

## 📬 Contact

Feel free to connect on [LinkedIn](www.linkedin.com/in/shreyash-ekawade-2a3769343) or email me at **shreyashekawade091@gmail.com** for feedback, collaborations, or questions!

