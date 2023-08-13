CREATE DATABASE IF NOT EXISTS Library;
#
# Declarando as entidades
#	
CREATE TABLE IF NOT EXISTS category(
	id int NOT NULL AUTO_INCREMENT, # auto incrementado significa que a cada registro, ele cria automaticamente  id_novo = id_anterior + 1
	name varchar(50) NOT NULL,
	
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS author(
	id int NOT NULL AUTO_INCREMENT,
    name varchar(50),
	
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS publisher(
	id int NOT NULL AUTO_INCREMENT,
    name varchar(50) NOT NULL,
	
	PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS student(
	id int NOT NULL AUTO_INCREMENT,
    name varchar(50) NOT NULL,
	
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS book(
	id int NOT NULL AUTO_INCREMENT,
    title varchar(50) NOT NULL,
	year_published int NOT NULL,
	author_id int NOT NULL,
    category_id int NOT NULL, 
	publisher_id int NOT NULL,
    
    PRIMARY KEY (id),

	# a tabela book se relaciona com os ids das tabelas author, category e publisher.

	FOREIGN KEY (author_id) REFERENCES author(id),
    FOREIGN KEY (category_id) REFERENCES category(id),
	FOREIGN KEY (publisher_id) REFERENCES publisher(id)
);
CREATE TABLE IF NOT EXISTS transactions(
	# o objetivo dessa tabela é registrar num histórico todas 
	# as transacoes concluidas (emprestimo + devolução) da biblioteca

	id int NOT NULL AUTO_INCREMENT,
    student_id int NOT NULL,
	book_id int NOT NULL,
    taken_date date NOT NULL,
    brought_date date NOT NULL,
    

	# a tabela transactions se relaciona com os ids das tabelas book e student.

    PRIMARY KEY (id),
    FOREIGN KEY (book_id) REFERENCES book(id),
   	FOREIGN KEY (student_id) REFERENCES student(id)
);