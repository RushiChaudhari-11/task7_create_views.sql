-- 1. View: Books with author and publisher names
CREATE VIEW view_books_detailed AS
SELECT 
    B.book_id,
    B.title,
    A.name AS author_name,
    P.name AS publisher_name,
    B.year,
    B.isbn
FROM Books B
JOIN Authors A ON B.author_id = A.author_id
LEFT JOIN Publishers P ON B.publisher_id = P.publisher_id;

-- Usage Example:
SELECT * FROM view_books_detailed;


-- 2. View: Members and number of books they borrowed
CREATE VIEW view_member_loan_count AS
SELECT 
    M.member_id,
    M.name,
    COUNT(L.loan_id) AS total_loans
FROM Members M
LEFT JOIN Loans L ON M.member_id = L.member_id
GROUP BY M.member_id, M.name;

-- Usage Example:
SELECT * FROM view_member_loan_count WHERE total_loans > 1;


-- 3. View: Loans that are still not returned
CREATE VIEW view_active_loans AS
SELECT 
    L.loan_id,
    B.title AS book_title,
    M.name AS member_name,
    L.loan_date
FROM Loans L
JOIN Books B ON L.book_id = B.book_id
JOIN Members M ON L.member_id = M.member_id
WHERE L.return_date IS NULL;

-- Usage Example:
SELECT * FROM view_active_loans;


-- 4. View: Books published before year 2000
CREATE VIEW view_old_books AS
SELECT book_id, title, year
FROM Books
WHERE year < 2000;

-- Usage Example:
SELECT * FROM view_old_books;
