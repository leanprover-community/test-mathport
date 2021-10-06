import Lake

open Lake DSL System

package testdep {
  dependencies := #[
    { name := "liquidbin", src := Lake.Source.path (FilePath.mk "./Lib4/liquidbin") }
  ]
}
