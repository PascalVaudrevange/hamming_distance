import Test.HUnit
import HammingDistance (hammingDistanceString, findNearestNeighbourString)


testHammingDistanceWithNoDifference :: Test
testHammingDistanceWithNoDifference = 
    TestCase $ assertEqual "A difference of 0 bit"
        0 (hammingDistanceString "12345" "12345")

testHammingDistanceWithOneDifference :: Test
testHammingDistanceWithOneDifference = TestCase $ assertEqual "A difference of 1 bit"
        1 (hammingDistanceString "12345" "02345")

testHammingDistanceWithTwoDifferences :: Test
testHammingDistanceWithTwoDifferences = TestCase $ assertEqual "A difference of 2 bits"
        2 (hammingDistanceString "12345" "12045")


testFindNearestNeighbour :: Test
testFindNearestNeighbour = TestCase $ assertEqual "finding the correct next neighbor if element in list"
        "12345" (findNearestNeighbourString ["01234", "12345", "23456"] "12345")

testFindNearestNeighbour2 :: Test
testFindNearestNeighbour2 = TestCase $ assertEqual "finding the correct next neighbor if element not in list"
        "02345" (findNearestNeighbourString ["01234", "02345", "23456"] "12345")


main :: IO Counts
main = runTestTT $ TestList [
    testHammingDistanceWithNoDifference
    , testHammingDistanceWithOneDifference 
    , testHammingDistanceWithTwoDifferences
    , testFindNearestNeighbour
    , testFindNearestNeighbour2]
