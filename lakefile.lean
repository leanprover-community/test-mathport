import Lake.Package

open Lake System

def package : Lake.PackageConfig := {
  name := "testdep"
  dependencies := [
    { name := "liquidbin", src := Lake.Source.path (FilePath.mk "./Lib4/liquidbin") }
  ]
}
