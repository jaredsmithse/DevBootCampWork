# No original gist
# SQL Tutor answers

-- 1 --  
SELECT * FROM invoices

-- 2 --  
SELECT * FROM artists

-- 3 --  
SELECT name FROM artists

-- 4 --  
SELECT first_name, last_name FROM employees

-- 5 --  
SELECT name FROM media_types

-- 6 -- 
SELECT * FROM employees
ORDER BY hire_date DESC

-- 7 -- 
SELECT * FROM artists
ORDER BY name

-- 8 -- 
SELECT hire_date, first_name, last_name FROM employees
WHERE hire_date < '20110215'

-- 9 -- 
SELECT * FROM employees 
WHERE first_name LIKE 'A%'

-- 10 -- 
SELECT name FROM artists
WHERE name LIKE '%smith'

-- 11 -- 
SELECT name FROM artists
WHERE name LIKE '%smith%'

-- 12 -- 
SELECT * FROM invoices
WHERE billing_city = 'Redmond' AND billing_state = 'WA'

-- 13 -- 
SELECT * FROM invoices 
WHERE billing_city = 'Berlin' AND billing_country = 'Germany'

-- 14 -- 
SELECT * FROM invoices 
WHERE billing_country = 'Canada'

-- 15 -- 
SELECT * FROM invoices 
WHERE billing_country = 'Canada' AND billing_state = 'AB'

-- 16 -- 
SELECT * FROM invoices 
WHERE billing_country = 'Canada' AND billing_state = 'AB' AND billing_city = 'Edmonton'

-- 17 -- 
SELECT billing_address FROM invoices
WHERE billing_city = 'Redmond' AND billing_state = 'WA'

-- 18 -- 
SELECT * FROM invoices
WHERE billing_city = 'Reno' AND billing_state = 'NV' AND total > 5

-- 19 -- 
SELECT * FROM tracks
WHERE composer IS NULL

-- 20 -- 
SELECT * FROM customers 
WHERE company IS NULL

-- 21 -- 
SELECT * FROM invoices
WHERE billing_city = 'Redmond' AND billing_state = 'WA'
ORDER BY total ASC

-- 22 -- 
SELECT * FROM invoices
WHERE billing_city = 'Redmond' AND billing_state = 'WA'
ORDER BY total DESC

-- 23 -- 
SELECT * FROM invoices
WHERE billing_country = 'Germany'
ORDER BY total DESC

-- 24 -- 
SELECT * FROM invoices
WHERE billing_country = 'Germany'
ORDER BY total DESC LIMIT 10

-- 25 -- 
SELECT * FROM invoices
WHERE billing_city = 'Boston' AND billing_state = 'MA'
ORDER BY total DESC LIMIT 10

-- 26 -- 
SELECT * FROM invoices
WHERE billing_city = 'Boston' AND billing_state = 'MA'
ORDER BY total ASC LIMIT 10

-- 27 -- 
SELECT billing_address FROM invoices 
WHERE billing_city = 'Cupertino' AND billing_state = 'CA' 
ORDER BY total DESC LIMIT 3

-- 28 -- 
SELECT * FROM invoices
WHERE billing_city = 'Cupertino' OR billing_city = 'Mountain View' 
	AND billing_state = 'CA'

-- 29 -- 
SELECT COUNT(*) FROM invoices
WHERE billing_city = 'Santiago'

-- 30 -- 
SELECT customers.country, COUNT(*) FROM customers
GROUP BY country

-- 31 -- 
SELECT tracks.unit_price, COUNT(*) FROM tracks
GROUP BY tracks.unit_price

-- 32 -- 
SELECT employees.city, COUNT(*) FROM employees
GROUP BY city

-- 33 -- 
SELECT customers.country, COUNT(*) FROM customers
GROUP BY customers.country 
ORDER BY COUNT(*) DESC LIMIT 3

-- 34 -- 
SELECT invoices.billing_city, COUNT(*) FROM invoices
GROUP BY invoices.billing_city
ORDER BY COUNT(*) DESC LIMIT 5

-- 35 -- 
SELECT artists.name, albums.title 
FROM artists JOIN albums ON albums.artist_id = artists.id

-- 36 -- 
SELECT tracks.name, albums.title 
FROM tracks JOIN albums ON albums.id = tracks.album_id

-- 37 -- 
SELECT artists.name, albums.title 
FROM artists JOIN albums ON albums.artist_id = artists.id
ORDER BY artists.name 

-- 38 -- 
SELECT customers.first_name, customers.last_name, invoices.total 
FROM customers JOIN invoices ON invoices.customer_id = customers.id
ORDER BY invoices.total DESC

-- 39 -- 
SELECT * 
FROM customers JOIN invoices ON invoices.customer_id = customers.id
ORDER BY total DESC LIMIT 1

-- 40 -- 
SELECT * 
FROM albums JOIN artists ON albums.artist_id = artists.id
WHERE artists.name = 'Aerosmith'

-- 41 -- 
SELECT * 
FROM albums JOIN artists ON artists.id = albums.artist_id 
WHERE artists.name = 'Aerosmith'

-- 42 -- 
SELECT albums.*, artists.* 
FROM albums JOIN artists ON albums.artist_id = artists.id
WHERE artists.name = 'Iron Maiden'

-- 43 -- 
SELECT albums.*, tracks.* 
FROM albums JOIN tracks ON albums.id = tracks.album_id
WHERE tracks.name = 'Midnight'

-- 44 -- 
SELECT artists.*, albums.*, tracks.* 
FROM albums JOIN artists ON artists.id = albums.artist_id
JOIN tracks ON tracks.album_id = albums.id 
WHERE tracks.name = 'Midnight'

-- 45 -- 
SELECT COUNT(albums.artist_id) 
FROM albums JOIN artists ON albums.artist_id = artists.id
WHERE artists.name = 'Iron Maiden'

-- 46 -- 
SELECT artists.name, COUNT(albums.artist_id) 
FROM artists JOIN albums ON artists.id = albums.artist_id
GROUP BY artists.name, albums.artist_id
ORDER BY artists.name ASC

-- 47 -- 
SELECT albums.title, COUNT(tracks.album_id) 
FROM albums JOIN tracks ON albums.id = tracks.album_id
GROUP BY albums.title, tracks.album_id
ORDER BY albums.title ASC

-- 48 -- 
SELECT artists.*, COUNT(albums.artist_id) 
FROM artists JOIN albums ON artists.id = albums.artist.id
GROUP BY artists.id, artists.name, albums.artist_id
ORDER BY COUNT(albums.artist_id) DESC, artists.name ASC

-- 49 -- 
SELECT albums.id, albums.title, albums.artist_id, COUNT(tracks.album_id) 
FROM albums JOIN tracks ON albums.id = tracks.album_id 
GROUP BY albums.id 
ORDER BY COUNT(tracks.album_id) DESC

-- 50 -- 
SELECT artists.id, artists.name, COUNT(albums.artist_id) 
FROM artists JOIN albums ON artists.id = albums.artist_id 
GROUP BY artists.id, artists.name 
ORDER BY COUNT(albums.artist_id) DESC LIMIT 1

-- 51 -- 
SELECT albums.id, albums.title, albums.artist_id, COUNT(tracks.album_id) 
FROM albums JOIN tracks ON albums.id = tracks.album_id 
GROUP BY albums.id, albums.title 
ORDER BY COUNT(tracks.album_id) DESC LIMIT 1