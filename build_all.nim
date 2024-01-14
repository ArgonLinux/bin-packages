import std/[os, osproc, strutils], libarpm/io

proc build*(dir: string) =
  let res = execCmd("sh " & dir & "/build.sh")

  if res != 0:
    error("Failed to build package: " & dir & ": non-zero exit code returned: " & $res, true)

proc main* = 
  var num: int
  for k, p in walkDir(getCurrentDir()):
    var skip = false
    for forbid in ["gen-bin", ".git"]:
      if forbid in p:
        skip = true

    if skip: continue

    if k == pcDir:
      inc num
      info "Building package: " & p
      build p

  info "Successfully built #" & $num & " package(s)!"

when isMainModule:
  main()
