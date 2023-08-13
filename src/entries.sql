
#
# Populando as tabelas :D
#
INSERT INTO category (name) VALUES ('Fiction');
INSERT INTO category (name) VALUES ('Mystery');
INSERT INTO category (name) VALUES ('Science');
INSERT INTO category (name) VALUES ('History');
INSERT INTO category (name) VALUES ('Romance');

INSERT INTO author (name) VALUES ('J.K. Rowling');
INSERT INTO author (name) VALUES ('Agatha Christie');
INSERT INTO author (name) VALUES ('Stephen Hawking');
INSERT INTO author (name) VALUES ('Yuval Noah Harari');
INSERT INTO author (name) VALUES ('Jane Austen');

INSERT INTO publisher (name) VALUES ('Penguin Random House');
INSERT INTO publisher (name) VALUES ('HarperCollins');
INSERT INTO publisher (name) VALUES ('Cambridge University Press');
INSERT INTO publisher (name) VALUES ('Oxford University Press');
INSERT INTO publisher (name) VALUES ('Simon & Schuster');

INSERT INTO student (name) VALUES ('John Doe');
INSERT INTO student (name) VALUES ('Jane Smith');
INSERT INTO student (name) VALUES ('Michael Johnson');
INSERT INTO student (name) VALUES ('Emily Brown');
INSERT INTO student (name) VALUES ('William Davis');

INSERT INTO book (title, year_published, author_id, category_id, publisher_id) VALUES
('Harry Potter and the Sorcerer''s Stone', 1997, 1, 1, 1);
INSERT INTO book (title, year_published, author_id, category_id, publisher_id) VALUES
('Murder on the Orient Express', 1934, 2, 2, 2);
INSERT INTO book (title, year_published, author_id, category_id, publisher_id) VALUES
('A Brief History of Time', 1988, 3, 3, 3);
INSERT INTO book (title, year_published, author_id, category_id, publisher_id) VALUES
('Sapiens: A Brief History of Humankind', 2011, 4, 3, 4);
INSERT INTO book (title, year_published, author_id, category_id, publisher_id) VALUES
('Pride and Prejudice', 1813, 5, 5, 1);

INSERT INTO transactions (student_id, book_id, taken_date, brought_date) VALUES
(1, 1, '2023-07-15', '2023-08-01');
INSERT INTO transactions (student_id, book_id, taken_date, brought_date) VALUES
(2, 3, '2023-07-25', '2023-08-01');
INSERT INTO transactions (student_id, book_id, taken_date, brought_date) VALUES
(3, 2, '2023-07-20', '2023-08-01');
INSERT INTO transactions (student_id, book_id, taken_date, brought_date) VALUES
(4, 4, '2023-07-18', '2023-08-01');
INSERT INTO transactions (student_id, book_id, taken_date, brought_date) VALUES
(5, 5, '2023-07-30', '2023-08-01');
