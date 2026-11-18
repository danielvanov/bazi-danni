-- ВЪПРОС 1:
-- Кои книги са взети в момента и кой ги държи?

-- Избираме заглавие, ученик и дата на взимане
SELECT
    b.title,
    s.name AS student,
    l.borrowed_on AS date_taken

-- Взимаме информация от таблицата loans
FROM loans AS l

-- Свързваме заемането с книгата чрез book_id
JOIN books AS b ON b.id = l.book_id

-- Свързваме заемането с ученика чрез student_id
JOIN students AS s ON s.id = l.student_id

-- Показваме само книгите, които не са върнати
WHERE l.returned_on IS NULL

-- Подреждаме по дата и заглавие
ORDER BY l.borrowed_on, b.title;


-- ВЪПРОС 2:
-- Кой ученик държи книга повече от 14 дни?

-- Показваме ученик, книга и кога е взета
SELECT
    s.name AS student,
    b.title,
    l.borrowed_on AS date_taken

-- Използваме таблицата със заеманията
FROM loans AS l

-- Свързваме с таблицата books
JOIN books AS b ON b.id = l.book_id

-- Свързваме с таблицата students
JOIN students AS s ON s.id = l.student_id

-- Книгата трябва още да не е върната
WHERE l.returned_on IS NULL

-- Проверяваме дали е взета преди повече от 14 дни
AND l.borrowed_on < CURRENT_DATE - 14

-- Подреждаме по дата и име на ученика
ORDER BY l.borrowed_on, s.name;