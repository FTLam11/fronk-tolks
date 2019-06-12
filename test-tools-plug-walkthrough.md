---

# GameFAQs: Rambo XXX: Ocarina of Time
## Frank Lam

![New Game+ Start](https://media.giphy.com/media/RBK9izWXCsV44/giphy.gif)

New Game+ Start!!!

---

# Scope

The last talk was a high level overview of testing and how it could
influence our design. This talk expands on the actual implementation by
covering common libraries + tools and a few demos of different test
types.

The topics for this talk are:

1. Review of Test Hierarchy, test writing conventions
2. Introduce variety of test libraries + tools
3. Describe an ideal development workflow w/ testing
4. Show examples of different test types
5. Reimplement a class purely based on tests

---

# 1. Obligatory anime flashback

![Squirtle squad](https://media.giphy.com/media/eSwGh3YK54JKU/giphy.gif)

1. [Test
   Hierarchy](https://github.com/FTLam11/fronk-tolks/blob/master/we-talkin-bout-testing.md#test-hierarchy)
2. [Slides](https://docs.google.com/presentation/d/12SjaioLqcF3ycD3V9jXfax5OucdB-IMaJcDWYO4gGgg/edit?usp=sharing)

---

# 2. Test Libraries + Tools
## A smorgasbord of options

* Core libraries (test structure, runner, formatting, DSL)
* Expectation/assertion libraries
* Mocking libraries
* BDD Frameworks
* Coverage tools
* Factories
* Web Drivers
* IDE/Editor Plugins (!)
* Utility/Miscellaneous

---

# 3. Cultivating a test-based workflow
## Pick your items/weapons

* IDE/text editor
* Programming language
* Framework

---

# 4-1. Unit Tests
## Grinding levels + experience

Unit tests are the easiest tests to write, quick n EZ. They test a
single unit in isolation.

* Test the public API
* Are we building the system *right*? (Behavior/Implementation)

---

# 4-2 Integration Tests
## Miniboss fight time

*

Does testing help or hinder our business?

![Elephant in the room](https://thumbs.gfycat.com/SameAnnualFallowdeer-size_restricted.gif)

---

# 4-3 Acceptance Tests
## Impossible final boss fight

Yeah I don't wanna talk about this.

{.column}

Still don't wanna talk about this.

---

# 5. Deep dive
## Let's break something and reimplement it

![2EZ](http://granitegrok.com/wp-content/uploads/2013/05/not-so-easy-button.png)

EZ

---

# Closing words

![CRUD](http://docs.railsbridge.org/job-board/img/crud_grid.jpg)

We must accept that change is inevitable. Done well, testing can allow
us to change, refactor, understand, and design our code better.

Change Refactor Understand Design
