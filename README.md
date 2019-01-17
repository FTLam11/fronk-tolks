# We talkin' bout ~~PRACTICE?~~ TESTING?

![Allen Iverson Practice](https://media.giphy.com/media/3oEjI105rmEC22CJFK/giphy.gif)

Disclaimer: This talk concerns testing during the development of web/mobile
applications for external users. Thus, frameworks/library testing, human factors,
UX testing, etc... is out of scope.

![Rated Mature](https://d1yjjnpx0p53s8.cloudfront.net/styles/logo-thumbnail/s3/0002/7231/brand.gif)

This talk may contain coarse language and crude humor. The
intended audience is grown-ass adults and therefore content may be
unsuitable for children under 17.

## Whom does testing involve?

Potentially anyone but the user! Users gives precisely zero
fucks. Why would a user care about how well tested the application is?

![DON'T CARE](https://thumbs.gfycat.com/EdibleKaleidoscopicAsiaticlesserfreshwaterclam-size_restricted.gif)

> As a user of an application, I care that things work like they are
> supposed to.

## What problems can testing help solve?

![Elephant in the room](https://thumbs.gfycat.com/SameAnnualFallowdeer-size_restricted.gif)

* As a software agency, we help customers solve their business
  problems. Our customers compensate us with money.
* We write code to solve business problems, BUT writing code costs
  money and time. The more we write, the more money and time we spend.
* Business problems change. Thus, code must change. Change costs time
  and money. How quickly can we adapt and change our code?

In an ideal world, we would write perfect code and not care about
testing. Unfortunately, there is no easy button.

![Not so easy](http://granitegrok.com/wp-content/uploads/2013/05/not-so-easy-button.png)

There are some difficult questions to be answered!

From a **project management** perspective:

* When can an issue be closed?
* When is a feature considered complete?
* When is a project finished?

From an **engineering** perspective:

* Are we building the system right?
* Are we building the right system?

I think tests can be very helpful in answering these questions.

## In the wild

> How can I write less code? I'll skip tests! EZ MONEY.

In the real world, we have limited time and energy. When we find ourselves in
a pinch, the first thing we skip out on are tests. Why spend time
writing tests when we can write more features?

So we start shipping code with no tests. Things are progressing
decently, there are various bugs here and there but things are more or
less going according to plan. BUT THEN...

Shit hits the fan:

* The customer wants to change some business behavior.
* We misunderstood the requirements.
* The customer wants to add a new feature.

> I have a plan.
> ALL WE HAVE TO DO IS WRITE MORE CODE!!!11111
> Are you crazy?
> Maybe.

## To test or to not test?

We **DO NOT** test for the sake of testing.

> I get paid for code that works, not for tests...
[Kent Beck](https://stackoverflow.com/questions/153234/how-deep-are-your-unit-tests/153565#153565)

### Pros

Tests can help us **understand our code better**, and allow us to
**confidently change and refactor code**.

1. Give us a quick feedback loop

> To err is human...
[Alexander Pope](https://www.dictionary.com/browse/to-err-is-human--to-forgive-divine)

2. Drive the design and foster cleaner architecture

> If an object is very difficult to test, it will quickly become apparent
> that the design may need to change.

3. Define clear public interfaces

> Confidently identify stable behavior

4. Verify application conforms to specifications
   [MITRE Systems Engineeing](https://www.mitre.org/publications/systems-engineering-guide/se-lifecycle-building-blocks/test-and-evaluation/verification-and-validation)

> Did we build the system right?

> When shit goes down, we have evidence.zip

5. Serve as a safety net to guard against breaking changes

> Made a change, broke a test? Double check and fix that mess!

6. Automate complicated and long manual tests that validate application
   works as intended for users

> Did we build the right system?

7. Aid in troubleshooting production issues

> At times logging and dubugger might not suffice

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

It's ok! Let's chill out and look at some cats.

![Cute keyboard cat](https://media.giphy.com/media/rld1hYOuC7QGs/giphy.gif)
![Cat vs Shaq](https://media.giphy.com/media/nNxT5qXR02FOM/giphy.gif)
![Cat face](https://media.giphy.com/media/Md4xQfuJeTtx6/giphy.gif)

## Test writing philophy

Just like production code is bound to change, test code may also change.
It's important to treat test code with the same respect as production
code. Just like you would refactor production code, you would also
refactor test code. The catch is that we must be very selective about
what we test and how we choose to do it.

When writing tests, we must be able to quickly answer three questions:

* What is the purpose of this test? It must provide some value, otherwise
  it shouldn't be exist. No need to waste time on things that provide
  zero or negative value. We should have a greater understanding and
  confidence for having any given test.
* What type of test is this? The test type dictates how granular the
  details are, as well as different test approaches/tools we may use.
* How should this test be written? There should be consistency across
  the test codebase, with established structure and style. There should
  be **no freestyling** here.

If we can't quickly answer these, we have poorly written tests.
We must waste time/money reading and debugging tests.
