module Main where

import Prelude
import Control.Monad.Aff (liftEff')
import Control.Monad.Eff (Eff)
import Pux (onlyEffects, Update)

data State = State
data Action = Action

push :: forall eff. Eff eff Unit
push = pure unit

update :: forall eff. Update State (Action) eff
update Action s =
  onlyEffects s [ liftEff' push >>= (const $ pure Action) ]

main :: forall eff. Eff eff Unit
main = pure unit
