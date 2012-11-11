import qualified Data.Set as Set

main :: IO ()
main = do inputFstLine <- getLine
          inputSndLine <- getLine
          let k = last (map (\x -> read x::Integer) (words inputFstLine))
          let nSet = Set.fromList (map (\x -> read x::Integer) (words inputSndLine))
          let pSet = Set.map (\x -> x - k) nSet
          let result = Set.intersection  nSet pSet
          putStrLn $ show $ Set.size result
