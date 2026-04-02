# Лабораторна робота №4: Аналітичні SQL-запити(OLAP)
Виконали роботу студентки групи ІО-41:
---
*Головач Альона Василівна*

*Усенко Вікторія Сергіївна*

*Приступа Валерія Русланівна*

---

## Цілі
- Використовувати агрегатні функції, такі як COUNT, SUM, AVG, MIN та MAX, для обчислення зведеної статистики з ваших даних.
- Написати запити GROUP BY для групування рядків за одним або кількома стовпцями та обчислення агрегатів для кожної групи.
- Використовувати HAVING для фільтрації результатів згрупованих запитів на основі агрегованих умов.
- Виконувати операції JOIN (принаймні INNER JOIN та LEFT JOIN), щоб об'єднати дані з кількох таблиць.
- Створювати об'єднані запити на агрегацію для кількох таблиць, які об'єднують таблиці та створюють згрупований, агрегований вивід.
- Інтерпретувати результати ваших запитів та пояснити, що робить кожен з них.

  ## Опис виконання роботи:
  У ході виконання лабораторної роботи було здійснено роботу з базою даних інтернет-магазину в середовищі PostgreSQL. На основі раніше створеної структури таблиць було виконано аналітичні запити з використанням агрегатних функцій, групування даних та об'єднання таблиць. Було реалізовано запити типу SELECT з використанням агрегатних функцій COUNT, SUM, AVG, MIN та MAX для отримання зведеної статистики, зокрема підрахунку кількості замовлень, обчислення загальної суми продажів та визначення середніх значень цін товарів. Також застосовувалися запити з оператором GROUP BY для групування даних за різними параметрами, такими як клієнти, категорії товарів або замовлення.
  Для фільтрації згрупованих результатів використовувався оператор HAVING, що дозволило відбирати лише ті групи, які відповідають заданим умовам, наприклад клієнтів із сумою покупок вище певного значення. Було також реалізовано запити з об'єднанням таблиць (JOIN), зокрема INNER JOIN та LEFT JOIN, для отримання пов’язаної інформації з кількох таблиць, таких як клієнти, замовлення та товари.
  Окрім цього, були створені складні запити, що поєднують декілька таблиць і одночасно використовують агрегатні функції для обчислення узагальнених показників, наприклад загальної суми витрат кожного клієнта. Також у роботі застосовувалися підзапити у різних частинах SQL-запитів (SELECT, WHERE, HAVING), що дозволило реалізувати більш гнучку фільтрацію та обчислення.
  Після виконання кожного запиту перевірявся його результат, аналізувалася коректність отриманих даних та їх відповідність поставленому завданню.

  ---
## SQL-скрипт(и)
### Агрегаційні функції
**1)COUNT - підраховує кількість рядків.**
```sql
-- кількість замовлень
SELECT COUNT(*) AS total_orders
FROM orders;
```
<img width="274" height="124" alt="Снимок экрана — 2026-04-02 в 16 59 23" src="https://github.com/user-attachments/assets/45a38306-e206-443e-9e9c-5b8d10905a5d" />

**2)SUM - обчислює суму значень.**
```sql
-- загальна сума продажів
SELECT SUM(buy_price) AS total_sales
FROM orders;
```
<img width="272" height="128" alt="Снимок экрана — 2026-04-02 в 17 06 41" src="https://github.com/user-attachments/assets/3802ae66-db27-401b-8ad4-6115c01dbc5a" />

**3)AVG - знаходить середнє значення.**
```sql
-- середня ціна товарів
SELECT AVG(price) AS avg_price
FROM products;
```
<img width="272" height="129" alt="Снимок экрана — 2026-04-02 в 17 09 18" src="https://github.com/user-attachments/assets/bd1850d0-8baa-4bc4-a211-5a3eea15581d" />

**4)MIN AND MAX - знаходить мінімальне та максимальне значення.**
```sql
-- мінімальна і максимальна ціна
SELECT MIN(price) AS min_price, MAX(price) AS max_price
FROM products;
```
<img width="406" height="128" alt="Снимок экрана — 2026-04-02 в 17 15 12" src="https://github.com/user-attachments/assets/f07c5b08-2c02-4644-b4f3-d386498d2d3f" />

### Інші оператори
**1)SELECT - використовується для отримання даних з таблиці.**
```sql
-- кількість замовлень по клієнтах
SELECT client_id, COUNT(*) AS order_count
FROM orders
GROUP BY client_id;
```
<img width="432" height="240" alt="Снимок экрана — 2026-04-02 в 17 20 56" src="https://github.com/user-attachments/assets/c7578b1a-668d-4c15-a35b-d9340a755dde" />

**2)INSERT - додає нові записи в таблицю.**
```sql
-- 2.2. Додавання нового бренду
INSERT INTO brand (name, country) VALUES
('Apple', 'USA'),
('Samsung', 'South Korea'),
('Dell', 'USA'),
('HP', 'USA'),
('Lenovo', 'China'),
('Asus', 'Taiwan'),
('Acer', 'Taiwan'),
('Sony', 'Japan'),
('LG', 'South Korea'),
('Logitech', 'Switzerland'),
('Microsoft', 'USA'),
('Huawei', 'China');
```
<img width="1098" height="768" alt="image" src="https://github.com/user-attachments/assets/6e6ce7a7-b2da-44e0-9067-5228befa08be" />

**3)UPDATE - зміна даних.** 
```sql
UPDATE products
SET stock_quantity = 25
WHERE product_id =12;
```
Було: <img width="1850" height="136" alt="image" src="https://github.com/user-attachments/assets/b7824fcc-35c3-46ab-a28e-f034a3f3bd92" />

