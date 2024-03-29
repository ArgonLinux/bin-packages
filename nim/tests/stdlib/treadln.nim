
discard """
output: '''
test the improved readline handling that does not care whether its
Macintosh, Unix or Windows text format.
'''
"""

import std/syncio

# test the improved readline handling that does not care whether its
# Macintosh, Unix or Windows text format.

var
  inp: File
  line: string

if open(inp, "tests/stdlib/treadln.nim"):
  while not endOfFile(inp):
    line = readLine(inp)
    if line.len >= 2 and line[0] == '#' and line[1] == ' ':
      echo line[2..^1]
  close(inp)
