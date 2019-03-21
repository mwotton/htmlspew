{-# LANGUAGE DeriveGeneric       #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE StandaloneDeriving  #-}
module Main where

import           Generic.Random
import           GHC.Generics
import           Test.QuickCheck
import           Text.Html

deriving instance Generic Html
instance Arbitrary Html where
  arbitrary = genericArbitraryRec uniform

deriving instance Generic HtmlElement
instance Arbitrary HtmlElement where
  arbitrary = genericArbitraryRec uniform

deriving instance Generic HtmlAttr
instance Arbitrary HtmlAttr where
  arbitrary = genericArbitraryRec uniform


main :: IO ()
main = do
  (h :: Html) <- generate arbitrary
  putStrLn $ renderHtml h
