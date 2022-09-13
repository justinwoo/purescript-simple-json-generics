module Test.Main where

import Prelude

import Data.Either (Either(..))
import Data.Generic.Rep as GR
import Data.Show.Generic (genericShow)
import Effect (Effect)
import Partial.Unsafe (unsafeCrashWith)
import Simple.JSON as JSON
import Simple.JSON.Generics as Generics
import Test.Assert (assertEqual)

data IntOrBoolean = Int Int | Boolean Boolean
data UntaggedIntOrBoolean = UntaggedInt Int | UntaggedBoolean Boolean
data MyProduct = MyProduct Int Boolean String
data Fruit = Abogado | Boat | Candy

testJSON :: forall a. JSON.ReadForeign a => Eq a => Show a => a -> String -> Effect Unit
testJSON expected json =
  case JSON.readJSON json of
    Right actual -> assertEqual { actual, expected }
    Left e -> unsafeCrashWith $ "failed on " <> json <> " with " <> show e

main :: Effect Unit
main = do
  testJSON (Int 123) """{ "type": "Int", "value": 123 }"""
  testJSON (Boolean true) """{ "type": "Boolean", "value": true }"""
  testJSON (UntaggedInt 123) "123"
  testJSON (UntaggedBoolean true) "true"
  testJSON (MyProduct 1 true "asdf") """[1,true,"asdf"]"""
  testJSON Abogado "\"Abogado\""
  testJSON Boat "\"Boat\""
  pure unit

derive instance genericIntOrBoolean :: GR.Generic IntOrBoolean _
derive instance eqIntOrBoolean :: Eq IntOrBoolean
instance showIntOrBoolean :: Show IntOrBoolean where show = genericShow
instance readForeignIntOrBoolean :: JSON.ReadForeign IntOrBoolean where readImpl = Generics.taggedSumRep

derive instance genericUntaggedIntOrBoolean :: GR.Generic UntaggedIntOrBoolean _
derive instance eqUntaggedIntOrBoolean :: Eq UntaggedIntOrBoolean
instance showUntaggedIntOrBoolean :: Show UntaggedIntOrBoolean where show = genericShow
instance readForeignUntaggedIntOrBoolean :: JSON.ReadForeign UntaggedIntOrBoolean where readImpl = Generics.untaggedSumRep

derive instance genericMyProduct :: GR.Generic MyProduct _
derive instance eqMyProduct :: Eq MyProduct
instance showMyProduct :: Show MyProduct where show = genericShow
instance readFAndeignMyProduct :: JSON.ReadForeign MyProduct where readImpl = Generics.untaggedProductRep

derive instance genericFruit :: GR.Generic Fruit _
derive instance eqFruit :: Eq Fruit
instance showFruit :: Show Fruit where show = genericShow
instance fruitReadForeign :: JSON.ReadForeign Fruit where readImpl = Generics.enumSumRep
