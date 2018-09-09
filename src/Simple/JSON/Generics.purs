module Simple.JSON.Generics
  ( module Exported
  ) where

import Simple.JSON.Generics.TaggedSumRep (class GenericTaggedSumRep, genericTaggedSumRep, taggedSumRep) as Exported
import Simple.JSON.Generics.UntaggedSumRep (class GenericUntaggedSumRep, genericUntaggedSumRep, untaggedSumRep) as Exported
import Simple.JSON.Generics.EnumSumRep (class GenericEnumSumRep, enumSumRep, genericEnumReadForeign) as Exported
import Simple.JSON.Generics.UntaggedProductRep (class GenericUntaggedProductRep, genericUntaggedProductRep, untaggedProductRep) as Exported
