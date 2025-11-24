-- 2 
SELECT v.*
FROM vehicles v
JOIN inventory i
  ON v.VIN = i.VIN
WHERE i.dealershipId = 1;