SELECT author_id, COUNT(*) AS book_count 
FROM books 
GROUP BY author_id 
HAVING COUNT(*) > 1;  -- Authors with more than one book