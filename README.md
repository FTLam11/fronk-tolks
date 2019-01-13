# We talkin' bout ~~PRACTICE?~~ TESTING?

[Allen Iverson](https://media.giphy.com/media/3oEjI105rmEC22CJFK/giphy.gif)

Disclaimer: This talk is aimed towards the development of web/mobile
applications used by external users. Thus, testing of frameworks and
libraries is not a concern for these talks.

These series of talks may contain coarse or crude language. This program
is specifically designed to be viewed by adults, and therefore may be
unsuitable for children under 17.

## Whom does testing involve?

Potentially anyone but the user! Users gives precisely zero
fucks. Why would a user care about how well tested the application is?

> As a user of an application, I care that things work like they are
> supposed to.

## Elephant in the room

1. As a software agency, we help customers solve their business
   problems. Our customers compensate us with money.
2. We write code to solve business problems, BUT writing code costs
   money and time. The more we write, the more money and time we spend.
3. Business problems change. Thus, code must change. Change costs time
   and money. How quickly can we adapt and change our code?

How does a business grow and develop? By delivering solutions
with as less resources. In an ideal world, we could ignore tests
by writing perfect code. This is impossible! If it was possible
we'd all be living off the phat of the land.

## Why should we test?

We **DO NOT** test for the sake of testing.

> I get paid for code that works, not for tests...
[Kent Beck](https://stackoverflow.com/questions/153234/how-deep-are-your-unit-tests/153565#153565)

### Confidence

* Verify application conforms to specifications
  [MITRE Systems Engineeing](https://www.mitre.org/publications/systems-engineering-guide/se-lifecycle-building-blocks/test-and-evaluation/verification-and-validation)
* Safeguard usage of third-party functionality
* Safely change and refactor

### Understanding

* Document behavior of our code base
* Validate application works as intended for users
* Author easy to use and maintainable public API
