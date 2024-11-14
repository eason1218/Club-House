SELECT r.*, p.product_name
FROM product p
JOIN raw r ON p.id = r.product_id
WHERE p.brand = 'Club House';
