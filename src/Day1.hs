module Day1 where

import Data.List 
import FileAccess
import qualified Data.Text as T
import Data.Maybe (fromMaybe)

findSumTo2 :: Int -> [Int] -> Maybe (Int, Int)
findSumTo2 _ [] = Nothing
findSumTo2 val (x : xs) = case find (\y -> y + x == val) xs of
  Nothing -> findSumTo2 val xs
  Just res -> Just (x, res)

findSumTo3 :: Int -> [Int] -> (Int, Int, Int)
findSumTo3 _ [] = (0, 0, 0)
findSumTo3 val (x : xs) = case findSumTo2 (val - x) xs of
  Nothing -> findSumTo3 val xs
  Just (y, y') -> (x, y, y')

inputs = (fmap . fmap) ((read :: String -> Int) . T.unpack) (readLines "resources/Day1Input.txt")

day1Task1 :: IO Int
day1Task1 = do
  inputs <- inputs
  return $ let (x, y) = fromMaybe (0, 0) (findSumTo2 2020 inputs) in x * y

day1Task2 :: IO Int 
day1Task2 = do
  inputs <- inputs
  return $ let (x, y, z) = findSumTo3 2020 inputs in x * y * z