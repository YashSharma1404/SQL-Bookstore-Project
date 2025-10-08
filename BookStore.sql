create table books (
    book_id INTEGER PRIMARY KEY,
    title TEXT,
    genre TEXT,
    price DECIMAL(6,2),
    stock INTEGER
);

create table customers (
    customer_id INTEGER PRIMARY KEY,
    name TEXT,
    city TEXT,
    signup_date DATE
);

create table orders (
	order_id int not null primary key,
    customer_id int,
    book_id int,
    quantity int,
    order_date date,
    foreign key (customer_id) references customers(customer_id),
    foreign key(book_id) references books(book_id)
);

create table marketingspend (
	spend_id int primary key,
    customer_id int,
    spend_amount decimal(7,2),
    foreign key(customer_id) references customers(customer_id)
);

-- Books
INSERT INTO Books VALUES
(1, 'Data Science 101', 'Education', 29.99, 100),
(2, 'The Art of SQL', 'Technology', 34.50, 50),
(3, 'Mystery at the Bookstore', 'Fiction', 15.00, 20),
(4, 'Learn Python the Hard Way', 'Education', 40.00, 30),
(5, 'Fantasy World Chronicles', 'Fantasy', 22.50, 10);

-- Customers
INSERT INTO Customers VALUES
(1, 'Alice', 'New York', '2023-01-10'),
(2, 'Bob', 'San Francisco', '2023-03-15'),
(3, 'Charlie', 'Austin', '2023-06-20'),
(4, 'Diana', 'New York', '2024-01-10'),
(5, 'Evan', 'Chicago', '2024-04-05');

-- Orders
INSERT INTO Orders VALUES
(1, 1, 1, 2, '2024-06-01'),
(2, 2, 2, 1, '2024-06-02'),
(3, 1, 3, 1, '2024-06-03'),
(4, 3, 1, 3, '2024-06-04'),
(5, 4, 5, 2, '2024-06-04'),
(6, 5, 2, 2, '2024-06-05'),
(7, 2, 4, 1, '2024-06-05'),
(8, 1, 1, 1, '2024-06-06');

-- Marketing Spend
INSERT INTO MarketingSpend VALUES
(1, 1, 50.00),
(2, 2, 75.00),
(3, 3, 40.00),
(4, 4, 60.00),
(5, 5, 35.00);


-- Total Revenue per Book
select
	b.title,
    sum(o.quantity) as total_unit_sold,
    sum(o.quantity * b.price) as total_revenue
from orders o
join books b on o.book_id = b.book_id
group by title
order by total_revenue desc;


-- Low Stock Alerts
select title, stock
from books
where stock < 15;


-- Customer RFM Segmentation
with customer_metrics as (
	select 
		c.customer_id,
        c.name,
        max(o.order_date) as last_order,
        count(o.order_id) as frequency,
		sum(o.quantity * b.price) as monetory
	from customers c 
    join orders o on c.customer_id = o.customer_id
    join books b on b.book_id = o.book_id
    group by c.customer_id
)
select *,
	datediff('2024-07-01', last_order) as recency_days
from customer_metrics;


-- Marketing ROI
with customer_spend as (
	select o.customer_id,
    sum(o.quantity * b.price) as total_revenue
    from orders o
    join books b on b.book_id = o.book_id
    group by o.customer_id
)
select 
	c.customer_id,
    c.name,
    ms.spend_amount,
    cs.total_revenue,
    (cs.total_revenue - ms.spend_amount) as profit
from customers c 
join marketingspend ms on c.customer_id = ms.customer_id
join customer_spend cs on c.customer_id = cs.customer_id;


-- Monthly Sales Trend
select
	sum(o.quantity) as book_sold,
	date_format(order_date, '%y-%m') as month,
    sum(o.quantity * b.price) as total_revenue
from orders o
join books b on o.book_id = b.book_id
group by month;


-- Returning Customers
select 
	c.customer_id,
    c.name,
    count(distinct o.order_id) as total_orders
from customers c
join orders o on c.customer_id = o.customer_id
group by c.customer_id
having total_orders > 1;


-- Average Order Value (AOV)
select 
	round(sum(o.quantity * b.price) * 1.0 / count(distinct o.order_id), 2) as avg_order_value
from orders o
join books b on o.book_id = b.book_id;


-- Churned Customers
select 
	c.customer_id,
    c.name,
    max(o.order_date) as last_purchase,
    datediff('2025-07-01', max(o.order_date)) as days_since_last_purchase
from customers c 
join orders o on c.customer_id = o.customer_id
group by c.customer_id
having days_since_last_purchase > 365;