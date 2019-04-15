# fronk-talks

Collection of talks given by `self`.

## We talkin' bout ~~PRACTICE?~~ TESTING?
[README link](we-talkin-bout-testing.md)

1. Why we should care about testing
2. How testing can influence design
3. Brief overview of what software testing is

## Ruby Class Definitions
[Specs link](https://github.com/FTLam11/fronk-talks/tree/master/spec)

Learn about Ruby classes via tests. A couple matters to note:

* Production code is all inlined for the sake of convenience and to
  encourage reading through it
* Specs are intentionally not being run in random order, there are some
  interesting things at play with scope and monkey patching

### Setup

1. `bundle`
2. `rspec`

### Method lookup

object's singleton class -> prepended modules of object's class -> object's class
-> included modules of object's class -> singleton class of object's
superclass -> prepended modules of object's superclass -> object's
superclass -> included modules of object's superclass -> etc...

### Shocking truths

* The superclass of the singleton class of an object is the object’s
  class. The superclass of the singleton class of a class is the
  singleton class of the class’s superclass.
* Class methods are singleton methods that reside in a class's singleton
  class

## Simple Vue JS Workshop: Building Tic-tac-toe

Short and sour intro to one of those JS framework thangs. Lot of room to
extend functionality like keeping score, automatically managing turns,
creating arbitrarily sized boards, move history, etc...

[README link](vue-workshop.md)
