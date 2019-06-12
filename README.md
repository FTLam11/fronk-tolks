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
[README link](vue-workshop.md)

Short and sour intro to one of those JS framework thangs. Lot of room to
extend functionality like keeping score, automatically managing turns,
creating arbitrarily sized boards, move history, etc...

## Live TDD Demo #1: Twelve Days of Christmas

Inspired by [99 Bottles of OOP](https://www.sandimetz.com/99bottles),
working through outputting the lyrics of a Christmas song classic.

[SPEC
link](https://github.com/FTLam11/fronk-tolks/blob/master/spec/05_xmas_spec.rb)

## We embark on the path towards enlightnment by way of test
[README link](test-tools-plus-walkthrough.md)

1. Review of Test Hierarchy, test writing conventions
2. Introduce variety of test libraries + tools
3. Describe an ideal development workflow w/ testing
4. Show examples of different test types
5. Reimplement a class purely based on tests
