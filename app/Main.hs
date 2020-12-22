module Main where

import HammingDistance (hammingDistance, findNearestNeighbour)
import RandomStrings (randomStrings)
import System.Environment (getArgs)


main2 :: IO ()
main2 = do 
    (arg1:(arg2:args)) <- getArgs
    print (hammingDistance arg1 arg2)



main :: IO()
main = do
    print result
    where
        nHashes = 5000
        nLookups = 100
        hashLength = 32
        hashes = randomStrings hashLength nHashes
        lookups = randomStrings hashLength nLookups
        result = map (findNearestNeighbour hashes) lookups
