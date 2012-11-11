{-# LANGUAGE ScopedTypeVariables #-}

import Criterion.Main
import ManipulativeNumbers hiding (main)

nSet5   = (map (toInteger) [1..5])
nSet8   = (map (toInteger) [1..8])
nSet9   = (map (toInteger) [1..9])
nSet10  = (map (toInteger) [1..10])
nSet25  = (map (toInteger) [1..25])
nSet50  = (map (toInteger) [1..50])
nSet100 = (map (toInteger) [1..100])

main = defaultMain [
        bgroup "t5"   [ bench "manipulativeNumbers 5"   $ whnf manipulativeNumbers nSet5],
        bgroup "t8"   [ bench "manipulativeNumbers 8"   $ whnf manipulativeNumbers nSet8],
        bgroup "t9"   [ bench "manipulativeNumbers 9"   $ whnf manipulativeNumbers nSet9]
        --bgroup "t10"  [ bench "manipulativeNumbers 10"  $ whnf manipulativeNumbers nSet10]
        --bgroup "medium" [ bench "manipulativeNumbers 50"  $ whnf manipulativeNumbers nSet50],
        --bgroup "large"  [ bench "manipulativeNumbers 100" $ whnf manipulativeNumbers nSet100]
       ]
