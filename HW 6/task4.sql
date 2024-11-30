SELECT DISTINCT b.cust_name
FROM restBill b
JOIN restRoom_management rm ON b.bill_date = rm.room_date
JOIN restStaff hw ON rm.headwaiter = hw.staff_no
WHERE hw.first_name = 'Charles' AND b.bill_total > 450.00;

SELECT hw.first_name, hw.surname
FROM restBill b
JOIN restRest_table rt ON b.table_no = rt.table_no
JOIN restRoom_management rm ON rt.room_name = rm.room_name AND b.bill_date = rm.room_date
JOIN restStaff hw ON rm.headwaiter = hw.staff_no
WHERE b.cust_name = 'Nerida Smith' AND b.bill_date = 160111;

SELECT b.cust_name
FROM restBill b
WHERE b.bill_total = (SELECT MIN(bill_total) FROM restBill);

SELECT s.first_name, s.surname
FROM restStaff s
WHERE s.staff_no NOT IN (SELECT DISTINCT b.waiter_no FROM restBill b);

SELECT b.cust_name, hw.first_name AS headwaiter_first_name, hw.surname AS headwaiter_surname, rt.room_name
FROM restBill b
JOIN restRest_table rt ON b.table_no = rt.table_no
JOIN restRoom_management rm ON rt.room_name = rm.room_name AND b.bill_date = rm.room_date
JOIN restStaff hw ON rm.headwaiter = hw.staff_no
WHERE b.bill_total = (SELECT MAX(bill_total) FROM restBill);