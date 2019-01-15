# We talkin' bout ~~PRACTICE?~~ TESTING?

![Allen Iverson Practice](https://media.giphy.com/media/3oEjI105rmEC22CJFK/giphy.gif)

Disclaimer: This talk is aimed towards the development of web/mobile
applications used by external users. Thus, testing of frameworks and
libraries is not a concern for these talks.

![Rated Mature](https://vignette.wikia.nocookie.net/logopedia/images/c/cf/TV-MA_1997.jpg/revision/latest?cb=20130727022342)

These series of talks may contain coarse or crude language. This program
is specifically designed to be viewed by adults, and therefore may be
unsuitable for children under 17.

## Whom does testing involve?

Potentially anyone but the user! Users gives precisely zero
fucks. Why would a user care about how well tested the application is?

![DON'T CARE](https://thumbs.gfycat.com/EdibleKaleidoscopicAsiaticlesserfreshwaterclam-size_restricted.gif)

> As a user of an application, I care that things work like they are
> supposed to.

## Elephant in the room

![Elephant in the room](https://thumbs.gfycat.com/SameAnnualFallowdeer-size_restricted.gif)

1. As a software agency, we help customers solve their business
   problems. Our customers compensate us with money.
2. We write code to solve business problems, BUT writing code costs
   money and time. The more we write, the more money and time we spend.
3. Business problems change. Thus, code must change. Change costs time
   and money. How quickly can we adapt and change our code?

How does a business grow and develop? By delivering equal solutions
with less resources. In an ideal world, we could ignore tests
by writing perfect code. This is impossible! If it was possible
we'd all be living off the phat of the land.

> To err is human...
[Alexander Pope](https://www.dictionary.com/browse/to-err-is-human--to-forgive-divine)

## In the wild

> How can I write less code? I'll skip tests! EZ MONEY.

In the real world, we have limited time and energy. When we find ourselves in
a pinch, the first thing we skip out on are tests. We absolutely cannot
spend time writing code that will not ship! Wait...

So we start shipping code with no tests. Things are progressing
decently, there are various bugs here and there but things are more or
less going according to plan. BUT THEN...

Shit hits the fan, like:

1. The customer wants to change some business behavior.
2. We misunderstood the requirements.
3. The customer wants to add a new feature.

> I have a plan.
> ALL WE HAVE TO DO IS WRITE MORE CODE!!!11111
> Are you crazy?
> Maybe.

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

## Test driven design

Design is hard. Write an application with shit design/no design and
eventually the cancer will become too widespread and we will no longer
be able to endure the foul smells.

> The code smells have become 2 dank.

![The rock](https://media.giphy.com/media/TT7JW4Qm7uaNW/giphy.gif)

* There is duplicated code all over the place
* Classes and/or methods have become too long
* No distinction between public and private methods
* Poor naming of classes, methods, variables
* The intent and usage is not obvious, impossible to reuse or extend
* Shotgun surgery
* Long and fragile method chains
* Nil and null pop up unexpectedly
* Comments become inaccurate
* Deeply nested conditionals

Similarly, write shit tests and feel double the pain. Yum, diarrhea.
There are different kinds of tests, and different philosophies for how
to go about it.

* Why did this test start failing?
* What the fuck does this example test?
* SWEET OUR TEST SUITE TAKES 30 MINUTES TO RUN, TIME TO WATCH SOME TV
* How did it turn out like this?

![Cute keyboard cat](https://media.giphy.com/media/rld1hYOuC7QGs/giphy.gif)
