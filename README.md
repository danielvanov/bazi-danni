# Assignment 1 — The Class Bookshelf

## Decisions I made and why
I used three tables: `books` to store the books, `students` to store the borrowers, and `loans` to keep the borrowing history. Each table has an `id` as its primary key, and `loans` uses foreign keys to connect a book to a student so an invalid borrower or book cannot be recorded. I store the date a book was borrowed and the date it was returned, leaving `returned_on` empty (`NULL`) while the book is still out. I do not store a separate "available" column because I can work that out from whether the book has an active loan, and a unique index prevents two active loans for the same book.
