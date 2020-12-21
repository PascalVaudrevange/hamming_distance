-- module TestHammingDistance (main) where
import Test.HUnit
import HammingDistance


testHammingDistanceWithNoDifference :: Test
testHammingDistanceWithNoDifference = 
    TestCase $ assertEqual "A difference of 0 bit"
        0 (hammingDistance "12345" "12345")

testHammingDistanceWithOneDifference :: Test
testHammingDistanceWithOneDifference = TestCase $ assertEqual "A difference of 1 bit"
        1 (hammingDistance "12345" "02345")

testHammingDistanceWithTwoDifferences :: Test
testHammingDistanceWithTwoDifferences = TestCase $ assertEqual "A difference of 2 bits"
        2 (hammingDistance "12345" "12045")

main :: IO Counts
main = runTestTT $ TestList [testHammingDistanceWithNoDifference, testHammingDistanceWithOneDifference, testHammingDistanceWithTwoDifferences]
