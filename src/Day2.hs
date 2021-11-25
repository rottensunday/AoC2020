module Day2 where

import Data.List
import Data.Maybe (fromMaybe)
import qualified Data.Text as T
import FileAccess

data PasswordPolicy = PasswordPolicy { minOcc :: Int
                                     , maxOcc :: Int
                                     , letter :: Char
                                     , password :: String
                                     }

policies = do
  lines <- readLines "resources/Day2Input.txt"
  return 5
  where parseLine :: String -> PasswordPolicy