#!/usr/bin/env stack
-- stack --resolver lts-14.17 script

-- Copyright 2018 Google LLC. All Rights Reserved.
--
-- Licensed under the Apache License, Version 2.0 (the "License");
-- you may not use this file except in compliance with the License.
-- You may obtain a copy of the License at
--
--     http://www.apache.org/licenses/LICENSE-2.0
--
-- Unless required by applicable law or agreed to in writing, software
-- distributed under the License is distributed on an "AS IS" BASIS,
-- WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
-- See the License for the specific language governing permissions and
-- limitations under the License.

{-# LANGUAGE TupleSections #-}

import Data.Function
import Data.List
import System.Random

candidates xs =
  permutations xs
    & map (zip xs)
    & filter (not . any isSelfAssignment)
 where
  isSelfAssignment (x,y) = x == y

numPeople = 5

main = do
  let assignments = candidates [1..numPeople]
  index <- randomRIO (0, length assignments - 1)
  print (assignments !! index)
