let upstream =
      https://github.com/garganscript/package-sets/releases/download/v0.1.3/release.dhall
        sha256:23abbf7e1a02f15f8efe7fcfba8cd583011b4f80343b97d51d29833fb7f193cb

let overrides = {
  simple-json =
    { dependencies =
      [ "arrays"
      , "exceptions"
      , "foreign"
      , "foreign-object"
      , "nullable"
      , "prelude"
      , "record"
      , "typelevel-prelude"
      , "variant"
      ]
    , repo = "https://github.com/justinwoo/purescript-simple-json"
    , version = "v9.0.0"
    }
}

let additions = {=}

in  upstream // overrides // additions
