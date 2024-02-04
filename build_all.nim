import std/[os, osproc, strutils], libarpm/io

proc build*(dir: string) =
  if fileExists(dir / ".git"):
    removeFile(dir / ".git") # otherwise, shit hits the fan

  let res = execCmd("sh " & dir & "/build.sh")

  if res != 0:
    error("Failed to build package: " & dir & ": non-zero exit code returned: " & $res, true)

proc main* = 
  var num: int
  if paramCount() < 1:
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
  else:
    var i = 0

    while i < paramCount():
      inc i
      build(paramStr(i))

    num = i

  info "Successfully built #" & $num & " package(s)!"

when isMainModule:
  main()
