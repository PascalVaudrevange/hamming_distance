module Main where

import Codec.Binary.UTF8.String (encode, decode)
import HammingDistance (hammingDistance, findNearestNeighbour)
import RandomStrings (randomStrings)
import System.Environment (getArgs)


main2 :: IO ()
main2 = do 
    (arg1:(arg2:args)) <- getArgs
    print (hammingDistance (encode arg1) (encode arg2))



main :: IO()
main = do
    print result
    where
        nHashes = 5000
        nLookups = 100
        hashLength = 32
        hashes = map encode (randomStrings hashLength nHashes)
        lookups = map encode (randomStrings hashLength nLookups)
        result = map (findNearestNeighbour hashes) lookups
