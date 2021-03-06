module AW6

where
import Data.List
import System.Random
import Week6
import AW5

-- ┌───────────────────────────────────────────────────────────────────────────┐
-- │ 1. Implement a function                                                   │
-- │                                                                           │
-- │    exM :: Integer -> Integer -> Integer -> Integer                        │
-- │                                                                           │
-- │    that does modular exponentiation of xy in polynomial time, by          │
-- │    repeatedly squaring modulo N.                                          │
-- │    E.g., x^33 mod 5 can be computed by means of                           │
-- │                                                                           │
-- │          x^33 (mod 5) = x^32 (mod 5) x r (mod 5)                          │
-- │                                                                           │
-- │    x^32 (mod N) is computed in five steps by means of repeatedly          │
-- │    squaring modulo N:                                                     │
-- │                                                                           │
-- │    x (mod N) -> x^2 (mod N) -> x^4 (mod N) -> ....... -> x^32 (mod N)     │
-- │                                                                           │
-- │    If this explanation is too concise, look up relevant literature.       │
-- │                                                                           │
-- └───────────────────────────────────────────────────────────────────────────┘
-- code is already given! ??

-- ┌───────────────────────────────────────────────────────────────────────────┐
-- │ 2. Check that your implementation is more efficient than expM by running  │
-- │    a number of relevant tests and documenting the results.                │
-- └───────────────────────────────────────────────────────────────────────────┘
-- example: test_ExpMod' 24 9 23
test_ExpMod' :: Integer -> Integer -> Integer -> IO()
test_ExpMod' n d e = do
	if n <= e 
	then print ("Start Testing")
	else do
		let x = 2^n 
		let y = 2^n
		test_ExpMod' (n - 1) d e
		print ("============================================")
		print ("Test with N is " ++ show n)
		test_ExpMod x y d
		print ("Done with Test with N is " ++ show n)
			
test_ExpMod :: Integer -> Integer -> Integer -> IO()
test_ExpMod x y n = do

	print ("--------------------------------------------")
	print ("Input: X: " ++ show x ++ " Y: " ++ show y ++ " N:" ++ show n)
	
	-- slow way
	print ("--------------------------------------------")
	st <- time           -- Start Time
	
	let e = expM x y n   -- find e with expM
	print ("Slow Way : " ++ show e)
	et <- time           -- End Time
	let dt = (et - st)   -- Diff Time 
	print ("Time     : " ++ show dt)
	
	-- quick way
	st <- time           -- Start Time
	let e = exM x y n   -- find e with expM
	print ("Quick Way: " ++ show e)
	et <- time           -- End Time
	let dt = (et - st)   -- Diff Time 
	print ("Time     : " ++ show dt)	
	
-- 3. In order to test Fermat's Primality Check (as implemented in function primeF),
--    the list of prime numbers generated by Eratosthenes' sieve is useless, for Fermat's
--    Primality Check correctly classify the primes as primes. Where the check can go
--    wrong is on classifying composite numbers; these can slip through the Fermat test.
--    Write a function composites :: [Integer] that generates the infinite list of composite
--    natural numbers. Hint: modify Eratosthenes' sieve, so that instead of throwing
--    away composite numbers, it marks them as false. Next filter out the numbers
--    marked as false.

-- first 105 composites:
-- source: http://en.wikipedia.org/wiki/Composite_number
first_105_composites = [4, 6, 8, 9, 10, 12, 14, 15, 16, 18, 20, 21, 22, 24, 25, 26, 27, 28, 30, 32, 33, 34, 35, 36, 38, 39, 40, 42, 44, 45, 46, 48, 49, 50, 51, 52, 54, 55, 56, 57, 58, 60, 62, 63, 64, 65, 66, 68, 69, 70, 72, 74, 75, 76, 77, 78, 80, 81, 82, 84, 85, 86, 87, 88, 90, 91, 92, 93, 94, 95, 96, 98, 99, 100, 102, 104, 105, 106, 108, 110, 111, 112, 114, 115, 116, 117, 118, 119, 120, 121, 122, 123, 124, 125, 126, 128, 129, 130, 132, 133, 134, 135, 136, 138, 140]

-- list of non-primes
composite n = sieve2 [2..n]
sieve2 [] = []
sieve2 (n:ns) = 
	if (isPrime n) == True
	then sieve2 ns
	else n : sieve2 ns
	
-- 4. Use the list of composite numbers to test Fermat's primality check. What is the
--    least composite number that you can find that fools the check, for testF k with
--    k = 1; 2; 3 ? What happens if you increase k?
--    the change on a wrong positive
test_primeF :: Int -> [Integer] -> IO()
test_primeF k [] = print ("Done Testing")
test_primeF k (x:xs) = do
	
	-- test if x is primeF
	t <- primeF k x
	
	-- if true then show
	if (t == True)
	then do
		let p = isPrime x
		print ("PrimeF " ++ show x ++ " is True, isPrime " ++ show x ++ " is " ++ show p)
		test_primeF k xs
		
	else do
		test_primeF k xs

-- 5. Use the list generated by the following function for a further test of Fermat's pri-
--    mality check. 
carmichael :: [Integer]
carmichael = [ (6*k+1)*(12*k+1)*(18*k+1) |
	k <- [2..],
	isPrime (6*k+1),
	isPrime (12*k+1),
	isPrime (18*k+1) ]

--	  Read the entry on Carmichael numbers on Wikipedia to explain what you find.		
	
