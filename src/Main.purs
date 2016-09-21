module Main where

import Prelude
import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Class (liftEff)
import Control.Monad.Eff.Exception (EXCEPTION)
import Pux (onlyEffects, Update)
import Signal.Channel (CHANNEL)

data State = State
data Action = Action

push :: forall eff. Eff (channel :: CHANNEL, err :: EXCEPTION | eff) Unit
push = pure unit

update :: forall eff. Update State (Action) eff
update Action s =
  onlyEffects s [ liftEff push >>= (const $ pure Action) ]

main :: forall eff. Eff eff Unit
main = pure unit
