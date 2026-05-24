-- Создание таблицы продуктов
CREATE TABLE IF NOT EXISTS products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(100) NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    stock_quantity INT NOT NULL
);

-- Создание таблицы заказов
CREATE TABLE IF NOT EXISTS orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    order_date DATE NOT NULL,
    client_id INT NOT NULL
);

-- Создание таблицы заказанных продуктов
CREATE TABLE IF NOT EXISTS order_items (
    item_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL
);

-- Заполнение таблицы продуктов
INSERT INTO products (product_name, price, stock_quantity)
VALUES
('Ноутбук', 45000.00, 10),
('Смартфон', 25000.00, 15),
('Наушники', 5000.00, 20),
('Планшет', 32000.00, 8),
('Часы умные', 12000.00, 25),
('Клавиатура', 2500.00, 30),
('Мышь', 800.00, 40),
('Монитор', 18000.00, 12);

-- Заполнение таблицы заказов
INSERT INTO orders (order_date, client_id)
VALUES
('2025-05-20', 1),
('2025-05-20', 2),
('2025-05-21', 3),
('2025-05-22', 4),
('2025-05-22', 5);

-- Заполнение таблицы заказанных продуктов
INSERT INTO order_items (order_id, product_id, quantity)
VALUES
(1, 1, 2),
(1, 2, 1),
(2, 3, 3),
(2, 4, 1),
(3, 5, 2),
(3, 6, 5),
(4, 7, 4),
(5, 8, 1),
(5, 2, 2);

-- Простые запросы
SELECT * FROM products;
SELECT * FROM orders;
SELECT * FROM order_items;
SELECT product_name, price FROM products WHERE price > 10000;
SELECT product_name, stock_quantity FROM products WHERE stock_quantity < 15;

-- Многотабличный запрос
SELECT
    o.order_id AS 'Номер заказа',
    p.product_name AS 'Название продукта',
    oi.quantity AS 'Количество',
    p.price * oi.quantity AS 'Итоговая сумма'
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
ORDER BY o.order_id;