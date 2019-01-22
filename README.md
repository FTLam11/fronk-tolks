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
![Kent Beck](https://stackoverflow.com/questions/153234/how-deep-are-your-unit-tests/153565#153565)

### Fuck NO! Common testing misconceptions

![Mythbusters](https://media.giphy.com/media/NLTrXfORPlcJ2/giphy.gif)

1. The ninja programmer

![TMNT](https://media.giphy.com/media/ZQdBX1H2ki3Cg/giphy.gif)

> I've written this feature before, I don't need to write tests for
> this. It'll be easy-peasy lemon squeezy.

No two problems are the same, there are always exceptions. When Apple
releases a new phone or a civil engineer builds a bridge, is this logic
rational at all?

2. The lazy programmer

![Homer Simpson](https://media.giphy.com/media/Zk9mW5OmXTz9e/giphy.gif)

> Sigh, I have to write twice the amount of code!? This is not my job,
> I'll let QA/QC do the testing.

Lines of code is not a good metric at all. Pushing all testing responsibility
to a single person/team sounds like an awful idea.
[The Twelve-factor App](https://12factor.net/)

3. The stressed-out project manager

![Stressed out](https://media.giphy.com/media/l3dj0GFYLf0z7WSCQ/source.mp4)

> I can't afford any more schedule delays!

Indeed there is an upfront cost with writing tests, however a good testing
strategy pays off in the long run for many reasons that will be explained soon...

4. The testaholic

![Test Dummies](https://media.giphy.com/media/5xrkJe3IJKSze/giphy.gif)

> We MUST have 100% code coverage.

Some people may become obsessed with different test metrics at the
expense of all other things. End-to-end tests are very complex,
expensive, and time-consuming.

5. The overworked sad programmer

![Bugs don't stop](https://media.giphy.com/media/11ZSwQNWba4YF2/source.gif)

> I don't write tests, does that make me a bad programmer?

Absolutely not. I'm guessing the majority of programmers don't spend
anytime writing automated tests. Even if you aren't writing them, you
are likely doing testing in some format (manual testing). Writing tests
well is difficult, and is a legitimate sacrifice when schedule does not
make it feasible.

### Fuck yeah! Let's test~

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

## Test writing philosophy

Just like production code is bound to change, test code may also change.
It's important to treat test code with the same respect as production
code. Just like you would refactor production code, you would also
refactor test code. The catch is that we must be very selective about
what we test and how we choose to do it.

When writing tests, we must be able to quickly answer three questions:

1. **What is the purpose of this test?** It must provide some value, otherwise
   it shouldn't be exist. No need to waste time on things that provide
   zero or negative value. We should have a greater understanding and
   confidence for having any given test.
2. **What type of test is this?** The test type dictates how granular the
   details are, as well as different test approaches/tools we may use.
3. **How should this test be written?** There should be consistency across
   the test codebase, with established structure and style. There should
   be **no freestyling** here.

If we can't quickly answer these, we have poorly written tests. This
likely means we must waste time/money reading and debugging tests when
things fail.

## Conclusion (with a catchy acronym)

![CRUD](http://docs.railsbridge.org/job-board/img/crud_grid.jpg)

We must accept that change is inevitable. Done well, testing can allow
us to change, refactor, understand, and design our code better.

Change
Refactor
Understand
Design
