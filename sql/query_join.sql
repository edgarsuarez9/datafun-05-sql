SELECT b.title, a.first_name, a.last_name 
FROM books b
INNER JOIN authors a ON b.author_id = a.author_id;

SELECT b.title, a.first_name, a.last_name 
FROM books b
LEFT JOIN authors a ON b.author_id = a.author_id;  -- Include all books, even those without an author
