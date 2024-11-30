SELECT DISTINCT s.first_name, s.surname
FROM restBill b
JOIN restStaff s ON b.waiter_no = s.staff_no
WHERE b.cust_name = 'Tanya Singh';

SELECT rm.room_date
FROM restRoom_management rm
JOIN restStaff s ON rm.headwaiter = s.staff_no
WHERE s.first_name = 'Charles' AND rm.room_name = 'Green' AND rm.room_date BETWEEN 160201 AND 160229;

SELECT DISTINCT s.first_name, s.surname
FROM restStaff s
JOIN restStaff z ON s.headwaiter = z.headwaiter
WHERE z.first_name = 'Zoe' AND z.surname = 'Ball' AND s.staff_no != z.staff_no;

SELECT b.cust_name, b.bill_total, s.first_name || ' ' || s.surname AS waiter_name
FROM restBill b
JOIN restStaff s ON b.waiter_no = s.staff_no
ORDER BY b.bill_total DESC;

SELECT DISTINCT s.first_name, s.surname
FROM restStaff s
JOIN restBill b1 ON s.staff_no = b1.waiter_no
WHERE b1.table_no IN (
    SELECT DISTINCT b.table_no
    FROM restBill b
    WHERE b.bill_no IN (14, 17)
);

SELECT DISTINCT s.first_name, s.surname
FROM restStaff s
WHERE s.staff_no IN (
    SELECT b.waiter_no
    FROM restBill b
    JOIN restRest_table rt ON b.table_no = rt.table_no
    WHERE rt.room_name = 'Blue' AND b.bill_date = 160312
)
OR s.staff_no IN (
    SELECT rm.headwaiter
    FROM restRoom_management rm
    WHERE rm.room_name = 'Blue' AND rm.room_date = 160312
);

