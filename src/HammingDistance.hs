module HammingDistance (
    hammingDistance,
    hammingDistanceOnCharacterLevel
) where

import Data.Bits (xor, popCount)
import Codec.Binary.UTF8.String (encode)
import GHC.Word (Word8)

numberOfDifferingBits :: Word8 -> Word8 -> Int
numberOfDifferingBits x y = popCount (xor x y)

hammingDistance :: String -> String -> Int
hammingDistance x y 
    | (length x) == (length y) = sum(zipWith (numberOfDifferingBits) (encode x) (encode y))
    | otherwise                = error "Strings are not of equal length"