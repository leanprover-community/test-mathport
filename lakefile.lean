import Lake.Package

open Lake System

def package : Lake.PackageConfig := {
  name := "TestMathbin"
  dependencies := [
    { name := "mathbin", src := Lake.Source.path (FilePath.mk "Lib4/Mathbin") }
  ]
}