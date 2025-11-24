-- 4
SELECT DISTINCT d.*
FROM dealerships d
JOIN inventory i
  ON d.dealershipId = i.dealershipId
JOIN vehicles v
  ON v.VIN = i.VIN
WHERE v.color = 'Red'
  AND v.make = 'Ford'
  AND v.model = 'Mustang';
  