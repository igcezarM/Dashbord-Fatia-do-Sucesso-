select * from pizza_sales;

--Receita total 
select 
sum(total_price) as [receita total]
from pizza_sales;

-- Quantidade vendida 
Select 
COUNT(quantity) as [quantidade Vendida]
from pizza_sales;

--Ticket Médio 

select 
SUM( total_price) / COUNT(distinct order_id) [Tickect Médio ]
from pizza_sales;

-- total de Pedidos 
SELECT 
COUNT(DISTINCT order_id) AS [total pedidos]
FROM pizza_sales;

-- Total de pedidos por dia 
SELECT 
    DATENAME(WEEKDAY, order_date) AS [Dia da semana],
    COUNT(DISTINCT order_id) AS total
FROM pizza_sales
GROUP BY DATENAME(WEEKDAY, order_date)
ORDER BY total DESC;

Select *
from pizza_sales



-- Quantidade Vendida por Mês 
SELECT 
    DATENAME(month, order_date) as nome_do_Mês,
    COUNT(DISTINCT order_id) as total_pedidos
FROM pizza_sales
GROUP BY MONTH(order_date), DATENAME(month, order_date)  
ORDER BY MONTH(order_date)  

-- Porcentagem por Categoria
SELECT 
    pizza_name,
    CAST(
        (SUM(total_price) * 100.0) / (SELECT SUM(total_price) FROM pizza_sales) 
        AS DECIMAL(10,2)
    ) as percentual_receita
FROM pizza_sales
GROUP BY pizza_name
ORDER BY percentual_receita DESC

-- 5 Sabores Mais Vendidos 

SELECT 
TOP 5
    pizza_name,
    SUM(total_price) as total_receita
FROM pizza_sales
GROUP BY pizza_name
ORDER BY SUM(total_price) DESC