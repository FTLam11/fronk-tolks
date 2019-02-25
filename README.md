---

# We talkin' bout ~~PRACTICE?~~ TESTING?
## Frank Lam

![Allen Iverson Practice](https://media.giphy.com/media/3oEjI105rmEC22CJFK/giphy.gif)

What up AI?

---

# Scope

Disclaimer: This talk concerns testing during the development of web/mobile
applications for external users. Thus, frameworks/library testing, human factors,
UX testing, subject testing, manual testing, etc... are out of scope.

The topics for this talk are:

1. Why we should care about testing
2. How it can influence design
3. Brief overview of what software testing is

We won't be discussing how to actually do testing. That is talk for
another day.

---

# Let the brainwashing commence

1. Yo, I care not about testing
2. Bruh, testing is lame
3. I wanna join the test party
4. Show me your testing strats
5. Wrap it up

---

# 1. We should care about testing(?)

## Exercise 1: Why test?

* What are some things we hope to gain through testing?
* Why should we bother to test?

HINT: We **DO NOT** test for the sake of testing.

> I get paid for code that works, not for tests...
[Kent Beck](https://stackoverflow.com/questions/153234/how-deep-are-your-unit-tests/153565#153565)

---

# The quick and dirty intro
## Testing is like ice cream and pizza

* Developmental Testing vs Operational Testing ([Defense Acquisition University](https://www.dau.mil/guidebooks/Shared%20Documents/Chapter%208%20Test%20and%20Evaluation.pdf))
* Unit Tests/Integration Tests/Acceptance Tests ([Testing Pyramid](https://martinfowler.com/articles/practical-test-pyramid.html))
* Classical (Detroit) vs Mockist (London) ([Test Double Wiki](https://github.com/testdouble/contributing-tests/wiki/Test-Driven-Development))
* TDD/BDD/RDD ([Ruby Conf 2013 REPL Driven Development](https://www.youtube.com/watch?v=D9j_Mf91M0I))

---

# Testing answers two questions

People often have very strong opinions about what they believe is right
and how to go about testing. You might be surprised how sensitive and
passionate people can get about testing. Regardless of how testing is
executed, from a practical standpoint testing addresses **two very
important questions for developing systems**.

* Are we building the *right* system? (Performance)
* Are we building the system *right*? (Behavior/Implementation)

---

# Running a business

* As a software agency, we help customers solve their business
  problems. Our customers compensate us with money.
* We write code to solve business problems, BUT writing code costs
  money and time. The more we write, the more money and time we spend.
* Business problems change. Thus, code must change. Change costs time
  and money. How quickly can we adapt and change our code?

Can testing help us run our business better?

![Elephant in the room](https://thumbs.gfycat.com/SameAnnualFallowdeer-size_restricted.gif)

---

# In practice

From a **project management** perspective:

* When can an issue be closed?
* How to determine if a feature is complete?
* Will the project be delivered on time?
* Will the project be delivered within budget?
* Will the project perform as promised?

{.column}

From an **engineering** perspective:

* Are we building the system *right*?
* Are we building the *right* system?

Maybe tests can help answer these questions?

---

# 2. Bruh, testing is for fools
## Since writing code is expensive... I'll skip tests!

![2EZ](http://granitegrok.com/wp-content/uploads/2013/05/not-so-easy-button.png)

EZ

---

# I wanna live in Imaginaryland

In an ideal world, we would write perfect code and not care about
testing. Business rules would also be static, so we would just
write the code once and never change it again.

![Drake meme](https://i.imgflip.com/2ubesp.jpg)

---

# WELCOME TO THE REAL WORLD

In the real world, we have limited time and energy. When we find ourselves in
a pinch, the first thing we skip out on are tests. Why spend time
writing tests when we can write more features? Tests are getting in the
way of us writing more features!

![Think twice](https://i.imgflip.com/2ubfbg.jpg)

---

# OH NO
## The unthinkable happens

* The customer did not know what they wanted.
* The customer did not correctly express what they wanted/we misunderstood the requirements.
* The customer wants to change some business logic.
* The customer wants to add a new feature.

---

# We become emotional
## Which leads to thoughts and reactions such as:

> Yes, I can add that feature, but it will break everything.

> No, I can’t add that feature; it wasn’t designed to do that.

> Trust me! This is not what you want!

> **crying sounds**

```
rm -rf path_to_project_from_hell
```

---

# Common testing misconceptions
## Mythbuster time!

![Mythbusters](https://media.giphy.com/media/NLTrXfORPlcJ2/giphy.gif)

Myth busted!

---

# 1. The ninja programmer

![TMNT](https://media.giphy.com/media/ZQdBX1H2ki3Cg/giphy.gif)

> I've written this feature before, I don't need to write tests for
> this. It'll be easy-peasy lemon squeezy.

No two problems are the same, there are always exceptions. When Apple
releases a new phone or a civil engineer develops a bridge, is this logic
rational at all?

---

# 2. The lazy programmer

![Homer Simpson](https://media.giphy.com/media/Zk9mW5OmXTz9e/giphy.gif)

> Sigh, I have to write twice the amount of code!? This is not my job,
> I'll let QA/QC do the testing.

But **it is** your job. You are responsible for writing *working* code.
Lines of code by itself is not a good metric at all. Pushing all testing
responsibility to a single person/team also sounds like an awful idea.

---

# 3. The stressed-out project manager

![Stressed out](https://media.giphy.com/media/PLHnMUOaOuuMblCelJ/giphy.gif)

> I can't afford any more schedule delays!

Indeed there is an upfront cost with writing tests, however a good testing
strategy pays off in the long run for many reasons that will be explained soon...

> Slow and steady wins the race.

---

# 4. The testaholic

![Test Dummies](https://media.giphy.com/media/5xrkJe3IJKSze/giphy.gif)

> We MUST have 100% code coverage. We MUST test real usage scenarios.

Some people may become obsessed with different test metrics at the
expense of all other things. End-to-end tests (testing with real objects
and scenarios) are very complex, expensive, and time-consuming. There
should be emphasis on gaining acceptable confidence and understanding to
change code instead of some arbitrary test metric.

---

# 5. The ~~sad~~ programmer

![Bugs don't stop](https://media.giphy.com/media/11ZSwQNWba4YF2/source.gif)

> I don't write tests, does that make me a bad programmer?

Nah? I'm guessing the majority of programmers don't spend
time writing automated tests. Even if you aren't writing them, you
are likely doing testing in some manner (manually verifying data and
behavior).

---

# The cold hard truth

The truth is testing well is difficult, because it is not just
about writing and running tests, testing is also about design. Designing well is
**really fucking** hard. Adopting a test driven workflow has a high learning
curve, and takes time to turn into a habit. No one has time for that!?

Have faith! Believe in yourself, you can do it!

![KG](https://media.giphy.com/media/iWeUG9ywcgB8Y/giphy-downsized.gif)

---

# 3. You're invited to the test pow wow
## Exercise 2: Searls-Briggs Indicator

Check out the [RailsConf 2017 Keynote](https://youtu.be/V4fnzHxHXMI), it's a fun
twist on the [Myers-Briggs Indicator Test](https://en.wikipedia.org/wiki/Myers%E2%80%93Briggs_Type_Indicator).

The Myers-Briggs Test categorizes people into different personality
buckets. This exercise will do the same thing but with questions centered
around software.

---

# Sensitive VS Fearless

* I prefer hearing all requirements up front, even if I can't tackle
  them all right away.
* Adding to a long function feels like more code won't "fit".
* I look forward to being assigned to new projects and teams.
* I often feel paralyzed while staring at a blank editor screen.

---

# Inventive VS Aesthetic

* It's more important to build the right thing than to build the thing
  right.
* I love experimenting with new tools, frameworks, and build systems.
* I strive to write visually appealing code, down to syntax &
  symmetry.
* It's boring when all the code in a project is structured similarly.

---

# Naive VS Leery

* Publishing metrics (e.g. code coverage) is always a good idea.
* Writing good commit messages today will pay off in the future.
* Software teams will make smarter use of time under pressure.
* Software is generally improving over time and we're not doomed.

---

# Economical VS Thorough

* Better to ship code quickly than wait until everything is tested.
* Design principles are useful, but most teams waste too much time on
  them.
* Most teams lack sufficient understanding of their dependencies.
* It's okay for everyone on a team to maintain separate coding styles.

---

# Reflect young grasshopper

Let us first revisit Exercise 1: Why test?

![Master yoda](https://media.giphy.com/media/6fScAIQR0P0xW/giphy-downsized.gif)

---

# Back to the two main questions

> Are we building the *right* system? (Performance)

Tests help us **understand and communicate requirements better**,
**reduce the cost of change**, and **demonstrate how the system performs
in near real situations**.

> Are we building the system *right*? (Behavior/Implementation)

Tests help us **understand our code better**, **inform of better
design**, and allow us to **confidently change and refactor code**.
Tests will...

---

# 1. Give us a quick feedback loop

* Two heads are better than one, tests can serve as another set of eyes
watching over our code (especially helpful for dynamically-typed
languages).

> To err is human...
[Alexander Pope](https://www.dictionary.com/browse/to-err-is-human--to-forgive-divine)

---

# 2. Drive the design and foster cleaner architecture

* Test Driven Development can help us find the necessary abstractions via
programming by wishful thinking. We can breakdown large complex problems
into smaller and more manageable chunks. When we experience excessive
pain trying to test something, the tests will raise suspicion on
questionable design.

> If an object is very difficult to test, it will quickly become apparent
> that the design may need to change.

---

# 3. Define clear public interfaces

* It becomes much easier to see how objects interact with each other.
* Confidently identify stable behavior that can be called and relied on
  by other developers.

---

# 4. Verify application conforms to specifications
   [MITRE Systems Engineeing](https://www.mitre.org/publications/systems-engineering-guide/se-lifecycle-building-blocks/test-and-evaluation/verification-and-validation)

* Test specs trace back to some feature, there is no redundant
  test/production code.

---

# 5. Serve as a safety net to guard against breaking changes

* Made a change, broke a test? Double check and fix that mess!

---

# 6. Automate complicated and long manual tests that validate application works as intended for users

* If I have to fill out another goddamn form...
* If I have to reset another database...
* Shit, I just sent out a few hundred emails...
* Oops, forgot to uncomment out production code...

---

# 7. Aid in troubleshooting production issues

* At times logging, dubugger, and exception notifications might not suffice
  * Write a high-level failing test that reproduces the bug
  * Step down further into code base to identify root cause, adding
  tests where appropriate
  * Fix the bug at the lowest level, and pop back up to see if
  high-level test passes and bug is fixed

---

# 4. Super ~~secret~~ testing strats
## Test writing philosophy

Just like production code is bound to change, test code may also change.
It's important to treat test code with the same respect as production
code. Just like you would refactor production code, you would also
refactor test code. The catch is that we must be very selective about
what we test and how we choose to do it.

---

# On test writing
## What is the purpose of this test?

* It must provide some value, otherwise it shouldn't exist.
* No need to waste time on things that provide zero or negative value.
* Each test we keep must provide us greater understanding and confidence.

---

# On test writing
## What type of test is this?

* The test type dictates how granular the details are.
* Different types require different test approaches/tools.

---

# On test writing
## How should this test be written?

* There should be consistency across the test codebase.
* There should be established structure and style.
* There should be **no freestyling** here.

---

# On test writing
## The dangers of writing tests poorly

If we can't quickly answer these, we have poorly written tests. This
likely means we must waste time/money reading and debugging tests while
developing production code and when tests fail.

---

# Test Hierarchy

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

---

# Unit Tests

* Test a single unit of code, e.g., a single class
* Are super fast to run, provide developers quick feedback to iterate on
design
* Isolating test failures and finding them is easy
* Most comfortable to write, because often can use same language as
production to write them, may involve DSL
* Should be the majority of tests

---

# Integration Tests

* Test multiple units of code together, e.g., collaborator class or API
tests
* Can be a little more annoying to setup, e.g., might need access to a request
object
* Can substitute some acceptance level testing if resources are limited
* Quantity should be in between unit and acceptance tests

---

# Acceptance Tests

* Exercise entire stack: UI, client-end, back-end, third-party APIs,
database, network, etc...
* Everything should be real as to simulate actual user experience
* Most cumbersome to write, most brittle, expensive
* Do as little as possible, YMMV
([PRO](https://www.symphonious.net/2015/04/30/making-end-to-end-tests-work/)/[AGAINST](https://testing.googleblog.com/2015/04/just-say-no-to-more-end-to-end-tests.html))

---

# We talkin' bout ~~PRACTICE?~~ ~~TESTING~~ DESIGN?
## Bad tests, bad design; bad design, bad tests

Design is hard. Write an application with bad design/no design and
eventually the pain will become overwhelming.

> The code smells have become 2 dank.

![The rock](https://media.giphy.com/media/TT7JW4Qm7uaNW/giphy.gif)

---

# Dank code smells

* There is duplicated code all over the place
* Classes and/or methods have become too long
* No distinction between public and private methods
* Poor naming of classes, methods, variables
* The intent and usage is not obvious, impossible to reuse or extend
* Shotgun surgery
* Long and fragile method chains
* Nil/null pop up unexpectedly
* Comments become inaccurate
* Deeply nested conditionals

---

# Dank test smells

If we have poorly written tests, we will feel double the pain! For
example:

* Why did this test start failing?
* How is this test passing?
* What the fuck does this example test?
* Lord have mercy, our tests take 30 minutes to run...

When we lose confidence in our tests (the thing they were supposed to
give us!), we are fuckkkkkkkkkkkkkkkkkkkkkkked.

```
rm -rf path_to_project_from_hell/spec
```

---

# Exercise 3: We become role players and cosplayers

Our goal for this exercise is to develop a drink ordering system.

1. Brainstorm features
2. Split up into groups, with each group tackling one feature
3. Break each feature into individual requirements
4. Determine how each requirement will be validated.
5. Determine how each feature will be validated.

---

# 5. Wu-Tang Clan Ain't Nuthing ta F' Wit (wRAP up)

Today we were primarily concerned with answering two questions:

* Are we building the *right* system? (Performance)
* Are we building the system *right*? (Behavior/Implementation)

We learned how testing can guide our application design, how testing can
make changing our code easier, and how testing can impact our business.

---

# Closing words

![CRUD](http://docs.railsbridge.org/job-board/img/crud_grid.jpg)

We must accept that change is inevitable. Done well, testing can allow
us to change, refactor, understand, and design our code better.

Change Refactor Understand Design
