module Main where

import Prelude
import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Class (liftEff)
import Control.Monad.Eff.Exception (EXCEPTION)
import Pux (onlyEffects, Update)
import Signal.Channel (CHANNEL)

data State = State
data Action = Action

something :: forall eff. Eff (channel :: CHANNEL, err :: EXCEPTION | eff) Unit
something = pure unit

update :: forall eff. Update State (Action) eff
update Action s =
  onlyEffects s [ liftEff something >>= (const $ pure Action) ]

main :: forall eff. Eff eff Unit
main = pure unit
