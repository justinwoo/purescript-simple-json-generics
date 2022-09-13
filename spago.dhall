{ sources = [ "src/**/*.purs", "test/**/*.purs" ]
, name = "simple-json-generics"
, dependencies =
    [ "assert"  -- test
    , "control"
    , "effect"
    , "either"
    , "foreign"
     --, "generics-rep"
     , "partial"
     , "prelude"
    , "simple-json"
    , "transformers"
    , "typelevel-prelude"
    ]
, packages = ./packages.dhall
}
