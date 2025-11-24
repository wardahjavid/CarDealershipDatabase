-- 6
SELECT d.name AS dealershipName,
       v.make,
       v.model,
       s.saleDate,
       s.price
FROM salesContracts s
JOIN vehicles v
  ON s.VIN = v.VIN
JOIN inventory i
  ON v.VIN = i.VIN
JOIN dealerships d
  ON i.dealershipId = d.dealershipId
WHERE d.dealershipId = 1
  AND s.saleDate BETWEEN '2024-01-01' AND '2024-12-31';



