# We talkin' bout ~~PRACTICE?~~ TESTING?

![Allen Iverson Practice](https://media.giphy.com/media/3oEjI105rmEC22CJFK/giphy.gif)

Disclaimer: This talk concerns testing during the development of web/mobile
applications for external users. Thus, frameworks/library testing, human factors,
UX testing, subject testing, etc... is out of scope.

# Agenda (How things will hopefully go)

1. Yo, I care not about testing
2. Bruh, testing is lame
3. I wanna join the test party
4. Show me your testing strats
5. Wrap it up

# 1. We should care about testing(?)

## Exercise 1: Why test?

### The quick and dirty

Testing comes in many different flavors and applications:

* Developmental Testing vs Operational Testing ([Defense Acquisition University](https://www.dau.mil/guidebooks/Shared%20Documents/Chapter%208%20Test%20and%20Evaluation.pdf))
* Unit Tests/Integration Tests/Acceptance Tests ([Testing Pyramid](https://martinfowler.com/articles/practical-test-pyramid.html))
* Classical (Detroit) vs Mockist (London) ([Test Double Wiki](https://github.com/testdouble/contributing-tests/wiki/Test-Driven-Development))
* TDD/BDD/RDD ([Ruby Conf 2013 REPL Driven Development](https://www.youtube.com/watch?v=D9j_Mf91M0I))

People often have very strong opinions about what they believe is right
and how to go about testing. You might be surprised how sensitive and
passionate people can get when discussing testing. Much drama and many
pissing contests have occurred in the past and will continue to happen.
Regardless of how testing is executed, from a practical standpoint
testing addresses **two very important questions for developing systems**.

> Are we building the *right* system? (Performance)

> Are we building the system *right*? (Behavior/Implementation)

### What problems can testing help solve?

![Elephant in the room](https://thumbs.gfycat.com/SameAnnualFallowdeer-size_restricted.gif)

* As a software agency, we help customers solve their business
  problems. Our customers compensate us with money.
* We write code to solve business problems, BUT writing code costs
  money and time. The more we write, the more money and time we spend.
* Business problems change. Thus, code must change. Change costs time
  and money. How quickly can we adapt and change our code?

In an ideal world, we would write perfect code and not care about
testing. Business problems would also never change, so we would just
write the code once and never change it again. Unfortunately, we live in
the real world and there is no easy button.

![Not so easy](http://granitegrok.com/wp-content/uploads/2013/05/not-so-easy-button.png)

There are some difficult questions to be answered!

From a **project management** perspective:

* When can an issue be closed?
* How to determine if a feature is complete?
* Will the project be delivered on time?
* Will the project be delivered within budget?
* Will the project perform as promised?

From an **engineering** perspective:

* Are we building the system *right*?
* Are we building the *right* system?

I think tests can be very helpful in answering these questions.

## Exercise 2: We become role players and cosplayers

# 2. Bruh, testing is for fools

### But you just told me writing more code is expensive...

> How can I write less code? I'll skip tests! EZ MONEY.

In the real world, we have limited time and energy. When we find ourselves in
a pinch, the first thing we skip out on are tests. Why spend time
writing tests when we can write more features?

So we start shipping code with no tests. Things are progressing
decently, there are various bugs here and there but things are more or
less going according to plan. However, *requirements will change*.

* The customer did not know what they wanted.
* The customer did not correctly express what they wanted/we misunderstood the requirements.
* The customer wants to change some business logic.
* The customer wants to add a new feature.

Which leads to thoughts and reactions such as:

> Yes, I can add that feature, but it will break everything.

> No, I can’t add that feature; it wasn’t designed to do that.

> **crying sounds**

```
rm -rf path_to_project_from_hell
```

### Common testing misconceptions

![Mythbusters](https://media.giphy.com/media/NLTrXfORPlcJ2/giphy.gif)

1. The ninja programmer

![TMNT](https://media.giphy.com/media/ZQdBX1H2ki3Cg/giphy.gif)

> I've written this feature before, I don't need to write tests for
> this. It'll be easy-peasy lemon squeezy.

No two problems are the same, there are always exceptions. When Apple
releases a new phone or a civil engineer develops a bridge, is this logic
rational at all?

2. The lazy programmer

![Homer Simpson](https://media.giphy.com/media/Zk9mW5OmXTz9e/giphy.gif)

> Sigh, I have to write twice the amount of code!? This is not my job,
> I'll let QA/QC do the testing.

But **it is** your job. You are responsible for not only writing the
code, more importantly you are responsible for the code working
correctly. Lines of code by itself is not a good metric at all.
Pushing all testing responsibility to a single person/team also sounds
like an awful idea.

3. The stressed-out project manager

![Stressed out](https://media.giphy.com/media/PLHnMUOaOuuMblCelJ/giphy.gif)

> I can't afford any more schedule delays!

Indeed there is an upfront cost with writing tests, however a good testing
strategy pays off in the long run for many reasons that will be explained soon...

> Slow and steady wins the race.

4. The testaholic

![Test Dummies](https://media.giphy.com/media/5xrkJe3IJKSze/giphy.gif)

> We MUST have 100% code coverage. We MUST test real usage scenarios.

Some people may become obsessed with different test metrics at the
expense of all other things. End-to-end tests (testing with real objects
and scenarios) are very complex, expensive, and time-consuming. There
should be emphasis on gaining acceptable confidence and understanding to
change code instead of some arbitrary test metric.

5. The ~~overworked sad~~ programmer

![Bugs don't stop](https://media.giphy.com/media/11ZSwQNWba4YF2/source.gif)

> I don't write tests, does that make me a bad programmer?

Probably not? I'm guessing the majority of programmers don't spend
time writing automated tests. Even if you aren't writing them, you
are likely doing testing in some manner (manually verifying data and
behavior).

The truth is testing well is difficult, because it is not just
about writing and running tests, testing is also about design. Design well is
**really fucking** hard. Adopting a test driven workflow has a high learning
curve, and takes time to turn into a habit. No one has time for that!?

Have faith! Believe in yourself, you can do it!

![KG](https://media.giphy.com/media/iWeUG9ywcgB8Y/giphy-downsized.gif)

# 3. You're invited to the test pow wow

### Deep thoughts

We **DO NOT** test for the sake of testing.

> I get paid for code that works, not for tests...
[Kent Beck](https://stackoverflow.com/questions/153234/how-deep-are-your-unit-tests/153565#153565)

Let us first revisit Exercise 1: Why test?

### Please enlighten!

> Are we building the *right* system? (Performance)

Tests help us **understand and communicate requirements better**,
**reduce the costs of change**, and **demonstrate how the system performs
in real situations**.

> Are we building the system *right*? (Behavior/Implementation)

Tests help us **understand our code better**, **inform of better
design**, and allow us to **confidently change and refactor code**.
Tests will:

1. Give us a quick feedback loop

Two heads are better than one, tests can serve as another set of eyes
watching over our code (especially helpful for dynamically-typed
languages).

> To err is human...
[Alexander Pope](https://www.dictionary.com/browse/to-err-is-human--to-forgive-divine)

2. Drive the design and foster cleaner architecture

Test Driven Development can help us find the necessary abstractions via
programming by wishful thinking. We can breakdown large complex problems
into smaller and more manageable chunks. When we experience excessive
pain trying to test something, the tests will raise suspicion on
questionable design.

> If an object is very difficult to test, it will quickly become apparent
> that the design may need to change.

3. Define clear public interfaces

It becomes much easier to see how objects interact with each other.

> Confidently identify stable behavior

4. Verify application conforms to specifications
   [MITRE Systems Engineeing](https://www.mitre.org/publications/systems-engineering-guide/se-lifecycle-building-blocks/test-and-evaluation/verification-and-validation)

> When shit goes down, we have evidence.zip

5. Serve as a safety net to guard against breaking changes

> Made a change, broke a test? Double check and fix that mess!

6. Automate complicated and long manual tests that validate application
   works as intended for users

If I have to fill out another goddamn form...

7. Aid in troubleshooting production issues

> At times logging, dubugger, and exception notifications might not suffice

# 4. Super ~~secret~~ testing strats

### Test writing philosophy

Just like production code is bound to change, test code may also change.
It's important to treat test code with the same respect as production
code. Just like you would refactor production code, you would also
refactor test code. The catch is that we must be very selective about
what we test and how we choose to do it.

When writing tests, we must be able to quickly answer three questions:

1. **What is the purpose of this test?** It must provide some value, otherwise
   it shouldn't be exist. No need to waste time on things that provide
   zero or negative value. Each test we keep must provide us greater
   understanding and confidence.
2. **What type of test is this?** The test type dictates how granular the
   details are, as well as different test approaches/tools we may use.
3. **How should this test be written?** There should be consistency across
   the test codebase, with established structure and style. There should
   be **no freestyling** here.

If we can't quickly answer these, we have poorly written tests. This
likely means we must waste time/money reading and debugging tests while
developing and when things fail.

### Test Hierarchy

![Test Pyramid](https://martinfowler.com/bliki/images/testPyramid/test-pyramid.png)

Tests should fall into one of three buckets (ordered by quantity from
most to least):

1. Unit Tests
2. Integration Tests
3. Acceptance Tests

Each of these buckets have tradeoffs between:

* Feedback speed
* Build time
* Fake vs real

#### Unit Tests

#### Integration Tests

#### Acceptance Tests

# We talkin' bout ~~PRACTICE?~~ ~~TESTING~~ DESIGN?

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
* SWEET OUR TEST SUITE TAKES 30 MINUTES TO RUN, TIME TO WATCH SOME TV.
* How did it turn out like this?

It's ok! Let's chill out and look at some cats.

![Cute keyboard cat](https://media.giphy.com/media/rld1hYOuC7QGs/giphy.gif)
![Cat vs Shaq](https://media.giphy.com/media/nNxT5qXR02FOM/giphy.gif)
![Cat face](https://media.giphy.com/media/Md4xQfuJeTtx6/giphy.gif)

## Exercise 3: Searls-Briggs Indicator

Check out the [RailsConf 2017 Keynote](https://youtu.be/V4fnzHxHXMI), it's a fun
twist on the Myers Briggs Indicator Test.

* Sensitive VS Fearless
  * I prefer hearing all requirements up front, even if I can't tackle
    them all right away.
  * Adding to a long function feels like more code won't "fit".
  * I look forward to being assigned to new projects and teams.
  * I often feel paralyzed while staring at a blank editor screen.
* Inventive VS Aesthetic
  * It's more important to build the right thing than to build the thing
    right.
  * I love experimenting with new tools, frameworks, and build systems.
  * I strive to write visually appealing code, down to syntax &
    symmetry.
  * It's boring when all the code in a project is structured similarly.
* Naive VS Leery
  * Publishing metrics (e.g. code coverage) is always a good idea.
  * Writing good commit messages today will pay off in the future.
  * Software teams will make smarter use of time under pressure.
  * Software is generally improving over time and we're not doomed.
* Economical VS Thorough
  * Better to ship code quickly than wait until everything's tested.
  * Design principles are useful, but most teams waste too much time on
    them.
  * Most teams lack sufficient understanding of their dependencies.
  * It's okay for everyone on a team to maintain separate coding styles.

# 5. Wu-Tang Clan Ain't Nuthing ta F' Wit (wRAP up)

Today we were primarily concerned with answering two questions:

> Are we building the *right* system? (Performance)

> Are we building the system *right*? (Behavior/Implementation)

![CRUD](http://docs.railsbridge.org/job-board/img/crud_grid.jpg)

We must accept that change is inevitable. Done well, testing can allow
us to change, refactor, understand, and design our code better.

Change
Refactor
Understand
Design
