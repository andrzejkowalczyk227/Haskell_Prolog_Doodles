import Data.List
import System.Random
---------
--------- ZAD 1
---------
firstFromList :: [a] -> a
firstFromList (x:_) = x

secondFromList :: [a] -> a
secondFromList (x:y:_) = y

-- dwa sposoby
lastFromList :: [a] -> a
lastFromList [x] = x
lastFromList x = head $ reverse x

lastFromList' :: [a] -> a
lastFromList' [x] = x
lastFromList' (x:xs) = lastFromList xs

-- dwa sposoby
prelastFromList :: [a] -> a
prelastFromList x = secondFromList $ reverse x

prelastFromList' :: [a] -> a
prelastFromList' [x,y] = x -- [x,y] musi byc pierwsze w matchingu bo [x,y] == (x:xs)
prelastFromList' (x:xs) = prelastFromList xs

---------
--------- ZAD 2
--------- 
mergeLists :: [[a]] -> [a]
mergeLists x = concat x

mergeLists' :: [[a]] -> [a]
mergeLists' (x:xs) = x++mergeLists xs

---------
--------- ZAD 3
--------- 
howManyTimes :: (Eq a) => a -> [a] -> Int
howManyTimes _ [] = 0
howManyTimes x (y:ys)
    | x==y = 1 + howManyTimes x ys 
    | otherwise = 0 + howManyTimes x ys

---------
--------- ZAD 4
--------- 
connectOneAfterOne :: [a] -> [a] -> [a]
connectOneAfterOne [] [] = []
connectOneAfterOne [] y = []
connectOneAfterOne x [] = []
connectOneAfterOne (x:xs) (y:ys) = x:y:connectOneAfterOne xs ys

-- gdyby miala dolaczyc pozostalosc
-- ...
-- connectOneAfterOne [] y = y
-- connectOneAfterOne x [] = x
-- ...

---------
--------- ZAD 5
---------
an :: Int -> Int
an 0 = 1
an n = (an (n-1)) + (bn (n-1))

bn :: Int -> Int
bn 0 = 1
bn n = (an (n-1)) * (bn (n-1))

-- odpowiedz
-- [an x | x<-[1..10]]
-- [bn x | x<-[1..10]]

---------
--------- ZAD 6
---------
-- ogolny przypadek (Ord a) => [a] -> [a] 
quickSort :: [Int] -> [Int]
quickSort [] = []
quickSort [x] = [x]
quickSort (x:xs) =
   let smallerSorted = quickSort $ filter (<=x) xs
       biggerSorted = quickSort $ filter (>x) xs
   in smallerSorted ++ [x] ++ biggerSorted

removeDuplicateElements :: [Int] -> [Int]
removeDuplicateElements [] = []
removeDuplicateElements [x] = [x]
removeDuplicateElements (x:xs)
   | head xsort == head ysort = removeDuplicateElements ysort
   | otherwise = (head xsort):removeDuplicateElements ysort
   where xsort = quickSort (x:xs)
         ysort = quickSort xs

---------
--------- ZAD 7
---------
isPrimeNumber :: Int -> Bool
isPrimeNumber n = foldl (\acc x -> if n `mod` x == 0 then False else acc) True [2..limit]
   where limit = div n 2

nPrimeNumbers :: Int -> [Int]
nPrimeNumbers 0 = []
nPrimeNumbers n = map (+2) $ take n $ findIndices (\x -> isPrimeNumber x) [2..]

nPrimeNumbers' :: Int -> [Int]
nPrimeNumbers' 0 = []
nPrimeNumbers' n = map (+1) $ take n $ elemIndices True boolPrimes
   where boolPrimes = scanl (\acc x -> if (isPrimeNumber x) then True else False) False [2..]
   
-- wywraca pcta (chociaz bog wie dlaczego)
-- nPrimeNumbers n = take n $ foldl (\acc x -> if (isPrimeNumber x) then acc++[x] else acc) [] [2..]

---------
--------- ZAD 8
---------
-- ponowne wykorzystanie juz utworzonych funkcji
-- brak w zadaniu uscislenia typu, wiec przyjety jest ogolny
-- ogolny przypadek (Ord a) => [a] -> [a] 
quickSort' :: (Ord a) => [a] -> [a]
quickSort' [] = []
quickSort' [x] = [x]
quickSort' (x:xs) =
   let smallerSorted = quickSort' $ filter (<=x) xs
       biggerSorted = quickSort' $ filter (>x) xs
   in smallerSorted ++ [x] ++ biggerSorted
   
removeDuplicateElements' :: (Ord a) => [a] -> [a]
removeDuplicateElements' [] = []
removeDuplicateElements' [x] = [x]
removeDuplicateElements' (x:xs)
   | head xsort == head ysort = removeDuplicateElements' ysort
   | otherwise = (head xsort):removeDuplicateElements' ysort
   where xsort = quickSort' (x:xs)
         ysort = quickSort' xs

-- wlasciwa funkcja
deleteFromListAndSort :: (Ord a) => [[a]] -> [[a]]
deleteFromListAndSort [[]] = [[]]
deleteFromListAndSort xlist = map reverse $ map removeDuplicateElements' xlist

---------
--------- ZAD 8
---------
simulateDrawingNumbers :: Int -> [Int]
simulateDrawingNumbers n = take n $ randomRs (1,49) (mkStdGen 40)






