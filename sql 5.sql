-- 5
SELECT d.*
FROM dealerships d
JOIN inventory i
  ON d.dealershipId = i.dealershipId
WHERE i.VIN = '1HGCM82633A004352';

