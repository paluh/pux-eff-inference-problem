module Main where

import Prelude
import Control.Monad.Aff (liftEff')
import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Console (CONSOLE, log)
import DOM (DOM)
import Pux (onlyEffects, Update)

foreign import push :: forall eff. String -> Eff (dom :: DOM | eff) Unit

data State = State
data Action = Action

update :: forall eff. Update State (Action) (dom :: DOM | eff)
update Action s =
  onlyEffects s [ liftEff' (push "/url") >>= (const $ pure Action) ]