Стало: <img width="1846" height="135" alt="image" src="https://github.com/user-attachments/assets/acfa173f-bc70-40b1-a8d6-269fe9141b29" />
```sql
UPDATE products
SET price = 50000
WHERE product_id =12;
```
Було: <img width="1850" height="136" alt="image" src="https://github.com/user-attachments/assets/b7824fcc-35c3-46ab-a28e-f034a3f3bd92" />

Стало: <img width="1370" height="116" alt="image" src="https://github.com/user-attachments/assets/c6bc2ad0-b87e-41ae-a486-878ef3f3102f" />
**4)DELETE - видалення даних.**
```sql
##
DELETE FROM orders
WHERE order_id = 6;
```
Було: <img width="1860" height="427" alt="image" src="https://github.com/user-attachments/assets/0c003df3-e2ed-40f9-9c29-10bceb3063f9" />
Стало: <img width="1864" height="343" alt="image" src="https://github.com/user-attachments/assets/58f9ac9c-a273-4cfe-9b2d-96dab4b6d5c7" />

### Умови та групування
**1)WHERE — фільтрує рядки за умовою.**
```sql
-- замовлення дорожчі за середню суму
SELECT *
FROM orders
WHERE buy_price > (SELECT AVG(buy_price) FROM orders);
```
<img width="867" height="213" alt="Снимок экрана — 2026-04-02 в 17 40 39" src="https://github.com/user-attachments/assets/f7fdcd5e-da1f-445c-954e-5e13e1ab8811" />

**2)GROUP BY — групує рядки за певним стовпцем.**
```sql
-- сума витрат кожного клієнта
SELECT c.firstname || ' ' || c.surname AS full_name,
       SUM(oi.quantity * oi.price) AS total_spent
FROM client c
         JOIN orders o USING(client_id)
         JOIN order_items oi USING(order_id)
GROUP BY c.client_id, c.firstname, c.surname
ORDER BY total_spent DESC;
```
<img width="428" height="240" alt="Снимок экрана — 2026-04-02 в 17 42 20" src="https://github.com/user-attachments/assets/5a0e7b5a-330a-49a4-a2a9-a8bb371c91de" />

**3)HAVING — фільтрує згруповані результати.**
```sql
-- клієнти, які витратили більше 1000
SELECT client_id, SUM(buy_price) AS total_spent
FROM orders
GROUP BY client_id
HAVING SUM(buy_price) > 1000;
```
<img width="397" height="236" alt="Снимок экрана — 2026-04-02 в 17 43 37" src="https://github.com/user-attachments/assets/4494f861-1e04-4333-8aad-3e2e2d5c2494" />

### JOIN (об’єднання таблиць)
**1) INNER JOIN — повертає тільки ті рядки, які є в обох таблицях.**
```sql
-- клієнти та їх замовлення
SELECT c.firstname || ' ' || c.surname AS full_name,
       o.order_id,
       o.buy_price
FROM client c
         JOIN orders o USING(client_id);
```
<img width="597" height="372" alt="Снимок экрана — 2026-04-02 в 17 48 01" src="https://github.com/user-attachments/assets/38d78eea-3dde-478e-8321-15e65fdcf107" />

**2) LEFT JOIN — повертає всі рядки з лівої таблиці.**
```sql
-- всі клієнти навіть без замовлень
SELECT c.firstname || ' ' || c.surname AS full_name,
       o.order_id
FROM client c
         LEFT JOIN orders o USING(client_id);
```
<img width="415" height="510" alt="Снимок экрана — 2026-04-02 в 17 49 37" src="https://github.com/user-attachments/assets/fd5b14a6-ba97-4b32-967c-3b863f0af40c" />

**3) RIGHT JOIN — повертає всі рядки з правої таблиці.**
```sql
-- вивести всі замовлення та відповідних клієнтів (навіть якщо клієнта немає)
SELECT c.firstname || ' ' || c.surname AS full_name,
       o.order_id,
       o.buy_price
FROM client c
         RIGHT JOIN orders o USING(client_id);
```
<img width="571" height="377" alt="Снимок экрана — 2026-04-02 в 17 54 47" src="https://github.com/user-attachments/assets/91f1976d-e617-42ee-9311-68df2db5cc3c" />

**4) FULL JOIN — повертає всі рядки з обох таблиць.**
```sql
- вивести всі клієнти і всі замовлення (навіть без відповідностей)
SELECT c.firstname || ' ' || c.surname AS full_name,
       o.order_id,
       o.buy_price
FROM client c
         FULL JOIN orders o USING(client_id);
```
<img width="606" height="512" alt="Снимок экрана — 2026-04-02 в 17 56 36" src="https://github.com/user-attachments/assets/f40e6410-772f-439c-a27b-bdb12191e4cf" />

## Висновок:
У ході виконання лабораторної роботи було закріплено навички роботи з SQL-запитами для аналізу даних у базі даних інтернет-магазину. Було використано агрегатні функції (COUNT, SUM, AVG, MIN, MAX) для отримання зведеної статистики, а також оператор GROUP BY для групування даних.
Було застосовано оператор HAVING для фільтрації згрупованих результатів. Також реалізовано запити з використанням різних типів з’єднань (INNER JOIN, LEFT JOIN, RIGHT JOIN, FULL JOIN) для об’єднання даних з кількох таблиць.
Окрім цього, було використано підзапити у різних частинах SQL-запитів (SELECT, WHERE, HAVING), що дозволило виконувати більш складний аналіз даних.
У результаті роботи було отримано практичні навички написання складних SQL-запитів та аналізу інформації з бази даних.



