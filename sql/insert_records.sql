-- Insert authors data
INSERT INTO authors (author_id, first_name, last_name, year_born)
VALUES
    ('f2e4eae8-c1b0-4c1e-9c54-4c1f78845c3b', 'Mark', 'Twain', 1835),
    ('4a9be8c2-02a0-4a54-a2f4-9889e89e3c34', 'Leo', 'Tolstoy', 1828),
    ('8e04c1f0-cb93-4a98-95f8-39d74d626c83', 'Virginia', 'Woolf', 1882),
    ('a76590ed-0cb1-40dc-9c88-b772d83c72e8', 'Gabriel', 'Garcia Marquez', 1927),
    ('1db2af48-b45b-4e34-8e36-9a37ef1b75f7', 'Chinua', 'Achebe', 1930),
    ('e22e43c2-5056-4b56-bdac-ade45fc3d6a6', 'Toni', 'Morrison', 1931),
    ('ffdb1b5e-7cb6-487f-9c94-0e9b1d876d7e', 'Raymond', 'Carver', 1938),
    ('b3e3b39a-4b9d-467b-b60b-c2efbeffde25', 'Neil', 'Gaiman', 1960),
    ('c77632ea-f251-49c4-bc8b-f9b77b6d7f4b', 'Stephen', 'King', 1947),
    ('d67ecf0c-f44f-4d34-9031-ef7e9370db02', 'Agatha', 'Christie', 1890);

-- Insert books data
INSERT INTO books (book_id, title, year_published, author_id)
VALUES
    ('bf1ae8b1-8766-44f3-b1ff-0d88c7e92c71', 'The Adventures of Tom Sawyer', 1876, 'f2e4eae8-c1b0-4c1e-9c54-4c1f78845c3b'),
    ('73eb20f0-8e7c-4c3a-89e5-1e18aa2358f8', 'War and Peace', 1869, '4a9be8c2-02a0-4a54-a2f4-9889e89e3c34'),
    ('76e1b3b7-b962-4a5e-9707-8a97968d51ae', 'Mrs. Dalloway', 1925, '8e04c1f0-cb93-4a98-95f8-39d74d626c83'),
    ('d8b1b828-dfc1-4a37-9e4b-c5b7bb4d14ef', 'One Hundred Years of Solitude', 1967, 'a76590ed-0cb1-40dc-9c88-b772d83c72e8'),
    ('aa1e2cbe-4e8f-4d75-9882-bd0bb9c85d8d', 'Things Fall Apart', 1958, '1db2af48-b45b-4e34-8e36-9a37ef1b75f7'),
    ('2bde6a34-0cf9-42f1-a1e5-4fc2d1db7395', 'Beloved', 1987, 'e22e43c2-5056-4b56-bdac-ade45fc3d6a6'),
    ('256ad7a3-9f7d-420b-9cbb-c3fbd0c7989a', 'What We Talk About When We Talk About Love', 1981, 'ffdb1b5e-7cb6-487f-9c94-0e9b1d876d7e'),
    ('aa2bda6f-b97f-40c2-96db-2f4aa2e7067b', 'American Gods', 2001, 'b3e3b39a-4b9d-467b-b60b-c2efbeffde25'),
    ('c7063006-9b78-47b6-9736-9933b98c2091', 'The Shining', 1977, 'c77632ea-f251-49c4-bc8b-f9b77b6d7f4b'),
    ('be8a95c4-569c-4586-bbb4-bba728b2c586', 'Murder on the Orient Express', 1934, 'd67ecf0c-f44f-4d34-9031-ef7e9370db02');
