I've this simple [example](https://github.com/paluh/pux-eff-inference-problem) Pux app which fails to compile (`pulp build``):


```purescript
foreign import push :: forall eff. String -> Eff (dom :: DOM | eff) Unit

data State = State
data Action = Action

update :: forall eff. Update State (Action) (dom :: DOM | eff)
update Action s =
  onlyEffects s [ liftEff' (push "/url") >>= (const $ pure Action) ]
```


I'm getting this error:

    Label err appears more than once in a row type.
    Relevant expression:

      push "/url"


I'm using:

```
$ cat bower.json
  ...
  "dependencies": {
    "purescript-pux": "5.0.3"
  },
  ...
```

and

```sh
$ pulp --version

Pulp version 9.0.1
psc version 0.9.3 using /home/paluh/.local/bin/psc
```

What I'm doing wrong? How to fix this problem?
