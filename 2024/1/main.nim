import strutils
import algorithm

type
  intSeq = seq[int]
  strSeq = seq[string]
  intTuple = tuple[x: int, y: int]
  intTupleSeq = seq[intTuple]

let
  input: string = readFile("InputFull.txt")

var
  lX, lY: intSeq


proc lineToSeq(line: string): void =
  var
    intX, intY: int
    splitNumbers: strSeq

  splitNumbers = line.splitWhitespace()
  
  intX = parseInt(splitNumbers[0])
  intY = parseInt(splitNumbers[1])
  
  lX.add(intX)
  lY.add(intY)


proc intSeqToTupleSeq(list1: intSeq, list2: intSeq): intTupleSeq =
  var
    lTuples: intTupleSeq
    i: int = 0

  for num in list1:
    lTuples.add((num, list2[i]))
    i = i + 1

  return lTuples


proc tupleDistance(t: tuple): int =
  return abs(t.x - t.y)


proc totalTupleSeqDistance(tupleSeq: intTupleSeq): int =
  var
    totalDistance: int = 0

  for intTuple in tupleSeq:
    totalDistance = totalDistance + tupleDistance(intTuple)

  return totalDistance


block main:
  var totalDistance: int

  for line in splitLines(input):
    if line != "":
      lineToSeq(line)

  lX.sort()
  lY.sort()

  totalDistance = totalTupleSeqDistance(intSeqToTupleSeq(lX, lY))
  
  echo "Total distance: ", totalDistance
