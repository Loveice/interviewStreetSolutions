--module ManipulativeNumbers (main, manipulativeNumbers) where
import qualified Data.Set as Set
import qualified Data.List as List
import Data.Maybe
import Data.Bits

listXor x y = zipWith (xor) x y 

rearrange (x:xs) = (xs++[x])

permExists set x = Set.member (reverse x) set
          
addIfNotMember set x = 
          if (permExists set x)==True
            then
              set         
            else 
              Set.insert x set

halve xs = take (n `div` 2) xs
    where n = length xs

--splist (x,y) = [x,y]

--split xs = splitAt (n `div` 2) xs
--    where n = length xs

--perm list = recombine (head xs) (last xs)
--    where xs = map (List.permutations) (splist (split list))

--recombine xs ys = [x++y | x <- xs, y <- ys] ++ [] 

--perm [] = []
--perm [x] = [[x]]
--perm xs = [x:ys | x<- xs, ys<- perm (List.delete x xs)]  

manipulativeNumbers :: (Integral a, Bits a, Ord a) => [a] -> a
manipulativeNumbers nSet = floor (logBase 2 (fromIntegral minValue))
  where 
    minValue = Set.findMax xorPerms
    xorPerms = (Set.map (\x -> minimum (listXor x (rearrange x))) purgedPerms)
    purgedPerms = foldl (\set x -> addIfNotMember set x) (Set.fromList []) perms
    perms = List.permutations nSet

main :: IO ()
main = do --inputFstLine <- getLine
          --inputSndLine <- getLine
          let nSet   = (map (toInteger) [1..8])
          --let nSet = (map (\x -> read x::Int) (["1".."8"]))
          let result = manipulativeNumbers nSet 
          putStrLn $ show result

