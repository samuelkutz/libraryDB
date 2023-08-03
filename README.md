# README - libraryDB

libraryDB é um exemplo de um modelo de banco de dados relacional para catálogar livros de uma escola.

## Criação do Banco de Dados

```sql
CREATE DATABASE IF NOT EXISTS Library;
```

Após isso, são criadas as tabelas: `category`, `author`, `publisher`, `student`

###### (cada uma contendo seu id único autoincrementado a cada registro e um nome)

```sql
CREATE TABLE IF NOT EXISTS category(
	id int NOT NULL AUTO_INCREMENT,
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
```

## Tabela `book`

#### Já a tabela `book` é a tabela principal do sistema, responsável por armazenar informações sobre os livros disponíveis na biblioteca. 

* `id`: chave primária e autoincrementada (assim como todas as outras)

* `title`: título do livro

* `year_published`: o ano de publicação do livro
  
* `author_id`, `category_id` e `publisher_id`: chaves estrangeiras referenciando as tabelas `author`, `category` e `publisher`, respectivamente

Isso garante que os dados dos livros estejam associados corretamente aos autores, categorias e editoras correspondentes.

```sql
CREATE TABLE IF NOT EXISTS book(
    id int NOT NULL AUTO_INCREMENT,
    title varchar(50) NOT NULL,
    year_published int NOT NULL,
    author_id int NOT NULL,
    category_id int NOT NULL, 
    publisher_id int NOT NULL,
    
    PRIMARY KEY (id),
    FOREIGN KEY (author_id) REFERENCES author(id),
    FOREIGN KEY (category_id) REFERENCES category(id),
    FOREIGN KEY (publisher_id) REFERENCES publisher(id)
);
```

## Tabela `transactions`

Como um bônus, a tabela de transações é um histórico de todos os livros emprestados e dovolvidos. Vale notar que os registros acontecem apenas quando o livro é devolvido.

```sql
CREATE TABLE IF NOT EXISTS transactions(
    id int NOT NULL AUTO_INCREMENT,
    student_id int NOT NULL,
    book_id int NOT NULL,
    taken_date date NOT NULL,
    brought_date date NOT NULL,
    
    PRIMARY KEY (id),
    FOREIGN KEY (book_id) REFERENCES book(id),
    FOREIGN KEY (student_id) REFERENCES student(id)
);
```

A tabela `transactions` é utilizada para registrar as transações de empréstimo de livros para os alunos. Ela possui uma coluna `id` como chave primária e autoincrementada, além de duas colunas `student_id` e `book_id` que são chaves estrangeiras, referenciando as tabelas `student` e `book`, respectivamente. As colunas `taken_date` e `brought_date` armazenam as datas de retirada e devolução dos livros, ambas obrigatórias (NOT NULL).

* `id`: chave primária e autoincrementada (assim como todas as outras)

* `student_id`, `book_id`: chaves estrangeiras, referenciando as tabelas `student` e `book`

* `taken_date`, `brought_date`: armazenam as datas de retirada e devolução dos livros, ambas obrigatórias

## Populando as Tabelas

Depois de criar as tabelas, o código insere alguns dados iniciais para ilustrar o funcionamento do sistema:

- São inseridas cinco categorias de livros: "Fiction", "Mystery", "Science", "History" e "Romance".
- São inseridos cinco autores: "J.K. Rowling", "Agatha Christie", "Stephen Hawking", "Yuval Noah Harari" e "Jane Austen".
- São inseridas cinco editoras: "Penguin Random House", "HarperCollins", "Cambridge University Press", "Oxford University Press" e "Simon & Schuster".
- São inseridos cinco alunos: "John Doe", "Jane Smith", "Michael Johnson", "Emily Brown" e "William Davis".
- São inseridos cinco livros, associados aos autores, categorias e editoras correspondentes.
- São realizadas cinco transações de empréstimo, associando alunos e livros em diferentes datas de retirada e devolução.

Esse código SQL forma uma base simples para o sistema de biblioteca, permitindo o registro e gerenciamento de livros, autores, editoras, alunos e transações de empréstimo.
