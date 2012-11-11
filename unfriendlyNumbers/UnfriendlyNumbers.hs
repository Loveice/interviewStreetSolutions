import qualified Data.Set as Set

divisors :: Integral b => b -> [b]
divisors n = (filter ((==0) . rem n) [2 .. (n `div` 2)]) ++ [n]

isDivider :: Integral a => [a] -> a -> Bool
isDivider [x] y = x `rem` y /= 0 
isDivider (x:xs) y = 
          if x `rem` y /= 0 
            then
              isDivider xs y
            else
              False 


main :: IO ()
main = do inputFstLine <- getLine
          inputSndLine <- getLine
          let friendly = last (map (\x -> read x::Integer) (words inputFstLine))
          let unfriendliesSet = Set.fromList (map (\x -> read x::Integer) (words inputSndLine))
          let divisorsList = divisors friendly
          let unfriendlies = Set.toList unfriendliesSet
          let result = map (isDivider unfriendlies) divisorsList
          putStrLn $ show $ length (filter (==True) result)
