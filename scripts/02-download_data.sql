#### Preamble ####
# Purpose: Downloads the data from sql
# Author: YiZhuo Li
# Date: 14 November 2024
# Contact: liyizhuo.li@mail.utoronto.ca
# License: MIT
  
SELECT r.*, p.product_name
FROM product p
JOIN raw r ON p.id = r.product_id
WHERE p.brand = 'Club House';
